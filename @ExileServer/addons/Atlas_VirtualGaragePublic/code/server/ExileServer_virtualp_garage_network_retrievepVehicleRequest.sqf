/**
 * File: ExileServer_virtualp_garage_network_retrievepVehicleRequest
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
params ["_sessionID","_data"];
_data params ["_vehicleInfo","_id"];
try
{
	private _player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) throw "You don't exist!";

	private _vehicleData = format["retrieveVehicleFromGarage:%1:%2",_vehicleInfo,_id] call ExileServer_system_database_query_selectSingle;
	if (isNil "_vehicleData") throw "Error retrieving vehicle information";
	_vehicleData params ["_vehicleID","_vehicleClass","_textures","_fuel","_hitPoints","_damage","_pinCode","_popTabs","_ownerUID","_itemCargo","_magazineCargo","_weaponCargo","_containerCargo","_ammo"];
	if (isNil "_vehicleClass") throw "Error retrieving vehicle information";

	private _vehicle = objNull;
	private _position = (getPos _player) findEmptyPosition [10, 250, _vehicleClass];
	if (_position isEqualTo []) throw "Could not find valid position to create vehicle!";
	if (_pinCode != "000000") then
	{
		_vehicle = [_vehicleClass, _position, (random 360), true, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
	}
	else
	{
		_vehicle = [_vehicleClass, _position, (random 360), true] call ExileServer_object_vehicle_createNonPersistentVehicle;
	};
	
	if (isNull _vehicle) throw "The requested vehicle could not be retrieved!";
	_vehicle setVariable ["ExileDatabaseID", _vehicleID];

	if !(getNumber(missionConfigFile >> "CfgPublicVirtualGarage" >> "clearInventory") isEqualTo 1) then 
	{
		[_vehicle, _itemCargo] call ExileServer_util_fill_fillItems;
		[_vehicle, _magazineCargo] call ExileServer_util_fill_fillMagazines;
		[_vehicle, _weaponCargo] call ExileServer_util_fill_fillWeapons;
		[_vehicle, _containerCargo] call ExileServer_util_fill_fillContainers;
	};

	_vehicle setFuelCargo _fuel;
	_vehicle setVariable ["ExileMoney", _popTabs, true];
	_vehicle setDamage _damage;
	_vehicle lock 0;
	
	
	
	private _vehicleTextures = getObjectTextures _vehicle;
	{
		if (_x != (_vehicleTextures select _forEachIndex)) then
		{
			_vehicle setObjectTextureGlobal [_forEachIndex, _x];
		};
	} forEach _textures;
	{
		_vehicle setHitPointDamage [_x select 0, _x select 1];
	} forEach _hitPoints;

	if (_pinCode != "000000") then
	{
		_vehicle setVariable ["ExileIsLocked",0];
		_vehicle setVariable ["ExileOwnerUID", _ownerUID];
		_vehicle call ExileServer_object_vehicle_database_insert;
		_vehicle call ExileServer_object_vehicle_database_update;
		if !(_textures isEqualTo []) then
		{ 
			private _vehicleID = _vehicle getVariable ["ExileDatabaseID", -1];
			format["updateVehicleSkin:%1:%2", _textures, _vehicleID] call ExileServer_system_database_query_fireAndForget;
		};
	};
	
	_vehicle setVehicleAmmo 0;
	diag_log STR(_ammo);
	diag_log "Ammo go!";

	if !(_ammo isEqualTo []) then 
	{
		diag_log "1";
		{
			private ["_turretPath", "_pylonIndex", "_magClass","_bulletAmount", "_magClass", "_maxMagAmmo", "_numMags"];
			_turretPath = _x select 0;
			_pylonIndex = _x select 1;
			_magClass = _x select 2;
			_bulletAmount = _x select 3;
			
			if (["120mm",_magClass] call BIS_fnc_inString || ["125mm",_magClass] call BIS_fnc_inString || ["105mm",_magClass] call BIS_fnc_inString || ["L30A1_Cannon",_magClass] call BIS_fnc_inString || ["2A46",_magClass] call BIS_fnc_inString || ["100mm",_magClass] call BIS_fnc_inString) then
			{
				_vehicle removeMagazinesTurret [_magClass, _turretPath];
				_vehicle addMagazineTurret [_magClass,_turretPath,_bulletAmount];
			} else
			{
				//DO THIS IF SMOKE
				if (["smoke",_magclass] call BIS_fnc_inString) then
				{
					_vehicle removeMagazinesTurret [_magClass, _turretPath];
					_vehicle removeWeaponTurret ["SmokeLauncher", _turretPath];
					_vehicle addMagazineTurret [_magClass,_turretPath,_bulletAmount];
					_vehicle addWeaponTurret ["SmokeLauncher", _turretPath];
				} else
				{
					//DO THIS IF CHAFF
					if (["chaff",_magclass] call BIS_fnc_inString) then
					{
						_vehicle removeMagazinesTurret [_magClass, _turretPath];
						_vehicle removeWeaponTurret ["CMFlareLauncher", _turretPath];
						_vehicle addMagazineTurret [_magClass,_turretPath,_bulletAmount];
						_vehicle addWeaponTurret ["CMFlareLauncher", _turretPath];
					} else
					{
						//DO THIS IF PYLON
						if (["pylon",_magclass] call BIS_fnc_inString) then
						{
							_vehicle setAmmoOnPylon [_pylonIndex,_bulletAmount];
						} else
						{
							//FOR EVERYTHING ELSE
							_maxMagAmmo = (configFile >> "CfgMagazines" >> _magClass >> "count") call BIS_fnc_getCfgData;
							_numMags = ceil (_bulletAmount / _maxMagAmmo);
				
							while {_numMags > 1} do
							{
								_vehicle addMagazineTurret [_magClass, _turretPath];
								_numMags = _numMags - 1;
								_bulletAmount = _bulletAmount - _maxMagAmmo;
							};
							_vehicle setMagazineTurretAmmo [_magClass, _bulletAmount, _turretPath];	
						};
					};
				};
			};
		}forEach _ammo;
	};
	
	format["deleteVehicleFromVirtualGarage:%1:%2",_vehicleInfo,_id] call ExileServer_system_database_query_fireAndForget;
	[_sessionID, "toastRequest",["SuccessTitleAndText", ["Vehicle Retrieved!", "Requested vehicle has been retrieved!"]]] call ExileServer_system_network_send_to;
	[_sessionID, "retrievepVehicleResponse", [netId _vehicle]] call ExileServer_system_network_send_to;
	_log = format["%1 (%2) has just retrieved a %3 (%4) from the virtual garage!", name _player, getPlayerUID _player, getText(configFile >> "CfgVehicles" >> _vehicleClass >> "displayName"), _vehicleClass];
	["AtlasVirtualGarage",_log] call FNC_A3_CUSTOMLOG;
}
catch
{
	[_sessionID, "ToastRequest",["ErrorTitleAndText", ["Whoops!", _exception]]] call ExileServer_system_network_send_to;
};

true
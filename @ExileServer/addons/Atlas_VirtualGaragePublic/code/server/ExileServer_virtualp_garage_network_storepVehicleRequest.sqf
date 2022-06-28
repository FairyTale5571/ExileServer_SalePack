/**
 * File: ExileServer_virtualp_garage_network_storepVehicleRequest
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
params ["_sessionID","_data"];
_data params ["_vehicleNetID", "_nickname"];

try
{
	private _player = _sessionID call ExileServer_system_session_getPlayerObject;
	_storedVehicles = format ["countVGVehicles:%1",getPlayerUID _player] call ExileServer_system_database_query_selectSingleField;
	if (isNull _player) throw "You don't exist!";
	if (_vehicleNetID == "") throw "??";
	private _vehicle = objectFromNetId _vehicleNetID;
	if (typeOf _vehicle in (getArray(missionConfigFile >> "CfgPublicVirtualGarage" >> "restrictedVehicles"))) throw "This vehicle can not be stored!";
	if (isNull _vehicle) throw "Could not find the vehicle to store!";
	if !((crew _vehicle) isEqualTo []) throw "The vehicle has a crew!";
	if !(_vehicle getVariable ["ExileIsPersistent", false]) throw "Only pincode protected vehicles can be stored!";
	if ((_vehicle getVariable ["ExileDatabaseID", -1]) isEqualTo -1) throw "Only pincode protected vehicles can be stored!";
	_maxNumberOfVehicles = _player getVariable ["VG_Slots",0];
	if (_storedVehicles >= _maxNumberOfVehicles) throw "You cannot store any more vehicles in your garage.<br />Buy bore slots to store more vehicles!";
	
	_vehicle enableSimulationGlobal false;
	_vehicle hideObjectGlobal true;
	private _vehicleClass = typeOf _vehicle;
	private _textures = getObjectTextures _vehicle;
	private _fuel = getFuelCargo _vehicle;
	private _hitPoints = [];

	{
		_hitPoints pushBack [_x ,_vehicle getHitPointDamage _x];
	} forEach ((getAllHitPointsDamage _vehicle) select 0);

	private _damage = damage _vehicle;
	private _pinCode = _vehicle getVariable ["ExileAccessCode","000000"];
	private _popTabs = _vehicle getVariable ["ExileMoney", 0];
	private _ownerUID = _vehicle getVariable ["ExileOwnerUID", getPlayerUID _player];
	private _itemCargo = [];
	private _magazineCargo = [];
	private _weaponCargo = [];
	private _containerCargo = [];
	private _currentLoadout = _vehicle call AtlasClient_util_getConfigLoadout;

	if !(getNumber(missionConfigFile >> "CfgPublicVirtualGarage" >> "clearInventory") isEqualTo 1) then 
	{
		_itemCargo = _vehicle call ExileServer_util_getItemCargo;
		_magazineCargo = magazinesAmmoCargo _vehicle;
		_weaponCargo = weaponsItemsCargo _vehicle;
		_containerCargo = _vehicle call ExileServer_util_getObjectContainerCargo;
	};
	
	clearBackpackCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	{ detach _x } forEach attachedObjects _vehicle;
	deleteVehicle _vehicle;
	
	private _message = ["Atlas_VirtualGarageStoreVehicle",
	[
		_nickname, 
		_vehicleClass, 
		getPlayerUID _player, 
		_ownerUID, 
		_textures, 
		_popTabs, 
		_pinCode, 
		_damage, 
		_hitPoints, 
		_fuel, 
		_itemCargo, 
		_magazineCargo, 
		_weaponCargo, 
		_containerCargo,
		_currentLoadout
	]] call ExileServer_util_extDB2_createMessage;
	_message call ExileServer_system_database_query_insertSingle;
	_vehicle call ExileServer_object_vehicle_database_delete;

	[_sessionID, "ToastRequest",["SuccessTitleAndText", ["Vehicle Stored!", "Requested vehicle has been stored"]]] call ExileServer_system_network_send_to;
	[_sessionID, "pstoreVehicleResponse", [true,_nickname]] call ExileServer_system_network_send_to;
	_log = format["%1 (%2) has just stored a %3 (%4) into the virtual garage!", name _player, getPlayerUID _player, getText(configFile >> "CfgVehicles" >> _vehicleClass >> "displayName"), _vehicleClass];
	["LoneGarageLOG",_log] call FNC_A3_CUSTOMLOG;
}
catch
{
	[_sessionID, "pstoreVehicleResponse", [false,_exception]] call ExileServer_system_network_send_to;
};

true

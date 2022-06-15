params ["_sessionID","_parameters"];
_parameters params ["_netID"];
_player = objectFromNetId _netID;
_item = getText(missionConfigFile >> "CfgExAd" >> "DeployVehicle" >> "item");
_spawnPos = _player modelToWorld [0,2,0];
_spawnDir = (getDir _player) -90;
_player removeItem _item;

_vehicle = getText(missionConfigFile >> "CfgExAd" >> "DeployVehicle" >> "Vehicle");
diag_log format ["createVehicleRequested %1", _spawnPos];
_veh = createVehicle[_vehicle, _spawnPos , [] ,0 , "NONE"];
_veh setVariable ["deployedVehicle",true,true];

if (getNumber(missionConfigFile >> "CfgExAd" >> "DeployVehicle" >> "autoCleanup") isEqualTo 1) then
{
	[_veh] spawn 
	{
		private ["_wait","_tick", "_vehObj","_driver"];
		_wait = true;
		_tick = 0;
		_vehObj = [_this,0,objNull] call BIS_fnc_param;
		
		while {_wait} do 
		{
			uiSleep 1;
			if(isNull _vehObj)exitWith{_wait = false};
			
			_driver = driver _vehObj;
			if (isNull _driver)then
			{
				_tick = _tick + 1;
			}else{
				_tick = 0;
			};
			if(_tick >= getNumber(missionConfigFile >> "CfgExAd" >> "DeployVehicle" >> "timeToCleanup"))exitWith{_wait = false};
		};
		moveOut (driver _vehObj);
		_vehObj call ExileServer_system_vehicleSaveQueue_removeVehicle;
		_vehObj call ExileServer_system_simulationMonitor_removeVehicle;
		deleteVehicle _vehObj;
	};
};
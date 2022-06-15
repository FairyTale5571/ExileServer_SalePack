private["_sessionID", "_parameters", "_object", "_player", "_hackerUID", "_hackAttempts", "_laptop", "_marker"];
_sessionID = _this select 0;
_parameters = _this select 1;
try 
{	
	_object = objectFromNetId (_parameters select 0);
	if (isNull _object) then 
	{
		throw "Flag object is null."; 
	};
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Player is null."; 
	};
	if ((_player distance _object) > 10) then 
	{
		throw "You are too far away."; 
	};
	_hackerUID = _object getVariable ["ExileHackerUID", ""];
	if !(_hackerUID isEqualTo (getPlayerUID _player)) then 
	{
		throw "You aren't the hacker!";	
	};
	if !("Exile_Item_Laptop" in (magazines _player)) then 
	{
		throw "You do not have a laptop."; 
	};
	_hackAttempts = (_object getVariable ["ExileHackAttempts", 0]) + 1;
	_object setVariable ["ExileHackAttempts", _hackAttempts, true];
	_object setVariable ["ExileHackerUID", "", true];
	_player setVariable ["ExileIsHacking", false, true];
	_laptop = _object getVariable ["ExileHackerLaptop", objNull];
	if !(isNull _laptop) then 
	{
		deleteVehicle _laptop;
	};
	_marker = _object getVariable ["ExileHackingMarker", nil];
	if !(isNil "_marker") then 
	{
		deleteMarker _marker;
	};
	
	_territoryID = _object getVariable ["ExileDatabaseID", -1];

	_storedVehicles = _object getVariable ["ExileTerritoryStoredVehicles", []];
	_storedVehicleRandom = selectRandom (_storedVehicles);
	_index = -1;
	{
		if (toLower(_x select 1) isEqualTo toLower(_storedVehicleRandom select 1)) exitWith 
		{
			_index = _forEachIndex;	
		};
	}
	forEach _storedVehicles;
	if (_index isEqualTo -1) then 
	{
		throw "Unable to find vehicle in stored vehicles";
	};	
	_vehicleInfo = format["confirmVehicleOwnership:%1:%2", _storedVehicleRandom select 1,_territoryID] call ExileServer_system_database_query_selectSingle;
	
	_storedVehicles deleteAt _index;
	_object setVariable ["ExileTerritoryStoredVehicles", _storedVehicles, true];
	format["retrieveVehicle:%1", _vehicleInfo select 0] call ExileServer_system_database_query_fireAndForget;
	_vehicleObject = (_vehicleInfo select 0) call ExileServer_object_vehicle_database_load;
	
	_vehicleObject setVariable ["ExileIsLocked", 0];
	_vehicleObject lock 0;
	_vehicleObject enableRopeAttach true;
	
	_vehicleObject call ExileServer_object_vehicle_database_update;

	[_sessionID, "toastRequest", ["SuccessTitleAndText", ["Hacking Success!", format ["You got a %1 from the garage!", getText (configfile >> "CfgVehicles" >> (typeOf _vehicleObject) >> "displayName")]]]] call ExileServer_system_network_send_to;
}
catch 
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Hacking failed!", _exception]]] call ExileServer_system_network_send_to;
};


private["_sessionID", "_parameters", "_flag", "_playerObject", "_lappyToppy", "_marker", "_serverTime", "_cooldown"];
_sessionID = _this select 0;
_parameters = _this select 1;
_flag = objectFromNetID(_parameters select 0);
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Player is null";	
	};
	if (isNull _flag) then 
	{
		throw "Flag is null";
	};
	_lappyToppy = createVehicle ["Exile_Construction_Laptop_Static", _playerObject modelToWorld [0.1,0.55,0], [], 0, "CAN_COLLIDE"];
	_lappyToppy attachTo [_playerObject, [0.1,0.55,0]];
	_lappyToppy setDir -90;
	_lappyToppy animate ['LaptopLidRotation', 1];
	_flag setVariable ["ExileHackerLaptop", _lappyToppy];
	_flag setVariable ["ExileHackerUID", getPlayerUID _playerObject, true];
	if (getNumber(missionConfigFile >> "CfgFlagHacking" >> "showMapIcon") isEqualTo 1) then 
	{
		_marker = createMarker [format["ExileHacking%1", diag_tickTime], getPos _flag];
		_marker setMarkerType "ExileHackingIcon";
		_marker setMarkerText "Hacker Activity!";
		_flag setVariable ["ExileHackingMarker", _marker];
	};
	_serverTime = time;
	if(_serverTime > ((_flag getVariable ["ExileXM8MobileNotifiedTime",-1800]) + 1800))then
	{
			_flag call ExileServer_system_xm8_sendBaseRaid;
			_flag setVariable ["ExileXM8MobileNotifiedTime", _serverTime];
	};
	if (getNumber(missionConfigFile >> "CfgFlagHacking" >> "notifyServer") isEqualTo 1) then
	{
		_cooldown = getNumber(missionConfigFile >> "CfgFlagHacking" >> "notificationCooldown") * 60;
		if (_serverTime > ((_flag getVariable ["ExileHackNotifiedTime", (_cooldown * -1)]) + _cooldown)) then 
		{
			["baguetteRequest", ["Warning! Flag hack in progress!"]] call ExileServer_system_network_send_broadcast;
			_flag setVariable ["ExileHackNotifiedTime", _serverTime];
		};
	};
}
catch
{
	if !(isNull _flag) then 
	{
		_flag setVariable ["ExileHackerUID", "", true];
	};
	_exception call ExileServer_util_log;
};
true
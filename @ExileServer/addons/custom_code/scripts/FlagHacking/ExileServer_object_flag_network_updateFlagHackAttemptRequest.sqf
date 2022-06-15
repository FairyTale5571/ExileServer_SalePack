private["_sessionID", "_parameters", "_flag", "_hackAttempts", "_laptop", "_marker"];
_sessionID = _this select 0;
_parameters = _this select 1;
_flag = objectFromNetId (_parameters select 0);
_hackAttempts = (_flag getVariable ["ExileHackAttempts", 0]) + 1;
_flag setVariable ["ExileHackAttempts", _hackAttempts, true];
_flag setVariable ["ExileHackerUID", "", true];
_laptop = _flag getVariable ["ExileHackerLaptop", objNull];
if !(isNull _laptop) then 
{
	deleteVehicle _laptop;
};
_marker = _flag getVariable ["ExileHackingMarker", nil];
if !(isNil "_marker") then 
{
	deleteMarker _marker;
};
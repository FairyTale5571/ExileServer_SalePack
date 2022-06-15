params ["_sessionID","_data"];
_data params ["_vehicleID"];

try
{
	private _player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) throw "You do not exist!";
	if !(alive _player) throw "You're not alive!";

	private _vehicle = objectFromNetId _vehicleID;
	if (isNull _vehicle) throw "Could not find vehicle!";
	if !(alive _vehicle) throw "Your vehicle is not in a driveable state!";

	[format["%1 (%2) has just left a safezone in a %3 (%4)", name _player, getPlayerUID _player, getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"), (typeof _vehicle)], 0] call safeZonePlus_Log;

	_vehicle setVariable ["safeZonePlus_Owner", nil, true];

	_vehicle removeAllEventHandlers "GetIn";
	_vehicle addEventHandler ["GetIn","_this call ExileServer_object_vehicle_event_onGetIn"];
	
	[[netID _vehicle],{
		params["_vehicleID"];
		private _vehicle = objectFromNetID _vehicleID;
		_vehicle removeAllEventHandlers "Fired";

		// I have to exec this to all clients, due to an arma issue...
		if (local _vehicle) then
		{
			[_vehicle, true] remoteExecCall ["allowDamage", -2];
		};
	}] remoteExecCall ["call", -2, false];
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["SafeZonePlus:",_exception]]] call ExileServer_system_network_send_to;
};

true
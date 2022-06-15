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

	[format["%1 (%2) has just entered a safezone in a %3 (%4)", name _player, getPlayerUID _player, getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"), (typeof _vehicle)], 0] call safeZonePlus_Log;

	_vehicle setVariable ["safeZonePlus_Owner", netId _player, true];

	_vehicle removeAllEventHandlers "GetIn";
	_vehicle addEventHandler["GetIn","_this call safezonePlus_onGetInVehicle"];
	_vehicle addEventHandler ["GetIn","_this call ExileServer_object_vehicle_event_onGetIn"];

	[[netID _vehicle],{
		params["_vehicleID"];
		private _vehicle = objectFromNetID _vehicleID;

		_vehicle removeAllEventHandlers "Fired";
		_vehicle AddEventHandler["Fired",{
			if (local (_this select 6)) then
			{
				// You never fucking know....
				if (isServer) exitWith
				{
					deleteVehicle (_this select 6);
				};

				// Check to make sure they're not in the trader.
				if (ExilePlayerInSafezone || {(_this select 0) call ExileClient_util_world_isInTraderZone}) then
				{
					deleteVehicle (_this select 6);
				};
			}
			else
			{
				if (isServer && {(_this select 0) call ExileClient_util_world_isInTraderZone}) then
				{
					private _owner = objNull;
					private _projectile = _this select 6;
					{
						if (isNull _projectile) exitWith { _owner = nil; };
						if (owner _projectile == owner _x) then { _owner = _x };
					} forEach allPlayers;

					if (isNil "_owner") exitWith { false };
					if (isNull _owner) exitWith { deleteVehicle _projectile };
				};
			};
			true
		}];

		// I have to exec this to all clients, due to an arma issue...
		if (local _vehicle) then
		{
			_vehicle allowDamage false;
		};
	}] remoteExecCall ["call", -2, false];
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["SafeZonePlus:",_exception]]] call ExileServer_system_network_send_to;
};

true
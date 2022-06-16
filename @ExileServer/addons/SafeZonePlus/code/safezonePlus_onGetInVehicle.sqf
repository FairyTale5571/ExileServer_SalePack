params ["_vehicle","_seat","_player","_turret"];

private _owner = objNull;
try
{
	if (isNil "_player") throw {};
	if (isNull _player) throw {};
	private _ownerID = _vehicle getVariable ["safezonePlus_Owner", ""];
	if (_ownerID == "") throw {};
	_owner = objectFromNetId _ownerID;
	if (isNull _owner) throw {};
	if !(_vehicle call ExileClient_util_world_isInTraderZone) throw {};

	private _clanID = _player getVariable["ExileClanID", -1];
	private _ownerClanID = _owner getVariable["ExileClanID", -1];
	switch (true) do
	{
		case ((getPlayerUID _player) == (getPlayerUID _owner)): {throw false;};
		case (_player == _owner): {throw false;};
		case ((group _owner) == (group _player)): {throw false;};
		case ((_clanID != -1) && (_clanID == _ownerClanID)): {throw false;};
		default {throw true;};
	};
}
catch
{
	if ((_exception isEqualType false) && {!(isNull _owner)}) then
	{
		if (_exception) then
		{
			[format["%1 (%2) was kicked from a %3 (%4) owned by %5 (%6)", name _player, getPlayerUID _player, getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"), (typeof _vehicle), name _owner, getPlayerUID _owner], 1] call safeZonePlus_Log;
			[true] remoteExecCall ["disableUserInput", (owner _player)];
			_player action["Eject", _vehicle];

			[_player, "toastRequest", ["ErrorTitleAndText", ["SafeZonePlus:", "This is not your vehicle! Stop being a troll, your actions are being logged"]]] call ExileServer_system_network_send_to;
			[_owner, "toastRequest", ["ErrorTitleAndText", ["SafeZonePlus:", "A player just got kicked from your vehicle!"]]] call ExileServer_system_network_send_to;
			[_vehicle, _owner, _player] spawn
			{
				params ["_vehicle","_owner","_player"];
				[] remoteExecCall ["safezonePlus_closeGear", _player];
				waitUntil {(vehicle _player) == _player};

				if ((owner _vehicle) != (owner _owner)) then
				{
					if ((group _vehicle) setGroupOwner (owner _owner)) then
					{
						[_owner, "toastRequest", ["SuccessTitleAndText", ["SafeZonePlus:", "Don't worry, you're still the owner!"]]] call ExileServer_system_network_send_to;
					}
					else
					{
						[_owner, "toastRequest", ["ErrorTitleAndText", ["SafeZonePlus:", "Protection failed, someone else now owns your vehicle!"]]] call ExileServer_system_network_send_to;
					};
				}
				else
				{
					[_owner, "toastRequest", ["ErrorTitleAndText", ["SafeZonePlus:", "Don't worry, you're still the owner"]]] call ExileServer_system_network_send_to;
				};

				uiSleep 10;
				[] remoteExec ["safezonePlus_closeGear", (owner _player)];
				uiSleep 0.1;
				[false] remoteExecCall ["disableUserInput", (owner _player)];
				true
			};
		};
	}
	else
	{
		if (_vehicle call ExileClient_util_world_isInTraderZone) then 
		{
			private _sessionID = _player getVariable ["ExileSessionID", ""];
			[_sessionID, [netId _vehicle]] call ExileServer_SafezonePlus_network_onEnterSafezonePlus;
		}
		else
		{
			private _sessionID = _player getVariable ["ExileSessionID", ""];
			[_sessionID, [netId _vehicle]] call ExileServer_SafezonePlus_network_onLeaveSafezonePlus;
		};
	};
};

true
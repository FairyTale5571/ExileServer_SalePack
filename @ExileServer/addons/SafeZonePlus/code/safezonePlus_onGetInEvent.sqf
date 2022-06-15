params["_vehicle"];

if (isNull _vehicle) exitWith {systemchat "arma??"};

if (player call ExileClient_util_world_isInTraderZone) then
{
	private _ownerID = _vehicle getVariable ["safeZonePlus_Owner",""];
	if (_ownerID == "") then
	{
		["onEnterSafezonePlus",[netId _vehicle]] call ExileClient_system_network_send;
	};
};

true


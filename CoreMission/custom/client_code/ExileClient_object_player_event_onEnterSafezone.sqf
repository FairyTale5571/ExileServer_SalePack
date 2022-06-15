/**
 * ExileClient_object_player_event_onEnterSafezone
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_attachedObjects","_position"];
if (ExilePlayerInSafezone) exitWith { false };
if !(alive player) exitWith { false };
ExilePlayerInSafezone = true;
player allowDamage false;
player removeAllEventHandlers "HandleDamage";
private _vehicle = vehicle player;

ExileClientSafeZoneVehicle = objNull;
ExileClientSafeZoneVehicleFiredEventHandler = -1;

if(getNumber(missionConfigFile >> "CfgTradeSafeZone" >> "disableRamming") isEqualTo 1) then
{
	ExileClientVehiclesCollision = [];
	{
		ExileClientVehiclesCollision pushBackUnique _x;
		player disableCollisionWith _x;
	} forEach nearestObjects [player, ["LandVehicle","Tank","Air","Ship"], 30];
};
if !(_vehicle isEqualTo player) then 
{
	if (local _vehicle) then 
	{
		["onEnterSafezonePlus",[netId _vehicle]] call ExileClient_system_network_send;
		_vehicle allowDamage false;
	};
	private _attachedObjects = attachedObjects _vehicle;
	if !(_attachedObjects isEqualTo []) then 
	{
		private _position = getPosATL _vehicle;
		{
			if ((typeOf _x) in ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"]) then 
			{
				detach _x;
				_x setPosATL [(_position select 0) + random 2, (_position select 1) + random 2, 0.05];
				_x setDir (random 360);
			};
		} forEach _attachedObjects;
	};
};
if(getNumber(missionConfigFile >> "CfgTradeSafeZone" >> "enableESP") isEqualTo 1) then
{
	ExileClientSafeZoneESPEventHandler = addMissionEventHandler ["Draw3D", {(getNumber (missionConfigFile >> "CfgTradeSafeZone" >> "distanceESP")) call ExileClient_gui_safezone_safeESP}];
};
["Welcome! God mode enabled."] spawn ExileClient_gui_baguette_show;
ExileClientSafeZoneUpdateThreadHandle = [1, ExileClient_object_player_thread_safeZone, [], true] call ExileClient_system_thread_addtask;
true
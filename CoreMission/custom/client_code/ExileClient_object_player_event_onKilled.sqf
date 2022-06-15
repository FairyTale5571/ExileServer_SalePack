/**
 * ExileClient_object_player_event_onKilled
 *
 * Exile Mod
 * www.exilemod.com
 * A? 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

closeDialog 0;
ExileClientLastDiedPlayerObject = player;
ExileClientIsAutoRunning = false;
//Start custom code
if !((vehicle player) isEqualTo player) then
{
	unassignVehicle player; 					//comm: this features allowed kick players from explosion vehicles, anyway, air/land/water/apc
	player action ["GetOut", vehicle player];
	player action ["Eject", vehicle player];
	private _relPos = (vehicle player) worldToModel (getPos player);
	private _position = call
	{
		if ((_relPos select 0) < 0.02) exitWith { _relPos set [0, -2]; _relPos };
		if ((_relPos select 0) > 0.02) exitWith { _relPos set [0, 2]; _relPos };
		[2,2,0]
	};
	_position = ((vehicle player) modelToWorld _position);
	player setPosATL _position;
};
//end custom code
setGroupIconsVisible [false, false];
false call ExileClient_gui_hud_toggle;
[] call ExileClient_object_player_event_unhook;
if !(ExileClientLastDeathMarker isEqualTo "") then
{
	deleteMarkerLocal ExileClientLastDeathMarker;
};
ExileClientLastDeathMarker = createMarkerLocal [format ["Death%1", time], getPos player];
ExileClientLastDeathMarker setMarkerShapeLocal "ICON";
ExileClientLastDeathMarker setMarkerTypeLocal "KIA";
ExileClientLastDeathMarker setMarkerColorLocal "ColorRed";
ExileClientLastDeathMarker setMarkerAlphaLocal 0.5;
if (ExileClientIsInBush) then
{
	call ExileClient_object_bush_detach;
};
if !(ExileClientBreakFreeActionHandle isEqualTo -1) then
{
	player removeAction ExileClientBreakFreeActionHandle;
	ExileClientBreakFreeActionHandle = -1;
};
if (isClass (configFile >> "CfgPatches" >> "secondary_weapons")) then {_this call SecondaryWeapons_events_onKilled;};
ExileClientIsHandcuffed = false;
ExileClientHostageTaker = objNull;
ExileClientNotificationQueue = [];
ExileIsPlayingRussianRoulette = false;
ExileRussianRouletteChair = false;
[] call ExileClient_gui_russianRoulette_hide;
[] call ExileClient_system_breathing_event_onPlayerDied;
[] call ExileClient_system_snow_event_onPlayerDied;
[] call ExileClient_system_radiation_event_onPlayerDied;
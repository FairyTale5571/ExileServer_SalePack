/**
 * ExileClient_object_construction_move
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private["_object", "_result","_CanMove"];
disableSerialization;
_object = _this select 0;
setMousePosition [0.5,0.5];
_result = ["Do you really want to move this object?", "Move?", "Yes", "Nah"] call BIS_fnc_guiMessage;
waitUntil {uiSleep 0.05; !isNil "_result" };
_CanMove = true;

if (_result) then
{	
	if (ExileClientPlayerIsInCombat) then
	{
		_CanMove = false;
		["ErrorTitleAndText", ["Construction aborted!", "You cannot build during a combat."]] call ExileClient_gui_toaster_addTemplateToast;
	};

	if ([player, 20] call ExileClient_util_world_isClimbingPlayerNearby) then
	{
		_CanMove = false;
		["ErrorTitleAndText", ["Construction aborted!", "You cannot build while someone is on a ladder."]] call ExileClient_gui_toaster_addTemplateToast;
	};
	
	if (player call ExileClient_util_world_isInOwnTerritory) then
	{
		_flag = _object call ExileClient_util_world_getTerritoryAtPosition;
		_territoryLevelConfigs = getArray (missionConfigFile >> "CfgTerritories" >> "prices");
		_territoryLevelConfig = _territoryLevelConfigs select ((_flag getVariable ["ExileTerritoryLevel", 0]) - 1);
		_numberOfConstructionsAllowed = _territoryLevelConfig select 2;
		
		if ((_flag getVariable ["ExileTerritoryNumberOfConstructions", 0]) >= _numberOfConstructionsAllowed) then
		{
			  _CanMove = false;
			  ["ErrorTitleAndText", ["Moving aborted!", "You reached the max elements limit! You need to remove two elements to be able to move and build again!"]] call ExileClient_gui_toaster_addTemplateToast;
		};
	
	};

	if(_CanMove) then
	{
		ExileClientConstructionPosition = getPosATL _object;
		["moveConstructionRequest", [netId _object]] call ExileClient_system_network_send;
	};				
};
true
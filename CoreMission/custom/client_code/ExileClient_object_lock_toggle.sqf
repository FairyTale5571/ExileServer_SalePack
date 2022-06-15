/**
 * ExileClient_object_lock_toggle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_condition", "_object", "_known", "_pincode", "_bypass"];
_condition = _this;
_object = ExileClientInteractionObject;
if(ExileLockIsShown)exitWith{};
ExileLockIsShown = true;
_known = _object getVariable ["ExileAlreadyKnownCode",""];
_bypass = false;
if (player call ExileClient_util_world_isInOwnTerritory) then
{
	if ((getNumber(missionConfigFile >> "CfgLockBypass" >> "buildRights") isEqualTo 1) and !_bypass) then 
	{
		private _territory = player call ExileClient_util_world_getTerritoryAtPosition;
		if(!isNull _territory)then
		{
			if((getPlayerUID player) in (_territory getVariable ["ExileTerritoryBuildRights",[]]))then
			{
				_bypass = true;
			};
		};
	};
	if ((getNumber(missionConfigFile >> "CfgLockBypass" >> "moderator") isEqualTo 1) and !_bypass) then 
	{
		private _territory = player call ExileClient_util_world_getTerritoryAtPosition;
		if(!isNull _territory)then
		{
			if((getPlayerUID player) in (_territory getVariable ["ExileTerritoryModerators",[]]))then
			{
				_bypass = true;
			};
		};
	};
	if ((getNumber(missionConfigFile >> "CfgLockBypass" >> "owner") isEqualTo 1) and !_bypass) then 
	{
		private _territory = player call ExileClient_util_world_getTerritoryAtPosition;
		if(!isNull _territory)then
		{
			if((getPlayerUID player) isEqualTo (_territory getVariable ["ExileOwnerUID",""]))then
			{
				_bypass = true;
			};
		};
	};
	if(_bypass and (_known isEqualTo "")) then
	{
		if ((getNumber(missionConfigFile >> "CfgLockBypass" >> "doors") isEqualTo 1) and {(typeOf _object) find "Exile_Construction" >= 0}) then
		{
			_known = "55434";
		};
		if ((getNumber(missionConfigFile >> "CfgLockBypass" >> "storage") isEqualTo 1) and {(typeOf _object) find "Container" >= 0}) then
		{
			_known = "55434";
		};
	};
};
if ((_known isEqualTo "") || ExileClientPlayerIsInCombat) then
{
	_pincode = 4 call ExileClient_gui_keypadDialog_show;
}
else
{
	_pincode = _known;
};
if!(_pincode isEqualTo "")then
{
	["lockToggle",[netId _object,_pincode,_condition]] call ExileClient_system_network_send;
};
call ExileClient_gui_interactionMenu_unhook;
ExileLockIsShown = false;
true
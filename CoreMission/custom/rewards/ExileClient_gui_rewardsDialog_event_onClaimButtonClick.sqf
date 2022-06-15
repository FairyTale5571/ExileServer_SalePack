/*
 * ExileClient_gui_rewardsDialog_event_onClaimButtonClick
 *
 * Rewards Client - Made by Andrew_S90
 *
 * Derived from ExileMod Code
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private ["_dialog", "_rewardsLB", "_claim", "_dropdown", "_selectedRewardsLBIndex", "_itemClassName", "_selected", "_currentContainerType", "_containerNetID"];
disableSerialization;

_dialog = uiNameSpace getVariable ["RscExileRewardsDialog", displayNull];
_rewardsLB = _dialog displayCtrl 2003;
_claim = _dialog displayCtrl 2004;
_dropdown = _dialog displayCtrl 2005;

_dropdown ctrlEnable false;
_claim ctrlEnable false;
_dropdown ctrlCommit 0;
_claim ctrlCommit 0;


_selectedRewardsLBIndex = lbCurSel _rewardsLB;
if !(_selectedRewardsLBIndex isEqualTo -1) then
{
	_itemClassName = _rewardsLB lbData _selectedRewardsLBIndex;
	if !(_itemClassName isEqualTo "") then
	{
		if !(ExileClientIsWaitingForServerTradeResponse) then
		{
			if (_itemClassName == "ExileMoney" || _itemClassName == "ExileScore" || (_itemClassName isKindOf "AllVehicles")) then 
			{
				if(_itemClassName isKindOf "AllVehicles") then {
					_itemClassName call ExileClient_gui_rewardsDialog_event_onClaimVehicle;
				} else {
					["claimTabsRequest", [_itemClassName, (parseNumber (_rewardsLB lbTextRight _selectedRewardsLBIndex))]] call ExileClient_system_network_send;
				};
			} else {
			
				_selected = lbCurSel _dropdown;
				_currentContainerType = _dropdown lbValue _selected;
				_containerNetID = "";
				if (_currentContainerType isEqualTo 2) then
				{
					_containerNetID = _dropdown lbData _selected;
				};
				ExileClientIsWaitingForServerTradeResponse = true;
				["claimItemRequest", [_itemClassName, _currentContainerType, _containerNetID]] call ExileClient_system_network_send;
			};
		};
	};
};
true
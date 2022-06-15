/**
 * ExileClient_object_lock_scan
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
if !(isNull ExileClientInteractionObject) then 
{
	if(getNumber (missionConfigFile >> "CfgPvE" >> "PvE_status") isEqualTo 1) then
	{
		if !(getNumber (missionConfigFile >> "CfgPvE" >> "allowScanCodeLock") isEqualTo 1) then
		{
			["ErrorTitleAndText",["This is PvE server!"]] call ExileClient_gui_toaster_addTemplateToast;
		};
	}else{
		if ("Exile_Item_ThermalScannerPro" in (magazines player)) then 
		{
			["scanCodeLockRequest", [netId ExileClientInteractionObject]] call ExileClient_system_network_send;
		};
	};
};
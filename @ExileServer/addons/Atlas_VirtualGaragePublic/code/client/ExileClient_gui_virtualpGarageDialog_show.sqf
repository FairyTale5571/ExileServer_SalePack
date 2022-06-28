/**
 * File: ExileClient_gui_virtualpGarageDialog_show
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
private["_flag", "_buildRights", "_territoryLevel", "_maxNumberOfVehicles", "_display", "_confirmButton", "_dropdown", "_index"];
disableSerialization;
createDialog "RscVirtualGaragePublic";
_display = uiNameSpace getVariable ["RscVirtualGaragePublic", displayNull];
false call ExileClient_gui_hud_toggle;
_confirmButton = _display displayCtrl 4004;
_confirmButton ctrlEnable false;
_dropdown = _display displayCtrl 4002;
_slots = player getVariable ["VG_Slots",0];
_slotText = _display displayCtrl 4024;
_slotText ctrlSetText format ["You have %1 slots",_slots];
_buySlotsButton = _display displayCtrl 4025;
if(_slots >= (getNumber (missionConfigFile >> "CfgPublicVirtualGarage" >> "maxSlots"))) then
{
	_buySlotsButton ctrlEnable false;
	_buySlotsButton ctrlSetText "You buy all slots:)";
}else{
	_cost = round (_slots * (getNumber(missionConfigFile >> "CfgPublicVirtualGarage" >> "multiplierSlotsCost")));
	_buySlotsButton ctrlSetText format ["Buy +1 slot for %1",_cost];
};
lbClear _dropdown;
_index = _dropdown lbAdd "Retrieve Vehicle";
_dropdown lbSetValue [_index, 0];
_index = _dropdown lbAdd "Store Vehicle";
_dropdown lbSetValue [_index, 1];
_dropdown lbSetCurSel 0;
call ExileClient_gui_modelBox_create;
true
/**
 * File: ExileClient_virtualp_garage_network_buySlotsResponse
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
disableSerialization;
_display = uiNameSpace getVariable ["RscVirtualGaragePublic", displayNull];
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
true
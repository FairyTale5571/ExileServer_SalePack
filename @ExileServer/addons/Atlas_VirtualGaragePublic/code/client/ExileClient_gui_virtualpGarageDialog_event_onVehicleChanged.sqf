/**
 * File: ExileClient_gui_virtualpGarageDialog_event_onVehicleChanged
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
private["_display", "_confirmButton", "_listBox", "_index", "_data", "_vehicleClass"];
disableSerialization;
_display = uiNameSpace getVariable ["RscVirtualGaragePublic", displayNull];
_confirmButton = _display displayCtrl 4004;
_listBox = _this select 0;
_index = _this select 1;
if !((_listBox lbData _index) isEqualTo "Empty") then
{
	_data = parseSimpleArray (_listBox lbData _index);
	_vehicleClass = _data select 0;
	_display setVariable ["ExileSelectedVehicle", _data select 1];
	_display setVariable ["ID_SelectedVehicle",_data select 2];
	_confirmButton ctrlEnable !((_data select 1) isEqualTo "");
	_vehicleClass call ExileClient_gui_virtualpGarageDialog_updateVehicle;
};
/**
 * ExileClient_object_vehicle_rekeyVehicle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_ReKeyPrice", "_vehicleID", "_newPinCode"];
_ReKeyPrice = _this select 0;
_vehicleID = _this select 1;

["InfoTitleOnly", ["Please enter the new PIN!"]] call ExileClient_gui_toaster_addTemplateToast;
_newPinCode = 4 call ExileClient_gui_keypadDialog_show;
if(_newPinCode isEqualTo "")exitWith {["ErrorTitleAndText", ["PIN CHANGE ABORTED!", ""]] call ExileClient_gui_toaster_addTemplateToast;};
["rekeyVehicleRequest",[_vehicleID,_newPinCode,_ReKeyPrice]] call ExileClient_system_network_send;
true
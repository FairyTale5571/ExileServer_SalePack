/**
 * ExileClient_gui_vehicleRekeyDialog_network_rekeyVehicleDialogResponse
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_responseCode", "_vehicleID", "_salesPrice"];
_responseCode = _this select 0;
_vehicleID = _this select 1;
_salesPrice = _this select 2;
if (_responseCode isEqualTo "enough poptabs") then
{
	[_salesPrice,_vehicleID] spawn ExileClient_object_vehicle_rekeyVehicle;
}
else 
{
	_exception = _this select 0;
	["ErrorTitleAndText", ["Failed to change PIN!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
true
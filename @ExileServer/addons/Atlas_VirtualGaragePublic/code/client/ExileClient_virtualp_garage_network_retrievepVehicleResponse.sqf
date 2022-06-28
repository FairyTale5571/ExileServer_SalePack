/**
 * File: ExileClient_virtualp_garage_network_retrievepVehicleResponse
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
private["_responseCode", "_vehicleNetID", "_salesPrice", "_vehicleObject"];
params ["_vehicleNetID"];
disableSerialization;
_display = uiNamespace getVariable ["RscVirtualGaragePublic",displayNull];
if!(isNil "_display") then
{
	closeDialog 0;
};
_vehicleObject = objectFromNetId _vehicleNetID;
player moveInDriver _vehicleObject;
["SuccessTitleAndText", ["Vehicle deployed!"]] call ExileClient_gui_toaster_addTemplateToast;


ExileClientIsWaitingForServerTradeResponse = false;
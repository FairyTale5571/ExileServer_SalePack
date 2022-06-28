/**
 * File: ExileClient_virtualp_garage_network_pstoreVehicleResponse
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
private["_success", "_nickname", "_display"];
_success = _this select 0;
_nickname = _this select 1;
if (_success) then 
{
	["SuccessTitleAndText", ["Success!", format["'%1' has been digitized and stored", _nickname]]] call ExileClient_gui_toaster_addTemplateToast;
	_display = uiNamespace getVariable ["RscVirtualGaragePublic", displayNull];
	if !(isNull _display) then 
	{
		closeDialog 1;
	};
}
else
{
	["ErrorTitleAndText", ["Failed to store vehicle", _nickname]] call ExileClient_gui_toaster_addTemplateToast;
};
ExileClientIsWaitingForServerTradeResponse = false;
true
_display = uiNamespace getVariable["VehiclePaintingDialog", displayNull];
_listBox = (_display displayCtrl 1500);
_index = lbCurSel _listBox;

if (VehiclePainting_Mode == 2) then
{
  	["PaintVehicleRequest",[VehiclePainting_SelectedItem,getObjectTextures ExileClientModelBoxVehicle]] call ExileClient_system_network_send;
}
else
{
	if (_index == -1) then
	{
	    ["ErrorTitleAndText", ["No Texture Selected", "No Texture was selected from the list"]] call ExileClient_gui_toaster_addTemplateToast;
	}
	else
	{
	    ["PaintVehicleRequest",[VehiclePainting_SelectedItem,getObjectTextures ExileClientModelBoxVehicle]] call ExileClient_system_network_send;
	}
}

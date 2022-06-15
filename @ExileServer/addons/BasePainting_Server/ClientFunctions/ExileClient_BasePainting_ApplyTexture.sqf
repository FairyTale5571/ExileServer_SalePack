/*
* 	Name: ExileClient_BasePainting_ApplyTexture.sqf
* 	Author(s): Shix
* 	Description: Send Network Message to the server to save the new texture and do some other shit ..... yeah
*/
_display = uiNamespace getVariable["BasePaintingDialog", displayNull];
_listBox = (_display displayCtrl 1500);
_index = lbCurSel _listBox;

if (BasePainting_Mode == 2) then
{
  	["PaintBasePartRequest",[BasePainting_SelectedItem,getObjectTextures ExileClientModelBoxVehicle]] call ExileClient_system_network_send;
}
else
{
	//No invisible walls ...... seriously arma ... why even allow that in the first place
	if (_index == -1) then
	{
	    ["ErrorTitleAndText", ["No Texture Selected", "No Texture was selected from the list"]] call ExileClient_gui_toaster_addTemplateToast;
	}
	else
	{
	    ["PaintBasePartRequest",[BasePainting_SelectedItem,getObjectTextures ExileClientModelBoxVehicle]] call ExileClient_system_network_send;
	}
}

/*
* 	Name: ExileClient_BasePainting_LBSelChanged.sqf
* 	Author(s): Shix
* 	Description: Updates many harambe picutres and votes for Donald Trump
*/
_display = uiNamespace getVariable["BasePaintingDialog", displayNull];
_listBox = (_display displayCtrl 1500);
_index = lbCurSel _listBox;
_texturePath = _listBox lbData _index;
ExileClientModelBoxVehicle setObjectTexture [lbCurSel 2100,_texturePath];

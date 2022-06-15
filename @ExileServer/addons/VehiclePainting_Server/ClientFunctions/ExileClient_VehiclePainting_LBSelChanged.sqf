_display = uiNamespace getVariable["VehiclePaintingDialog", displayNull];
_listBox = (_display displayCtrl 1500);
_index = lbCurSel _listBox;
_texturePath = _listBox lbData _index;
ExileClientModelBoxVehicle setObjectTexture [lbCurSel 2100,_texturePath];

disableSerialization;
createDialog "VehiclePaintingDialog";
VehiclePainting_Mode = 1;
//Display object
_display = uiNamespace getVariable["VehiclePaintingDialog", displayNull];

(findDisplay 7688) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {call ExileClient_VehiclePainting_DialogClose;}; call ExileClient_VehiclePainting_FilterList;"];
(findDisplay 7688) displayAddEventHandler ["MouseZChanged", "_this call ExileClient_VehiclePainting_MouseZChanged"]; //EH for zooming in and out

VehiclePainting_SelectedItem = _this select 0;
VehiclePainting_ItemTextures = getObjectTextures VehiclePainting_SelectedItem;
_objectType = typeOf(VehiclePainting_SelectedItem);

//Hide the colour sliders
{
    (_display displayCtrl _x) ctrlSetFade 1;
    (_display displayCtrl _x) ctrlCommit 0;
    ctrlEnable [_x, false];
} forEach [1900,1901,1902,1200];

//Set the range on colour slider ctrls
{
    sliderSetRange [_x, 0, 1];
    sliderSetSpeed [_x, 0.1, 1];
} forEach [1900,1901,1902];


VehiclePianting_CurrentZoom = 0.7;

//Fill Combobox with texture selections ... well a numerical representation
for "_i" from 1 to count VehiclePainting_ItemTextures do
{
	(_display displayCtrl 2100) lbAdd str(_i);
};
lbSetCurSel [2100, 0];

//Load vehicle specific
if (isClass(missionConfigFile >> "CfgVehiclePainting" >> "Skins" >> _objectType)) then {
    {
    	_index = (_display displayCtrl 1500) lbAdd toUpper (_x select 0);
    	(_display displayCtrl 1500) lbSetData [_index,_x select 1];
    } forEach getArray(missionConfigFile >> "CfgVehiclePainting" >>"Skins" >> _objectType >> "Skins");
};

//Load textures that can go on all vehicles
{
  	_index = (_display displayCtrl 1500) lbAdd toUpper (_x select 0);
	(_display displayCtrl 1500) lbSetData [_index,_x select 1];
} forEach getArray(missionConfigFile >> "CfgVehiclePainting" >> "Skins" >> "All" >> "Skins");

call ExileClient_gui_modelBox_create;
_objectType call ExileClient_gui_modelBox_update;

for "_i" from 0 to (count VehiclePainting_ItemTextures) -1 do
{
    ExileClientModelBoxVehicle setObjectTexture [_i,VehiclePainting_ItemTextures select _i];
};

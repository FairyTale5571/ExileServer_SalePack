/*
* 	Name: ExileClient_BasePainting_DialogLoad.sqf
* 	Author(s): Shix
* 	Description: Loads the Base Painting Dialog
*/
disableSerialization;
createDialog "BasePaintingDialog";
BasePainting_Mode = 1;
//Display object .... duhhh
_display = uiNamespace getVariable["BasePaintingDialog", displayNull];

(findDisplay 7688) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {call ExileClient_BasePainting_DialogClose}; call ExileClient_BasePainting_FilterList;"]; //EH for if they press Esc
(findDisplay 7688) displayAddEventHandler ["MouseZChanged", "_this call ExileClient_BasePainting_MouseZChanged"]; //EH for zooming in and out
BasePainting_SelectedItem = _this select 0; //Cast the selected base bart to a golbal var
BasePainting_ItemTextures = getObjectTextures BasePainting_SelectedItem;
_objectType = typeOf(BasePainting_SelectedItem);

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


BasePianting_CurrentZoom = 0.7;

//Fill Combobox with texture selections ... well a numerical representation
for "_i" from 1 to count BasePainting_ItemTextures do
{
	(_display displayCtrl 2100) lbAdd str(_i);
};
lbSetCurSel [2100, 0];

//Load textures to list
{
	_index = (_display displayCtrl 1500) lbAdd toUpper (_x select 0);
	(_display displayCtrl 1500) lbSetData [_index,_x select 1];
} forEach getArray(missionConfigFile >> "BasePainting_Config" >>"Textures" >> _objectType);

{
  	_index = (_display displayCtrl 1500) lbAdd toUpper (_x select 0);
	(_display displayCtrl 1500) lbSetData [_index,_x select 1];
} forEach getArray(missionConfigFile >> "BasePainting_Config" >>"Textures" >> "All");

call ExileClient_gui_modelBox_create;
_objectType call ExileClient_gui_modelBox_update;

for "_i" from 0 to (count BasePainting_ItemTextures) -1 do
{
    ExileClientModelBoxVehicle setObjectTexture [_i,BasePainting_ItemTextures select _i];
};

//BasePaintingSearchThread = [0.1,ExileClient_BasePainting_FilterList,[],true,true] call ExileClient_system_thread_addTask;
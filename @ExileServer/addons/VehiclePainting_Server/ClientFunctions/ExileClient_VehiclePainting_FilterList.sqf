disableSerialization;
_textures = [];
if (VehiclePainting_Mode isEqualTo 1) then
{
    if (isClass(missionConfigFile >> "CfgVehiclePainting" >> "Skins" >> typeOf(VehiclePainting_SelectedItem))) then {
        _textures append getArray(missionConfigFile >> "CfgVehiclePainting" >>"Skins" >> typeOf(VehiclePainting_SelectedItem) >> "Skins");

    };
    _textures append getArray(missionConfigFile >> "CfgVehiclePainting" >> "Skins" >> "All" >> "Skins");
};
_display = uiNamespace getVariable["VehiclePaintingDialog", displayNull];
_listBox = (_display displayCtrl 1500);

if (ctrlText 1400 == "") then
{
    lbClear _listBox;
    {
      	_index = _listBox lbAdd toUpper (_x select 0);
    	(_display displayCtrl 1500) lbSetData [_index,_x select 1];
    } forEach _textures;
}
else
{
    lbClear _listBox;
    {
        _textureName = _x select 0;
        _texturePath = _x select 1;
        _inStr = [toLower (ctrlText 1400), toLower(_textureName)] call BIS_fnc_inString;
        if (_inStr) then
        {
            _index = _listBox lbAdd toUpper _textureName;
        	(_display displayCtrl 1500) lbSetData [_index,_texturePath];
        };
    } forEach _textures;
};

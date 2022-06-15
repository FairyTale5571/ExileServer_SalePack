/**
 * ExileClient_gui_selectSpawnLocation_zoomToMarker
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_markerName","_display","_mapControl","_pos"];
disableSerialization;
_markerName = _this;
_display = uiNamespace getVariable ["EPSpawnDialog",displayNull];
_mapControl = _display displayCtrl 1300;
_pos = getMarkerPos _markerName;
if (str(_pos) == "[0,0,0]") then {
	_varF = player getVariable [_markerName, objNull];
	if (!isNil "_varF") then { _pos = getPos _varF; };
};
_mapControl ctrlMapAnimAdd [1, 0.1, _pos]; 
ctrlMapAnimCommit _mapControl;
true
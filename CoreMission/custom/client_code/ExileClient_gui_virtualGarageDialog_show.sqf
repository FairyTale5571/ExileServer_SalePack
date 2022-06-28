
private["_flag", "_buildRights", "_territoryLevel", "_maxNumberOfVehicles", "_display", "_confirmButton", "_dropdown", "_index","_flags"];
disableSerialization;
try 
{
	if ((getNumber(missionConfigFile >> 'CfgVirtualGarage' >> 'enableVirtualGarage')) isEqualTo 0) then 
	{
		throw "Scroll MouseButton on Flag or find table with Laptop in any TradeZone (Exept Black Market) to store your Vehicle!";
	};
	if ((getNumber(missionConfigFile >> "CfgVirtualGarage" >> "canAccessGarageInCombat") isEqualTo 1) && {ExileClientPlayerIsInCombat}) then 
	{
		throw "You cannot access Virtual Garage while in combat!";	
	};
	_flag = player call ExileClient_util_world_getTerritoryAtPosition;
	if (isNull _flag) then 
	{
		throw "You must be in your territory in order to access Virtual Garage";
	};
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
	if !((getPlayerUID player) in _buildRights) then 
	{
		throw "You do not have permission to access this territory's Virtual Garage";
	};
	_territoryLevel = _flag getVariable ["ExileTerritoryLevel", 1];
	_maxNumberOfVehicles = getArray(missionConfigFile >> "CfgVirtualGarage" >> "numberOfVehicles") select ((_territoryLevel - 1) max 0);
	if (_maxNumberOfVehicles isEqualTo -1) then 
	{
		throw "Your territory isn't allowed to store any vehicles.<br />Upgrade your territory to gain access to Virtual Garage";
	};
	_flags = player nearObjects ["Exile_Construction_Flag_Static", 5];
	if(_flags isEqualTo [])exitWith
	{
		throw "Move closer to your Base Flag to use Virtual Garage!";
	};
	createDialog "RscExileVirtualGarageDialog";
	_display = uiNameSpace getVariable ["RscExileVirtualGarageDialog", displayNull];
	false call ExileClient_gui_hud_toggle;
	false call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
	_confirmButton = _display displayCtrl 4007;
	_confirmButton ctrlEnable false;
	_dropdown = _display displayCtrl 4005;
	lbClear _dropdown;
	_index = _dropdown lbAdd "Retrieve Vehicle";
	_dropdown lbSetValue [_index, 0];
	_index = _dropdown lbAdd "Store Vehicle";
	_dropdown lbSetValue [_index, 1];
	_dropdown lbSetCurSel 0;
	call ExileClient_gui_modelBox_create;
}
catch 
{
	[_exception, 'Okay'] call ExileClient_gui_xm8_showWarning;
};
true
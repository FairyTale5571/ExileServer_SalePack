/**
 * ExileClient_gui_setupTerritoryDialog_event_onPlaceButtonClick
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_display", "_listBox", "_territoryName", "_selectedFlag", "_alphabet", "_forbiddenCharacter","_position","_center","_allTerritoryFlags","_baseName","_ExileAllBasenames"];
_display = uiNameSpace getVariable ["RscExileSetupTerritoryDialog", displayNull];
_listBox = _display displayCtrl 4001;
_territoryName = ctrlText (_display displayCtrl 4000);
_selectedFlag = lbCurSel _listBox;
_selectedFlag = _listBox lbData _selectedFlag;

try
{
	_territoryName = _territoryName call ExileClient_util_string_trim;
	_NameLength = count _territoryName;
	if (_NameLength isEqualTo 0) then 
	{
		throw "Please enter a territory name.";
	};
	if (_NameLength < 3) then 
	{
		throw "Territory name is too short.";
	};
	if (_NameLength > 16) then
	{
		throw "Territory name is longer than 16 letters.";
	};
	if(_selectedFlag == "") then 
	{
		throw "Please choose a flag from the list.";
	};

	_ExileAllBasenames = [];
	_position = worldSize/2;
	_center = [_position,_position,0];
	_allTerritoryFlags = nearestObjects [_center, ["Exile_Construction_Flag_Static"], worldSize];
    {
        _baseName = _x getVariable ["ExileTerritoryName", ""];
        _ExileAllBasenames pushBack _baseName;
            
    }forEach _allTerritoryFlags;
	
	if(_territoryName in _ExileAllBasenames) then 
	{
		throw "Name is already in use, please choose a different name!";
	};
	
	_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
	_forbiddenCharacter = [_territoryName, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) then 
	{
		throw "Invalid character in input. Please try again.";
	};
	["Exile_Item_Flag",_selectedFlag,_territoryName] call ExileClient_construction_beginNewObject;
}
catch
{
	["ErrorTitleAndText", ["Failed to place flag!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
closeDialog 0;
true
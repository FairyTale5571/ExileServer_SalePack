	/**
	 * ExileClient_gui_selectSpawnLocation_show
	 *
	 * Exile Mod
	 * www.exilemod.com
	 * © 2015 Exile Mod Team
	 *
	 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
	 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
	 */
	 

diag_log "Selecting spawn location...";
ExileClientSpawnLocationSelectionDone = false;
ExileClientSelectedSpawnLocationMarkerName = "";

[] spawn
{
	private["_display","_topTextCTRL1","_topTextCTRL2","_spawnButton","_listBox","_listItemIndex","_numberOfSpawnPoints","_randNum","_randData","_randomSpawnIndex","_puid"];
	uiSleep 0.1;
	waitUntil {!isNull (findDisplay 46)};
	disableSerialization;
	createDialog "EPSpawnDialog";
	waitUntil
	{
		_display = findDisplay 86000;
		!isNull _display
	};
	_display = uiNamespace getVariable ["EPSpawnDialog",displayNull];

	_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
	_spawnButton = _display displayCtrl 1600;
	_spawnButton2 = _display displayCtrl 1601;
	_spawnButton ctrlEnable false;
	_spawnButton2 ctrlEnable false;
	_tipText = _display displayCtrl 1204;
	_listBox = _display displayCtrl 1500;

	lbClear _listBox;

	{
		if (getMarkerType _x == "ExileSpawnZone") then
		{
			_listItemIndex = _listBox lbAdd (markerText _x);
			_listBox lbSetData [_listItemIndex, _x];
		};
	}
	forEach allMapMarkers;

	_numberOfSpawnPoints = {getMarkerType _x == "ExileSpawnZone"} count allMapMarkers;
	if (_numberOfSpawnPoints > 0) then 
	{
		_randNum = floor(random _numberOfSpawnPoints);
		_randData = lbData [1500,_randNum];
		_randomSpawnIndex = _listBox lbAdd "Random";
		_listBox lbSetData [_randomSpawnIndex, _randData];
	};


	_tipTextListArray = getArray(missionConfigFile >> "CfgSpawnMenu" >> "tooltipText");
	_tipTextList = selectRandom _tipTextListArray;
	_tipText ctrlSetStructuredText parseText format["<t size ='1.8 / (getResolution select 5)' valign='middle' align='right'> %1 </t>",_tipTextList];

	if (getNumber(missionConfigFile >> "CfgSpawnMenu" >> "chooseSpawnBox") isEqualTo 1) then
	{
		_listBox = _display ctrlCreate["RscListbox", 24004];
		_listBox ctrlSetPosition [1.378,0.62,0.21,0.518];
		_listBox ctrlSetBackgroundColor [0,0,0,0.8];
		_listBox ctrlCommit 0;
		_listBox ctrlRemoveAllEventHandlers "LBDblClick";
		_listBox ctrlRemoveAllEventHandlers "LBSelChanged";
		_listBox ctrlAddEventHandler ["LBDblClick", "call fnc_LBDblClick_LBSelChanged_LO;"];
		_listBox ctrlAddEventHandler ["LBSelChanged", "call fnc_LBDblClick_LBSelChanged_LO;"];
		_listItemIndex = _listBox lbAdd "Default loot";
		_listItemIndex = _listBox lbSetColor [0, [0, 1, 0, 0.5]];
		_listItemIndex = _listBox lbSetTooltip [0, "Get a Free Loadout"];
		_listItemIndex = _listBox lbAdd "Premium 1";
		_listItemIndex = _listBox lbSetTooltip [1, "300 RUR month"];
		_listItemIndex = _listBox lbAdd "Premium 2";
		_listItemIndex = _listBox lbSetTooltip [2, "300 RUR month"];		//собственно вот, [2, "300RUR month"];	- где 2 это номер case, "300RUR month" текст который будет выводиться при наведении на класс
	};
	systemChat 'For buy premium contact to admin';
	/* waitUntil {!isNil "atlas_sup"}; */
	FNC_GET_ACTUAL_LOADOUT = {
		waitUntil {typeOf player isEqualTo 'Exile_Unit_Player'};
		uiSleep 3;
		_puid =  getPlayerUID player;
		switch (_this) do {
			case 0:
			{
				
			};
			case 1:				//Дублируем этот класс, чтобы получилось сase 2, как показано ниже
			{		
				// сюда писать ID игроков которым будет выдаваться лут, через запятую
				if !(_puid in [""]) then 
				{
				
					[parseText format["<t size='0.7'font='OrbitronLight'>Only Available for Prem Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
					//Сюда писать лут, можно скопировать с виртуального арсенала
					
					//При портировании лута из арсенала нужно будет заменить все this на player
					
					call ExileClient_object_player_bambiStateEnd; 
				};
			};
			case 2:				//Вот, это case 2, дописываем его ективацию выше, в данном случае это 68-69 строки
			{		
				// сюда писать ID игроков которым будет выдаваться лут, через запятую
				if !(_puid in [""]) then 
				{
				
					[parseText format["<t size='0.7'font='OrbitronLight'>Only Available for Prem Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
					//Сюда писать лут, можно скопировать с виртуального арсенала
					
					//При портировании лута из арсенала нужно будет заменить все this на player
					
					call ExileClient_object_player_bambiStateEnd; 
				};
			};
		};
	};
	fnc_LBDblClick_LBSelChanged_LO = {
		CURSEL_PREMIUM_LOADOUT = _this select 1;
	};
	fnc_ButtonClick = {
		[0] call ExileClient_gui_selectSpawnLocation_event_onSpawnButtonClick;
		if(isNil"CURSEL_PREMIUM_LOADOUT")then{CURSEL_PREMIUM_LOADOUT=0;};
		CURSEL_PREMIUM_LOADOUT spawn FNC_GET_ACTUAL_LOADOUT;
	};
	fnc_ButtonClick2 = {
		[1] call ExileClient_gui_selectSpawnLocation_event_onSpawnButtonClick;
		if(isNil"CURSEL_PREMIUM_LOADOUT")then{CURSEL_PREMIUM_LOADOUT=0;};
		CURSEL_PREMIUM_LOADOUT spawn FNC_GET_ACTUAL_LOADOUT;
	};
	_this call Atlas_spawnOnFlag;
	true
};
true
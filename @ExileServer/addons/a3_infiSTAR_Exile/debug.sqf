fnc_admin_c = compileFinal 'compile _this';
fnc_admin_cc = compileFinal 'call compile _this';
fnc_createctrl = {
	params['_display','_type','_idc'];
	ctrlDelete (_display displayCtrl _idc);
	_ctrl = _display ctrlCreate[_type, _idc];
	_ctrl
};




fnc_setPNS = compileFinal '
	profileNameSpace setVariable _this;saveProfileNamespace;
';
fnc_getPNS = compileFinal '
	profileNameSpace getVariable _this
';
fnc_lbDebugChanged = {
	disableSerialization;
	_ctrl = _this select 0;
	_index = _this select 1;
	((findDisplay -1341) displayCtrl 1) ctrlSetText (['infiSTAR_SAVED_FUNCTIONS',[]] call fnc_getPNS select _index);
};
fnc_fillDebugListBox = {
	_listbox = (findDisplay -1341) displayCtrl 1384;
	_listbox ctrlRemoveAllEventHandlers 'LBDblClick';
	_listbox ctrlRemoveAllEventHandlers 'LBSelChanged';		
	_listbox ctrlAddEventHandler ['LBDblClick', 'call fnc_lbDebugChanged;call fnc_debug_loadbtn;true'];
	_listbox ctrlAddEventHandler ['LBSelChanged', 'call fnc_lbDebugChanged;true'];
	lbClear _listbox;
	
	_var = ['infiSTAR_SAVED_FUNCTIONS',[]] call fnc_getPNS;
	if!(_var isEqualTo [])then
	{
		{
			_lbid = _listbox lbAdd _x;
		} forEach _var;
	};
};
already_run_array = [];
last_selected_run_id = 0;
fnc_getMainText = {
	private _txt = ctrlText((findDisplay -1341) displayCtrl 1339);
	already_run_array = already_run_array - [_txt];
	last_selected_run_id = already_run_array pushBack _txt;
	_txt
};
fnc_debug_loadbtn = {
	_var = ['infiSTAR_SAVED_FUNCTIONS',[]] call fnc_getPNS;
	_varname = lbtext[1384,(lbCurSel 1384)];
	if(_varname isEqualTo '')then
	{
		systemChat 'You need to select a function to load it..!';
	}
	else
	{
		_varvalue = [format['infiSTAR_SAVED_FUNCTION_%1',_varname],''] call fnc_getPNS;
		((findDisplay -1341) displayCtrl 1339) ctrlSetText _varvalue;
		
		systemChat format['Loaded: %1',_varname];
		call fnc_fillDebugListBox;
	};
true
};
fnc_workplace = {
_admin = !isNil'MAIN_DISPLAY_ID';
disableSerialization;
if(isNull findDisplay -1341)then{createdialog 'infiSTAR_EDITBOX2';'AdminConsole' call fnc_adminLog;};
_display = findDisplay -1341;
_buttonheight = 0.05;

_wfposY = safeZoneY + 0.01;
_wf1 = _display displayCtrl 1380;
_wf1 ctrlSetPosition [0,_wfposY,1,_buttonheight];
_wf1 ctrlCommit 0;

_wf1cb = [_display,'RscCheckBox',1360] call fnc_createctrl;
_wf1cb cbSetChecked (['cbChecked__wf1',false] call fnc_getPNS);
_wf1cb ctrlSetPosition [-_buttonheight,_wfposY,_buttonheight,_buttonheight];
_wf1cb ctrlSetEventHandler['CheckedChanged','[''cbChecked__wf1'',(_this select 1) isEqualTo 1] call fnc_setPNS;true'];
_wf1cb ctrlSetTooltip 'ALWAYS SHOW';
_wf1cb ctrlCommit 0;


_wf1cb1 = [_display,'RSCButton',1461] call fnc_createctrl;
_wf1cb1 ctrlSetText 'copy';
_wf1cb1 ctrlSetPosition [1,_wfposY,0.09,_buttonheight];
_wf1cb1 ctrlCommit 0;
_wf1cb1 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 7564982345) ctrlSetText ctrlText((findDisplay 46) displayCtrl 1362);true'];

_wf1cb2 = [_display,'RSCButton',1361] call fnc_createctrl;
_wf1cb2 ctrlSetText 'clear';
_wf1cb2 ctrlSetPosition [1.09,_wfposY,0.09,_buttonheight];
_wf1cb2 ctrlCommit 0;
_wf1cb2 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1380) ctrlSetText '''';[''wf1tTCT'',''''] call fnc_setPNS;true'];

if(!isNil'wf1T')then{terminate wf1T;wf1T=nil;};
wf1T = [0,_wfposY+0.045,1,_buttonheight] spawn {
	disableSerialization;
	_oldText = ['wf1tTCT',''] call fnc_getPNS;
	
	_display = findDisplay -1341;
	_wf1 = _display displayCtrl 1380;
	_wf1 ctrlSetText _oldText;
	
	_wf1t = [findDisplay 46,'RSCText',1362] call fnc_createctrl;
	_wf1t ctrlSetPosition _this;
	_wf1t ctrlCommit 0;
	while {true} do
	{
		if((isNull _wf1) && !(['cbChecked__wf1',false] call fnc_getPNS))exitWith{_wf1t ctrlSetText '';};
		
		_oldText = ['wf1tTCT',''] call fnc_getPNS;
		if(!isNull _wf1)then
		{
			_ctrltext = ctrlText _wf1;
			if(_ctrltext isEqualTo '')then
			{
				_wf1t ctrlSetText '';
			}
			else
			{
				if!(_ctrltext isEqualTo _oldText)then
				{
					['wf1tTCT',_ctrltext] call fnc_setPNS;
				};
			};
		};
		if!(_oldText isEqualTo '')then
		{
			_wf1t ctrlSetText str(_oldText call fnc_admin_cc);
		};
		uiSleep 0.1;
	};
};

_wfposY = _wfposY + 0.1;
_wf2 = _display displayCtrl 1381;
_wf2 ctrlSetPosition [0,_wfposY,1,_buttonheight];
_wf2 ctrlCommit 0;

_wf2cb = [_display,'RscCheckBox',1260] call fnc_createctrl;
_wf2cb cbSetChecked (['cbChecked__wf2',false] call fnc_getPNS);
_wf2cb ctrlSetPosition [-_buttonheight,_wfposY,_buttonheight,_buttonheight];
_wf2cb ctrlSetEventHandler['CheckedChanged','[''cbChecked__wf2'',(_this select 1) isEqualTo 1] call fnc_setPNS;true'];
_wf2cb ctrlSetTooltip 'ALWAYS SHOW';
_wf2cb ctrlCommit 0;

_wf2cb1 = [_display,'RSCButton',1561] call fnc_createctrl;
_wf2cb1 ctrlSetText 'copy';
_wf2cb1 ctrlSetPosition [1,_wfposY,0.09,_buttonheight];
_wf2cb1 ctrlCommit 0;
_wf2cb1 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 7564982345) ctrlSetText ctrlText((findDisplay 46) displayCtrl 1262);true'];

_wf2cb2 = [_display,'RSCButton',1261] call fnc_createctrl;
_wf2cb2 ctrlSetText 'clear';
_wf2cb2 ctrlSetPosition [1.09,_wfposY,0.09,_buttonheight];
_wf2cb2 ctrlCommit 0;
_wf2cb2 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1381) ctrlSetText '''';[''wf2tTCT'',''''] call fnc_setPNS;true'];

if(!isNil'wf2T')then{terminate wf2T;wf2T=nil;};
wf2T = [0,_wfposY+0.045,1,_buttonheight] spawn {
	disableSerialization;
	_oldText = ['wf2tTCT',''] call fnc_getPNS;
	
	_display = findDisplay -1341;
	_wf2 = _display displayCtrl 1381;
	_wf2 ctrlSetText _oldText;
	
	_wf2t = [findDisplay 46,'RSCText',1262] call fnc_createctrl;
	_wf2t ctrlSetPosition _this;
	_wf2t ctrlCommit 0;
	while {true} do
	{
		if((isNull _wf2) && !(['cbChecked__wf2',false] call fnc_getPNS))exitWith{_wf2t ctrlSetText '';};
		
		_oldText = ['wf2tTCT',''] call fnc_getPNS;
		if(!isNull _wf2)then
		{
			_ctrltext = ctrlText _wf2;
			if(_ctrltext isEqualTo '')then
			{
				_wf2t ctrlSetText '';
			}
			else
			{
				if!(_ctrltext isEqualTo _oldText)then
				{
					['wf2tTCT',_ctrltext] call fnc_setPNS;
				};
			};
		};
		if!(_oldText isEqualTo '')then
		{
			_wf2t ctrlSetText str(_oldText call fnc_admin_cc);
		};
		uiSleep 0.1;
	};
};


_wfposY = _wfposY + 0.1;
_wf3 = _display displayCtrl 1382;
_wf3 ctrlSetPosition [0,_wfposY,1,_buttonheight];
_wf3 ctrlCommit 0;

_wf3cb = [_display,'RscCheckBox',1160] call fnc_createctrl;
_wf3cb cbSetChecked (['cbChecked__wf3',false] call fnc_getPNS);
_wf3cb ctrlSetPosition [-_buttonheight,_wfposY,_buttonheight,_buttonheight];
_wf3cb ctrlSetEventHandler['CheckedChanged','[''cbChecked__wf3'',(_this select 1) isEqualTo 1] call fnc_setPNS;true'];
_wf3cb ctrlSetTooltip 'ALWAYS SHOW';
_wf3cb ctrlCommit 0;

_wf3cb1 = [_display,'RSCButton',1661] call fnc_createctrl;
_wf3cb1 ctrlSetText 'copy';
_wf3cb1 ctrlSetPosition [1,_wfposY,0.09,_buttonheight];
_wf3cb1 ctrlCommit 0;
_wf3cb1 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 7564982345) ctrlSetText ctrlText((findDisplay 46) displayCtrl 1162);true'];

_wf3cb2 = [_display,'RSCButton',1161] call fnc_createctrl;
_wf3cb2 ctrlSetText 'clear';
_wf3cb2 ctrlSetPosition [1.09,_wfposY,0.09,_buttonheight];
_wf3cb2 ctrlCommit 0;
_wf3cb2 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1382) ctrlSetText '''';[''wf3tTCT'',''''] call fnc_setPNS;true'];

if(!isNil'wf3T')then{terminate wf3T;wf3T=nil;};
wf3T = [0,_wfposY+0.045,1,_buttonheight] spawn {
	disableSerialization;
	_oldText = ['wf3tTCT',''] call fnc_getPNS;
	
	_display = findDisplay -1341;
	_wf3 = _display displayCtrl 1382;
	_wf3 ctrlSetText _oldText;
	
	_wf3t = [findDisplay 46,'RSCText',1162] call fnc_createctrl;
	_wf3t ctrlSetPosition _this;
	_wf3t ctrlCommit 0;
	while {true} do
	{
		if((isNull _wf3) && !(['cbChecked__wf3',false] call fnc_getPNS))exitWith{_wf3t ctrlSetText '';};
		
		_oldText = ['wf3tTCT',''] call fnc_getPNS;
		if(!isNull _wf3)then
		{
			_ctrltext = ctrlText _wf3;
			if(_ctrltext isEqualTo '')then
			{
				_wf3t ctrlSetText '';
			}
			else
			{
				if!(_ctrltext isEqualTo _oldText)then
				{
					['wf3tTCT',_ctrltext] call fnc_setPNS;
				};
			};
		};
		if!(_oldText isEqualTo '')then
		{
			_wf3t ctrlSetText str(_oldText call fnc_admin_cc);
		};
		uiSleep 0.1;
	};
};


_wfposY = _wfposY + 0.1;
_wf4 = _display displayCtrl 1383;
_wf4 ctrlSetPosition [0,_wfposY,1,_buttonheight];
_wf4 ctrlCommit 0;

_wf4cb = [_display,'RscCheckBox',1060] call fnc_createctrl;
_wf4cb cbSetChecked (['cbChecked__wf4',false] call fnc_getPNS);
_wf4cb ctrlSetPosition [-_buttonheight,_wfposY,_buttonheight,_buttonheight];
_wf4cb ctrlSetEventHandler['CheckedChanged','[''cbChecked__wf4'',(_this select 1) isEqualTo 1] call fnc_setPNS;true'];
_wf4cb ctrlSetTooltip 'ALWAYS SHOW';
_wf4cb ctrlCommit 0;

_wf4cb1 = [_display,'RSCButton',1761] call fnc_createctrl;
_wf4cb1 ctrlSetText 'copy';
_wf4cb1 ctrlSetPosition [1,_wfposY,0.09,_buttonheight];
_wf4cb1 ctrlCommit 0;
_wf4cb1 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 7564982345) ctrlSetText ctrlText((findDisplay 46) displayCtrl 1062);true'];

_wf4cb2 = [_display,'RSCButton',1061] call fnc_createctrl;
_wf4cb2 ctrlSetText 'clear';
_wf4cb2 ctrlSetPosition [1.09,_wfposY,0.09,_buttonheight];
_wf4cb2 ctrlCommit 0;
_wf4cb2 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1383) ctrlSetText '''';[''wf4tTCT'',''''] call fnc_setPNS;true'];

if(!isNil'wf4T')then{terminate wf4T;wf4T=nil;};
wf4T = [0,_wfposY+0.045,1,_buttonheight] spawn {
	disableSerialization;
	_oldText = ['wf4tTCT',''] call fnc_getPNS;
	
	_display = findDisplay -1341;
	_wf4 = _display displayCtrl 1383;
	_wf4 ctrlSetText _oldText;
	
	_wf4t = [findDisplay 46,'RSCText',1062] call fnc_createctrl;
	_wf4t ctrlSetPosition _this;
	_wf4t ctrlCommit 0;
	while {true} do
	{
		if((isNull _wf4) && !(['cbChecked__wf4',false] call fnc_getPNS))exitWith{_wf4t ctrlSetText '';};
		
		_oldText = ['wf4tTCT',''] call fnc_getPNS;
		if(!isNull _wf4)then
		{
			_ctrltext = ctrlText _wf4;
			if(_ctrltext isEqualTo '')then
			{
				_wf4t ctrlSetText '';
			}
			else
			{
				if!(_ctrltext isEqualTo _oldText)then
				{
					['wf4tTCT',_ctrltext] call fnc_setPNS;
				};
			};
		};
		if!(_oldText isEqualTo '')then
		{
			_wf4t ctrlSetText str(_oldText call fnc_admin_cc);
		};
		uiSleep 0.1;
	};
};

_ctrl = [_display,'RSCEdit',7564982345] call fnc_createctrl;
_ctrl ctrlSetPosition [0,_wfposY + 0.245,1,_buttonheight];
_ctrl ctrlSetBackgroundColor [0,0,0,0.6];
_ctrl ctrlCommit 0;

_ctrl = _display displayCtrl 1339;
_startYpos = safeZoneY + 0.61;
_ctrl ctrlSetPosition [0,_startYpos,1,1];
_ctrl ctrlCommit 0;
_ctrl ctrlSetText (['workplacemainwindow',''] call fnc_getPNS);
if(!isNil'workplacemainwindowT')then{terminate workplacemainwindowT;workplacemainwindowT=nil;};
workplacemainwindowT = [] spawn {
	disableSerialization;
	while{true}do
	{
		_ctrl = (findDisplay -1341) displayCtrl 1339;
		if(isNull _ctrl)exitWith{workplacemainwindowT=nil;};
		
		_ctext = ctrlText _ctrl;
		_vtext = ['workplacemainwindow',''] call fnc_getPNS;
		if!(_ctext isEqualTo _vtext)then
		{
			['workplacemainwindow',_ctext] call fnc_setPNS;
		};
		uiSleep 0.1;
	};
};
_ctrlid = 7338;

if(_admin)then{
_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'GLOBAL';
_ctrl ctrlSetPosition [0,_startYpos + 1,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','[call fnc_getMainText] call admin_d0;systemChat ''<infiSTAR.de> RAN CODE ON: GLOBAL (SERVER AND ALL CLIENTS)'';true'];

_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'ALL BUT SERVER';
_ctrl ctrlSetPosition [0,_startYpos + 1 + _buttonheight,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','[''if(!isServer)then{''+(call fnc_getMainText)+''};''] call admin_d0;systemChat ''<infiSTAR.de> RAN CODE ON: ALL BUT SERVER'';true'];


_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'SERVER';
_ctrl ctrlSetPosition [0.25,_startYpos + 1,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','[call fnc_getMainText] call admin_d0_server;systemChat ''<infiSTAR.de> RAN CODE ON: SERVER'';true'];

_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'SELECTED (ORANGE) TARGET';
_ctrl ctrlSetPosition [0.25,_startYpos + 1 + _buttonheight,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','if(isPlayer SELECTED_TARGET_PLAYER)then{[call fnc_getMainText,SELECTED_TARGET_PLAYER] call admin_d0_target;systemChat format[''<infiSTAR.de> RAN CODE ON: %1'',name SELECTED_TARGET_PLAYER];};true'];
};

_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'LOCAL';
_ctrl ctrlSetPosition [0.5,_startYpos + 1,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','(call fnc_getMainText) call fnc_admin_cc;systemChat ''<infiSTAR.de> RAN CODE ON: LOCAL'';true'];

if(_admin)then{
_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'CAMERAON';
_ctrl ctrlSetPosition [0.5,_startYpos + 1 + _buttonheight,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','if(!isNull cameraOn)then{[call fnc_getMainText,cameraOn] call admin_d0_target;systemChat format[''<infiSTAR.de> RAN CODE ON: %1'',name cameraOn];};true'];
};

_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'NEXT';
_ctrl ctrlSetPosition [0.75,_startYpos + 1,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','
	_max = ((count already_run_array)-1) max 0;
	_new = last_selected_run_id + 1;
	if(_new <= _max)then
	{
		last_selected_run_id = _new;
		_txt = already_run_array select last_selected_run_id;
		((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;
	};
	systemChat format[''<infiSTAR.de console> %1 / %2'',last_selected_run_id,_max];
true
'];

_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'LAST';
_ctrl ctrlSetPosition [0.75,_startYpos + 1 + _buttonheight,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','
	_max = ((count already_run_array)-1) max 0;
	_new = last_selected_run_id - 1;
	if(_new >= 0)then
	{
		last_selected_run_id = _new;
		_txt = already_run_array select last_selected_run_id;
		((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;
	};
	systemChat format[''<infiSTAR.de console> %1 / %2'',last_selected_run_id,_max];
true
'];






_buttonYpos = _startYpos;
_ctrlid = _ctrlid + 1;
if(_admin)then{
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'ALL ITEMS';
_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1339) ctrlSetText str ALLC_ITEMS;true'];
};

_buttonYpos = _buttonYpos + _buttonheight;
_ctrlid = _ctrlid + 1;
if(_admin)then{
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'ALL VEHICLES';
_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','_txt = str ALL_VEHS_TO_SEARCH_C;((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;diag_log _txt;true'];
};

_buttonYpos = _buttonYpos + _buttonheight + _buttonheight;
_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'CURSORTARGET';
_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','_txt = typeOf cursorTarget;((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;diag_log _txt;true'];

_buttonYpos = _buttonYpos + _buttonheight;
_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'VEHICLE PLAYER';
_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','_txt = typeOf vehicle player;((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;diag_log _txt;true'];

_buttonYpos = _buttonYpos + _buttonheight;
_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'GETPOS';
_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','_txt = str(getPos player);((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;diag_log _txt;true'];

_buttonYpos = _buttonYpos + _buttonheight;
_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'GETPOSATL';
_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','_txt = str(getPosATL player);((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;diag_log _txt;true'];

_buttonYpos = _buttonYpos + _buttonheight + _buttonheight;
_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCEdit',_ctrlid] call fnc_createctrl;
_oldTxt = ['infiSTAR_show_function_000',''] call fnc_getPNS;
if(_oldTxt isEqualTo '')then{_oldTxt = '{diag_activeSQFScripts}';};
_ctrl ctrlSetText _oldTxt;
_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
_ctrl ctrlSetBackgroundColor [0,0,0,0.6];
_ctrl ctrlCommit 0;

_buttonYpos = _buttonYpos + _buttonheight;
_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'RETURN FUNCTION VALUE';
_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','
	disableSerialization;
	_display = findDisplay -1341;
	_ctrl = _display displayCtrl 1339;
	
	_ctrltext = ctrlText(_display displayCtrl '+str (_ctrlid - 1)+');
	
	[''infiSTAR_show_function_000'',_ctrltext] call fnc_setPNS;
	
	_var = missionNameSpace getVariable [_ctrltext,''''];
	if(typeName _var isEqualTo ''CODE'')exitWith
	{
		_txt = str([] call _var);
		if(_txt isEqualTo '''')then{_txt = ''nothing to return'';};
		_ctrl ctrlSetText _txt;
		diag_log _txt;
		true
	};
	
	_function = _ctrltext call fnc_admin_cc;
	_txt = '''';
	if(typeName _function isEqualTo ''CODE'')then
	{
		_txt = str([] call _function);
		if(_txt isEqualTo '''')then{_txt = ''nothing to return'';};
	}
	else
	{
		_txt = ''not a function.. (a function is something within curly brackets)'';
	};
	_ctrl ctrlSetText _txt;
	diag_log _txt;
	true
'];

_buttonYpos = _buttonYpos + _buttonheight + _buttonheight;
_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCEdit',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText (['infiSTAR_show_variable_000','READ FROM VARIABLE'] call fnc_getPNS);
_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
_ctrl ctrlSetBackgroundColor [0,0,0,0.6];
_ctrl ctrlCommit 0;

_buttonYpos = _buttonYpos + _buttonheight;
_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'READ FROM VARIABLE';
_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','
	disableSerialization;
	_display = findDisplay -1341;
	_ctrl = _display displayCtrl 1339;
	_ctrltext = ctrlText(_display displayCtrl '+str (_ctrlid - 1)+');
	
	[''infiSTAR_show_variable_000'',_ctrltext] call fnc_setPNS;
	
	_var = missionNameSpace getVariable [_ctrltext,''''];
	_txt = str _var;
	_ctrl ctrlSetText _txt;
	diag_log _txt;
	true
'];

if(_admin)then{
_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'Debug Console';
_ctrl ctrlSetPosition [1,_startYpos + 0.7,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','[] spawn fnc_RscDisplayDebugPublic;true'];
};

_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'CLEAR';
_ctrl ctrlSetPosition [1,_startYpos + 0.85,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1339) ctrlSetText '''';[''workplacemainwindow'',''''] call fnc_setPNS;true'];

_ctrlid = _ctrlid + 1;
_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
_ctrl ctrlSetText 'CLOSE';
_ctrl ctrlSetPosition [1,_startYpos + 0.95,0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','closeDialog 0;true'];


_ctrl = [_display,'RSCEdit',1] call fnc_createctrl;
_ctrl ctrlSetPosition [-0.25,1 + (_buttonheight*2),0.25,_buttonheight];
_ctrl ctrlSetBackgroundColor [0,0,0,0.6];
_ctrl ctrlCommit 0;

_ctrl = [_display,'RSCButton',2] call fnc_createctrl;
_ctrl ctrlSetText 'Save';
_ctrl ctrlSetPosition [-0.25,1 + (_buttonheight*3),0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','
	_varname = ctrlText((findDisplay -1341) displayCtrl 1);
	if(_varname isEqualTo '''')then
	{
		systemChat ''You need to write a name to save this function..!'';
	}
	else
	{
		_var = [''infiSTAR_SAVED_FUNCTIONS'',[]] call fnc_getPNS;
		_index = _var pushBackUnique _varname;
		
		
		[''infiSTAR_SAVED_FUNCTIONS'',_var] call fnc_setPNS;
		[format[''infiSTAR_SAVED_FUNCTION_%1'',_varname],call fnc_getMainText] call fnc_setPNS;
		
		systemChat format[''Saved: %1'',_varname];
		call fnc_fillDebugListBox;
	};
true
'];

_ctrl = [_display,'RSCButton',3] call fnc_createctrl;
_ctrl ctrlSetText 'Load';
_ctrl ctrlSetPosition [-0.25,1 + (_buttonheight*4),0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','_this call fnc_debug_loadbtn'];

_ctrl = [_display,'RSCButton',4] call fnc_createctrl;
_ctrl ctrlSetText 'Delete';
_ctrl ctrlSetPosition [-0.25,1 + (_buttonheight*5),0.25,_buttonheight];
_ctrl ctrlCommit 0;
_ctrl ctrlSetEventHandler['ButtonClick','
	_var = [''infiSTAR_SAVED_FUNCTIONS'',[]] call fnc_getPNS;
	_varname = lbtext[1384,(lbCurSel 1384)];
	if(_varname isEqualTo '''')then
	{
		systemChat ''You need to select a function to delete..!'';
	}
	else
	{
		if(isNil''last_delete_call'')then
		{
			last_delete_call = _varname;
			systemChat format[''Please click again to delete: %1'',_varname];
		}
		else
		{
			if(last_delete_call isEqualTo _varname)then
			{
				_var deleteAt (_var find _varname);
				[''infiSTAR_SAVED_FUNCTIONS'',_var] call fnc_setPNS;
				[format[''infiSTAR_SAVED_FUNCTION_%1'',_varname],nil] call fnc_setPNS;
				
				systemChat format[''Deleted: %1'',_varname];
				call fnc_fillDebugListBox;
				last_delete_call = nil;
			}
			else
			{
				systemChat format[''Please click again to delete: %1'',_varname];
			};
		};
	};
true
'];

call fnc_fillDebugListBox;
};
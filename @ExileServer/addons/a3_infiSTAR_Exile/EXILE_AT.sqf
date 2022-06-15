/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Copyright infiSTAR - 2011 - 2016. All rights reserved.
	Christian (Chris) L. (infiSTAR23@gmail.com) Developer of infiSTAR
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
*/
comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de';
VERSION_DATE_IS = '04-Dec-2016 14-44-29#3762';
infiSTAR_customFunctions = [];
_configClasses = "true" configClasses (configfile >> "CfgCustomFunctions");
{
	_configProperties = configProperties [configfile >> "CfgCustomFunctions" >> configName _x];
	_type = getNumber (_configProperties select 0);
	_name = getText (_configProperties select 1);
	_code = getText (_configProperties select 2);
	infiSTAR_customFunctions pushBack [_type,_name,_code];
} forEach _configClasses;
if!(infiSTAR_customFunctions isEqualTo [])then{infiSTAR_customFunctions sort true;};
infiSTAR_MAIN_CODE = "
_log = format['<infiSTAR.de> %1 - Loading Menu..',time call GET_TIME_TIME];systemchat _log;diag_log _log;
allSupportBoxesNames = "+str _allSupportBoxesNames+";
infiSTAR_CUSTOM_RUN = [];
infiSTAR_CUSTOM_Toggleable = [];
infiSTAR_CUSTOM_OnTarget = [];
infiSTAR_customFunctions = "+str infiSTAR_customFunctions+";
infiSTAR_HTML_LOAD = "+str _use_html_load_on_adminmenu+";
pathToCustomBillBoardTextures = "+str _pathToCustomBillBoardTextures+";
if!(infiSTAR_customFunctions isEqualTo [])then
{
	_counter0 = 0;
	_counter1 = 0;
	_counter2 = 0;
	{
		_type = _x select 0;
		_name = _x select 1;
		_code = _x select 2;
		switch (_type) do
		{
			case 0: {
				infiSTAR_CUSTOM_RUN pushBack _name;
				missionNameSpace setVariable[format['FNC_CUSTOM_RUN_%1',_counter0],_code call fnc_admin_c];
				_counter0 = _counter0 + 1;
			};
			case 1: {
				infiSTAR_CUSTOM_Toggleable pushBack _name;
				missionNameSpace setVariable[format['FNC_CUSTOM_TOGGLEABLE_%1',_counter1],_code call fnc_admin_c];
				_counter1 = _counter1 + 1;
			};
			case 2: {
				infiSTAR_CUSTOM_OnTarget pushBack _name;
				missionNameSpace setVariable[format['FNC_CUSTOM_ON_TARGET_%1',_counter2],_code call fnc_admin_c];
				_counter2 = _counter2 + 1;
			};
		};
	} forEach infiSTAR_customFunctions;
};
MYPUIDinfiESP = getPlayerUID player;
SHIFT_IS_PRESSED=false;ALT_IS_PRESSED=false;FILLMAINSTATE=0;LASTSUBBUTTON=1;BTN_GET_ITEM_SEL=1;BTN_SPAWN_VEH_SEL=0;
SortAlphaPlease = true;SortGroupsPlease = nil;SortRangePlease = nil;
infiSTAR_add_vehicles=true;
SELECTED_TARGET_PLAYER = player;
show_spectate_overlay = true;
MAIN_DISPLAY_ID = -1338;LEFT_SHIFT_ID = 1500;RIGHT_SHIFT_ID = 1501;
uiNamespace setVariable['A3MAPICONS_mainMap', nil];
uiNamespace setVariable['A3MAPICONS_mainMap', findDisplay 12 displayCtrl 51];
if(isNil 'AH_HackLogArray')then{AH_HackLogArray = [];};
if(isNil 'AH_SurvLogArray')then{AH_SurvLogArray = [];};
if(isNil 'AH_AdmiLogArray')then{AH_AdmiLogArray = [];};
if(isNil 'SERVER_FPS')then{SERVER_FPS = 'UNKNOWN';};
if(isNil 'SERVER_THREADS')then{SERVER_THREADS = 'UNKNOWN';};
if(isNil 'SERVER_LOOPTIME')then{SERVER_LOOPTIME = 'UNKNOWN';};
if(isNil 'infiSTAR_toggled_A')then{infiSTAR_toggled_A = ['==== OnTarget ====','==== Toggleable ====','==== Custom Functions ===='];};
if(isNil 'infiSTAR_loop_array')then{infiSTAR_loop_array = [];};
FN_SHOW_LOG = {};
fnc_get_selected_object = {
	_target = lbtext[LEFT_SHIFT_ID,(lbCurSel LEFT_SHIFT_ID)];
	if(_target isEqualTo '')then
	{
		if(isNull SELECTED_TARGET_PLAYER)then
		{
			SELECTED_TARGET_PLAYER = player;
		};
	}
	else
	{
		{
			_grp = group _x;
			_side = side _x;
			_name = _x call fnc_get_exileObjName;
			_search = format['%1 [%2]',_name,_side];
			if(count units _grp > 1)then
			{
				_search = format['%1 [%2 (%3)]',_name,_side,_grp];
			};
			if(_search == _target)exitWith
			{
				SELECTED_TARGET_PLAYER = _x;
			};
		} forEach (call fnc_get_plr);
	};
	SELECTED_TARGET_PLAYER
};
FN_GET_CLR = {
	if(_this isEqualTo SELECTED_TARGET_PLAYER)exitWith{[1,0.7,0.15,_alpha]};
	if(!alive _this)exitWith{[1,1,1,_alpha]};
	_xuid = getPlayerUID _this;
	
	if(_xuid in infiSTAR_Ds && MYPUIDinfiESP in infiSTAR_Ds)exitWith{[1,0.2,1,_alpha]};
	if(_xuid in infiSTAR_ADMINS && !(_xuid in infiSTAR_Ds))exitWith{[0,1,0,_alpha]};
	
	if(_this in (units(group player)))exitWith{[1,0.95,0,_alpha]};
	if(vehicle _this isEqualTo _this)exitWith{[1,0.17,0.17,_alpha]};
	[0.047,0.502,1,_alpha]
};
TRADER_FUNCTION_ARRAY = [
	[''],
	['Exile_Trader_Armory','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_SpecialOperations','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_Equipment','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_Food','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_Hardware','ExileClient_gui_traderDialog_show',0],
	[''],
	['Exile_Trader_Vehicle','ExileClient_gui_vehicleTraderDialog_show',0],
	['Exile_Trader_Aircraft','ExileClient_gui_vehicleTraderDialog_show',0],
	['Exile_Trader_Boat','ExileClient_gui_vehicleTraderDialog_show',0],
	[''],
	['Exile_Trader_Office','ExileClient_gui_purchaseTerritoryDialog_show',0],
	['Exile_Trader_Office','ExileClient_gui_payTerritoryProtectionMoneyDialog_show',0],
	[''],
	['Exile_Trader_WasteDump','ExileClient_gui_wasteDumpDialog_show',1],
	['Exile_Trader_VehicleCustoms','ExileClient_gui_vehicleCustomsDialog_show',1],
	['Exile_Trader_AircraftCustoms','ExileClient_gui_vehicleCustomsDialog_show',1],
	['Exile_Trader_BoatCustoms','ExileClient_gui_vehicleCustomsDialog_show',1],
	[''],
	['-- customs are not set by default --'],
	['Exile_Trader_CommunityCustoms','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_CommunityCustoms2','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_CommunityCustoms3','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_CommunityCustoms4','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_CommunityCustoms5','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_CommunityCustoms6','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_CommunityCustoms7','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_CommunityCustoms8','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_CommunityCustoms9','ExileClient_gui_traderDialog_show',0],
	['Exile_Trader_CommunityCustoms10','ExileClient_gui_traderDialog_show',0]
];
fnc_admin_c = compileFinal 'compile _this';
fnc_admin_cc = compileFinal 'call compile _this';
fnc_createctrl = {
	params['_display','_type','_idc'];
	ctrlDelete (_display displayCtrl _idc);
	_ctrl = _display ctrlCreate[_type, _idc];
	_ctrl
};
fn_STAR_validpic = { !((toLower _this) in ['','pictureheal','picturepapercar','picturething','picturestaticobject']) };
fn_STAR_validclass = { getNumber (_entry >> 'scope') >= 2 };
fn_STAR_validclass = { (getText(_x >> 'picture') call fn_STAR_validpic) && {toLower(configName _x) find '_base' isEqualTo -1} };


ALL_VEHS_TO_SEARCH_C = [];
ALL_VEHS_TO_SEARCH_C_EXILE = [];
ALL_VEHS_TO_SEARCH_C_OTHER = [];
{
	_configName = configName _x;
	ALL_VEHS_TO_SEARCH_C pushBackUnique _configName;
	if(_configName select [0,5] isEqualTo 'Exile')then{ALL_VEHS_TO_SEARCH_C_EXILE pushBackUnique _configName;}else{ALL_VEHS_TO_SEARCH_C_OTHER pushBackUnique _configName;};
} forEach ('(call fn_STAR_validclass) && {configName _x isKindOf ''allVehicles'' && !(configName _x isKindOf ''Man'')}' configClasses (configFile >> 'CfgVehicles'));

{
	ALL_VEHS_TO_SEARCH_C pushBackUnique _x;
	ALL_VEHS_TO_SEARCH_C_OTHER pushBackUnique _x;
} forEach [
	'Land_Pod_Heli_Transport_04_covered_F',
	'Land_Pod_Heli_Transport_04_fuel_F',
	'Land_Pod_Heli_Transport_04_box_F',
	'Land_Pod_Heli_Transport_04_repair_F',
	'Land_Pod_Heli_Transport_04_medevac_F',
	'Land_Pod_Heli_Transport_04_bench_F',
	'Land_Pod_Heli_Transport_04_covered_black_F',
	'Land_Pod_Heli_Transport_04_fuel_black_F',
	'Land_Pod_Heli_Transport_04_box_black_F',
	'Land_Pod_Heli_Transport_04_repair_black_F',
	'Land_Pod_Heli_Transport_04_medevac_black_F',
	'Land_Pod_Heli_Transport_04_bench_black_F'
];



ALLC_ITEMS = ['B_Parachute'];
ALL_MAGS_TO_SEARCH_C = [];
newAllItems_CATEGORY = [];
_bags = getArray(missionconfigfile >> 'CfgTraderCategories' >> 'Backpacks' >> 'items');
{
	ALLC_ITEMS pushBackUnique _x;
	_itemInformation = [_x] call BIS_fnc_itemType;
	_category = _itemInformation select 1;
	if!(_category in newAllItems_CATEGORY)then{newAllItems_CATEGORY pushBackUnique _category;};
} forEach _bags;

{
	_configName = configName _x;
	ALLC_ITEMS pushBackUnique _configName;
	_itemInformation = [_configName] call BIS_fnc_itemType;
	_category = _itemInformation select 1;
	if!(_category in newAllItems_CATEGORY)then{newAllItems_CATEGORY pushBackUnique _category;};
} forEach ('(call fn_STAR_validclass) && {(getText(_x >> ''vehicleClass'') isEqualTo ''Backpacks'')}' configClasses (configFile >> 'CfgVehicles'));

{
	_configName = configName _x;
	ALLC_ITEMS pushBackUnique _configName;
	_itemInformation = [_configName] call BIS_fnc_itemType;
	_category = _itemInformation select 1;
	if!(_category in newAllItems_CATEGORY)then{newAllItems_CATEGORY pushBackUnique _category;};
} forEach ('(call fn_STAR_validclass) && {getText(_x >> ''picture'') call fn_STAR_validpic}' configClasses (configFile >> 'CfgWeapons'));

{
	_configName = configName _x;
	ALLC_ITEMS pushBackUnique _configName;
	ALL_MAGS_TO_SEARCH_C pushBackUnique _configName;
	_itemInformation = [_configName] call BIS_fnc_itemType;
	_category = _itemInformation select 1;
	if!(_category in newAllItems_CATEGORY)then{newAllItems_CATEGORY pushBackUnique _category;};
} forEach ('(call fn_STAR_validclass) && {getText(_x >> ''picture'') call fn_STAR_validpic}' configClasses (configFile >> 'CfgMagazines'));
newAllItems_CATEGORY sort true;
{
	_itemInformation = [_x] call BIS_fnc_itemType;
	_category = _itemInformation select 1;
	
	_variable = missionNameSpace getVariable (_category+'_ARRAY');
	if(isNil '_variable')then
	{
		missionNameSpace setVariable[(_category+'_ARRAY'),[_x]];
	}
	else
	{
		_variable pushBackUnique _x;
		missionNameSpace setVariable[(_category+'_ARRAY'),_variable];
	};
} forEach ALLC_ITEMS;
_log = format['<infiSTAR.de> %1 - config data loaded!',time call GET_TIME_TIME];diag_log _log;
if('==== Base Deleter ====' call ADMINLEVELACCESS)then
{
	CCG_fnc_adminClick = {
		private ['_click'];
		_click = _this select 0;
		if(_click == '')exitWith{};
		try {
			switch (_click) do {
				case 'BD: Set Center' : {
					call CCG_fnc_bdSetCenter;
					throw 'BASEDELETER: Set Center';
				};
				case 'BD: Set Radius' : {
					call CCG_fnc_bdSetRadius;
					throw 'BASEDELETER: Set Radius';
				};
				case 'BD: Cancel / Remove' : {
					call CCG_fnc_bdCancel;
					throw 'BASEDELETER: Cancel';
				};
				case 'BD: Delete Base' : {
					call CCG_fnc_bdDeleteB;
					throw 'BASEDELETER: Delete Base';
				};
				case 'BD: Delete Weaponholder' : {
					call CCG_fnc_bdDeleteW;
					throw 'BASEDELETER: Delete Weaponholder';
				};
			};
		} catch {
			systemChat _exception;
			call fnc_FULLinit;
		};
	};
	CCGbdObjs = [];
	CCG_fnc_bdSetCenter = {
		private ['_arrow'];
		CCGbdCenter = getPosASL player;
		_arrow = 'Sign_Arrow_F' createVehicleLocal [0,0,0];
		_arrow setPosASL CCGbdCenter;
		CCGbdObjs pushBack _arrow;
	};
	CCG_fnc_bdSetRadius = {
		private ['_arrow', '_pos', '_radius', '_angle', '_distance', '_count', '_step', '_count', '_step', '_objects'];
		if(isNil 'CCGbdCenter')then{throw 'BASEDELETER: Center not set!';};
		CCGbdRadius = CCGbdCenter distance (getPosASL player);
		_arrow = 'Sign_Arrow_F' createVehicleLocal [0,0,0];
		_arrow setPosASL CCGbdCenter;
		CCGbdObjs pushBack _arrow;
		_angle = 0;
		_count = round((2 * pi * CCGbdRadius) / 2);
		if(_count == 0)then{throw 'BASEDELETER: Center and Radius position can not be the same!';};
		for '_x' from 0 to _count do
		{
			private['_a', '_b', '_obj'];
			_a = (CCGbdCenter select 0) + (sin(_angle)*CCGbdRadius);
			_b = (CCGbdCenter select 1) + (cos(_angle)*CCGbdRadius);
			_obj = 'Sign_Sphere100cm_F' createVehicleLocal [0,0,0];
			_obj setPosASL [_a, _b, CCGbdCenter select 2];
			CCGbdObjs pushBack  _obj;
			_angle = _angle + (360/_count);
		};
		for '_x' from 0 to _count do
		{
			private['_a', '_b', '_obj'];
			_a = (CCGbdCenter select 0) + (sin(_angle)*CCGbdRadius);
			_b = (CCGbdCenter select 2) + (cos(_angle)*CCGbdRadius);
			_obj = 'Sign_Sphere100cm_F' createVehicleLocal [0,0,0];
			_obj setPosASL [_a, CCGbdCenter select 1, _b];
			CCGbdObjs pushBack  _obj;
			_angle = _angle + (360/_count);
		};
		for '_x' from 0 to _count do
		{
			private['_a', '_b', '_obj'];
			_a = (CCGbdCenter select 1) + (sin(_angle)*CCGbdRadius);
			_b = (CCGbdCenter select 2) + (cos(_angle)*CCGbdRadius);
			_obj = 'Sign_Sphere100cm_F' createVehicleLocal [0,0,0];
			_obj setPosASL [CCGbdCenter select 0, _a, _b];
			CCGbdObjs pushBack  _obj;
			_angle = _angle + (360/_count);
		};
	};
	CCG_fnc_bdGetObjectsToDelete = {
		if(isNil 'CCGbdCenter')exitWith{[]};
		if(isNil 'CCGbdRadius')exitWith{[]};
		nearestObjects [ASLtoATL CCGbdCenter,['Exile_Construction_Abstract_Static','AbstractConstruction','Exile_Construction_Flag_Static'], CCGbdRadius]
	};
	CCG_fnc_bdGetWeaponHoldersToDelete = {
		if(isNil 'CCGbdCenter')exitWith{[]};
		if(isNil 'CCGbdRadius')exitWith{[]};
		nearestObjects [ASLtoATL CCGbdCenter,['GroundWeaponHolder','WeaponHolderSimulated','LootWeaponHolder'], CCGbdRadius]
	};
	CCG_fnc_bdDeleteB = {
		private ['_objects'];
		if(isNil 'CCGbdCenter')then{throw 'BASEDELETER: Center not set!';};
		if(isNil 'CCGbdRadius')then{throw 'BASEDELETER: Radius not set!';};
		[-5,ASLtoATL CCGbdCenter,CCGbdRadius] call fnc_AdminReq;
		systemChat format['BASEDELETER: Deleting..', count (call CCG_fnc_bdGetObjectsToDelete)];
	};
	CCG_fnc_bdDeleteW = {
		private ['_objects'];
		if(isNil 'CCGbdCenter')then{throw 'BASEDELETER: Center not set!';};
		if(isNil 'CCGbdRadius')then{throw 'BASEDELETER: Radius not set!';};
		[-6,ASLtoATL CCGbdCenter,CCGbdRadius] call fnc_AdminReq;
		systemChat format['BASEDELETER: Deleting..', count (call CCG_fnc_bdGetWeaponHoldersToDelete)];
	};
	CCG_fnc_bdCancel = {
		CCGbdCenter = nil;
		CCGbdRadius = nil;
		{if(!isNull _x)then{deleteVehicle _x;};} foreach CCGbdObjs;
		CCGbdObjs = [];
	};
};
fnc_setFocus = {
	disableSerialization;
	ctrlSetFocus ((findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_SHIFT_ID);
	ctrlSetFocus ((findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_SHIFT_ID);
};
MAP_OBJECT_SELECTED = objNull;
fnc_MouseButtonDown = {
	if(_this select 1 isEqualTo 0)then
	{
		_pos = ((_this select 0) posScreenToWorld [_this select 2, _this select 3]);
		if(ALT_IS_PRESSED)then
		{
			_veh = vehicle player;
			if(_veh isEqualTo player)then
			{
				_veh setPosATL _pos;
			}
			else
			{
				if(_veh isKindOf 'AIR')then
				{
					_posObj = getPosATL _veh;
					_pos = [_pos select 0,_pos select 1,_posObj select 2];
				};
				[1,netId player,_pos] call fnc_AdminReq;
			};
			format['Teleport to %1(GPS: %2)',_pos,mapGridPosition _pos] call fnc_adminLog;
			{player reveal _x;} foreach (_pos nearObjects 50);
		};
		if(SHIFT_IS_PRESSED && !isNil'infiSTAR_dad_state')then{MAP_OBJECT_SELECTED = _pos nearestObject 'AllVehicles';}else{MAP_OBJECT_SELECTED = objNull;};
	};
	false
};
fnc_MouseButtonUp = {
	if(_this select 1 isEqualTo 0)then
	{
		_pos = ((_this select 0) posScreenToWorld [_this select 2, _this select 3]);
		if(isNull MAP_OBJECT_SELECTED)exitWith{true};
		if(SHIFT_IS_PRESSED && !isNil'infiSTAR_dad_state')then
		{
			_obj = MAP_OBJECT_SELECTED;
			if(isPlayer _obj)then
			{
				{
					if(!isNull _x)then
					{
						if(getPlayerUID _x != '')then
						{
							_name = _x call fnc_get_exileObjName;
							[1,netId _x,_pos] call fnc_AdminReq;
						};
					};
				} forEach (crew _obj);
			}
			else
			{
				if(local _obj)then
				{
					_obj setPosATL _pos;
				}
				else
				{
					[20,netId _obj,_pos] call fnc_AdminReq;
				};
			};
		};
		MAP_OBJECT_SELECTED = objNull;
	};
	false
};
fnc_addpic = {
	_status = call {
		if(isClass (configFile >> 'CfgWeapons' >> _this))exitWith{'CfgWeapons'};
		if(isClass (configFile >> 'CfgMagazines' >> _this))exitWith{'CfgMagazines'};
		if(isClass (configFile >> 'CfgVehicles' >> _this))exitWith{'CfgVehicles'};
		'';
	};
	if!(_status isEqualTo '')then
	{
		_pic = (getText (configFile >> _status >> _this >> 'picture'));
		if(_pic call fn_STAR_validpic)then
		{
			_ctrl lbSetPicture [(lbsize _ctrl)-1,_pic];
			_ctrl lbSetPictureColor [(lbsize _ctrl)-1,[1, 1, 1, 1]];
		};
	};
};
fnc_search = {
	[
		_txt,
		{
			_txt = _this;
			if(_txt == lastSearched)exitWith{};
			disableSerialization;
			_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_SHIFT_ID;
			lbClear _ctrl;
			if(LASTSUBBUTTON isEqualTo 0)then
			{
				if('Items spawn menu' call ADMINLEVELACCESS)then
				{
					{
						_displayName = getText(configFile >> 'CfgWeapons' >> _x >> 'displayName');
						if(_displayName isEqualTo '')then{_displayName = getText(configFile >> 'CfgMagazines' >> _x >> 'displayName');};
						if(_displayName isEqualTo '')then{_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');};
						if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
							_lbid = _ctrl lbAdd format['%1 (%2)',_displayName,_x];
							_ctrl lbSetData [_lbid,_x];
							_x call fnc_addpic;
						};
					} forEach ALLC_ITEMS;
					for '_i' from 0 to 12 do {_ctrl lbAdd '';};
				};
			};
			if(LASTSUBBUTTON isEqualTo 1)then
			{
				if(('Spawn Vehicles' call ADMINLEVELACCESS) || ('Spawn Persistent Vehicles' call ADMINLEVELACCESS))then
				{
					_ctrl lbAdd '==== Vehicles ====';
					if(!isNil 'infiSTAR_add_vehicles')then
					{
						{
							_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');
							if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
								_lbid = _ctrl lbAdd format['%1 (%2)',_displayName,_x];
								_ctrl lbSetData [_lbid,_x];
								_x call fnc_addpic;
								if(_x select [0,5] isEqualTo 'Exile')then{_ctrl lbSetColor [_lbid, [0,1,0,1]];};
							};
						} forEach ALL_VEHS_TO_SEARCH_C;
						for '_i' from 0 to 12 do {_ctrl lbAdd '';};
					};
				};
			};
			lastSearched = _txt;
			[] call fnc_colorizeMain;
			for '_i' from 0 to 10 do{_ctrl lbAdd '';};
		}
	] execFSM 'call.fsm';
};
fnc_searchNfill = {
	if(isNil 'SEARCHLOOP')then{
		SEARCHLOOP = true;
		if(isNil 'lastSearched')then{lastSearched = '';};
		[] spawn {
			disableSerialization;
			_alpha = 1;
			while {true} do
			{
				if(isNull (findDisplay MAIN_DISPLAY_ID))exitWith{};
				if(!isNil 'stopthissearchplease')exitWith{stopthissearchplease=nil;};
				_txt = ctrlText((findDisplay MAIN_DISPLAY_ID) displayCtrl 100);
				if(_txt isEqualTo '')then
				{
					[] call fnc_fill_infiSTAR_Player;
					waitUntil {((ctrlText((findDisplay MAIN_DISPLAY_ID) displayCtrl 100) != '')||(isNull (findDisplay MAIN_DISPLAY_ID))||(!isNil 'stopthissearchplease'))};
				}
				else
				{
					_txt = toLower _txt;
					if(FILLMAINSTATE isEqualTo 1)then
					{
						call fnc_search;
					}
					else
					{
						_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_SHIFT_ID;
						lbclear _ctrl;
						_shown = [];
						{
							
							_name = _x call fnc_get_exileObjName;
							if((toLower _name) find _txt > -1)then
							{
								_grp = group _x;
								_index = _shown pushBackUnique _grp;
								if(_index > -1)then
								{
									_ctrl lbAdd format['______%1______',_grp];
									{
										_PUIDX = getPlayerUID _x;
										_side = side _x;
										_grp = group _x;
										_ExileName = _x call fnc_get_exileObjName;
										_name = format['%1 [%2]',_ExileName,_side];
										if(count units _grp > 1)then
										{
											_name = format['%1 [%2 (%3)]',_ExileName,_side,_grp];
										};
										
										_lbid = _ctrl lbAdd _name;
										_veh = vehicle _x;
										_xpic = getText (configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'picture');
										if(alive _x)then
										{
											if(_x isEqualTo _veh)then
											{
												_wpnstate = weaponState _x;
												_cwep = _wpnstate select 0;
												if(_cwep != '')then
												{
													_xpic = getText (configFile >> 'CfgWeapons' >> _cwep >> 'picture');
												};
											};
										};
										if(_xpic call fn_STAR_validpic)then
										{
											_ctrl lbSetPicture [_lbid,_xpic];
											_ctrl lbSetPictureColor [_lbid,[1, 1, 1, 1]];
										};
										_clr = _x call FN_GET_CLR;
										_ctrl lbSetColor [_lbid,_clr];
									} forEach (units _grp);
								};
							};
						} forEach (call fnc_get_plr);
					};
				};
				uiSleep 0.1;
			};
			SEARCHLOOP = nil;
		};
	};
};
fnc_SearchFieldButtons = {
	disableSerialization;
	_display = findDisplay MAIN_DISPLAY_ID;
	_others=false;
	if(FILLMAINSTATE == 1)then{_others = true;};
	
	_editSearch = _display displayCtrl 100;
	_editSearch ctrlEnable true;
	_editSearch ctrlShow true;
	_editSearch ctrlSetTextColor [0.56,0.04,0.04,1];
	_editSearch ctrlSetText '';
	
	_btnItems = _display displayCtrl 36;
	_btnItems ctrlEnable true;
	_btnItems ctrlShow true;
	_btnItems buttonSetAction '
		LASTSUBBUTTON = 0;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;
	';
	if!('Items spawn menu' call ADMINLEVELACCESS)then
	{
		_btnItems ctrlEnable false;
		_btnItems ctrlShow false;
	};
	
	_ctrlL = _display displayCtrl LEFT_SHIFT_ID;
	if(isNil 'ctrlposL')then{ctrlposL = ctrlPosition _ctrlL;};
	_ctrlLTMP = ctrlposL;
	if(isNil 'ctrlposeditSearch')then{ctrlposeditSearch = ctrlPosition _editSearch;};
	_ctrleditSearchTMP = ctrlposeditSearch;
	if(isNil 'ctrlposbtnItems')then{ctrlposbtnItems = ctrlPosition _btnItems;};
	_ctrlbtnItemsTMP = ctrlposbtnItems;
	if(FILLMAINSTATE in [0,3,4])then
	{
		_btnItems ctrlSetText 'Reset PlayerSearch';
		_btnItems buttonSetAction '
			((findDisplay MAIN_DISPLAY_ID) displayCtrl 100) ctrlSetText '''';
			[] call fnc_fill_infiSTAR_Player;
		';
		
		
		_ctrlLTMP = [(ctrlposL select 0),(ctrlposL select 1)+.165,(ctrlposL select 2),(ctrlposL select 3)-.165];
		_ctrleditSearchTMP = [SafeZoneX,(ctrlposeditSearch select 1)-0.045,(ctrlposL select 2),(ctrlposeditSearch select 3)*0.75];
		_ctrlbtnItemsTMP = [SafeZoneX,(ctrlposbtnItems select 1)-0.035,(ctrlposL select 2),(ctrlposbtnItems select 3)];
	};
	_ctrlL ctrlSetPosition _ctrlLTMP;
	_ctrlL ctrlCommit 0.3;
	_editSearch ctrlSetPosition _ctrleditSearchTMP;
	_editSearch ctrlCommit 0.3;
	_btnItems ctrlSetPosition _ctrlbtnItemsTMP;
	_btnItems ctrlCommit 0.3;
	
	if(FILLMAINSTATE == 1)then{
		_btnItems ctrlSetText 'Items';
		_btnItems buttonSetAction '
			LASTSUBBUTTON = 0;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;
		';
	};
	
	_btnVehs = _display displayCtrl 37;
	_btnVehs ctrlEnable _others;
	_btnVehs ctrlShow _others;
	_btnVehs buttonSetAction '
		LASTSUBBUTTON = 1;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;
	';
	if!(('Spawn Vehicles' call ADMINLEVELACCESS) || ('Spawn Persistent Vehicles' call ADMINLEVELACCESS))then
	{
		_btnVehs ctrlEnable false;
		_btnVehs ctrlShow false;
	};
	
	_btnTrader = _display displayCtrl 38;
	_btnTrader ctrlSetText 'Trader';
	_btnTrader ctrlEnable _others;
	_btnTrader ctrlShow _others;
	_btnTrader buttonSetAction '
		LASTSUBBUTTON = 2;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;
	';
	
	call fnc_searchNfill;
};
fnc_cloneGear = {
	_unit = _this;
	if(isNil'_unit')exitWith{systemchat'_unit not defined';};
	if(isNull _unit)exitWith{systemchat'_unit OBJECT-NULL';};
	_export = '';
	_fnc_addMultiple = {
		_items = _this select 0;
		_expression = _this select 1;
		_itemsUsed = [];
		{
			_item = _x;
			_itemLower = tolower _x;
			if !(_itemLower in _itemsUsed)then{
				_itemsUsed set [count _itemsUsed,_itemLower];
				_itemCount = {_item == _x} count _items;
				_expressionLocal = _expression;
				if(_itemCount > 1)then{
					_expressionLocal = format ['for ''_i'' from 1 to %1 do {%2};',_itemCount,_expression];
				};
				_export = _export + format [_expressionLocal,_var,_x];
			};
		} foreach _items;
	};
	_export = _export + '_unit = player;';
	_var = '_unit';
	_export = _export + format ['removeAllWeapons %1;',_var];
	_export = _export + format ['removeAllItems %1;',_var];
	_export = _export + format ['removeAllAssignedItems %1;',_var];
	_export = _export + format ['removeUniform %1;',_var];
	_export = _export + format ['removeVest %1;',_var];
	_export = _export + format ['removeBackpack %1;',_var];
	_export = _export + format ['removeHeadgear %1;',_var];
	_export = _export + format ['removeGoggles %1;',_var];
	if(uniform _unit != '')then{
		_export = _export + format ['%1 forceAddUniform ''%2'';',_var,uniform _unit];
		[uniformitems _unit,'%1 addItemToUniform ''%2'';'] call _fnc_addMultiple;
	};
	if(vest _unit != '')then{
		_export = _export + format ['%1 addVest ''%2'';',_var,vest _unit];
		[vestitems _unit,'%1 addItemToVest ''%2'';'] call _fnc_addMultiple;
	};
	if(!isnull unitbackpack _unit)then{
		_export = _export + format ['%1 addBackpack ''%2'';',_var,typeof unitbackpack _unit];
		[backpackitems _unit,'%1 addItemToBackpack ''%2'';'] call _fnc_addMultiple;
	};
	if(headgear _unit != '')then{_export = _export + format ['%1 addHeadgear ''%2'';',_var,headgear _unit];};
	if(goggles _unit != '')then{_export = _export + format ['%1 addGoggles ''%2'';',_var,goggles _unit];};
	{
		_weapon = _x select 0;
		_weaponAccessories = _x select 1;
		_weaponCommand = _x select 2;
		if(_weapon != '')then{
			_export = _export + format ['%1 addWeapon ''%2'';',_var,_weapon];
			{
				if(_x != '')then{_export = _export + format ['%1 %3 ''%2'';',_var,_x,_weaponCommand];};
			} foreach _weaponAccessories;
		};
	} foreach [
		[primaryweapon _unit,_unit weaponaccessories primaryweapon _unit,'addPrimaryWeaponItem'],
		[secondaryweapon _unit,_unit weaponaccessories secondaryweapon _unit,'addSecondaryWeaponItem'],
		[handgunweapon _unit,_unit weaponaccessories handgunweapon _unit,'addHandgunItem'],
		[binocular _unit,[],'']
	];
	[assigneditems _unit - [binocular _unit],'%1 linkItem ''%2'';'] call _fnc_addMultiple;
	_export
};
fnc_Loadoutmenu = {
	disableSerialization;
	if(isNil'missionNameSpaceLoadouts')then{missionNameSpaceLoadouts=[];};
	_display = findDisplay MAIN_DISPLAY_ID;
	_ctrl = [_display,'IGUIBack',44464] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.554062 * safezoneW + safezoneX,
		0.8,
		0.3,
		0.2 * safezoneH
	];
	_ctrl ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	_ctrl ctrlCommit 0;
	
	_ctrl = [_display,'RscListbox',44465] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.554062 * safezoneW + safezoneX,
		0.8
	];
	_ctrl ctrlCommit 0;
	fnc_load_LoadOuts = {
		infiSTAR_LoadOutARRay = profileNamespace getVariable['infiSTAR_LoadOutARRay',[]];
		lbClear (findDisplay MAIN_DISPLAY_ID displayCtrl 44465);
		if!(infiSTAR_LoadOutARRay isEqualTo [])then
		{
			{(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd _x;} forEach infiSTAR_LoadOutARRay;
			(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd '';
		};
		if!(missionNameSpaceLoadouts isEqualTo [])then
		{
			{(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd _x;} forEach missionNameSpaceLoadouts;
			(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd '';
		};
	};
	call fnc_load_LoadOuts;
	
	_ctrl = [_display,'RscEdit',44469] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.554062 * safezoneW + safezoneX,
		0.81+(ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3),
		(ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 2),
		0.033 * safezoneH
	];
	_ctrl ctrlCommit 0;
	
	_ctrl = [_display,'RSCButton',44466] call fnc_createctrl;
	_ctrl ctrlSetText 'LOAD';
	_ctrl ctrlSetPosition [
		0.68 * safezoneW + safezoneX,
		0.8,
		0.3,
		0.033 * safezoneH
	];
	fnc_ButtonClick_44466 = {
		_txt = lbtext[44465,(lbCurSel 44465)];
		if(_txt != '')then
		{
			if(_txt in missionNameSpaceLoadouts)exitWith
			{
				_m = missionNameSpace getVariable _txt;
				if((!isNil '_m')&&{(typeName _m == 'CODE')})then
				{
					call _m;
				};
			};
			
			if(isNil'FNC_CUSTOM_fn_loadInventory')then
			{
				FNC_CUSTOM_fn_loadInventory = (preprocessfile 'A3\functions_f\Inventory\fn_loadInventory.sqf') call fnc_admin_c;
			};
			_fnc_scriptName='';[player, [profileNamespace, _txt]] call FNC_CUSTOM_fn_loadInventory;
			_log = format['Loaded Loadout [%1]',_txt];
			_log call fnc_adminLog;
		};
	};
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44466'];
	
	_ctrl = [_display,'RSCButton',44467] call fnc_createctrl;
	_ctrl ctrlSetText 'DELETE';
	_ctrl ctrlSetPosition [
		0.68 * safezoneW + safezoneX,
		0.8+((ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3)/2),
		0.3,
		0.033 * safezoneH
	];
	fnc_ButtonClick_44467 = {
		_txt = lbtext[44465,(lbCurSel 44465)];
		if(_txt != '')then
		{
			if(_txt in infiSTAR_LoadOutARRay)then
			{
				_id = infiSTAR_LoadOutARRay find _txt;
				if(_id == -1)exitWith{systemchat 'can not find Loadout';};
				_return = infiSTAR_LoadOutARRay deleteAt _id;
				systemchat format['Deleted Loadout: %1',_return];
				profileNamespace setVariable['infiSTAR_LoadOutARRay',infiSTAR_LoadOutARRay];saveprofileNamespace;
				_fnc_scriptName='';[player, [profileNamespace, _txt]] call BIS_fnc_deleteInventory;
			}
			else
			{
				_id = missionNameSpaceLoadouts find _txt;
				if(_id == -1)exitWith{systemchat 'can not find Loadout';};
				_return = missionNameSpaceLoadouts deleteAt _id;
				systemchat format['Deleted Loadout: %1',_return];
			};
		};
		call fnc_load_LoadOuts;
	};
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44467'];
	
	_ctrl = [_display,'RSCButton',44468] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.68 * safezoneW + safezoneX,
		0.8+(ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3),
		0.3,
		0.033 * safezoneH
	];
	fnc_ButtonClick_44468 = {
		_txt = ctrlText 44469;
		if(_txt == '')exitWith{systemchat 'Type a Loadout name to save!';};
		if(count _txt > 30)exitWith{systemchat 'Loadout name should have max 30 characters!';};
		call fnc_get_selected_object;
		if(isNull SELECTED_TARGET_PLAYER)exitWith{systemchat 'Player selected is NULL-OBJECT';};
		
		_exit = false;
		{if(toUpper _txt isEqualTo toUpper _x)exitWith{_exit=true};} forEach missionNameSpaceLoadouts;
		if(_exit)exitWith{systemchat 'can not overwrite missionNameSpaceLoadouts Admin Loadouts';};
		
		_index = infiSTAR_LoadOutARRay pushBackUnique _txt;
		if(_index > -1)then
		{
			profileNamespace setVariable['infiSTAR_LoadOutARRay',infiSTAR_LoadOutARRay];saveprofileNamespace;
		};
		_fnc_scriptName='';[SELECTED_TARGET_PLAYER, [profileNamespace, _txt]] call BIS_fnc_saveInventory;
		call fnc_load_LoadOuts;
	};
	_ctrl ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44468'];
	_ctrl ctrlSetText 'SAVE FROM SELECTED';
	_ctrl ctrlCommit 0;
	
	_ctrl = [_display,'RSCButton',44471] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.81 * safezoneW + safezoneX,
		0.8+((ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3)/2),
		0.3,
		0.033 * safezoneH
	];
	fnc_ButtonClick_44471 = {
		call fnc_get_selected_object;
		_export = player call fnc_cloneGear;
		[_export,SELECTED_TARGET_PLAYER] call admin_d0_target;
		
		_log = format['Cloned Gear on %1(%2)!',SELECTED_TARGET_PLAYER call fnc_get_exileObjName,getPlayerUID SELECTED_TARGET_PLAYER];
		_log call FN_SHOW_LOG;
		_log call fnc_adminLog;
	};
	_ctrl ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44471'];
	_ctrl ctrlSetText 'CLONE ON SELECTED';
	_ctrl ctrlCommit 0;
	
	_ctrl = [_display,'RSCButton',44472] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.81 * safezoneW + safezoneX,
		0.8,
		0.3,
		0.033 * safezoneH
	];
	fnc_ButtonClick_44472 = {
		call fnc_get_selected_object;
		_export = SELECTED_TARGET_PLAYER call fnc_cloneGear;
		_export call fnc_admin_cc;
		
		_log = format['Cloned Gear of %1(%2) on yourself!',SELECTED_TARGET_PLAYER call fnc_get_exileObjName,getPlayerUID SELECTED_TARGET_PLAYER];
		_log call FN_SHOW_LOG;
		_log call fnc_adminLog;
	};
	_ctrl ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44472'];
	_ctrl ctrlSetText 'CLONE FROM SELECTED';
	_ctrl ctrlCommit 0;
	
	_ctrl = [_display,'RSCText',44463] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.677 * safezoneW + safezoneX,
		0.75,
		0.2 * safezoneW,
		0.03 * safezoneH
	];
	_ctrl ctrlSetText format['SELECTED TARGET: %1',call fnc_get_selected_object];
	_ctrl ctrlCommit 0;
};
fnc_WeatherLord = {
	disableSerialization;
	_display = findDisplay MAIN_DISPLAY_ID;
	
	_text1 = [_display,'RSCText',33300] call fnc_createctrl;
	_text1 ctrlSetPosition [
		0.55 * safezoneW + safezoneX,
		0.3,
		0.2 * safezoneW,
		0.03 * safezoneH
	];
	_text1 ctrlSetText 'Fog:';
	_text1 ctrlCommit 0;
	
	_slider1 = [_display,'RscXSliderH',33301] call fnc_createctrl;
	_slider1 ctrlSetPosition [
		0.554 * safezoneW + safezoneX,
		0.35
	];
	_slider1 ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	slider_fog_changed = {
		SET_FOG_VALUE = (_this select 1)/10;
		0 setFog SET_FOG_VALUE;
	};
	_slider1 ctrlRemoveAllEventHandlers 'SliderPosChanged';
	_slider1 ctrlAddEventHandler ['SliderPosChanged','call slider_fog_changed'];
	_slider1 ctrlCommit 0;
	
	_text2 = [_display,'RSCText',33302] call fnc_createctrl;
	_text2 ctrlSetPosition [
		0.55 * safezoneW + safezoneX,
		0.4,
		0.2 * safezoneW,
		0.03 * safezoneH
	];
	_text2 ctrlSetText 'Overcast:';
	_text2 ctrlCommit 0;
	
	_slider2 = [_display,'RscXSliderH',33303] call fnc_createctrl;
	_slider2 ctrlSetPosition [
		0.554 * safezoneW + safezoneX,
		0.45
	];
	_slider2 ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	slider_overcast_changed = {
		SET_OVERCAST_VALUE = (_this select 1)/10;
		0 setOvercast SET_OVERCAST_VALUE;
	};
	_slider2 ctrlRemoveAllEventHandlers 'SliderPosChanged';
	_slider2 ctrlAddEventHandler ['SliderPosChanged','call slider_overcast_changed'];
	_slider2 ctrlCommit 0;
	
	_text3 = [_display,'RSCText',33304] call fnc_createctrl;
	_text3 ctrlSetPosition [
		0.55 * safezoneW + safezoneX,
		0.5,
		0.2 * safezoneW,
		0.03 * safezoneH
	];
	_text3 ctrlSetText 'Rain:';
	_text3 ctrlCommit 0;
	
	_slider3 = [_display,'RscXSliderH',33305] call fnc_createctrl;
	_slider3 ctrlSetPosition [
		0.554 * safezoneW + safezoneX,
		0.55
	];
	_slider3 ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	slider_rain_changed = {
		SET_RAIN_VALUE = (_this select 1)/10;
		if(SET_RAIN_VALUE > 0.3)then{if(overcast < 0.75)then{SET_OVERCAST_VALUE = 0.75;};};
		0 setRain SET_RAIN_VALUE;
	};
	_slider3 ctrlRemoveAllEventHandlers 'SliderPosChanged';
	_slider3 ctrlAddEventHandler ['SliderPosChanged','call slider_rain_changed'];
	_slider3 ctrlCommit 0;
	
	_btn1 = [_display,'RSCButton',33400] call fnc_createctrl;
	_btn1 ctrlSetText 'CHANGE GLOBAL';
	_btn1 ctrlSetPosition [
		0.554 * safezoneW + safezoneX,
		0.6,
		0.3,
		0.033 * safezoneH
	];
	_btn1 ctrlCommit 0;
	_btn1 ctrlSetEventHandler['ButtonClick','[16,SET_FOG_VALUE,SET_OVERCAST_VALUE,SET_RAIN_VALUE] call fnc_AdminReq;'];
	
	SET_FOG_VALUE = fog;
	SET_OVERCAST_VALUE = overcast;
	SET_RAIN_VALUE = rain;
	if(!isNil'fnc_WeatherLordTHREAD')then{terminate fnc_WeatherLordTHREAD;};
	fnc_WeatherLordTHREAD = [] spawn {
		disableSerialization;
		_slider1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33301);
		_slider2 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33303);
		_slider3 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33305);
		if(isNil'SET_FOG_VALUE')then{SET_FOG_VALUE=fog};
		if(isNil'SET_OVERCAST_VALUE')then{SET_OVERCAST_VALUE=overcast};
		if(isNil'SET_RAIN_VALUE')then{SET_RAIN_VALUE=rain};
		while {!isNull findDisplay MAIN_DISPLAY_ID} do
		{
			_fog = SET_FOG_VALUE;
			if(_fog > 0)then{_fog=_fog*10;};
			_slider1 sliderSetPosition _fog;
			0 setFog SET_FOG_VALUE;
			
			_overcast = SET_OVERCAST_VALUE;
			if(_overcast > 0)then{_overcast=_overcast*10;};
			_slider2 sliderSetPosition _overcast;
			0 setOvercast SET_OVERCAST_VALUE;
			
			_rain = SET_RAIN_VALUE;
			if(_rain > 0)then{_rain=_rain*10;};
			_slider3 sliderSetPosition _rain;
			0 setRain SET_RAIN_VALUE;
			
			uiSleep 0.1;
		};
	};
};
fnc_reallyAdditem = {
	params[['_target',player],['_class','']];
	if(_class == '')exitWith{systemChat 'No Item selected!';};
	
	if(local _target)then
	{
		_ret = [_target, _class] call ExileClient_util_playerEquipment_add;
		if(!_ret)then{[_target, _class] call ExileClient_util_playerCargo_add;};
	}
	else
	{
		_toserver = '
			_target = (objectFromNetId '+str (netId _target)+');
			_class = '+str _class+';
			
			_driver = driver _target;
			if(isPlayer _driver)then
			{
				_target setOwner (owner _driver);
			}
			else
			{
				_crew = fullCrew _target;
				if!(_crew isEqualTo [])then
				{
					{
						_unit = _x select 0;
						if(isPlayer _unit)exitWith
						{
							_target setOwner (owner _unit);
						};
					} forEach _crew;
				};
			};
			
			_owner = owner _target;
			_code = {
				params[''_target'',''_class''];
				_ret = [_target, _class] call ExileClient_util_playerEquipment_add;
				if(!_ret)then{[_target, _class] call ExileClient_util_playerCargo_add;};
			};
			[[_target,_class],_code,_owner,false] call FN_infiSTAR_S;
		';
		[_toserver] call admin_d0_server;
	};
};
fnc_HTML_LOAD = {
	disableSerialization;
	_html = uiNamespace getVariable 'RscHTML_infiSTAR_Admin';
	if(ctrlHTMLLoaded _html)exitWith{_html ctrlEnable true;_html ctrlShow true;};
	
	[
		'',
		{
			if(!isNil'START_LOADING_HTML')then{terminate START_LOADING_HTML;START_LOADING_HTML=nil;};
			START_LOADING_HTML = [] spawn {
				disableSerialization;
				_html = uiNamespace getVariable 'RscHTML_infiSTAR_Admin';
				_html htmlLoad HTML_LOAD_URL_EXILE;
				_start = diag_tickTime + .2;
				waitUntil {diag_tickTime > _start};
				if(!ctrlHTMLLoaded _html)exitWith{_html ctrlEnable false;_html ctrlShow false;};
			};
		}
	] execFSM 'call.fsm';
};
fnc_FULLinit = {
	disableSerialization;
	if(isNull findDisplay MAIN_DISPLAY_ID)then
	{
		createdialog 'infiSTAR_AdminMenu';
		call fnc_initOnceOnOpen;
	};
	call fnc_initOnKeyPress;
};
fnc_btn_html = {
	infiSTAR_HTML_LOAD = !infiSTAR_HTML_LOAD;
	if(infiSTAR_HTML_LOAD)then{call fnc_HTML_LOAD;};
	[] call fnc_colorButtons;
};
fnc_initOnceOnOpen = {
	_display = findDisplay MAIN_DISPLAY_ID;
	
	_btn = [_display,'RSCButton',1338001] call fnc_createctrl;
	_btn ctrlSetText 'SAVE TOGGLE STATE';
	_btn ctrlSetPosition [
		0.39 * safezoneW + safezoneX + (0.15 * safezoneW),
		0.0379694 * safezoneH + safezoneY,
		0.12 * safezoneW,
		0.02 * safezoneH
	];
	_btn buttonSetAction '
		profileNamespace setVariable [''infiSTAR_saveToggle'',infiSTAR_toggled_A];
		saveprofileNamespace;
		_log = ''Saved currently toggled/enabled admin functions. Next time you login as admin, they will automatically turn on.'';
		_log call FN_SHOW_LOG;
		systemChat (''<infiSTAR.de> ''+_log);
	';
	_btn ctrlCommit 0;
	
	if(infiSTAR_HTML_LOAD)then{call fnc_HTML_LOAD;};
};
fnc_initOnKeyPress = {
	if!(FILLMAINSTATE in [1,2])then{FILLMAINSTATE = 0;};
	_display = findDisplay MAIN_DISPLAY_ID;
	
	_ctrlL = _display displayCtrl LEFT_SHIFT_ID;
	_ctrlL ctrlRemoveAllEventHandlers 'LBDblClick';
	_ctrlL ctrlRemoveAllEventHandlers 'LBSelChanged';		
	_ctrlL ctrlAddEventHandler ['LBDblClick', 'call fnc_LBDblClick_LEFT;[] call fnc_setFocus;'];
	_ctrlL ctrlAddEventHandler ['LBSelChanged', 'call fnc_LBSelChanged_LEFT;[] call fnc_setFocus;'];
	[] call fnc_fill_infiSTAR_Player;
	
	_ctrlR = _display displayCtrl RIGHT_SHIFT_ID;
	_ctrlR ctrlRemoveAllEventHandlers 'LBDblClick';
	_ctrlR ctrlRemoveAllEventHandlers 'LBSelChanged';
	_ctrlR ctrlAddEventHandler ['LBDblClick', 'call fnc_LBDblClick_RIGHT;[] call fnc_setFocus;'];
	_ctrlR ctrlAddEventHandler ['LBSelChanged', 'call fnc_LBSelChanged_RIGHT;[] call fnc_setFocus;'];
	[] call fnc_fill_infiSTAR_MAIN;
	
	_ctrl = _display displayCtrl 2;
	_ctrl ctrlSetText format['Players loaded in: %1 of %2                 SERVER UPTIME: %3  SERVER FPS: %4  SERVER THREADS: %5          infiSTAR.de Admin Menu %6',count allPlayers,((playersNumber west)+(playersNumber east)+(playersNumber civilian)+(playersNumber resistance)),time call GET_TIME_TIME,SERVER_FPS,SERVER_THREADS,INFISTARVERSION];
	
	_btnMainMenu = _display displayCtrl 20;
	_btnMainMenu buttonSetAction 'FILLMAINSTATE=0;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;';
	
	_btnSpawnMenu = _display displayCtrl 21;
	_btnSpawnMenu buttonSetAction 'FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;';
	
	if('==== Loadouts ====' call ADMINLEVELACCESS)then{call fnc_Loadoutmenu;};
	if('==== WeatherLord ====' call ADMINLEVELACCESS)then{call fnc_WeatherLord;};
	
	call fnc_SearchFieldButtons;
	[] call fnc_setFocus;
	[] call fnc_colorButtons;
};
fnc_colorizeMain = {
	disableSerialization;
	_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_SHIFT_ID;
	_lsize = lbSize RIGHT_SHIFT_ID;
	for '_i' from 0 to _lsize do
	{
		_lbtxt = lbtext [RIGHT_SHIFT_ID,_i];
		if(_lbtxt in (infiSTAR_Toggleable+infiSTAR_CUSTOM_Toggleable))then
		{
			if(_lbtxt in infiSTAR_toggled_A)then
			{
				_ctrl lbSetColor [_i,[0,1,0,1]];
			}
			else
			{
				_ctrl lbSetColor [_i,[1,0,0,1]];
			};
		};
		if(_lbtxt in infiSTAR_SubMenus)then
		{
			_ctrl lbSetColor [_i,[0.67,0.97,0.97,1]];
		};
		if(_lbtxt in infiSTAR_OnTargetNICE)then
		{
			_ctrl lbSetColor [_i,[0,0.8,1,1]];
		};
		if(_lbtxt in infiSTAR_OnTargetEVIL)then
		{
			_ctrl lbSetColor [_i,[0.99,0.8,0.8,1]];
		};
		if(_lbtxt in infiSTAR_CUSTOM_OnTarget)then
		{
			_ctrl lbSetColor [_i,[0.78,0.66,0,1]];
		};
	};
};
fnc_colorButtons = {
	call fnc_SearchFieldButtons;
	disableSerialization;
	_display = findDisplay MAIN_DISPLAY_ID;
	_btnMainMenu = _display displayCtrl 20;
	if(FILLMAINSTATE isEqualTo 0)then{_btnMainMenu ctrlSetTextColor [0,1,0,1];} else {_btnMainMenu ctrlSetTextColor [1,1,1,1];};
	_btnSpawnMenu = _display displayCtrl 21;
	if(FILLMAINSTATE isEqualTo 1)then{_btnSpawnMenu ctrlSetTextColor [0,1,0,1];} else {_btnSpawnMenu ctrlSetTextColor [1,1,1,1];};
	
	_btnAntiHackLog = _display displayCtrl 23;
	_btnAntiHackLog ctrlSetText (format['AHLogs: %1',count AH_HackLogArray + count AH_SurvLogArray + count PVAH_AHTMPBAN]);
	_btnAntiHackLog buttonSetAction 'FILLMAINSTATE=3;[] call fnc_fill_HackLog;[] call fnc_setFocus;[] call fnc_colorButtons;';
	if(FILLMAINSTATE isEqualTo 3)then{_btnAntiHackLog ctrlSetTextColor [0,1,0,1];} else {_btnAntiHackLog ctrlSetTextColor [1,1,1,1];};
	
	_btnAdminLog = _display displayCtrl 24;
	_btnAdminLog ctrlSetText (format['AdminLogs: %1',count AH_AdmiLogArray]);
	_btnAdminLog buttonSetAction 'FILLMAINSTATE=4;[] call fnc_fill_AdminLog;[] call fnc_setFocus;[] call fnc_colorButtons;';
	if(FILLMAINSTATE isEqualTo 4)then{_btnAdminLog ctrlSetTextColor [0,1,0,1];} else {_btnAdminLog ctrlSetTextColor [1,1,1,1];};
	
	_btnItems = _display displayCtrl 36;
	if((LASTSUBBUTTON isEqualTo 0)&&(FILLMAINSTATE isEqualTo 1))then
	{
		_btnItems ctrlSetTextColor [0,1,0,1];
		
		_ctrlpos =
		[
			0.2 * safezoneW + safezoneX,
			0.173 * safezoneH + safezoneY,
			0.15 * safezoneW,
			0.025 * safezoneH
		];
		
		_RSCButton33401 = [_display,'RSCButton',33401] call fnc_createctrl;
		_RSCButton33401 ctrlSetText 'INFRONT OF TARGET';
		_RSCButton33401 ctrlSetPosition _ctrlpos;
		_RSCButton33401 buttonSetAction 'BTN_GET_ITEM_SEL = 0;[] call fnc_colorButtons;';
		_RSCButton33401 ctrlCommit 0;
		_RSCButton33402 = [_display,'RSCButton',33402] call fnc_createctrl;
		_RSCButton33402 ctrlSetText 'ON TARGET';
		_RSCButton33402 ctrlSetPosition [((_ctrlpos select 0)+(_ctrlpos select 2))*1.2,_ctrlpos select 1,_ctrlpos select 2,_ctrlpos select 3];
		_RSCButton33402 buttonSetAction 'BTN_GET_ITEM_SEL = 1;[] call fnc_colorButtons;';
		_RSCButton33402 ctrlCommit 0;
		
		if(BTN_GET_ITEM_SEL isEqualTo 0)then
		{
			_RSCButton33401 ctrlSetTextColor [0,1,0,1];
			_RSCButton33402 ctrlSetTextColor [1,1,1,1];
		}
		else
		{
			_RSCButton33401 ctrlSetTextColor [1,1,1,1];
			_RSCButton33402 ctrlSetTextColor [0,1,0,1];
		};
	}
	else
	{
		_btnItems ctrlSetTextColor [1,1,1,1];
		
		ctrlDelete (_display displayCtrl 33401);
		ctrlDelete (_display displayCtrl 33402);
	};
	_btnVehs = _display displayCtrl 37;
	if((LASTSUBBUTTON isEqualTo 1)&&(FILLMAINSTATE isEqualTo 1))then
	{
		_btnVehs ctrlSetTextColor [0,1,0,1];
		if('Spawn Persistent Vehicles' call ADMINLEVELACCESS)then
		{
			_ctrlpos =
			[
				0.2 * safezoneW + safezoneX,
				0.173 * safezoneH + safezoneY,
				0.15 * safezoneW,
				0.025 * safezoneH
			];
			
			_RSCButton33401 = [_display,'RSCButton',33403] call fnc_createctrl;
			_RSCButton33401 ctrlSetText 'NonPersistent';
			_RSCButton33401 ctrlSetPosition _ctrlpos;
			_RSCButton33401 buttonSetAction 'BTN_SPAWN_VEH_SEL = 0;[] call fnc_colorButtons;';
			_RSCButton33401 ctrlCommit 0;
			_RSCButton33402 = [_display,'RSCButton',33404] call fnc_createctrl;
			_RSCButton33402 ctrlSetText 'Persistent';
			_RSCButton33402 ctrlSetPosition [((_ctrlpos select 0)+(_ctrlpos select 2))*1.2,_ctrlpos select 1,_ctrlpos select 2,_ctrlpos select 3];
			_RSCButton33402 buttonSetAction 'BTN_SPAWN_VEH_SEL = 1;[] call fnc_colorButtons;';
			_RSCButton33402 ctrlEnable true;
			_RSCButton33402 ctrlCommit 0;
			
			if(BTN_SPAWN_VEH_SEL isEqualTo 0)then
			{
				_RSCButton33401 ctrlSetTextColor [0,1,0,1];
				_RSCButton33402 ctrlSetTextColor [1,1,1,1];
			}
			else
			{
				_RSCButton33401 ctrlSetTextColor [1,1,1,1];
				_RSCButton33402 ctrlSetTextColor [0,1,0,1];
			};
		};
	}
	else
	{
		_btnVehs ctrlSetTextColor [1,1,1,1];
		if('Spawn Persistent Vehicles' call ADMINLEVELACCESS)then
		{
			ctrlDelete (_display displayCtrl 33403);
			ctrlDelete (_display displayCtrl 33404);
		};
	};
	_btnTrader = _display displayCtrl 38;
	if(LASTSUBBUTTON isEqualTo 2)then{_btnTrader ctrlSetTextColor [0,1,0,1];} else {_btnTrader ctrlSetTextColor [1,1,1,1];};
	_mytime = 0.3;
	_ctrlR = _display displayCtrl RIGHT_SHIFT_ID;
	if(isNil 'ctrlposR')then{ctrlposR = ctrlPosition _ctrlR;};
	_ctrlRTMP = [(ctrlposR select 0),(ctrlposR select 1),(ctrlposR select 2)*2.35,(ctrlposR select 3)];
	if(FILLMAINSTATE isEqualTo 0)then
	{
		_ctrlRTMP = ctrlposR;
	};
	if(FILLMAINSTATE isEqualTo 1)then
	{
		_ctrlRTMP = [(ctrlposR select 0),(ctrlposR select 1)+.25,(ctrlposR select 2),(ctrlposR select 3)-.25];
	};
	_ctrlR ctrlSetPosition _ctrlRTMP;
	_ctrlR ctrlCommit _mytime;
	
	_btnHTML = _display displayCtrl 25;
	if(infiSTAR_HTML_LOAD)then{_btnHTML ctrlSetTextColor [1,0,0,1];_btnHTML ctrlSetText 'HIDE HTML';}else{_btnHTML ctrlSetTextColor [0,1,0,1];_btnHTML ctrlSetText 'SHOW HTML';};
	(uiNamespace getVariable 'RscHTML_infiSTAR_Admin') ctrlEnable infiSTAR_HTML_LOAD;
	(uiNamespace getVariable 'RscHTML_infiSTAR_Admin') ctrlShow infiSTAR_HTML_LOAD;
};
fnc_fill_HackLog = {
	disableSerialization;
	_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_SHIFT_ID;
	lbclear _ctrl;
	_ctrl lbAdd 'clear ingame HackLog';
	_ctrl lbAdd 'DBL-CLICK TO SYSTEMCHAT';
	_ctrl lbAdd '--------------------';
	
	_cnt = count AH_HackLogArray;
	_ctrl lbAdd format['HackLog: %1',_cnt];
	for '_i' from (_cnt - 1) to 0 step -1 do
	{
		_ctrl lbAdd (AH_HackLogArray select _i);
	};
	
	_ctrl lbAdd '';
	_cnt = count AH_SurvLogArray;
	_ctrl lbAdd format['SurveillanceLog: %1',_cnt];
	for '_i' from (_cnt - 1) to 0 step -1 do
	{
		_ctrl lbAdd (AH_SurvLogArray select _i);
	};
	
	_ctrl lbAdd '';
	_ctrl lbAdd format['BanLog: %1',count PVAH_AHTMPBAN];
	if(str PVAH_AHTMPBAN != '[]')then
	{
		_ctrl lbAdd 'DBL-CLICK TO REMOVE';
		{_ctrl lbAdd _x;} forEach PVAH_AHTMPBAN;
	};
	for '_i' from 0 to 12 do {_ctrl lbAdd '';};
};
fnc_fill_AdminLog = {
	disableSerialization;
	_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_SHIFT_ID;
	lbclear _ctrl;
	if('AdminLog' call ADMINLEVELACCESS)then
	{
		_ctrl lbAdd 'clear ingame AdminLog';
		_ctrl lbAdd 'DBL-CLICK TO SYSTEMCHAT';
		{_ctrl lbAdd _x;} forEach AH_AdmiLogArray;
	}
	else
	{
		_ctrl lbAdd 'Nothin to see here';
	};
	for '_i' from 0 to 12 do {_ctrl lbAdd '';};
};
infiSTAR_SubMenus =
[
	'==== Vehicles ====','==== OnTarget ====','==== Toggleable ====','==== Custom Functions ===='
];
infiSTAR_SubMenus append newAllItems_CATEGORY;
infiSTAR_OnTargetNICE =
[
	'Teleport - Target To Me','Teleport - Me To Target',
	'Request Steam Name','Heal','Restore','Flip Vehicle',
	'Move In My Vehicle','Move In Target Vehicle','Remove Unconscious',
	'UnFreeze','UnRestrain',
	'Change Money on Player','Change Money on Bank','Change Respect'
];
infiSTAR_OnTargetEVIL =
[
	'Restrain','Freeze',
	'Remove Gear','Kill','Light','Explode','Force Suicide','Delete Vehicle','Eject','Eject Crew','Unconscious',
	'Force Disconnect','Kick (Silent)','Kick (Announce)',
	'Ban (Silent)','Ban (Announce)','TempBan (Silent)','TempBan (Announce)'
];
if!(getArray(configfile >> 'CfgPatches' >> 'Ryanzombies' >> 'units') isEqualTo [])then
{
	infiSTAR_OnTargetEVIL pushBackUnique 'Spawn Zombie on Target Location!';
};
infiSTAR_OnTarget = infiSTAR_OnTargetNICE + infiSTAR_OnTargetEVIL;
infiSTAR_Toggleable =
[
	'Player ESP','Player ESP (safezone style)','AI ESP','Dead ESP','Loot ESP',
	'MapIcons','Vehicle Marker','Flag Marker (with radius)','DeadPlayer Marker','Stealth / Invisible',
	'God Mode','God Mode (no stats change)','Vehicle God Mode','Vehboost','UnlimAmmo','noRecoil','FastFire','Lower Terrain',
	'Disable Announces','Teleport In Facing Direction (10m steps)','Show Server Information','Drag and drop units on the map'
];
fnc_fill_infiSTAR_MAIN = {
	disableSerialization;
	_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_SHIFT_ID;
	lbclear _ctrl;
	if(FILLMAINSTATE == 1)then
	{
		switch (LASTSUBBUTTON) do {
			case 0:{
				if('Items spawn menu' call ADMINLEVELACCESS)then
				{
					{
						_category = _x;
						_ctrl lbAdd _category;
						
						_varstate = missionNameSpace getVariable (_category+'SHOW_STATE');
						if(!isNil '_varstate')then
						{
							_variable = missionNameSpace getVariable (_category+'_ARRAY');
							{
								_displayName = getText(configFile >> 'CfgWeapons' >> _x >> 'displayName');
								if(_displayName isEqualTo '')then{_displayName = getText(configFile >> 'CfgMagazines' >> _x >> 'displayName');};
								if(_displayName isEqualTo '')then{_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');};
								
								_lbid = _ctrl lbAdd format['%1 (%2)',_displayName,_x];
								_ctrl lbSetData [_lbid,_x];
								_x call fnc_addpic;
							} forEach _variable;
						};
						
					} forEach newAllItems_CATEGORY;
					for '_i' from 0 to 12 do {_ctrl lbAdd '';};
				};
			};
			case 1:{
				if(('Spawn Vehicles' call ADMINLEVELACCESS) || ('Spawn Persistent Vehicles' call ADMINLEVELACCESS))then
				{
					_ctrl lbAdd '==== Vehicles ====';
					if(!isNil 'infiSTAR_add_vehicles')then
					{
						_lbid = _ctrl lbAdd 'Exile vehicles:';
						_ctrl lbSetColor [_lbid, [0,1,0,1]];
						{
							_lbid = _ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
							_ctrl lbSetData [_lbid,_x];
							_x call fnc_addpic;
							_ctrl lbSetColor [_lbid, [0,1,0,1]];
						} forEach ALL_VEHS_TO_SEARCH_C_EXILE;
						
						_ctrl lbAdd '';
						_ctrl lbAdd 'Other vehicles:';
						{
							_lbid = _ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
							_ctrl lbSetData [_lbid,_x];
							_x call fnc_addpic;
						} forEach ALL_VEHS_TO_SEARCH_C_OTHER;
					};
				};
				for '_i' from 0 to 12 do {_ctrl lbAdd '';};
			};
			case 2:{
				_lbid = _ctrl lbAdd '!!! ATTENTION !!!';_ctrl lbSetData [_lbid,'-1337'];
				_lbid = _ctrl lbAdd 'Trader menus might be a bit buggy.';_ctrl lbSetData [_lbid,'-1337'];
				{
					_lbid = _ctrl lbAdd (_x select 0);
					if(count _x isEqualTo 1)then{_ctrl lbSetData [_lbid,'-1337'];}else{_ctrl lbSetData [_lbid,str _forEachIndex];};
				} forEach TRADER_FUNCTION_ARRAY;
			};
			default {lbclear _ctrl;};
		};
	};
	if(FILLMAINSTATE == 0)then
	{
		_onTarget = [];
		{if(_x call ADMINLEVELACCESS)then{_onTarget pushBack _x;};} forEach infiSTAR_OnTargetNICE;
		
		if!(_onTarget isEqualTo [])then{_onTarget pushBack '---';};
		{if(_x call ADMINLEVELACCESS)then{_onTarget pushBack _x;};} forEach infiSTAR_OnTargetEVIL;
		if!(_onTarget isEqualTo [])then
		{
			_ctrl lbAdd '==== OnTarget ====';
			if(isNil 'infiSTAR_add_OnTarget')then
			{
				{_ctrl lbAdd _x;} forEach _onTarget;
			};
		};
		
		
		_Toggleable = [];
		{if(_x call ADMINLEVELACCESS)then{_Toggleable pushBack _x;};} forEach infiSTAR_Toggleable;
		if!(_Toggleable isEqualTo [])then
		{
			_ctrl lbAdd '==== Toggleable ====';
			if(isNil 'infiSTAR_add_Toggleable')then
			{
				{_ctrl lbAdd _x;} forEach _Toggleable;
			};
		};
		
		if('Spawn Ammo' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Spawn Ammo';};
		if('Change ViewDistance' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Change ViewDistance';};
		if('FreeRoam Cam (does not work with ESP)' call ADMINLEVELACCESS)then{_ctrl lbAdd 'FreeRoam Cam (does not work with ESP)'};
		if('BIS FreeRoam Cam (works with ESP)' call ADMINLEVELACCESS)then{_ctrl lbAdd 'BIS FreeRoam Cam (works with ESP)'};
		
		if('Spawn Support-Boxes' call ADMINLEVELACCESS)then
		{
			_ctrl lbAdd '';
			{
				_ctrl lbAdd _x;
			} forEach allSupportBoxesNames;
		};
		
		if('Create Billboard' call ADMINLEVELACCESS)then
		{
			_ctrl lbAdd '';
			{
				_index = _ctrl lbAdd format['Create Billboard: %1',_x select 0];
			} forEach pathToCustomBillBoardTextures;
		};
		
		_ctrl lbAdd '';
		if('Arsenal' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Arsenal';};
		if('Arsenal' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Arsenal (Mousewheel)';};
		if('Copy Worldspace(coords) to RPT & Chat' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Copy Worldspace(coords) to RPT & Chat';};
		if('Mass Message' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Mass Message';};
		if('Change Time' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Day'};
		if('Change Time' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Night'};
		if('AdminConsole' call ADMINLEVELACCESS)then{_ctrl lbAdd 'AdminConsole';};
		if('DebugConsole' call ADMINLEVELACCESS)then{_ctrl lbAdd 'DebugConsole';};
		if('Login as Arma Admin' call ADMINLEVELACCESS)then
		{
			if(isNil 'serverCommandLoginDone')then{_ctrl lbAdd 'Login';};
			if(serverCommandAvailable '#logout')then
			{
				_target = lbtext[LEFT_SHIFT_ID,(lbCurSel LEFT_SHIFT_ID)];
				_ctrl lbAdd format['#kick %1',_target];
				_ctrl lbAdd format['#exec ban %1',str _target];
			};
		};
		
		_ctrl lbAdd '';
		_ctrl lbAdd 'Self Disconnect';
		_ctrl lbAdd '';
		
		if('==== Base Deleter ====' call ADMINLEVELACCESS)then
		{
			_index = _ctrl lbAdd '==== Base Deleter ====';
			_ctrl lbSetColor [_index, [0.2,0.4,1,1]];
			if(isNil 'infiSTAR_add_BaseDeleter')then
			{
				_ctrl lbAdd 'BD: Set Center';
				if(!isNil 'CCGbdCenter')then{
					_ctrl lbAdd 'BD: Set Radius';
				};
				if(!isNil 'CCGbdCenter' && !isNil 'CCGbdRadius')then{
					_ctrl lbAdd '';
					_objects = call CCG_fnc_bdGetObjectsToDelete;
					_ctrl lbAdd format['BD: Selected %1 Objects', count _objects];
					_index = _ctrl lbAdd 'BD: Delete Base';
					_ctrl lbSetColor [_index, [0.8,0,0,1]];
					
					_ctrl lbAdd '';
					
					_objects = call CCG_fnc_bdGetWeaponHoldersToDelete;
					_ctrl lbAdd format['BD: Selected %1 WeaponHolder', count _objects];
					_index = _ctrl lbAdd 'BD: Delete Weaponholder';
					_ctrl lbSetColor [_index, [0.8,0,0,1]];
					_ctrl lbAdd '';
				};
				_ctrl lbAdd 'BD: Cancel / Remove';
				_ctrl lbAdd '';
			};
		};
		
		if(!isNil'infiSTAR_customFunctions')then
		{
			_customFunctions = [];
			{if((_x select 1) call ADMINLEVELACCESS)then{_customFunctions pushBack (_x select 1);};} forEach infiSTAR_customFunctions;
			if!(_customFunctions isEqualTo [])then
			{
				
				_ctrl lbAdd '==== Custom Functions ====';
				if(isNil 'infiSTAR_add_customFunctions')then
				{
					{_ctrl lbAdd _x;} forEach _customFunctions;
				};
			};
		};
		
		_ctrl lbAdd '';
		_ctrl lbAdd 'Keybinds:';
		_ctrl lbAdd 'F1 - Default AdminMenu Key';
		_ctrl lbAdd 'F3 - Adminconsole / Debug Console';
		_ctrl lbAdd 'F6 - Heal Yourself';
		_ctrl lbAdd 'F7 - Heal & Repair withing 15m';
		_ctrl lbAdd 'F8 - Flip CursorTarget Vehicle';
		_ctrl lbAdd 'F9 - Show Gear of Player you are currently spectating (might close if player moves)';
		_ctrl lbAdd 'SHIFT & F9 - To hide/show specate overlay (while spectating)';
		_ctrl lbAdd 'F10 - Stop Spectating';
		_ctrl lbAdd 'F11 - Add Ammo for current weapon';
		_ctrl lbAdd 'CTRL & 1 - Light / Zeus';
		_ctrl lbAdd 'SHIFT & 4 - Fly Up';
		_ctrl lbAdd 'SHIFT & 5 - Teleport in looking direction (if enabled)';
		_ctrl lbAdd '7 - Unlock/Lock targeted Vehicle';
		_ctrl lbAdd '7 - Opens/Closes targeted Door/Hatch/Gate';
		_ctrl lbAdd 'SHIFT & F2 - configviewer';
		_ctrl lbAdd 'SHIFT & TAB - Open Map';
		_ctrl lbAdd 'SHIFT & I - Show Info (Like Codes of Vehicles and Doors)';
		_ctrl lbAdd 'DELETE - Delete CursorTarget';
		_ctrl lbAdd 'ON MAP - LEFT-ALT + CLICK To Teleport';
		_ctrl lbAdd 'TYPE !admin in Chat to relog as player/admin';
	};
	[] call fnc_colorizeMain;
	for '_i' from 0 to 12 do {_ctrl lbAdd '';};
};
fnc_get_plr = {allPlayers};
fnc_fill_infiSTAR_Player_REAL = {
	disableSerialization;
	_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_SHIFT_ID;
	lbclear _ctrl;
	_unsorted = call fnc_get_plr;
	_sorted = _unsorted;
	lbclear _ctrl;
	if!(_sorted isEqualTo [])then
	{
		_fnc_addPlayerToList = {
			if(isNull _x)exitWith{};
			_PUIDX = getPlayerUID _x;
			if(_PUIDX == '')exitWith{};
			_side = side _x;
			
			_grp = group _x;
			_ExileName = _x call fnc_get_exileObjName;
			_name = format['%1 [%2]',_ExileName,_side];
			if(count units _grp > 1)then
			{
				_name = format['%1 [%2 (%3)]',_ExileName,_side,_grp];
			};
			_index = _ctrl lbAdd _name;
			
			_veh = vehicle _x;
			_xpic = getText (configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'picture');
			if(alive _x)then
			{
				if(_x == _veh)then
				{
					_wpnstate = weaponState _x;
					_cwep = _wpnstate select 0;
					if(_cwep != '')then
					{
						_xpic = getText (configFile >> 'CfgWeapons' >> _cwep >> 'picture');
					};
				};
			};
			if(_xpic call fn_STAR_validpic)then
			{
				_ctrl lbSetPicture [_index,_xpic];
				_ctrl lbSetPictureColor [_index,[1, 1, 1, 1]];
			};
			_alpha = 1;
			_clr = _x call FN_GET_CLR;
			_ctrl lbSetColor [_index,_clr];
		};
		if(!isNil'SortAlphaPlease')exitWith
		{
			{call _fnc_addPlayerToList} forEach _sorted;
		};
		if(!isNil'SortGroupsPlease')exitWith
		{
			_shown = [];
			{
				_grp = group _x;
				if!(_grp in _shown)then
				{
					_shown pushBack _grp;
					
					_ctrl lbAdd format['______%1______',_grp];
					{
						call _fnc_addPlayerToList;
					} forEach (units _grp);
				};
			} forEach _sorted;
		};
		if(!isNil'SortRangePlease')exitWith
		{
			sortRangePos = if(positionCameraToWorld [0,0,0] distance cameraOn > 10)then{positionCameraToWorld [0,0,0]}else{cameraOn};
			_sorted = [_unsorted,[],{sortRangePos distance _x},'ASCEND'] call BIS_fnc_sortBy;
			{call _fnc_addPlayerToList} forEach _sorted;
		};
	};
	_display = findDisplay MAIN_DISPLAY_ID;
	_btnSortAlpha = _display displayCtrl 10;if(!isNil 'SortAlphaPlease')then{lbSort _ctrl;_btnSortAlpha ctrlSetTextColor [0,1,0,1];} else {_btnSortAlpha ctrlSetTextColor [1,1,1,1];};
	_btnSortGroups = _display displayCtrl 11;if(!isNil 'SortGroupsPlease')then{_btnSortGroups ctrlSetTextColor [0,1,0,1];} else {_btnSortGroups ctrlSetTextColor [1,1,1,1];};
	_btnSortRange = _display displayCtrl 12;if(!isNil 'SortRangePlease')then{_btnSortRange ctrlSetTextColor [0,1,0,1];} else {_btnSortRange ctrlSetTextColor [1,1,1,1];};
	_ctrl lbAdd '-----------------------------------';
	_index = _ctrl lbAdd '[Selected]';_ctrl lbSetColor [_index,[1,0.7,0.15,1]];
	_index = _ctrl lbAdd '[In Vehicle]';_ctrl lbSetColor [_index,[0.047,0.502,1,1]];
	_index = _ctrl lbAdd '[Player]';_ctrl lbSetColor [_index,[1,0.17,0.17,1]];
	_index = _ctrl lbAdd '[Group]';_ctrl lbSetColor [_index,[1,0.95,0,1]];
	_index = _ctrl lbAdd '[Admin]';_ctrl lbSetColor [_index,[0,1,0,1]];
	_index = _ctrl lbAdd '[Dead Player]';_ctrl lbSetColor [_index,[1,1,1,1]];
	for '_i' from 0 to 12 do {_ctrl lbAdd '';};
};
fnc_fill_infiSTAR_Player = {
	[
		'',
		{
			call fnc_fill_infiSTAR_Player_REAL
		}
	] execFSM 'call.fsm';
};
fnc_LBDblClick_LEFT = {
	if(!isNil 'SELECTED_TARGET_PLAYER')then
	{
		if(!isNull SELECTED_TARGET_PLAYER)then
		{
			if('spectating' call ADMINLEVELACCESS)then{SELECTED_TARGET_PLAYER call fnc_beginspectate;};
		};
	};
};
fnc_LBSelChanged_LEFT = {
	_obj = call fnc_get_selected_object;
	if(!isNull (findDisplay MAIN_DISPLAY_ID displayCtrl 44463))then
	{
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44463) ctrlSetText format['SELECTED TARGET: %1',SELECTED_TARGET_PLAYER];
	};
	if(visibleMap)then
	{
		(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlMapAnimAdd [1, 0.1, getPos _obj];
		ctrlMapAnimCommit (uiNamespace getVariable 'A3MAPICONS_mainMap');
	};
	_obj
};
fnc_GET_ITEM = {
	_target = call fnc_get_selected_object;
	if((BTN_GET_ITEM_SEL isEqualTo 0)&&!(FILLMAINSTATE isEqualTo 6))then
	{
		_posATL = getPosATL _target;
		_pos = _target modelToWorld [0,1.5,0];
		_pos set[2,_posATL select 2];
		[3,netId _target,_pos,_class] call fnc_AdminReq;
		
		_log = format['Spawning %1 on the ground infront of %2!',_click,_target call fnc_get_exileObjName];
		_log call fnc_adminLog;
		_log call FN_SHOW_LOG;
	}
	else
	{
		[_target,_class] call fnc_reallyAdditem;
		_log = format['Spawning %1 on %2!',_click,_target call fnc_get_exileObjName];
		_log call fnc_adminLog;
		_log call FN_SHOW_LOG;
	};
};
FN_EXILE_VEH_TRADER_ADMIN = {
	if((player isEqualTo (vehicle player))&&((_this select 2 isEqualTo 1)))exitWith
	{
		systemChat '<infiSTAR.de> You need to be in a Vehicle to use this!'
	};
	_obj = (_this select 0) createVehicleLocal (getPos player);
	_obj setVariable ['ExileTraderType',(_this select 0)];
	_obj call (missionNameSpace getVariable (_this select 1));
	deleteVehicle _obj;
};
fnc_toggleables = {
	_stop = false;
	switch (_this) do {
		case 'Player ESP':{call fnc_PlayerESP_NORM;};
		case 'Player ESP (safezone style)':{call fnc_PlayerESP_SS;};
		case 'AI ESP':{if(isNil 'fnc_infiESP_stateAI')then{fnc_infiESP_stateAI = 1;}else{fnc_infiESP_stateAI = nil;};call fnc_call_single_esps;};
		case 'Dead ESP':{if(isNil 'fnc_infiESP_stateDEAD')then{fnc_infiESP_stateDEAD = 1;}else{fnc_infiESP_stateDEAD = nil;};call fnc_call_single_esps;};
		case 'Loot ESP':{call fnc_LootESP;};
		case 'MapIcons':{call infiSTAR_A3MAPICONS;};
		case 'Vehicle Marker':{call adminVehicleMarker;};
		case 'Flag Marker (with radius)':{call adminFlagMark;};
		case 'DeadPlayer Marker':{call adminDeadPlayer;};
		case 'God Mode':{if('God Mode (no stats change)' in infiSTAR_toggled_A)exitWith{systemChat 'Please disable   God Mode (no stats change)   first.';_stop=true;};call infiSTAR_A3Invulnerability;};
		case 'God Mode (no stats change)':{if('God Mode' in infiSTAR_toggled_A)exitWith{systemChat 'Please disable   God Mode   first.';_stop=true;};call infiSTAR_A3Invulnerability2;};
		case 'Vehicle God Mode':{call fnc_infiSTAR_A3cargod;};
		case 'Lower Terrain':{call fnc_LowerTerrain;};
		case 'Vehboost':{call infiSTAR_VehicleBoost;};
		case 'UnlimAmmo':{call fnc_infiSTAR_A3UnlAmmo;};
		case 'noRecoil':{call fnc_infiSTAR_A3noRecoil;};
		case 'FastFire':{call fnc_infiSTAR_A3FF;};
		case 'Stealth / Invisible':{call fnc_infiSTARHIDE;};
		case 'Disable Announces':{call fnc_DisableAnnouncements;};
		case 'Teleport In Facing Direction (10m steps)':{if(isNil'infiSTAR_TpdirectionENABLED')then{infiSTAR_TpdirectionENABLED=true}else{infiSTAR_TpdirectionENABLED=nil;};};
		case 'Show Server Information':{call FN_SERVER_INFORMATION_OVERLAY;};
		case 'Drag and drop units on the map':{if(isNil'infiSTAR_dad_state')then{infiSTAR_dad_state=true}else{infiSTAR_dad_state=nil;};};
	};
	if(_stop)exitWith{};
	if(_this in infiSTAR_CUSTOM_Toggleable)then
	{
		_id = infiSTAR_CUSTOM_Toggleable find _this;
		if!(_id isEqualTo -1)then
		{
			call (missionNameSpace getVariable format['FNC_CUSTOM_TOGGLEABLE_%1',_id]);
		};
	};
	if(_this in infiSTAR_toggled_A)then
	{
		lbSetColor [RIGHT_SHIFT_ID,1,[1,0,0,1]];
		infiSTAR_toggled_A = infiSTAR_toggled_A - [_this];
		_log = format['%1 - OFF',_this];
		_log call fnc_adminLog;
		_log call FN_SHOW_LOG;
	}
	else
	{
		lbSetColor [RIGHT_SHIFT_ID,1,[0,1,0,1]];
		infiSTAR_toggled_A pushBack _this;
		_log = format['%1 - ON',_this];
		_log call fnc_adminLog;
		_log call FN_SHOW_LOG;
	};
};
fnc_LBDblClick_RIGHT = {
	_click = lbtext[RIGHT_SHIFT_ID,(lbCurSel RIGHT_SHIFT_ID)];
	if(_click isEqualTo '')exitWith{};
	if(FILLMAINSTATE isEqualTo 1 && LASTSUBBUTTON isEqualTo 2)exitWith
	{
		_num = parseNumber(lbData[RIGHT_SHIFT_ID,(lbCurSel RIGHT_SHIFT_ID)]);
		if(_num isEqualTo -1337)exitWith{};
		(TRADER_FUNCTION_ARRAY select _num) call FN_EXILE_VEH_TRADER_ADMIN;
	};
	if(_click in infiSTAR_CUSTOM_RUN)exitWith
	{
		_id = infiSTAR_CUSTOM_RUN find _click;
		if!(_id isEqualTo -1)then
		{
			call (missionNameSpace getVariable format['FNC_CUSTOM_RUN_%1',_id]);
		};
	};
	if('==== Base Deleter ====' call ADMINLEVELACCESS)then{[_click] call CCG_fnc_adminClick;};
	if(_click in AH_HackLogArray)exitWith{systemchat _click;diag_log _click;};
	if(_click in AH_SurvLogArray)exitWith{systemchat _click;diag_log _click;};
	if(_click in AH_AdmiLogArray)exitWith{systemchat _click;diag_log _click;};
	if(_click in PVAH_AHTMPBAN)exitWith{
		[-667,_click] call fnc_AdminReq;
		systemchat format['Removed  %1  from TempBan Variable. Might still be banned in ban(s).txt',_click];
		[] call fnc_fill_HackLog;[] call fnc_setFocus;
	};
	if(_click in (infiSTAR_Toggleable+infiSTAR_CUSTOM_Toggleable))then{_click call fnc_toggleables;};
	if(_click in (infiSTAR_OnTarget+infiSTAR_CUSTOM_OnTarget))then
	{
		_unit = call fnc_get_selected_object;
		
		if(_click == 'Light')exitWith{[_unit] call fnc_Light_selected;};
		if(_click == 'Kill')exitWith{[_unit] call fnc_Kill_selected;};
		if(_click == 'Explode')exitWith{[_unit] call fnc_Explode_selected;};
		if(_click == 'Force Suicide')exitWith{[_unit] call fnc_fsuicide_selected;};
		if(_click == 'Delete Vehicle')exitWith{[_unit] call fnc_deleteVeh_selected;};
		
		if(_click == 'Change Money on Player')exitWith{if(!isNil'mrthread_x')then{terminate mrthread_x;mrthread_x=nil;};mrthread_x = [_unit,0] spawn fnc_ExileMoneyRespectChange;};
		if(_click == 'Change Money on Bank')exitWith{if(!isNil'mrthread_x')then{terminate mrthread_x;mrthread_x=nil;};mrthread_x = [_unit,1] spawn fnc_ExileMoneyRespectChange;};
		if(_click == 'Change Respect')exitWith{if(!isNil'mrthread_x')then{terminate mrthread_x;mrthread_x=nil;};mrthread_x = [_unit,2] spawn fnc_ExileMoneyRespectChange;};
		
		_log = format['%1 - %2(%3)',_click,_unit call fnc_get_exileObjName,getPlayerUID _unit];_log call fnc_adminLog;
		
		if(_click == 'Teleport - Target To Me')exitWith{[_unit] call fnc_TP2ME;};
		if(_click == 'Teleport - Me To Target')exitWith{[_unit] call fnc_TPME2;};
		if(_click == 'Request Steam Name')exitWith{[_unit] call fnc_getSteamName;};
		if(_click == 'Revive')exitWith{[_unit] call fnc_ReviveTarget;};
		if(_click == 'Heal')exitWith{[_unit] call fnc_HealTarget;};
		if(_click == 'Restore')exitWith{[_unit] call fnc_RepairTarget;};
		if(_click == 'Flip Vehicle')exitWith{[_unit] call fnc_flipVeh;};
		if(_click == 'Move In My Vehicle')exitWith{[_unit] call fnc_MoveInMyVehicle;};
		if(_click == 'Move In Target Vehicle')exitWith{[_unit] call fnc_MoveInTargetVehicle;};
		if(_click == 'Freeze')exitWith{[_unit,true] call fnc_freezeTarget;};
		if(_click == 'UnFreeze')exitWith{[_unit,false] call fnc_freezeTarget;};
		if(_click == 'Unconscious')exitWith{[_unit,true] call fnc_unconscious;};
		if(_click == 'Remove Unconscious')exitWith{[_unit,false] call fnc_unconscious;};
		if(_click == 'Spawn Zombie on Target Location!')exitWith{[_unit,true] call fnc_zombieOnTarget;};
		if(_click == 'Restrain')exitWith{[_unit,true] call fnc_restrainTarget;};
		if(_click == 'UnRestrain')exitWith{[_unit,false] call fnc_restrainTarget;};
		if(_click == 'Remove Gear')exitWith{[_unit] call fnc_RemoveGear;};
		if(_click == 'Eject')exitWith{[_unit] call fnc_EjectTargetVeh;};
		if(_click == 'Eject Crew')exitWith{[_unit] call fnc_EjectCrewTargetVeh;};
		if(_click == 'Force Disconnect')exitWith{[_unit] call fnc_Disconnect_selected;};
		if(_click == 'Kick (Silent)')exitWith{[_unit,0,0] call fnc_do_target;};
		if(_click == 'Kick (Announce)')exitWith{[_unit,0,1] call fnc_do_target;};
		if(_click == 'Ban (Silent)')exitWith{[_unit,1,0] call fnc_do_target;};
		if(_click == 'Ban (Announce)')exitWith{[_unit,1,1] call fnc_do_target;};
		if(_click == 'TempBan (Silent)')exitWith{[_unit,2,0] call fnc_do_target;};
		if(_click == 'TempBan (Announce)')exitWith{[_unit,2,1] call fnc_do_target;};
		if(_click in infiSTAR_CUSTOM_OnTarget)then
		{
			_id = infiSTAR_CUSTOM_OnTarget find _click;
			if!(_id isEqualTo -1)then
			{
				_unit call (missionNameSpace getVariable format['FNC_CUSTOM_ON_TARGET_%1',_id]);
			};
		};
	};
	
	_exitHere = false;
	{
		if(_click isEqualTo _x)exitWith{[_x,_forEachIndex] call fnc_create_Box;_exitHere=true;};
	} forEach allSupportBoxesNames;
	if(_exitHere)exitWith{true};
	
	_exitHere = false;
	{
		if(_click isEqualTo format['Create Billboard: %1',_x select 0])exitWith
		{
			_forEachIndex call fnc_createBillboard;
		};
	} forEach pathToCustomBillBoardTextures;
	if(_exitHere)exitWith{true};
	
	switch (_click) do {
		case '==== OnTarget ====':{if(isNil 'infiSTAR_add_OnTarget')then{infiSTAR_add_OnTarget = true;} else {infiSTAR_add_OnTarget = nil;};};
		case '==== Toggleable ====':{if(isNil 'infiSTAR_add_Toggleable')then{infiSTAR_add_Toggleable = true;} else {infiSTAR_add_Toggleable = nil;};};
		case '==== Base Deleter ====':{if(isNil 'infiSTAR_add_BaseDeleter')then{infiSTAR_add_BaseDeleter = true;} else {infiSTAR_add_BaseDeleter = nil;};};
		case '==== Custom Functions ====':{if(isNil 'infiSTAR_add_customFunctions')then{infiSTAR_add_customFunctions = true;} else {infiSTAR_add_customFunctions = nil;};};
		case '==== Vehicles ====':{if(isNil 'infiSTAR_add_vehicles')then{infiSTAR_add_vehicles = true;} else {infiSTAR_add_vehicles = nil;};};
		case 'clear ingame HackLog':{[0] call fnc_clearLogArray;_click call fnc_adminLog;[] call fnc_fill_HackLog;};
		case 'clear ingame AdminLog':{[1] call fnc_clearLogArray;_click call fnc_adminLog;[] call fnc_fill_AdminLog;};
		case 'BIS FreeRoam Cam (works with ESP)':{call fnc_BIS_FreeRoamCam;_click call fnc_adminLog;};
		case 'FreeRoam Cam (does not work with ESP)':{call fnc_FreeRoamCam;_click call fnc_adminLog;};
		case 'Day':{11 call fnc_changeTime;_click call fnc_adminLog;};
		case 'Night':{23 call fnc_changeTime;_click call fnc_adminLog;};
		case 'AdminConsole':{[] call fnc_workplace;};
		case 'DebugConsole':{[] spawn fnc_RscDisplayDebugPublic;};
		case 'Arsenal':{['Open',true] call BIS_fnc_arsenal;};
		case 'Arsenal (Mousewheel)':{ [] call fn_addArsenalAction; };
		case 'Copy Worldspace(coords) to RPT & Chat':{[] call fnc_worldspace;};
		case 'Mass Message':{[] call fnc_mass_message;};
		case 'Spawn Ammo':{[] call infiSTAR_A3addAmmo;};
		case 'Change ViewDistance':{[] call FN_CHANGE_VIEWDISTANCE;};
		case 'Self Disconnect':{_click call fnc_adminLog;(finddisplay 46) closeDisplay 0;};
	};
	if(_click in newAllItems_CATEGORY)then
	{
		_varstate = missionNameSpace getVariable (_click+'SHOW_STATE');
		if(isNil '_varstate')then
		{
			missionNameSpace setVariable[(_click+'SHOW_STATE'),true];
		}
		else
		{
			missionNameSpace setVariable[(_click+'SHOW_STATE'),nil];
		};
	};
	_class = lbData[RIGHT_SHIFT_ID,(lbCurSel RIGHT_SHIFT_ID)];
	if(_class in ALLC_ITEMS)exitWith
	{
		call fnc_GET_ITEM;
	};
	if(_class in ALL_VEHS_TO_SEARCH_C)exitWith
	{
		if!(('Spawn Vehicles' call ADMINLEVELACCESS) || ('Spawn Persistent Vehicles' call ADMINLEVELACCESS))exitWith{hint 'You are not allowed to spawn vehicles!';};
		
		_target = call fnc_get_selected_object;
		_position = AGLToASL (_target modelToWorld [0,10,0]);
		_dir = getDir (vehicle _target);
		
		if(BTN_SPAWN_VEH_SEL isEqualTo 0)then
		{
			_log = format['Spawning %1 infront of %2! (NonPersistent)',_click,_target call fnc_get_exileObjName];
			_log call FN_SHOW_LOG;
			[0,_class,_position,_dir,netId _target,false] call fnc_AdminReq;
			format['spawning %1 (NonPersistent)',_click] call fnc_adminLog;
		}
		else
		{
			_log = format['Spawning %1 infront of %2! (Persistent)',_click,_target call fnc_get_exileObjName];
			_log call FN_SHOW_LOG;
			[0,_class,_position,_dir,netId _target,true] spawn {
				disableSerialization;
				_array = _this;
				call ExileClient_gui_interactionMenu_unhook;
				ExileClientInteractionObject = player;
				_pincode = 4 call ExileClient_gui_keypadDialog_show;
				_array pushBack _pincode;
				_array call fnc_AdminReq;
			};
			format['spawning %1 (Persistent)',_click] call fnc_adminLog;
		};
	};
	if(_click == 'Login')then{if(isNil 'serverCommandLoginDone')then{serverCommandLoginDone = true;serverCommand ('#login '+passwordAdmin);};};
	if((_click find '#kick' > -1) || (_click find '#exec' > -1))then{serverCommand _click;};
	if((FILLMAINSTATE == 0)||(FILLMAINSTATE == 1))then{[] call fnc_fill_infiSTAR_MAIN;};
};
fnc_LBSelChanged_RIGHT = {
	_class = lbData[RIGHT_SHIFT_ID,(lbCurSel RIGHT_SHIFT_ID)];
	_cfg = call {
		if(isClass (configFile >> 'CfgWeapons' >> _class))exitWith{'CfgWeapons'};
		if(isClass (configFile >> 'CfgMagazines' >> _class))exitWith{'CfgMagazines'};
		if(isClass (configFile >> 'CfgVehicles' >> _class))exitWith{'CfgVehicles'};
		''
	};
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 8406);
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 8407);
	if(_cfg != '')then
	{
		_txt = gettext(configFile >> _cfg >> _class >> 'Library' >> 'libTextDesc');
		if(_txt isEqualTo '')then{_txt = 'by infiSTAR.de';};
		if(_cfg isEqualTo 'CfgVehicles')then
		{
			_salesPrice = getNumber(missionConfigFile >> 'CfgExileArsenal' >> _class >> 'price');
			if(_salesPrice isEqualTo 0)then{_salesPrice = 'unknown';}else{_salesPrice = format['%1 PopTabs',_salesPrice];};
			_vehicleConfig = configFile >> _cfg >> _class;
			_info = format['Capacity: %1 Armor: %2 Fuel: %3 MaxSpeed: %4 Price: %5',getNumber(_vehicleConfig>>'maximumLoad'),getNumber(_vehicleConfig>>'armor'),getNumber(_vehicleConfig>>'fuelCapacity'),getNumber(_vehicleConfig>>'maxSpeed'),_salesPrice];
			_log = format['Class: %1 %2',_class,_info];
			_txt=(_info+'<br/>'+_txt);
		};
		_ctrlText = '<t align=''center'' size=''0.85''>'+_txt+' </t>';
		_pic = (getText (configFile >> _cfg >> _class >> 'picture'));
		if(_pic call fn_STAR_validpic)then
		{
			_ctrlText = _ctrlText + '<br/><img align=''center'' size=''3.5'' image='''+_pic+'''/>';
		};
		_ctrl = [findDisplay MAIN_DISPLAY_ID,'RscStructuredText',8406] call fnc_createctrl;
		_ctrl ctrlSetPosition [1.05,0.355 * safezoneH + safezoneY,0.65,0.5];
		_ctrl ctrlSetBackgroundColor [0,0,0,0.6];
		_ctrl ctrlCommit 0;
		_ctrl ctrlSetStructuredText parseText _ctrlText;
		
		_ctrl = [findDisplay MAIN_DISPLAY_ID,'RSCEdit',8407] call fnc_createctrl;
		_ctrl ctrlSetPosition [0.59,safezoneY + safezoneH - 0.06,count _class / 100,0.05];
		_ctrl ctrlSetPosition [1.05,(0.355 * safezoneH + safezoneY)-0.05,0.65,0.05];
		_ctrl ctrlSetBackgroundColor [0,0,0,0.6];
		_ctrl ctrlCommit 0;
		_ctrl ctrlSetText _class;
	};
};
fnc_getConfig = {
	_cfg = '';
	if(isClass (configFile >> 'CfgWeapons' >> _this))then
	{
		_cfg = 'CfgWeapons';
	}
	else
	{
		if(isClass (configFile >> 'CfgMagazines' >> _this))then
		{
			_cfg = 'CfgMagazines';
		}
		else
		{
			if(isClass (configFile >> 'CfgVehicles' >> _this))then
			{
				_cfg = 'CfgVehicles';
			};
		};
	};
	_cfg
};
admin_showGear = {
	if(!isNull cameraOn)then
	{
		if(!isNil'show_gear_thread')then{terminate show_gear_thread;show_gear_thread=nil;};
		show_gear_thread = [] spawn {
			waitUntil {closeDialog 0;!dialog};
			createGearDialog [cameraOn,'RscDisplayInventory'];
		};
		_log = format['Showing Gear of %1',cameraOn call fnc_get_exileObjName];
		_log call FN_SHOW_LOG;
	};
};
fnc_endSpectate = {
	if(!isNil'SPECTATE_THREAD')then{terminate SPECTATE_THREAD;SPECTATE_THREAD=nil;};
	(vehicle player) switchCamera cameraView;
	ctrlDelete ((findDisplay 46) displayCtrl 3025);
	if(cameraOn isEqualTo (vehicle player))exitWith{};
	_log = 'Finished spectating.';
	_log call FN_SHOW_LOG;
};
fnc_beginspectate = {
	if(!isNil'SPECTATE_THREAD')then{terminate SPECTATE_THREAD;SPECTATE_THREAD=nil;};
	SPECTATE_THREAD = _this spawn {
		disableSerialization;
		_log = 'Spectating - Press F9 to see Inventory.';
		_log call FN_SHOW_LOG;
		_log = 'Spectating - Press SHIFT + F9 to hide/show overlay.';
		_log call FN_SHOW_LOG;
		_log = 'Spectating - Press F10 to exit stop spectating.';
		_log call FN_SHOW_LOG;
		_unit = _this;
		_ctrl = [findDisplay 46,'RscStructuredText',3025] call fnc_createctrl;
		_ctrl ctrlSetPosition [safezoneX+0.2,safezoneY+0.405,1,1];
		_ctrl ctrlCommit 0;
		while {true} do
		{
			if(isNil'_unit')exitWith{call fnc_endspectate;};
			if(isNull _unit)exitWith{call fnc_endspectate;};
			_uid = getPlayerUID _unit;
			if(_uid isEqualTo '')exitWith{call fnc_endspectate;};
			_veh = vehicle _unit;
			if(str _veh != str cameraOn)then
			{
				player reveal _unit;
				player reveal _veh;
				_veh switchCamera cameraView;
				format['SPECTATE - switchedCamera on %1(%2)',_unit call fnc_get_exileObjName,_uid] call fnc_adminLog;
			};
			if(show_spectate_overlay)then
			{
				_log = format['%1 (%2) @%3',_unit call fnc_get_exileObjName,_uid,mapGridPosition _veh];
				_ctrlText = '<t align=''left'' size=''1.1'' color=''#238701''>'+_log+'</t>';
				
				_moneyP = _unit getVariable ['ExileMoney', 0];
				_moneyP = if(_moneyP > 1000)then{format['%1K',_moneyP / 1000]}else{_moneyP};
				
				_moneyB = _unit getVariable ['ExileLocker', 0];
				_moneyB = if(_moneyB > 1000)then{format['%1K',_moneyB / 1000]}else{_moneyB};
				
				_respect = _unit getVariable ['ExileScore', 0];
				_log2 = format['Health: %1  Cash: %2  Bank: %3  Respect: %4',(1-(damage _unit))*100,_moneyP,_moneyB,_respect];
				_ctrlText = _ctrlText + '<br/><t align=''left'' size=''1.1'' color=''#238701''>'+_log2+'</t>';
				
				_cwep = '';
				_cammo = '';
				_cmags = '';
				_wpnstate = weaponState _unit;
				if(!isNil '_wpnstate')then
				{
					if(str _wpnstate != '[]')then
					{
						_cwep = _wpnstate select 0;
						_cmags = {_wpnstate select 3 == _x} count magazines _unit;
						_cammo = _wpnstate select 4;
					};
				};
				if(_cwep == '')then
				{
					_ctrlText = _ctrlText + '<br/><t align=''left'' size=''1.1'' color=''#238701''>Bare Fists</t>';
				}
				else
				{
					_type = _cwep;
					_cfg = _type call fnc_getConfig;
					_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
					_pic = getText (configFile >> _cfg >> _type >> 'picture');
					_log3 = format[' %1 [%2] (%3/%4)',_displayName,_cwep,_cammo,_cmags];					
					_ctrlText = _ctrlText + '<br/><img image='''+_pic+''' align=''left'' size=''1.1''/><t align=''left'' size=''1.1'' color=''#238701''>'+_log3+'</t>';
					
					if(_veh != _unit)then
					{
						_cwepsV = [];
						{
							if(_x find 'Horn' == -1)then
							{
								_cwepsV pushBack _x;
							};
						} forEach (weapons _veh);
						
						if(count _cwepsV > 0)then
						{
							_YPOS = safezoneY+0.355;
							
							{
								_cwep = _x;
								_cammo = _veh ammo _cwep;
								_cmags = {currentMagazine _veh == _x} count magazines _veh;
								
								_type = _cwep;
								_cfg = _type call fnc_getConfig;
								_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
								
								_log3a = format[' %1 [%2] (%3/%4)',_displayName,_cwep,_cammo,_cmags];
								_ctrlText = _ctrlText + '<br/><t align=''left'' size=''1.1'' color=''#A90F68''>'+_log3a+'</t>';
								_YPOS = _YPOS - 0.03;
							} forEach _cwepsV;
						};
					};
				};
				
				_ct = cursorTarget;
				if(!isNull _ct)then
				{
					if(getPlayerUID _ct != '')then
					{
						_cwep_ct = currentWeapon _ct;
						_cammo_ct = _ct ammo _cwep_ct;
						_cmags_ct = {currentMagazine _ct == _x} count magazines _ct;
						
						_log4 = format['%1 (%2) @%3',_ct call fnc_get_exileObjName,getPlayerUID _ct,mapGridPosition _ct];
						_ctrlText = _ctrlText + '<br/><t align=''left'' size=''1.1'' color=''#B80B36''>'+_log4+'</t>';
						
						_log5 = format['Health: %1  Distance: %2m',(1-(damage _ct))*100,round(cameraOn distance _ct)];
						_ctrlText = _ctrlText + '<br/><t align=''left'' size=''1.1'' color=''#B80B36''>'+_log5+'</t>';
						
						_type = _cwep_ct;
						_cfg = _type call fnc_getConfig;
						_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
						_pic = getText (configFile >> _cfg >> _type >> 'picture');
						_log6 = format[' %1 [%2] (%3/%4)',_displayName,_cwep_ct,_cammo_ct,_cmags_ct];
						_ctrlText = _ctrlText + '<br/><img image='''+_pic+''' align=''left'' size=''1.1''/><br/><t align=''left'' size=''1.1'' color=''#B80B36''>'+_log6+'</t>';
					}
					else
					{
						_type = typeOf _ct;
						_cfg = _type call fnc_getConfig;
						_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
						_log4 = format['%1 [%2] @%3',_displayName,_type,mapGridPosition _ct];
						_ctrlText = _ctrlText + '<br/><t align=''left'' size=''1.1'' color=''#B80B36''>'+_log4+'</t>';
						
						_log5 = format['Health: %1 - Distance: %2m',(1-(damage _ct))*100,round(cameraOn distance _ct)];
						_ctrlText = _ctrlText + '<br/><t align=''left'' size=''1.1'' color=''#B80B36''>'+_log5+'</t>';
					};
					
					_vehCT = vehicle _ct;
					if((_vehCT isKindOf 'LandVehicle') || (_vehCT isKindOf 'Air') || (_vehCT isKindOf 'Ship') || (_vehCT isKindOf 'Static'))then
					{
						_cwepsV = [];
						{
							if(_x find 'Horn' == -1)then
							{
								_cwepsV pushBack _x;
							};
						} forEach (weapons _vehCT);
						
						if(count _cwepsV > 0)then
						{
							_YPOS = safezoneY+0.655;
							
							{
								_cwep = _x;
								_cammo = _vehCT ammo _cwep;
								_cmags = {currentMagazine _vehCT == _x} count magazines _vehCT;
								
								_type = _cwep;
								_cfg = _type call fnc_getConfig;
								_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
								
								_log6a = format[' %1 [%2] (%3/%4)',_displayName,_cwep,_cammo,_cmags];
								_ctrlText = _ctrlText + '<br/><t align=''left'' size=''1.1'' color=''#A90F68''>'+_log6a+'</t>';
								_YPOS = _YPOS + 0.03;
							} forEach _cwepsV;
						};
					};
				};
				_ctrl ctrlSetStructuredText parseText _ctrlText;
			}
			else
			{
				_ctrl ctrlSetStructuredText parseText '';
			};
			uiSleep .15;
		};
	};
};
fnc_clearLogArray = {
	[-668,_this select 0] call fnc_AdminReq;
	_log = 'ingame Log(s) cleared!';
	_log call FN_SHOW_LOG;
	[] call fnc_FULLinit;
};
fnc_getSteamName = {
	[9876,getPlayerUID (_this select 0)] call fnc_AdminReq;
	_log = format['Requested Steam Name of %1(%2)',(_this select 0) call fnc_get_exileObjName,getPlayerUID (_this select 0)];
	_log call FN_SHOW_LOG;
};
fnc_TP2ME = {
	_unit = _this select 0;
	_pos = player modelToWorld [0,12,0];
	if(_unit isEqualTo vehicle _unit)then{_pos = player modelToWorld [0,1,0];};
	[1,netId _unit,_pos] call fnc_AdminReq;
	
	_log = format['Teleported %1 to you',_unit call fnc_get_exileObjName];
	_log call FN_SHOW_LOG;
};
fnc_TPME2 = {
	_unit = _this select 0;
	_unit = vehicle _unit;
	_object = vehicle player;
	prevLoc = getPosATL _object;
	_distance = -1;if!(_object isEqualTo player)then{_distance = -5;};
	_pos = _unit modelToWorldVisual [0,_distance,0];
	if(local _object)then
	{
		_object setPosATL _pos;
	}
	else
	{
		[1,netId player,_pos] call fnc_AdminReq;
	};
	_log = format['Teleported to %1 - press BACKSPACE to revert teleport',_unit call fnc_get_exileObjName];
	_log call FN_SHOW_LOG;
};
fnc_MoveInMyVehicle = {
	_unit = _this select 0;
	_unit moveInAny (vehicle player);
};
fnc_MoveInTargetVehicle = {
	_unit = _this select 0;
	player moveInAny (vehicle _unit);
};
fnc_EjectTargetVeh = {
	_unit = _this select 0;
	moveOut _unit;
	unassignVehicle _unit;
	_unit action ['eject', (vehicle _unit)];
};
fnc_EjectCrewTargetVeh = {
	_unit = _this select 0;
	_veh = (vehicle _unit);
	_uids = [];
	{
		moveOut _x;
		unassignVehicle _x;
		_x action ['eject', _veh];
		_uids pushBack (getPlayerUID _x)
	} forEach (crew _veh);
};
fnc_RemoveGear = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(!isNull _target)then
	{
		[11,netId _target] call fnc_AdminReq;
		
		_log = format['Removed Gear of %1!',_target call fnc_get_exileObjName];
		_log call FN_SHOW_LOG;
	};
};
fnc_worldspace = {
	disableSerialization;
	_name = cameraOn call fnc_get_exileObjName;
	_puid = getPlayerUID cameraOn;
	_dir = getDir cameraOn;
	_pos = getPosATL cameraOn;
	_worldspace = format['[%1,%2]',_dir,_pos];
	_log = format['Worldspace of %1(%2): %3',_name,_puid,_worldspace];
	systemChat format['%1 - saved to RPT',_log];
	diag_log [_log,'PLAIN DOWN'];
	if(isNull (findDisplay 24))then{(findDisplay 46) createDisplay 'RscDisplayChat';};
	_display = (findDisplay 24);
	_chat = _display displayCtrl 101;
	_chat ctrlSetText _worldspace;
	_log call fnc_adminLog;
};
fnc_mass_message = {
	disableSerialization;
	_display = findDisplay 24;
	if(isNull _display)exitWith
	{
		_log = 'open your chat, type a message and start this function again!';
		_log call FN_SHOW_LOG;
		systemchat _log;
	};
	_chat = _display displayCtrl 101;
	_msg = ctrlText _chat;
	(_display) closeDisplay 0;
	[7,toArray _msg] call fnc_AdminReq;
	format['Mass Message: %1',_msg] call fnc_adminLog;
	
	_log = 'message sent!';
	_log call FN_SHOW_LOG;
};
fnc_changeTime = {
	[17,_this] call fnc_AdminReq;
	_log = format['changed time to hour: %1',_this];
	_log call FN_SHOW_LOG;
};
fnc_get_addvalue = {
	disableSerialization;
	_display = findDisplay MAIN_DISPLAY_ID;
	
	_ctrl = [_display,'IGUIBack',77764] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.6,
		0-(0.033 * safezoneH),
		0.7,
		0.099 * safezoneH
	];
	_ctrl ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	_ctrl ctrlCommit 0;
	
	_ctrl = [_display,'RscEdit',77769] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.6,
		0,
		0.7,
		0.033 * safezoneH
	];
	ctrlSetFocus _ctrl;
	_ctrl ctrlCommit 0;
	
	fnc_ButtonClick_77766 = {
		_txt = ctrlText 77769;
		if(_txt != '')then
		{
			fnc_get_addvalue_VALUE = (parseNumber _txt);
			ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77764);
			ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77769);
			ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77766);
			ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77765);
		};
	};
	
	_ctrl = [_display,'RSCButton',77766] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.8,
		0.033 * safezoneH,
		0.3,
		0.033 * safezoneH
	];
	_ctrl ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_77766'];
	
	fnc_get_addvalue_VALUE = nil;
	_ctrl = [_display,'RscText',77765] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.6,
		0-(0.033 * safezoneH),
		0.7,
		0.033 * safezoneH
	];
	waitUntil {
		_curval = 0;
		_curname = call {
			if(_this isEqualTo 0)exitWith{_curval = SELECTED_TARGET_PLAYER getVariable ['ExileMoney', 0];'Money on player'};
			if(_this isEqualTo 1)exitWith{_curval = SELECTED_TARGET_PLAYER getVariable ['ExileLocker', 0];'Money on bank'};
			if(_this isEqualTo 2)exitWith{_curval = SELECTED_TARGET_PLAYER getVariable ['ExileScore', 0];'Respect'};
		};
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77766) ctrlSetText format['+/- %1',_curname];
		_addval = parseNumber(ctrlText 77769);
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77766) ctrlEnable true;
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77766) ctrlCommit 0;
		ctrlSetFocus ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77769);
		
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77765) ctrlSetText format['Current %1: %2 - after change: %3',_curname,_curval,_curval + _addval];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77765) ctrlCommit 0;
		
		!isNil 'fnc_get_addvalue_VALUE' || 
		isNull (findDisplay MAIN_DISPLAY_ID displayCtrl 77769)
	};
	if(isNil 'fnc_get_addvalue_VALUE')exitWith{0};
	fnc_get_addvalue_VALUE
};
fnc_ExileMoneyRespectChange = {
	_target = _this select 0;
	_option = _this select 1;
	if(typeName _target != 'OBJECT')exitWith
	{
		_log = 'Target is not an Object!';
		_log call FN_SHOW_LOG;
	};
	if!(isPlayer _target)exitWith
	{
		_log = 'Target is not a Player!';
		_log call FN_SHOW_LOG;
	};
	_value = _option call fnc_get_addvalue;
	if(_value isEqualTo 0)exitWith{systemChat 'WHY WOULD YOU WANT TO ADD OR REMOVE 0 POP-TABS..?';};
	
	_nameit = _option call {
		if(_this isEqualTo 0)exitWith{'Money to player'};
		if(_this isEqualTo 1)exitWith{'Money to bank of player'};
		if(_this isEqualTo 2)exitWith{'Respect to'};
		'ERROR'
	};
	if(_nameit isEqualTo 'ERROR')exitWith{systemChat 'ERROR';};
	
	_log = format['%1 %2 %3 %4',if(_value < 0)then{'Removed'}else{'Added'},_nameit,_value,_target call fnc_get_exileObjName];
	[12001 + _option,netId _target,_value] call fnc_AdminReq;
	_log call FN_SHOW_LOG;
	(_log+'('+getPlayerUID _target+')') call fnc_adminLog;
};
fnc_freezeTarget = {
	_target = _this select 0;
	_value = _this select 1;
	if(typeName _target != 'OBJECT')exitWith
	{
		_log = 'Target is not an Object!';
		_log call FN_SHOW_LOG;
	};
	if!(isPlayer _target)exitWith
	{
		_log = 'Target is not a Player!';
		_log call FN_SHOW_LOG;
	};
	[13,netId _target,_value] call fnc_AdminReq;
	_log = format['UnFroze %1!',_target call fnc_get_exileObjName];
	if(_value)then{_log = format['Froze %1!',_target call fnc_get_exileObjName];};
	_log call FN_SHOW_LOG;
};
fnc_unconscious = {
	_target = _this select 0;
	_value = _this select 1;
	if(typeName _target != 'OBJECT')exitWith
	{
		_log = 'Target is not an Object!';
		_log call FN_SHOW_LOG;
	};
	if!(isPlayer _target)exitWith
	{
		_log = 'Target is not a Player!';
		_log call FN_SHOW_LOG;
	};
	[18,netId _target,_value] call fnc_AdminReq;
	_log = format['Removed unconscious from %1!',_target call fnc_get_exileObjName];
	if(_value)then{_log = format['Put %1 unconscious!',_target call fnc_get_exileObjName];};
	_log call FN_SHOW_LOG;
};
fnc_zombieOnTarget = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')exitWith
	{
		_log = 'Target is not an Object!';
		_log call FN_SHOW_LOG;
	};
	if!(isPlayer _target)exitWith
	{
		_log = 'Target is not a Player!';
		_log call FN_SHOW_LOG;
	};
	[12,_target] call fnc_AdminReq;
	_log = format['Spawned Zombie on %1!',_target call fnc_get_exileObjName];
	_log call FN_SHOW_LOG;
};
fnc_restrainTarget = {
	_target = _this select 0;
	_value = _this select 1;
	if(typeName _target != 'OBJECT')exitWith
	{
		_log = 'Target is not an Object!';
		_log call FN_SHOW_LOG;
	};
	if!(isPlayer _target)exitWith
	{
		_log = 'Target is not a Player!';
		_log call FN_SHOW_LOG;
	};
	[15,netId _target,netId player,_value] call fnc_AdminReq;
	_log = format['UnRestrained %1!',_target call fnc_get_exileObjName];
	if(_value)then{_log = format['Restrained %1!',_target call fnc_get_exileObjName];};
	_log call FN_SHOW_LOG;
};
fnc_create_Box = {
	private['_boxname','_select','_target'];
	_boxname = _this select 0;
	_select = _this select 1;
	_target = call fnc_get_selected_object;
	[5000,netId _target,_select] call fnc_AdminReq;
	_log = format['%1 created for %2(%3)!',_boxname,_target call fnc_get_exileObjName,getPlayerUID _target];
	_log call FN_SHOW_LOG;
	_log call fnc_adminLog;
};
admin_showinfo_catch = {
	{player reveal _x;} foreach (cameraOn nearObjects 50);
	if(!isNil'delete_old_show_thread')then{terminate delete_old_show_thread;delete_old_show_thread=nil;};
	delete_old_show_thread = _this spawn {
		disableSerialization;
		params['_obj','_pin','_ownername','_owneruid'];
		
		
		_buildRightsUids = [];
		_nearestFlags = nearestObjects [_obj, ['Exile_Construction_Flag_Static'], 150];
		if!(_nearestFlags isEqualTo [])then
		{
			{
				_flag = _x;
				_radius = _flag getVariable ['ExileTerritorySize', -1];
				if((_obj distance _flag) < _radius)exitWith
				{
					_buildRightsUids append (_flag getVariable ['ExileTerritoryBuildRights', []]);
				};
			} forEach _nearestFlags; 
		};
		
		
		if!(_pin isEqualTo '')then{_obj setVariable ['ExileAlreadyKnownCode',_pin];};
		_timer = diag_tickTime + 20;
		while {_timer > diag_tickTime} do
		{
			_pinshown = _pin;
			if(_pinshown isEqualTo '')then
			{
				_pinshown = 'none';
			};
			_locked = locked _obj isEqualTo 2;
			_ExileIsLocked = _obj getVariable ['ExileIsLocked', 1] isEqualTo -1;
			_color = if(_locked || _ExileIsLocked)then{'#FF0000'}else{'#00FF00'};
			_inject = '</t><t align=''left'' size=''.9'' color='+str _color+' shadow=''1'' shadowColor=''#000000''>';
			_pinshown = format['%1 %2',_pinshown,if(_locked || _ExileIsLocked)then{_inject+'(LOCKED)'}else{_inject+'(UNLOCKED)'}];
			
			_ownedby = 'server';
			if!(_owneruid isEqualTo '')then
			{
				_isOnline = if({_owneruid isEqualTo (getPlayerUID _x)} count (call fnc_get_plr) > 0)then{true}else{false};
				_color = if(_isOnline)then{'#00FF00'}else{'#FF0000'};
				_inject = '</t><t align=''left'' size=''.9'' color='+str _color+' shadow=''1'' shadowColor=''#000000''>';
				_ownedby = format['%1 (%2) %3',_ownername,_owneruid,if(_isOnline)then{_inject+'(ONLINE)'}else{_inject+'(OFFLINE)'}];
			};
			
			
			_addstring = '';
			if!(_buildRightsUids isEqualTo [])then
			{
				_addstring = '<br/><t align=''left'' size=''.9'' color=''#44CD00'' shadow=''1'' shadowColor=''#000000''>buildrights: </t><br/>';
				{
					_xuid = _x;
					_xname = 'Unknown';
					
					_isOnline = false;
					_color = '#FF0000';
					
					{
						if(getPlayerUID _x isEqualTo _xuid)exitWith
						{
							_xname = _x call fnc_get_exileObjName;
							_isOnline = true;
							_color = '#00FF00';
						};
					} forEach (call fnc_get_plr);
					
					_inject = '</t><t size=''.9'' color='+str _color+' shadow=''1'' shadowColor=''#000000''>';
					_xstate = format['%1 (%2) %3',_xname,_xuid,if(_isOnline)then{_inject+'(ONLINE)'}else{_inject+'(OFFLINE)'}];
					_addstring = _addstring + format['<t size=''.9'' color=''#5FBEDE'' shadow=''1'' shadowColor=''#000000''> %1</t><br/>',_xstate];
				} forEach _buildRightsUids;
			};
			
			_pos = getPosATL _obj;
			_type = typeOf _obj;
			_health = format['%1%2',ceil((1-(damage _obj))*100),'%'];
			
			_ctrl = [findDisplay 46,'RscStructuredText',5555314] call fnc_createctrl;
			_ctrl ctrlSetPosition [safeZoneX + safeZoneW - 0.6,safeZoneY + 0.075,0.6,(0.4)+(((count _buildRightsUids)+1)/40)];
			_ctrl ctrlSetBackgroundColor[0,0,0,0.4];
			_ctrl ctrlCommit 0;
			_txt = format['
				<t align=''left'' size=''.9'' color=''#44CD00'' shadow=''1'' shadowColor=''#000000''>type: </t><t align=''left'' size=''.9'' color=''#5FBEDE'' shadow=''1'' shadowColor=''#000000''> %1</t><br/>
				<t align=''left'' size=''.9'' color=''#44CD00'' shadow=''1'' shadowColor=''#000000''>code: </t><t align=''left'' size=''.9'' color=''#5FBEDE'' shadow=''1'' shadowColor=''#000000''> %2</t><br/>
				<t align=''left'' size=''.9'' color=''#44CD00'' shadow=''1'' shadowColor=''#000000''>owner: </t><t align=''left'' size=''.9'' color=''#5FBEDE'' shadow=''1'' shadowColor=''#000000''> %3</t><br/>
				<t align=''left'' size=''.9'' color=''#44CD00'' shadow=''1'' shadowColor=''#000000''>direction: </t><t align=''left'' size=''.9'' color=''#5FBEDE'' shadow=''1'' shadowColor=''#000000''> %4</t><br/>
				<t align=''left'' size=''.9'' color=''#44CD00'' shadow=''1'' shadowColor=''#000000''>position: </t><t align=''left'' size=''.9'' color=''#5FBEDE'' shadow=''1'' shadowColor=''#000000''> %5</t><br/>
				<t align=''left'' size=''.9'' color=''#44CD00'' shadow=''1'' shadowColor=''#000000''>grid: </t><t align=''left'' size=''.9'' color=''#5FBEDE'' shadow=''1'' shadowColor=''#000000''> %6</t><br/>
				<t align=''left'' size=''.9'' color=''#44CD00'' shadow=''1'' shadowColor=''#000000''>health: </t><t align=''left'' size=''.9'' color=''#5FBEDE'' shadow=''1'' shadowColor=''#000000''> %7</t><br/>
			',
				_type,
				_pinshown,
				_ownedby,
				getDir _obj,
				_pos,
				mapGridPosition _pos,
				_health
			];
			_finalstring = _txt + _addstring;
			_ctrl ctrlSetStructuredText parseText _finalstring;
			uiSleep 0.1;
		};
		ctrlDelete ((findDisplay 46) displayCtrl 5555314);
	};
};
admin_showinfo = {
	{player reveal _x;} foreach ((screenToWorld [0.5,0.5]) nearObjects 50);
	{player reveal _x;} foreach (cameraOn nearObjects 50);
	_obj = cursortarget;
	if(!isNull _obj)then
	{
		[14,netId _obj] call fnc_AdminReq;
		_log = format['used showinfo on: %1 @%2',typeOf _obj,mapGridPosition _obj];
		_log call fnc_adminLog;
	};
};
fnc_infiSTAR_A3cargod = {
	if(isNil 'A3carGodRun')then
	{
		MY_VEHICLES = [];
		_code = {
			_obj = cameraOn;
			if(local _obj)then
			{
				if(_obj isKindOf 'Man')then
				{
					if!(MY_VEHICLES isEqualTo [])then
					{
						{_x removeAllEventhandlers 'HandleDamage';_x allowDamage true;} forEach MY_VEHICLES;
						MY_VEHICLES = [];
					};
				}
				else
				{
					MY_VEHICLES pushBackUnique _obj;
					_obj allowDamage false;
					_obj removeAllEventhandlers 'HandleDamage';
					_obj addEventHandler['HandleDamage',{false}];
				};
			};
		};
		A3carGodRun = [0.1, _code, [], true] call ExileClient_system_thread_addtask;
	}
	else
	{
		[A3carGodRun] call ExileClient_system_thread_removeTask;A3carGodRun=nil;
		{_x removeAllEventhandlers 'HandleDamage';_x allowDamage true;} forEach MY_VEHICLES;
	};
};
fnc_LowerTerrain = {
	if(isNil 'admin_terrain')then{admin_terrain = true;} else {admin_terrain = !admin_terrain};
	if(admin_terrain)then{
		setTerrainGrid 50;
	}
	else
	{
		setTerrainGrid 25;
	};
};
fnc_infiSTAR_A3UnlAmmo = {
	if(isNil'lastMagazineUNLAMMO')then{lastMagazineUNLAMMO = '';};
	if(isNil 'unlimAmmRun')then
	{
		_code = {
			private['_secondaryWeapon','_muzzle','_vehicle','_turretPath','_mags','_magArray','_magazineClass'];
			_secondaryWeapon = secondaryWeapon player;
			_muzzle = currentWeapon player;
			_vehicle = vehicle player;
			if(player isEqualTo _vehicle)then
			{
				if(_muzzle isEqualTo _secondaryWeapon)then
				{
					if!(_secondaryWeapon isEqualTo '')then
					{
						_curmag = currentMagazine player;
						if!(_curmag isEqualTo '')then
						{
							if!(_curmag isEqualTo lastMagazineUNLAMMO)then
							{
								lastMagazineUNLAMMO = _curmag;
							};
						};
						if!(lastMagazineUNLAMMO isEqualTo '')then
						{
							_magArray = getArray(configFile >> 'CfgWeapons' >> _secondaryWeapon >> 'magazines');
							if(lastMagazineUNLAMMO in _magArray)then
							{
								if(player ammo _secondaryWeapon isEqualTo 0)then
								{
									player addSecondaryWeaponItem lastMagazineUNLAMMO;
									if({lastMagazineUNLAMMO == _x} count (magazines player) < 2)then
									{
										player addMagazine lastMagazineUNLAMMO;
									};
								};
							};
						};
					};
				}
				else
				{
					_vehicle setAmmo [_muzzle,999];
				};
			}
			else
			{
				_assignedVehicleRole = assignedVehicleRole player;
				if((_assignedVehicleRole select 0) isEqualTo 'Turret')then
				{
					_turretPath = _assignedVehicleRole select 1;
					_mags = _vehicle magazinesTurret _turretPath;
					if(_mags isEqualTo [''])then
					{
						_magArray = getArray(configFile >> 'CfgWeapons' >> _muzzle >> 'magazines');
						
						{
							_vehicle addMagazineTurret [_x,_turretPath];
							systemChat format['Added %1 to your Turret!',_x];
						} forEach _magArray;
					}
					else
					{
						_magazineClass = _vehicle currentMagazineTurret _turretPath;
						_vehicle setMagazineTurretAmmo [_magazineClass,999,_turretPath];
					};
				};
			};
			_vehicle setVehicleAmmo 1;
		};
		unlimAmmRun = [0.1, _code, [], true] call ExileClient_system_thread_addtask;
	}
	else
	{
		[unlimAmmRun] call ExileClient_system_thread_removeTask;unlimAmmRun=nil;
	};
};
fnc_infiSTAR_A3noRecoil = {
	if(isNil 'noRecoilRun')then
	{
		_code = {
			(vehicle player) setUnitRecoilCoefficient 0;
			player setUnitRecoilCoefficient 0;
			player setCustomAimCoef 0;
		};
		noRecoilRun = [1, _code, [], true] call ExileClient_system_thread_addtask;
	}
	else
	{
		[noRecoilRun] call ExileClient_system_thread_removeTask;noRecoilRun=nil;
		(vehicle player) setUnitRecoilCoefficient 1;
		player setUnitRecoilCoefficient 1;
	};
};
fnc_infiSTAR_A3FF = {
	if(isNil 'A3FFrun')then
	{
		_code = {
			_muzzle = currentWeapon player;
			if(_muzzle isEqualType '')then
			{
				(vehicle player) setWeaponReloadingTime [player, _muzzle, 0];
			};
		};
		A3FFrun = [0.1, _code, [], true] call ExileClient_system_thread_addtask;
	}
	else
	{
		[A3FFrun] call ExileClient_system_thread_removeTask;A3FFrun=nil;
	};
};
fnc_infiSTARHIDE = {
	if(isNil 'A3HIDErun')then
	{
		_code = {if(!isObjectHidden player)then{[2,true] call fnc_AdminReq;};};
		A3HIDErun = [1, _code, [], true] call ExileClient_system_thread_addtask;
	}
	else
	{
		[A3HIDErun] call ExileClient_system_thread_removeTask;A3HIDErun=nil;
		[2,false] call fnc_AdminReq;
	};
};
fnc_DisableAnnouncements = {
	if(isNil 'A3DANNrun')then{A3DANNrun = 0;};
	if(A3DANNrun==0)then
	{
		A3DANNrun=1;
		AdminAnnounceDisabled = true;
	}
	else
	{
		A3DANNrun=0;
		AdminAnnounceDisabled = nil;
	};
};
fnc_FreeRoamCam = {
	if(isNil 'freeFlightCam')then
	{
		camDestroy freeFlightCam;
		freeFlightCam = nil;
		_getPos = player modelToWorld[0,3, 1.75];
		freeFlightCam = 'camera' camCreate _getPos;
		freeFlightCam setDir([_getPos, player] call BIS_fnc_dirTo);
		freeFlightCam camCommand 'MANUAL ON';
		freeFlightCam camCommand 'INERTIA OFF';
		freeFlightCam cameraEffect['INTERNAL', 'BACK'];
		showCinemaBorder false;
		_log = 'Right Click To Cancel!';
		_log call FN_SHOW_LOG;
	}
	else
	{
		camDestroy freeFlightCam;
		freeFlightCam = nil;
	};
};
fnc_BIS_FreeRoamCam = {
	if(!isNil'camerathread')then{terminate camerathread;camerathread=nil;};
	camerathread = [] spawn (uinamespace getvariable 'bis_fnc_camera');
};
fnc_createBillboard = {
	_textureid = _this;
	_selected = pathToCustomBillBoardTextures select _textureid;
	_name = _selected select 0;
	_texture = _selected select 1;
	_dir = getDir player + 90;
	_location = player modelToWorld [0,5,0];
	
	[4,_texture,_textureid,_dir,_location] call fnc_AdminReq;
	
	_log = format['Billoard %1 created!',_name];
	_log call FN_SHOW_LOG;
	_log call fnc_adminLog;
};
fnc_deleteVeh_selected = {
	{player reveal _x;} foreach (cameraOn nearObjects 50);
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then{_target = cursorTarget;};
	if(isNull _target)then{_target = cursorObject;};
	if(!isNull _target)then
	{
		if(isPlayer _target && vehicle _target isKindOf 'Man')exitWith{systemChat '<infiSTAR.de> can not delete a player..';};
		
		_delete = (vehicle _target);
		
		if(isNil 'DELETE_TARGET')then{DELETE_TARGET = objNull;};
		if(str DELETE_TARGET != str _delete)exitWith
		{
			_type = typeOf _delete;
			_distance = round(cameraOn distance _delete);
			
			
			if(_type isEqualTo '')then{
				_type = _delete;
			}
			else
			{
				_displayName = gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName');
				_type = format['%1(%2)',_type,_displayName];
			};
			_log = format['DELETE:   %1   distance %2m?  (press continue and delete again)',_type,_distance];
			
			
			_log call FN_SHOW_LOG;
			DELETE_TARGET = _delete;
		};
		
		if(isNil 'ToDeleteArray')then{ToDeleteArray = [];};
		if(_delete in ToDeleteArray)then
		{
			_log = format['%1 - IN DELETE QUEUE',_delete];
			_log call FN_SHOW_LOG;
		}
		else
		{
			_netId = netId _delete;
			if(_netId isEqualTo '0:0')then
			{
				deleteVehicle _delete;
			}
			else
			{
				ToDeleteArray pushBack _delete;
				[-4,netId _delete] call fnc_AdminReq;
			};
			
			_log = format['Deleting %1 @%2..',typeOf _delete,mapGridPosition _delete];
			if(getPlayerUID _target != '')then
			{
				_log = format['Deleting %1(%2) vehicle: %3 @%4..',_target call fnc_get_exileObjName,getPlayerUID _target,typeOf _delete,mapGridPosition _delete];
			};
			_log call FN_SHOW_LOG;
			systemchat _log;
			diag_log _log;
			_log call fnc_adminLog;
		};
	}
	else
	{
		DELETE_TARGET = objNull;
	};
};
fnc_flipVeh = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(isNull _target)then{_target = cursorObject;};
	_target = vehicle _target;
	if((!isNull _target) && {alive _target} && {_target isKindOf 'Landvehicle' || _target isKindOf 'Air' || _target isKindOf 'Ship'})then
	{
		if(local _target)then
		{
			_pos = getPos _target;
			_pos set[2,(_pos select 2)+2];
			_target setPos _pos;
			_target setVectorUp [0,0,1];
		}
		else
		{
			[-3,netId _target] call fnc_AdminReq;
		};
		
		_log = format['Flipping %1 @%2..',typeOf _target,mapGridPosition _target];
		_log call FN_SHOW_LOG;
	};
};
fnc_Light_selected = {
	_target = _this select 0;
	_pos = screenToWorld [0.5,0.5];
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(isNull _target)then{_target = cursorObject;};
	
	_log = format['Lightning @%1 %2',_pos,mapGridPosition _pos];
	if(!isNull _target)then
	{
		_pos = getPos _target;
		
		_log = format['Lightning %1 @%2 %3',typeOf _target,_pos,mapGridPosition _pos];
		if(getPlayerUID _target != '')then
		{
			_log = format['Lightning %1(%2) @%3 %4',_target call fnc_get_exileObjName,getPlayerUID _target,_pos,mapGridPosition _pos];
		};
	};
	_log call FN_SHOW_LOG;
	
	_log call fnc_adminLog;
	[-1,_pos] call fnc_AdminReq;
};
fnc_Kill_selected = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(isNull _target)then{_target = cursorObject;};
	if(!isNull _target)then
	{
		if(alive _target)then
		{
			if!(_target getVariable ['killed',''] isEqualTo '')exitWith{};
			
			_log = format['Killing %1 @%2',typeOf _target,mapGridPosition _target];
			if(getPlayerUID _target != '')then
			{
				_log = format['Killing %1(%2) @%3',_target call fnc_get_exileObjName,getPlayerUID _target,mapGridPosition _target];
			};
			_log call FN_SHOW_LOG;
			
			_log call fnc_adminLog;
			_target setVariable ['killed',format['%1(%2)',profileName,getPlayerUID player]];
			[-2,netId _target] call fnc_AdminReq;
		};
	};
};
fnc_Explode_selected = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(isNull _target)then{_target = cursorObject;};
	_pos = screenToWorld [0.5,0.5];
	_log = format['Exploding @%1',mapGridPosition _pos];
	if(!isNull _target)then
	{
		_log = format['Exploding %1 @%2',typeOf _target,mapGridPosition _target];
		if(isPlayer _target)then
		{
			_log = format['Exploding %1(%2) @%3',_target call fnc_get_exileObjName,getPlayerUID _target,mapGridPosition _target];
		};
		
		_eyepos = ASLToATL eyepos _target;if(surfaceIsWater _eyepos)then{_eyepos = eyepos _target;};
		_pos = getPosVisual _target;
		_pos set[2,_eyepos select 2];
	};
	_log call FN_SHOW_LOG;
	_log call fnc_adminLog;
	
	_bomb = 'HelicopterExploSmall' createVehicleLocal _pos;
};
fnc_fsuicide_selected = {
	_target = _this select 0;
	if(!isNull _target)then
	{
		if(isPlayer _target)then
		{
			_log = format['Force Suicide on %1(%2) @%3',_target call fnc_get_exileObjName,getPlayerUID _target,mapGridPosition _target];
			_log call FN_SHOW_LOG;
			_log call fnc_adminLog;
			[21,netId _target] call fnc_AdminReq;
		};
	};
};
fnc_Disconnect_selected = {
	_target = _this select 0;
	if(!isNull _target)then
	{
		[-664,netId _target] call fnc_AdminReq;	
		_log = format['Disconnect %1(%2)',_target call fnc_get_exileObjName,getPlayerUID _target];
		_log call FN_SHOW_LOG;
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_get_reason = {
	disableSerialization;
	if(_this isEqualTo [])exitWith{systemChat 'no input';};
	if(isNull findDisplay -1341)then{(findDisplay MAIN_DISPLAY_ID) closeDisplay 0;createdialog 'infiSTAR_EDITBOX';};
	_display = findDisplay -1341;
	_ctrl = [_display,'RSCButton',7337] call fnc_createctrl;
	_ctrl ctrlSetText 'SUBMIT REASON';
	_ctrl ctrlSetPosition [
		0.5,
		0.75,
		0.25,
		0.033 * safezoneH
	];
	_ctrl ctrlSetEventHandler['ButtonClick','
		_input = '+str _this+';
		_adminreq = _input select 0;
		_opt = _input select 1;
		_TNAME = _input select 2;
		_TUID = _input select 3;
		_what = _input select 4;
		
		_txt = ctrlText ((findDisplay -1341) displayCtrl 1336);
		_txt = if(_txt isEqualTo '''')then{''ADMIN DECISION''}else{_txt select [0,300]};
		_adminreq pushBack (toArray _txt);
		_adminreq call fnc_AdminReq;
		
		if(_opt isEqualTo 1)then
		{
			_code = format[''
				_text = ''''%1 has been %2!'''';
				systemChat _text;
				[''''ErrorTitleAndText'''', [''''infiSTAR.de'''', _text]] call ExileClient_gui_toaster_addTemplateToast;
			'',_TNAME,_what];
			[_code] call admin_d0;
		}
		else
		{
			_log = format[''%4 %1(%2): %3'',_TNAME,_TUID,_txt,_what];
			_log call FN_SHOW_LOG;
		};
	true;'];
	_ctrl ctrlCommit 0;
	_ctrl = [_display,'RSCButton',7338] call fnc_createctrl;
	_ctrl ctrlSetText 'STOP';
	_ctrl ctrlSetPosition [
		0.25,
		0.75,
		0.25,
		0.033 * safezoneH
	];
	_ctrl ctrlSetEventHandler['ButtonClick','closeDialog 0;true'];
	_ctrl ctrlCommit 0;
};
fnc_do_target = {
	_target = _this select 0;
	_option = _this select 1;
	_suboption = _this select 1;
	
	if(!isNull _target)then
	{
		_TUID = getPlayerUID _target;
		if(_TUID != '')then
		{
			_TNAME = _target call fnc_get_exileObjName;
			_input = call {
				if(_option isEqualTo 0)exitWith{[[-665,netId _target],_suboption,_TNAME,_TUID,'KICKED']};
				if(_option isEqualTo 1)exitWith{[[-666,0,netId _target],_suboption,_TNAME,_TUID,'BANNED']};
				if(_option isEqualTo 2)exitWith{[[-666,1,netId _target],_suboption,_TNAME,_TUID,'TEMP-BANNED']};
				[]
			};
			_input call fnc_get_reason;
		};
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_ATTACH_TO = {
	if(isNil'LastAttachedObject')then{LastAttachedObject=objNull;};
	if(!isNull LastAttachedObject)exitWith{detach LastAttachedObject;LastAttachedObject = nil;};
	
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(isNull _target)then{_target = cursorObject;};
	if(!isNull _target)then
	{
		_bbr = boundingBoxReal _target;
		_p1 = _bbr select 0;
		_p2 = _bbr select 1;
		_offset = 5;
		_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
		_maxLength = abs ((_p2 select 1) - (_p1 select 1));
		if(_maxWidth > _offset)then{_offset = _maxWidth;};
		if(_maxLength > _offset)then{_offset = _maxLength;};
		
		_bbr = boundingBoxReal vehicle player;
		_p1 = _bbr select 0;
		_p2 = _bbr select 1;
		_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
		
		[5,netId _target,_offset,_maxHeight] call fnc_AdminReq;
		LastAttachedObject = _target;
		
		_log = format['Attaching   %1   to player',typeOf _target];
		_log call FN_SHOW_LOG;
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_ReviveTarget = {
	_target = _this select 0;
	if(!isNull _target)then
	{
		if(alive _target)exitWith
		{
			_log = 'target already alive..!';
			_log call FN_SHOW_LOG;
		};
		if((getPlayerUID _target) isEqualTo '')exitWith
		{
			_log = 'target object not a player anymore..!';
			_log call FN_SHOW_LOG;
		};
		
		moveOut _target;
		unassignVehicle _target;
		_target action ['eject', (vehicle _target)];
		
		_log = format['Revived %1(%2) @%3',_target call fnc_get_exileObjName,getPlayerUID _target,mapGridPosition _target];
		_log call FN_SHOW_LOG;
		[19,netId _target] call fnc_AdminReq;
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_HealTarget = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(isNull _target)then{_target = cursorObject;};
	if(!isNull _target)then
	{
		_log = format['Healed %1 @%2',typeOf _target,mapGridPosition _target];
		if(getPlayerUID _target != '')then
		{
			_log = format['Healed %1(%2) @%3',_target call fnc_get_exileObjName,getPlayerUID _target,mapGridPosition _target];
		};
		_log call FN_SHOW_LOG;
		
		[9,netId _target] call fnc_AdminReq;
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_RepairTarget = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(isNull _target)then{_target = cursorObject;};
	if(!isNull _target)then
	{
		_log = format['%1 @%2 - Repaired & Refueled',typeOf _target,mapGridPosition _target];
		if(getPlayerUID _target != '')then
		{
			_log = format['%1 @%2 - Repaired & Refueled   @%3',_target call fnc_get_exileObjName,getPlayerUID _target,mapGridPosition _target];
		};
		_log call FN_SHOW_LOG;
		
		[9,netId (vehicle _target)] call fnc_AdminReq;
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
infiSTAR_A3Heal = {
	[9,netId cameraOn] call fnc_AdminReq;
	if!(cameraOn isEqualTo player)then{[9,netId player] call fnc_AdminReq;};
	_log = format['Healed %1(%2)',cameraOn call fnc_get_exileObjName,getPlayerUID cameraOn];
	_log call FN_SHOW_LOG;
};
infiSTAR_A3RestoreNear = {
	_done = [];
	{
		_crewandobject = [_x];
		_crewandobject append (crew _x);
		
		{
			_id = _done pushBackUnique _x;
			if(_id > -1)then
			{
				[9,netId _x] call fnc_AdminReq;
			};
		} forEach _crewandobject;
	} forEach (cameraOn nearEntities ['AllVehicles',15]);
	
	_log = format['Restored Near %1(%2)',cameraOn call fnc_get_exileObjName,getPlayerUID cameraOn];
	_log call FN_SHOW_LOG;
};
fn_addArsenalAction = {
	if('Arsenal' call ADMINLEVELACCESS)then
	{
		_log = '';
		_id = player getVariable ['arsenal_action_id',-1];
		if(_id > -1)then
		{
			player removeAction _id;
			_id = -1;
			_log = 'Arsenal Action removed from player.';
		}
		else
		{
			_id = player addAction ['Arsenal',{['Open',true] call BIS_fnc_arsenal;}];
			_log = 'Arsenal Action added to player.';
		};
		player setVariable ['arsenal_action_id',_id];
		_log call FN_SHOW_LOG;
		_log call fnc_adminLog;
	};
};
infiSTAR_A3addAmmo = {
	if(isNil'SELECTED_TARGET_PLAYER')then{SELECTED_TARGET_PLAYER=player;};
	if(isNull SELECTED_TARGET_PLAYER)then{SELECTED_TARGET_PLAYER=player;};
	if(!alive SELECTED_TARGET_PLAYER)then{SELECTED_TARGET_PLAYER=player;};
	_log = '';
	_veh = vehicle SELECTED_TARGET_PLAYER;
	if(_veh == SELECTED_TARGET_PLAYER)then 
	{
		_muzzle = currentWeapon SELECTED_TARGET_PLAYER;
		_magArray = getArray(configFile >> 'CfgWeapons' >> _muzzle >> 'magazines');
		if((((toLower _muzzle) find '_gl' != -1) && {((toLower _muzzle) find '_glock' == -1)})||((toLower _muzzle) find 'm203' != -1))then
		{
			_pewpews = [];
			{
				
				if(((toLower _x) select [0,4] in ['1rnd','3rnd'])||((toLower _x) find 'ugl_' != -1))then
				{
					_pewpews pushBack _x;
				};
			} forEach ALL_MAGS_TO_SEARCH_C;
			_magArray append _pewpews;
		};
		if(_magArray isEqualTo [])exitWith{};
		[] call fnc_FULLinit;
		LASTSUBBUTTON = 0;
		FILLMAINSTATE = 6;
		disableSerialization;
		_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_SHIFT_ID;
		lbclear _ctrl;
		_ctrl lbAdd '==== Magazines ====';
		{
			_lbid = _ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgMagazines' >> _x >> 'displayName'),_x];
			_ctrl lbSetData [_lbid,_x];
			_x call fnc_addpic;
		} forEach _magArray;
		[] call fnc_colorizeMain;
		for '_i' from 0 to 12 do {_ctrl lbAdd '';};
	}
	else
	{
		_log = format['%1 added Ammo to %2',SELECTED_TARGET_PLAYER call fnc_get_exileObjName,typeOf _veh];
		{
			_wep = _x;
			{
				[_veh,_x] call fnc_reallyAdditem;
			} forEach (getArray (configFile >> 'CfgWeapons' >> _wep >> 'magazines'));
		} forEach (weapons _veh);
	};
	_log call FN_SHOW_LOG;
	_log call fnc_adminLog;
	cameraOn setVehicleAmmo 1;
};
infiSTAR_A3Invulnerability = {
	if(isNil 'A3Invulnerability')then
	{
		_code = {
			if(alive player)then
			{
				player allowDamage false;
				player removeAllEventhandlers 'HandleDamage';
				player addEventhandler ['HandleDamage', {false}];
				ExileClientPlayerAttributes = [100,100,100,100,0,37,0];
				ExileClientPlayerAttributesASecondAgo = ExileClientPlayerAttributes;
				ExileClientPlayerLastHpRegenerationAt = diag_tickTime;
				ExileClientPlayerIsOverburdened = false;
				ExileClientPlayerOxygen = 100;
				ExileClientPlayerIsAbleToBreathe = true;
				ExileClientPlayerIsDrowning = false;
				ExileClientPlayerIsInjured = false;
				ExileClientPlayerIsBurning = false;
				ExileClientPlayerIsBleeding = false;
				ExileClientPlayerIsExhausted = false;
				ExileClientPlayerIsHungry = false;
				ExileClientPlayerIsThirsty = false;
				player setBleedingRemaining 0;
				player setOxygenRemaining 1;
				player setFatigue 0;
				if(damage player > 0)then{player setDamage 0;};
				if(!isNil'ExileRadiationThreadHandle')then
				{
					[] call ExileClient_system_radiation_event_onPlayerDied;
					ExilePlayerRadiation = 0;
					ExilePlayerRadiationLastCheck = 0;
				};
			};
		};
		A3Invulnerability = [0.1, _code, [], true] call ExileClient_system_thread_addtask;
	}
	else
	{
		[A3Invulnerability] call ExileClient_system_thread_removeTask;A3Invulnerability=nil;
		player allowDamage true;
		player removeAllEventhandlers 'HandleDamage';
		player addEventHandler ['HandleDamage',{_this call ExileClient_object_player_event_onHandleDamage}];
		[] call ExileClient_system_radiation_event_onPlayerSpawned;
	};
};
infiSTAR_A3Invulnerability2 = {
	if(isNil 'A3Invulnerability2')then
	{
		_code = {
			if(alive player)then
			{
				player allowDamage false;
				player removeAllEventhandlers 'HandleDamage';
				player addEventhandler ['HandleDamage', {false}];
				if(damage player > 0)then{player setDamage 0;};
			};
		};
		A3Invulnerability2 = [0.1, _code, [], true] call ExileClient_system_thread_addtask;
	}
	else
	{
		[A3Invulnerability2] call ExileClient_system_thread_removeTask;A3Invulnerability2=nil;
		player allowDamage true;
		player removeAllEventhandlers 'HandleDamage';
		player addEventHandler ['HandleDamage',{_this call ExileClient_object_player_event_onHandleDamage}];
	};
};
fnc_draw3dhandlerAI = ""
	if(!isNull cameraOn)then
	{
		ALLVEHICLES_OBJECTS_1500m = cameraOn nearEntities ['Allvehicles',1500];
		{
			if(!isNull _x)then
			{
				if(alive _x)then
				{
					_PUIDX = getPlayerUID _x;
					if(_PUIDX == '')then
					{
						if(_x isKindOf 'Animal_Base_F')exitWith{};
						_crew = crew _x;
						if!(_crew isEqualTo [])then
						{
							_distance = cameraOn distance _x;
							_txt = 'AI';
							_type = typeOf _x;
							if(_x isKindOf 'Man')then
							{
								if(_type select [0,11] in ['Exile_Trade','Exile_Guard'])then
								{
									_txt = format['%1 (%2m)',_type,round _distance];
								}
								else
								{
									_txt = format['AI (%1m)',round _distance];
								};
							}
							else
							{
								_txt = format['AI - %1 (%2m)',gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName'),round _distance];
							};
							
							_grp = group _x;
							if(!isNull _grp)then
							{
								_txt = format['%1 GRP:%2 UNITS:%3',_txt,allGroups find _grp,count units _grp];
							};
							_pos = ASLToATL eyepos _x;
							if(surfaceIsWater _pos)then{_pos = eyepos _x;};
							drawIcon3D['',[1,0,0.75,0.7],_pos,.1,.1,0,_txt,1,.03];
						};
					};
				};
			};
		} forEach ALLVEHICLES_OBJECTS_1500m;
	};
"";
fnc_draw3dhandlerDEAD = ""
	{
		if(!isNull _x)then
		{
			if!(getPlayerUID _x isEqualTo '')exitWith{};
			
			_distance = cameraOn distance _x;
			if(_distance < 500)then
			{
				_name = _x call fnc_get_exileObjName;
				_clr = [1,1,1,0.7];
				_txt = format['%1 %2m',_name,round _distance];
				_pos = _x modelToWorldVisual [0,0,1];
				drawIcon3D['',_clr,_pos,0,0,45,_txt,0,.032];
			};
		};
	} forEach allDeadMen;
"";
fnc_call_single_esps = {
	if(!isNil'infiSTAREspEHVAR')then{
		removeMissionEventHandler ['Draw3D',infiSTAREspEHVAR];
		infiSTAREspEHVAR=nil;
	};
	_string = '';
	if(!isNil 'fnc_infiESP_stateAI')then
	{
		_string = _string + fnc_draw3dhandlerAI;
	};
	if(!isNil 'fnc_infiESP_stateDEAD')then
	{
		_string = _string + fnc_draw3dhandlerDEAD;
	};
	if(_string != '')then
	{
		_string = ('if(isNull findDisplay 49)exitWith{'+_string+';true};');
		infiSTAREspEHVAR = addMissionEventHandler ['Draw3D',_string];
	};
};
fnc_PlayerESP_NORM_CODE = {
	private['_distance','_alpha','_clr','_crew','_pos'];
	
	{
		_distance = round(cameraOn distance _x);
		if(_distance < 2000)then
		{
			_alpha = (1-(_distance/2000/1.5));
			_isOnFoot = isNull objectParent _x;
			if(_isOnFoot)then
			{
				_name = _x call fnc_get_exileObjName;
				_clr = _x call FN_GET_CLR;
				_curwep = currentWeapon _x;
				_hp = round((damage _x - 1) * -100);
				_txt = format['unarmed - %1HP',_hp];
				
				_pos = _x modelToWorldVisual (_x selectionPosition 'head');
				_pos2D = worldToScreen _pos;
				
				
				_txt2 = '';
				if(alive _x)then
				{
					_txt2 = format['%1 - %2m',_name,_distance];
				}
				else
				{
					_txt2 = format['%1 - %2m (DEAD, but still watching)',_name,_distance];
				};
				if(abs(_pos2D select 0) < 1)then
				{
					if(_curwep != '')then
					{
						_txt = format['%1 - [%2/%3] - %4HP',gettext(configFile >> 'CfgWeapons' >> _curwep >> 'displayName'),_x ammo _curwep,getNumber(configFile >> 'CfgMagazines' >> currentMagazine _x >> 'count'),_hp];
					};
					
					_dir = _x getRelDir cameraOn;
					drawIcon3D['iconManMedic',_clr,_pos,.5,.5,if(_x isEqualTo cameraOn)then{_dir}else{_dir+180},_txt,1,0.03,'PuristaMedium','',true];
					drawIcon3D['',_clr,_pos,.5,0,0,_txt2,1,0.03,'PuristaMedium','',true];
				}
				else
				{
					drawIcon3D['iconManMedic',_clr,_pos,.5,.5,(_x getRelDir cameraOn)+180,_txt2,1,0.03,'PuristaMedium','',true];
				};
			}
			else
			{
				_veh = vehicle _x;
				_class = typeOf _veh;
				_speed = round(speed _veh*100)/100;
				_maxSpeed = getNumber(configFile >> 'CfgVehicles' >> _class >> 'maxSpeed');
				_typename = gettext(configFile >> 'CfgVehicles' >> _class >> 'displayName');
				_icon = gettext(configFile >> 'CfgVehicles' >> _class >> 'Picture');
				
				_crew = fullCrew _veh;
				_vehclr = [0.047,0.502,1,_alpha];
				if(!alive _veh)then{_vehclr = [1,1,1,_alpha]};
				
				_pos = _veh modelToWorldVisual [0,0,0];
				_pos2D = worldToScreen _pos;
				if(abs(_pos2D select 0) < 1)then
				{
					_cnt = count _crew;
					if(_cnt > 0)then
					{
						_num = _cnt * -1;
						{
							_height = _num + _forEachIndex;
							_unit = _x select 0;
							_role = _x select 1;
							_txt = format['%1. %2 - %3 %4HP',_forEachIndex,_role,_unit call fnc_get_exileObjName,round((1-(damage _unit))*100)];
							drawIcon3D['\A3\ui_f\data\map\Markers\Military\dot_ca.paa',[1,0.17,0.17,_alpha],_unit modelToWorldVisual (_unit selectionPosition 'head'),0,0,0,format['%1',_forEachIndex],1,0.03,'PuristaMedium','',true];
							drawIcon3D['',_unit call FN_GET_CLR,_pos,.5,_height,0,_txt,1,0.03,'PuristaMedium','',true];
						} forEach _crew;
					};
					
					_txt = format['%1 - %2m',_typename,_distance];
					drawIcon3D['',_vehclr,_pos,.5,0,0,_txt,1,0.03,'PuristaMedium','',true];
					
					_txt = format['%1/%2km/h %3HP',_speed,_maxSpeed,round((1-(damage _veh))*100)];
					drawIcon3D[_icon,_vehclr,_pos,.5,.5,0,_txt,1,0.03,'PuristaMedium','',true];
				}
				else
				{
					_crewnames = '';
					{
						_unit = _x select 0;
						if(_crewnames == '')then
						{
							_crewnames = _unit call fnc_get_exileObjName;
						}
						else
						{
							_crewnames = format['%1, %2',_crewnames,_unit call fnc_get_exileObjName];
						};
					} forEach _crew;
					
					_txt = format['%1 - %2 - %3HP - %4m',_crewnames,_typename,round((1-(damage _veh))*100),_distance];
					drawIcon3D[_icon,_vehclr,_pos,.5,.5,0,_txt,1,0.03,'PuristaMedium','',true];
				};
			};
		};
	} forEach plr_in_sd;
	true
};
fnc_PlayerESP_NORM = {
	if(!isNil'plr_in_sd_task')then{[plr_in_sd_task] call ExileClient_system_thread_removeTask;plr_in_sd_task=nil;};
	if(isNil'fnc_PlayerESP_NORM_ID')then
	{
		plr_in_sd = (call fnc_get_plr);
		_code = {
			plr_in_sd = [];{if(cameraOn distance _x < 3000)then{plr_in_sd pushBackUnique _x;};} forEach (call fnc_get_plr);
		};
		plr_in_sd_task = [3, _code, [], true] call ExileClient_system_thread_addtask;
		fnc_PlayerESP_NORM_ID = addMissionEventHandler ['Draw3D', { if(isNull findDisplay 49)then{[] call fnc_PlayerESP_NORM_CODE;};true } ];
	}
	else
	{
		plr_in_sd = [];
		removeMissionEventHandler ['Draw3D', fnc_PlayerESP_NORM_ID];fnc_PlayerESP_NORM_ID=nil;
	};
};
fnc_PlayerESP_SS_CODE = {
	private['_espRenderRange','_distance','_alpha','_clr','_crew','_pos'];
	_espRenderRange = _this;
	if (!isNull cameraOn) then
	{
		{
			if(!isNull _x)then
			{
				if(isPlayer _x)then
				{
					_distance = round(cameraOn distance _x);
					_alpha = (1-(_distance/_espRenderRange/1.5));
					_clr = [1,1,1,_alpha];
					_crew = fullCrew (vehicle _x);
					_name = '';
					{
						if(_forEachIndex == 0) then
						{
							_name = format['%1(%2m)',(_x select 0) call fnc_get_exileObjName,_distance];
						}
						else
						{
							_name = _name + format[', %1(%2m)',(_x select 0) call fnc_get_exileObjName,_distance];
						};
					} forEach _crew;
					_pos = _x modelToWorldVisual (_x selectionPosition 'head');
					drawIcon3D['\A3\ui_f\data\map\Markers\Military\dot_ca.paa',_clr,_pos,.3,.3,0,_name,1,0.03];
				};
			};
		} forEach ((cameraOn nearEntities[['Exile_Unit_Player', 'LandVehicle', 'Ship', 'Air'], _espRenderRange]) - [cameraOn]);
	};
};
fnc_PlayerESP_SS = {
	if(isNil'fnc_PlayerESP_SS_ID')then
	{
		fnc_PlayerESP_SS_ID = addMissionEventHandler ['Draw3D', { if(isNull findDisplay 49)then{2000 call fnc_PlayerESP_SS_CODE;};true } ];
	}
	else
	{
		removeMissionEventHandler ['Draw3D', fnc_PlayerESP_SS_ID];fnc_PlayerESP_SS_ID=nil;
	};
};
iconTextSize = 250 * pixelH;
nameTextSize = 15 * pixelH;
fnc_LootESP_CODE = {
	if (!isNull cameraOn) then
	{
		_pos = getPos cameraOn;
		_distance = 300;
		
		_getinfo = {
			_cnt = count weaponCargo _this;if(_cnt > 0)exitWith{[[1,0,0,1],'Weapon',_cnt]};
			_cnt = count magazineCargo _this;if(_cnt > 0)exitWith{[[1,1,0,1],'Magazine',_cnt]};
			_cnt = count itemCargo _this;if(_cnt > 0)exitWith{[[0,0,1,1],'Item',_cnt]};
			_cnt = count backpackCargo _this;if(_cnt > 0)exitWith{[[0,1,0,1],'Backpack',_cnt]};
			[[1,1,1,1],typeOf _this,1]
		};
		
		{
			_ret = _x call _getinfo;
			_clr = _ret select 0;
			_txt = _ret select 1;
			_cnt = _ret select 2;
			drawIcon3D['A3\ui_f\data\map\Markers\Military\dot_ca.paa',_clr,getPosATL _x,iconTextSize,iconTextSize,0,format['%1(%2)',_txt,_cnt],0,nameTextSize,'PuristaMedium','',true];
		} forEach (nearestObjects [cameraOn, ['LootWeaponHolder', 'GroundWeaponHolder', 'WeaponHolderSimulated'],_distance]);
	};
};
fnc_LootESP = {
	if(isNil'LootESPid')then
	{
		LootESPid = addMissionEventHandler ['Draw3D', { if(isNull findDisplay 49)then{call fnc_LootESP_CODE;};true } ];
		systemChat '<infiSTAR.de> Loot ESP showing loot within 300m';
	}
	else
	{
		removeMissionEventHandler ['Draw3D',LootESPid];
		LootESPid=nil;
	};
};
fnc_draw_MapIcons = {
	_icon = '';
	_alpha = 1;
	_iscale = ((1 - ctrlMapScale _ctrl) max .2) * 28;
	if(mapiconsshowplayer)then
	{
		_shown = [];
		{
			if(!isNull _x)then
			{
				_veh = vehicle _x;
				if(_veh in _shown)exitWith{};
				_shown pushBack _veh;
				_PUIDX = getPlayerUID _x;
				if(_PUIDX != '')then
				{
					_name = _x call fnc_get_exileObjName;
					_type = typeOf _veh;
					_dist = round(_veh distance player);
					_clr = _x call FN_GET_CLR;
					_txt = format['%1 (%2m) (DEAD, but still watching)',_name,_dist];
					if(alive _x)then
					{
						if(_x isEqualTo _veh)then
						{
							_txt = format['%1 (%2m)',_name,_dist];
						}
						else
						{
							_names = '';
							{
								if(_forEachIndex isEqualTo 0)then
								{
									_names = _names + format['%1',(_x select 0) call fnc_get_exileObjName];
								}
								else
								{
									_names = _names + format[', %1',(_x select 0) call fnc_get_exileObjName];
								};
							} forEach (fullCrew _veh);
							_typename = gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName');
							_txt = format['%1 - %2 (%3m)',_names,_typename,_dist];
						};
					};
					
					_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
					_grpx = group _x;
					if(!isNull _grpx)then
					{
						_alive = {alive _x} count units _grpx;
						if(_alive > 1)then
						{
							_txt = _txt + format[' GRP:%1 PLR:%2',allGroups find _grpx,_alive];
						};
					};
					
					_ctrl drawIcon [_icon, _clr, getPosASL _veh, _iscale, _iscale, getDir _veh,_txt];
				};
			};
		} forEach (call fnc_get_plr);
	};
	if(mapiconsshowvehicles||mapiconsshowai)then
	{
		{
			if(!isNull _x)then
			{
				_PUIDX = getPlayerUID _x;
				if(_PUIDX isEqualTo '')then
				{
					_veh = vehicle _x;
					_type = typeOf _veh;
					if(mapiconsshowvehicles)then
					{
						if!(_veh isKindOf 'Man')then
						{
							_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
							_drawcode = [_icon, [0.67,0.97,0.97,1], getPosASL _veh, _iscale, _iscale, getDir _veh];
							_displayName = '';
							if(mapiconsshowvehiclestypes)then
							{
								_displayName = gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName');
								_drawcode pushBack _displayName;
							};
							if(mapiconsshowvehicleslockstate)then
							{
								_locked = locked _veh;
								if!(_locked isEqualTo 1)then
								{
									if(_locked isEqualTo 0)then
									{
										_drawcode set[1,[0,0.55,0.15,1]];
									}
									else
									{
										_drawcode set[1,[1,0.4,0,1]];
									};
								};
							};
							_ctrl drawIcon _drawcode;
						};
					};
					if(mapiconsshowai)then
					{
						if(_x isKindOf 'Animal_Base_F')exitWith{};
						_crew = crew _x;
						if!(_crew isEqualTo [])then
						{
							_distance = cameraOn distance _x;
							_txt = 'AI';
							_type = typeOf _x;
							if(_x isKindOf 'Man')then
							{
								if(_type select [0,11] in ['Exile_Trade','Exile_Guard'])then
								{
									_txt = format['%1 (%2m)',_type,round _distance];
								}
								else
								{
									_txt = format['AI (%1m)',round _distance];
								};
							}
							else
							{
								_txt = format['AI - %1 (%2m)',gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName'),round _distance];
							};
							
							_grp = group _x;
							if(!isNull _grp)then
							{
								_txt = format['%1 GRP:%2 UNITS:%3',_txt,allGroups find _grp,count units _grp];
							};
							_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
							_ctrl drawIcon [_icon, [1,0,0.75,1], getPosASL _x, _iscale, _iscale, getDir _x,_txt];
						};
					};
				};
			};
		} forEach ([0,0,0] nearEntities ['Allvehicles',1000000]);
	};
	if(mapiconsshowdeadvehicles)then
	{
		{
			if((_x isKindOf 'Air')||(_x isKindOf 'Landvehicle'))then
			{
				_veh = vehicle _x;
				_type = typeOf _veh;
				_clr = [1,1,1,1];
				if(_x isEqualTo SELECTED_TARGET_PLAYER)then{_clr = [1,0.7,0.15,1];};
				_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
				_ctrl drawIcon [_icon, _clr, getPosASL _x, _iscale, _iscale, getDir _x];
			};
		} forEach allDead;
	};
	if(mapiconsshowdeadplayer)then
	{
		{
			if(!isNull _x)then
			{
				_name = _x call fnc_get_exileObjName;
				_veh = vehicle _x;
				_dist = round(_veh distance player);
				_txt = format['%1 (%2m)',_name,_dist];
				if(getPlayerUID _x != '')then
				{
					_txt = format['%1 (%2m) (DEAD, but still watching)',_name,_dist];
				};
				_type = typeOf _veh;
				_clr = [1,1,1,1];
				_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
				_ctrl drawIcon [_icon, _clr, getPosASL _veh, _iscale, _iscale, getDir _veh,_txt];
			};
		} forEach allDeadMen;
	};
};
fnc_mapiconsshowflags = {
	{
		_ctrl drawIcon ['iconObject_1x1', [0,1,1,1], getPosASL _x, _size, _size, getDir _x];
	} forEach Exile_Construction_Flag_Static_ARRAY;
};
fnc_mapiconsshowbuildings = {
	{
		_ctrl drawIcon ['iconObject_1x1', [1,1,1,1], getPosASL _x, _size, _size, getDir _x];
	} forEach Exile_Construction_Abstract_Static_ARRAY;
};
fnc_mapiconsshowcameras = {
	{
		_ctrl drawIcon ['iconObject_1x1', [1,0,1,1], getPosASL _x, _size, _size, getDir _x];
	} forEach Exile_Construction_BaseCamera_Static_ARRAY;
};
fnc_removeButtons = {disableSerialization;{ctrlDelete _x;} forEach MapIconsButtonCTRLs;};
fnc_addButtons = {
	_xpos = 0.5;
	_y = safeZoneY+0.0105;
	MapIconsButtonCTRLs = [];
	
	for '_i' from 2084 to 2093 do
	{
		_y = _y + 0.0495;
		_ctrl = [_display,'RscButton',_i] call fnc_createctrl;
		_ctrl ctrlSetPosition [_xpos,_y,0.3,0.05];
		MapIconsButtonCTRLs pushBack _ctrl;
	};
};
infiSTAR_A3MAPICONS = {
	if(isNil 'fnc_MapIcons_run')then
	{
		fnc_MapIcons_run = true;
		if(isNil'timerForBaseParts')then{timerForBaseParts = 0;};
		if(isNil'Exile_Construction_Flag_Static_ARRAY')then{Exile_Construction_Flag_Static_ARRAY = [];};
		if(isNil'Exile_Construction_Abstract_Static_ARRAY')then{Exile_Construction_Abstract_Static_ARRAY = [];};
		if(isNil'Exile_Construction_BaseCamera_Static_ARRAY')then{Exile_Construction_BaseCamera_Static_ARRAY = [];};
		
		if(isNil'mapiconsshowflags')then{mapiconsshowflags=false;};
		if(isNil'mapiconsshowbuildings')then{mapiconsshowbuildings=false;};
		if(isNil'mapiconsshowcameras')then{mapiconsshowcameras=false;};
		if(isNil'mapiconsshowplayer')then{mapiconsshowplayer=true;};
		if(isNil'mapiconsshowvehicles')then{mapiconsshowvehicles=false;};
		if(isNil'mapiconsshowvehiclestypes')then{mapiconsshowvehiclestypes=false;};
		if(isNil'mapiconsshowvehicleslockstate')then{mapiconsshowvehicleslockstate=false;};
		if(isNil'mapiconsshowdeadplayer')then{mapiconsshowdeadplayer=false;};
		if(isNil'mapiconsshowdeadvehicles')then{mapiconsshowdeadvehicles=false;};
		if(isNil'mapiconsshowai')then{mapiconsshowai=false;};
		
		if(!isNil'MAP_BUTTON_THREAD')exitWith{};
		MAP_BUTTON_THREAD = [] spawn {
			disableSerialization;
			private['_display','_button','_state','_text','_function','_color'];
			_display = findDisplay 12;
			while{true}do
			{
				if(visibleMap)then
				{
					if(mapiconsshowflags || mapiconsshowbuildings || mapiconsshowcameras)then
					{
						if(time > timerForBaseParts)then
						{
							timerForBaseParts = time + 25;
							
							Exile_Construction_Flag_Static_ARRAY = allMissionObjects 'Exile_Construction_Flag_Static';
							Exile_Construction_Abstract_Static_ARRAY = allMissionObjects 'Exile_Construction_Abstract_Static';
							Exile_Construction_BaseCamera_Static_ARRAY = allMissionObjects 'Exile_Construction_BaseCamera_Static';
						};
					};
					if(isNil'EventHandlerDrawAdded')then
					{
						call fnc_addButtons;
						EventHandlerDrawAdded = (uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlAddEventHandler['Draw','
						if(visibleMap)then
						{
							_ctrl = _this select 0;
							_myscale = 33.2012;
							_scale = ctrlMapScale _ctrl;
							_size = 10 max (_myscale*(_myscale/(_scale * 10000)));
							if(mapiconsshowflags)then{call fnc_mapiconsshowflags};
							if(mapiconsshowbuildings)then{call fnc_mapiconsshowbuildings};
							if(mapiconsshowcameras)then{call fnc_mapiconsshowcameras};
							call fnc_draw_MapIcons
						}
						'];
					};
					
					{
						_var = _x select 0;
						_text = _x select 1;
						_button = MapIconsButtonCTRLs select _forEachIndex;
						
						_state = missionNameSpace getVariable [_var,false];
						_color = if(_state)then{[0.56,0.04,0.04,1]}else{[0,1,0,1]};
						_BTNtext = if(_state)then{format['Hide %1',_text]}else{format['Show %1',_text]};
						_onoff = if(_state)then{'OFF'}else{'ON'};
						_button ctrlSetText _BTNtext;
						_button ctrlSetTextColor _color;
						_button ctrlRemoveAllEventHandlers 'ButtonDown';
						_button ctrlAddEventHandler ['ButtonDown',
							format['
								''MapIcons: %1 - %2'' call fnc_adminLog;
								missionNameSpace setVariable [''%3'',!(missionNameSpace getVariable [''%3'',false])];
							',
							_text,_onoff,_var]
						];
						if!(format['MapIcons: %1',_text] call ADMINLEVELACCESS)then{_button ctrlEnable false;};
						_button ctrlCommit 0;
					} forEach [
						['mapiconsshowflags','Flags'],
						['mapiconsshowbuildings','Buildings'],
						['mapiconsshowcameras','Cameras'],
						['mapiconsshowplayer','Player'],
						['mapiconsshowdeadplayer','DeadPlayer'],
						['mapiconsshowvehicles','Vehicles'],
						['mapiconsshowvehiclestypes','Vehicle Types'],
						['mapiconsshowvehicleslockstate','Vehicle lockstate'],
						['mapiconsshowdeadvehicles','DeadVehicles'],
						['mapiconsshowai','AI']
					];
					
					if(mapiconsshowvehicles)then
					{
						MapIconsButtonCTRLs select 6 ctrlEnable true;
						MapIconsButtonCTRLs select 7 ctrlEnable true;
					}
					else
					{
						MapIconsButtonCTRLs select 6 ctrlEnable false;
						MapIconsButtonCTRLs select 7 ctrlEnable false;
						mapiconsshowvehiclestypes = false;
						mapiconsshowvehicleslockstate=false;
					};
				}
				else
				{
					if(!isNil'EventHandlerDrawAdded')then
					{
						call fnc_removeButtons;
						(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveEventHandler ['Draw',EventHandlerDrawAdded];EventHandlerDrawAdded=nil;
					};
				};
				uiSleep 0.3;
			};
		};
	} 
	else 
	{
		fnc_MapIcons_run = nil;
		terminate MAP_BUTTON_THREAD;MAP_BUTTON_THREAD=nil;
		if(!isNil'EventHandlerDrawAdded')then{(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveEventHandler ['Draw',EventHandlerDrawAdded];EventHandlerDrawAdded=nil;};
		call fnc_removeButtons;
	};
};
adminVehicleMarkers = {
	while {true} do
	{
		{
			_typename = gettext (configFile >> 'CfgVehicles' >> typeOf _x >> 'displayName');
			_xPos = getPos _x;
			
			_cm = ('adminVehicleMarkers' + (str _forEachIndex));
			_pos = getMarkerPos _cm;
			if((_pos select 0 != _xPos select 0) || (_pos select 1 != _xPos select 1))then
			{
				deleteMarkerLocal _cm;
				_vm = createMarkerLocal [_cm,_xPos];ADMIN_LOCAL_MARKER=true;
				_vm setMarkerDirLocal (getDir _x);
				_vm setMarkerTypeLocal 'mil_start';
				_vm setMarkerColorLocal 'ColorBlue';
				_vm setMarkerTextLocal format['%1',_typename];
			};
		} forEach ([0,0,0] nearEntities[['LandVehicle','Ship','Air','Tank'],1000000]);
		uiSleep 1;
	};
	for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminVehicleMarkers' + (str _i));};
};
adminVehicleMarker = {
	if(isNil 'markadVehicleMarker')then
	{
		markadVehicleMarker = [] spawn adminVehicleMarkers;
	}
	else
	{
		terminate markadVehicleMarker;markadVehicleMarker=nil;
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminVehicleMarkers' + (str _i));};
	};
};
adminFlagMarks = {
	while {true} do
	{
		if(isNil'timerForFlags')then{timerForFlags = 0;};
		if(time > timerForFlags)then
		{
			timerForFlags = time + 25;
			Exile_Construction_Flag_Static_ARRAY = (allMissionObjects 'Exile_Construction_Flag_Static');
		};
		for '_i' from 0 to (count Exile_Construction_Flag_Static_ARRAY)-1 do
		{
			_c = Exile_Construction_Flag_Static_ARRAY select _i;
			if(!isNull _c)then
			{
				deleteMarkerLocal ('adminFlagMarks' + (str _i));
				_vm = createMarkerLocal [('adminFlagMarks' + (str _i)), getPos _c];
				_vm setMarkerAlphaLocal 0.8;
				_vm setMarkerBrushLocal 'Grid';
				_radius = _c getVariable['ExileTerritorySize', 15];
				_vm setMarkerSizeLocal [_radius,_radius];
				_vm setMarkerShapeLocal 'ELLIPSE';
				_vm setMarkerColorLocal 'ColorGreen';
				
				_k = _i + 30000;
				deleteMarkerLocal ('adminFlagMarks' + (str _k));
				_vm = createMarkerLocal [('adminFlagMarks' + (str _k)), getPos _c];
				_vm setMarkerColorLocal 'ColorGreen';
				_vm setMarkerTypeLocal 'selector_selectable';
				_vm setMarkerSizeLocal [0.5,0.5];
				
				_level = _c getVariable['ExileTerritoryLevel', 1];
				_vm setMarkerTextLocal format['LVL %1',_level];
			};
		};
		uiSleep 20;
	};
};
adminFlagMark = {
	if(isNil 'FLAG_MARK_THREAD')then
	{
		timerForFlags = 0;
		FLAG_MARK_THREAD = [] spawn adminFlagMarks;
	}
	else
	{
		terminate FLAG_MARK_THREAD;FLAG_MARK_THREAD=nil;
		_flagCount = (count Exile_Construction_Flag_Static_ARRAY)+300;
		for '_i' from 0 to _flagCount do {deleteMarkerLocal ('adminFlagMarks' + (str _i));deleteMarkerLocal ('adminFlagMarks' + (str (_i+30000)));};
	};
};
adminDeadPlayers =
{
	while {true} do
	{
		ADMIN_DeadPlayer_LIST = [] + allDeadMen;
		for '_i' from 0 to (count ADMIN_DeadPlayer_LIST)-1 do
		{
			deleteMarkerLocal ('adminDeadPlayers' + (str _i));
			_c = ADMIN_DeadPlayer_LIST select _i;
			if(!isNull _c)then
			{
				_txt = _c call fnc_get_exileObjName;
				_txt = format['%1 (DEAD)',_txt];
				_vm = createMarkerLocal [('adminDeadPlayers' + (str _i)), getPos _c];ADMIN_LOCAL_MARKER=true;
				_vm setMarkerTypeLocal 'waypoint';
				_vm setMarkerColorLocal 'ColorBlack';
				_vm setMarkerTextLocal _txt;
			};
		};
		uiSleep 20;
	};
	for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminDeadPlayers' + (str _i));};
};
adminDeadPlayer = {
	if(isNil 'markadDeadPlayer')then
	{
		markadDeadPlayer = [] spawn adminDeadPlayers;
	}
	else
	{
		terminate markadDeadPlayer;markadDeadPlayer=nil;
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminDeadPlayers' + (str _i));};
	};
};
fnc_infiSTAR_vehboostKeydown = {
	_key = _this select 1;
	_shiftState = _this select 2;
	_ctrlState = _this select 3;
	_altState = _this select 4;
	
	_obj = cameraOn;
	if(!local _obj)exitWith{};
	if(_obj == player)exitWith{};
	
	
	if(_key isEqualTo 0x39)exitWith
	{
		_vel = velocity _obj;
		_obj setVelocity [
			(_vel select 0) * 0.96, 
			(_vel select 1) * 0.96, 
			(_vel select 2) * 0.98
		];
		false
	};
	
	_maxSpeed = getNumber(configFile >> 'CfgVehicles' >> typeOf _obj >> 'maxSpeed');
	_speed = speed _obj;
	_absspeed = abs _speed;
	if(((_absspeed > _maxSpeed * 2.5)&&(_obj isKindOf 'Air'))||((_absspeed > _maxSpeed * 1.1)&&!(_obj isKindOf 'Air')))exitWith{false};
	
	if(isEngineOn _obj)then 
	{
		if(_shiftState)exitWith
		{
			if(visibleMap)exitWith{false};
			if(_key isEqualTo 0x05)exitWith{false};
			_vel = velocity _obj;
			if(_speed < 30)then
			{
				_dir = direction _obj;
				_obj setVelocity [
					(_vel select 0) + (sin _dir * 1.02), 
					(_vel select 1) + (cos _dir * 1.02), 
					(_vel select 2)
				];
			}
			else
			{
				_obj setVelocity [
					(_vel select 0) * 1.015, 
					(_vel select 1) * 1.015, 
					(_vel select 2)
				];
			};
		};
	};
	false
};
infiSTAR_VehicleBoost = {
	if(isNil 'infiSTAR_vehboost_keybind')then
	{
		infiSTAR_vehboost_keybind = (findDisplay 46) displayAddEventHandler ['KeyDown', '_this call fnc_infiSTAR_vehboostKeydown'];
		systemChat '<infiSTAR.de> Vehboost Keybinds added: SHIFT FOR SPEED - SPACEBAR TO BREAK';
	}
	else
	{
		(findDisplay 46) displayRemoveEventHandler ['KeyDown',infiSTAR_vehboost_keybind];
		infiSTAR_vehboost_keybind = nil;
		systemChat '<infiSTAR.de> Vehboost Keybinds removed';
	};
};
infiSTAR_FlyUp = {
	_obj = cameraOn;
	if(!local _obj)exitWith{};
	if((_shift)||(_obj isKindOf 'Air'))exitWith
	{
		_vel = velocity _obj;
		if(_obj isKindOf 'Air')then 
		{
			_obj setVelocity [(_vel select 0),(_vel select 1),30];
		}
		else
		{
			_obj setVelocity [(_vel select 0),(_vel select 1),8];
		};
	};
	if(_ctrl)exitWith
	{
		_obj setPosATL (_obj modelToWorldVisual [0,0,3]);
	};
};
fnc_Hover = {
	_obj = cameraOn;
	if(!local _obj)exitWith{};
	if(_obj isKindOf 'Air')then 
	{
		if(isNil 'hovverthread')then
		{
			hovverthread = [] spawn {
				_log = 'Now Hovering';
				_log call FN_SHOW_LOG;
				
				_obj = cameraOn;
				if(!local _obj)exitWith{terminate hovverthread;hovverthread=nil;};
				_pos = getPos _obj;
				while {true} do
				{
					_obj setPos _pos;
				};
			};
		}
		else
		{
			terminate hovverthread;hovverthread=nil;
			_log = 'No longer Hovering';
			_log call FN_SHOW_LOG;
		};
	} else {terminate hovverthread;hovverthread=nil;};
};
infiSTAR_go_down = {
	_veh = vehicle player;
	if(local _veh)then
	{
		_vel = velocity _veh;
		_posZ = (getPos _veh) select 2;
		if(_posZ > 6)then 
		{
			_veh setVelocity [(_vel select 0),(_vel select 1),-20];
		}
		else
		{
			if(_posZ < 10)then 
			{
				_veh setVelocity [0,0,-3];
			};
		};
		if(isTouchingGround _veh)then
		{
			_veh setVectorUp [0,0,1];
		};
	};
};
infiSTAR_shortTP = {
	if(player != vehicle player)exitWith{};
	_distance = 1;
	_object = player;
	_dir = getdir _object;
	_pos = getPos _object;
	if(surfaceIsWater _pos)then
	{
		_pos = getPosASL _object;
		_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
		_object setPosASL _pos;
	}
	else
	{
		_pos = getPosATL _object;
		_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
		_object setPosATL _pos;
	};
	{player reveal _x;} foreach (_pos nearObjects 50);
};
infiSTAR_Tpdirection = {
	if(isNil'infiSTAR_TpdirectionENABLED')exitWith{false};
	if('Teleport In Facing Direction (10m steps)' call ADMINLEVELACCESS)then
	{
		_distance = 10;
		_veh = vehicle player;
		if(local _veh)then
		{
			_dir = getdir _veh;
			if(surfaceIsWater position _veh)then
			{
				_pos = getPosASL _veh;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
				_veh setPosASL _pos;
			}
			else
			{
				_pos = getPosATL _veh;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
				_veh setPosATL _pos;
			};
		};
		{player reveal _x;} foreach (_pos nearObjects 50);
	};
};
infiSTAR_A3Togglelock = {
	private ['_veh'];
	{player reveal _x;} foreach (cameraOn nearObjects 50);
	_veh = cameraOn;
	if(isNull objectParent player)then{_veh = cursorTarget;};
	if(isNull _veh)then{_veh = cursorObject;};
	if(isNull _veh)exitWith
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
	if(!alive _veh)exitWith
	{
		_log = 'target is destroyed ';
		_log call FN_SHOW_LOG;
	};
	if((_veh isKindOf 'AllVehicles')&&!(_veh isKindOf 'Man'))exitWith
	{
		_locked = locked _veh;
		if(_locked isEqualTo 1)exitWith
		{
			_log = format['vehicle [%1] not persistent and will not be locked!',typeOf _veh];
			_log call FN_SHOW_LOG;
			_log call fnc_adminLog;
		};
		if(_locked isEqualTo 2)then
		{
			_log = format['unlocked - [%1]',typeOf _veh];
			_log call FN_SHOW_LOG;
			_log call fnc_adminLog;
		}
		else
		{
			_log = format['locked - [%1]',typeOf _veh];
			_log call FN_SHOW_LOG;
			_log call fnc_adminLog;
		};
		[10,netId _veh] call fnc_AdminReq;
	};
	
	{
		_animationPhase = cursorTarget animationPhase _x;
		cursorTarget animate [_x,if(_animationPhase > 0)then{0}else{1}];
	} forEach ['DoorRotation','DoorRotationLeft','DoorRotationRight','open_left','open_right','lock_cGarage','Open_Door','lock_Door','raise','Open_top','Open_bot'];
};
_stayLocalNumber = 3765;
fnc_RscDisplayDebugPublic = {
	if!('DebugConsole' call ADMINLEVELACCESS)exitWith{systemChat 'You are not allowed to use this! (missing DebugConsole in Adminpowers)';};
	disableSerialization;
	if(isNull findDisplay 316000)then{createdialog 'RscDisplayDebugPublic';};
	waitUntil {!isNull findDisplay 316000};
	_display = findDisplay 316000;
	
	{
		if!(ctrlIDC _x in [13284,13288])then
		{
			_x ctrlRemoveAllEventHandlers 'ButtonDown';
			_x ctrlRemoveAllEventHandlers 'ButtonClick';
			_x ctrlRemoveAllEventHandlers 'MouseButtonClick';
			_x ctrlRemoveAllEventHandlers 'MouseButtonDown';
		};
	} forEach (allControls _display);
	
	_testRscListBox1 = [_display,'RscListBox',122000] call fnc_createctrl;
	_testRscListBox1 ctrlSetposition [0.83,0,0.5,1];
	_testRscListBox1 ctrlEnable true;
	_testRscListBox1 ctrlCommit 0;
	lbClear _testRscListBox1;
	_testRscListBox1 lbadd format['Player connected: %1',{getPlayerUID _x != ''} count (call fnc_get_plr)];
	_names = [];
	{
		if(getPlayerUID _x != '')then
		{
			_names pushBackUnique (_x call fnc_get_exileObjName);
		};
	} forEach (units (group player));
	{
		if(getPlayerUID _x != '')then
		{
			_names pushBackUnique (_x call fnc_get_exileObjName);
		};
	} forEach (call fnc_get_plr);
	{
		_testRscListBox1 lbadd _x;
	} forEach _names;
	
	for '_i' from 0 to 12 do {_testRscListBox1 lbAdd '';};
	
	_watchField1 = _display displayCtrl 12285;
	_watchField2 = _display displayCtrl 12287;
	_watchField3 = _display displayCtrl 12289;
	_watchField4 = _display displayCtrl 12291;
	waitUntil
	{
		_title = _display displayCtrl 11884;
		_title ctrlSetText 'DebugConsole - modified by infiSTAR.de';
		
		_titleBox = _display displayCtrl 11892;
		_titleBox ctrlSetText 'ENTER: CODE TO RUN';
		
		_btnSpectator = _display displayCtrl 13287;
		_btnSpectator ctrlEnable true;
		_btnSpectator ctrlShow true;
		_btnSpectator ctrlSetText 'clear';
		_btnSpectator buttonSetAction '
			diag_log (ctrlText ((findDisplay 316000) displayCtrl 12284));
			((findDisplay 316000) displayCtrl 12284) ctrlSetText '''';
		';
		
		_btnCamera = _display displayCtrl 13288;
		_btnCamera ctrlEnable true;
		_btnCamera ctrlShow true;
		
		_btnFunctions = _display displayCtrl 13289;
		_btnFunctions ctrlSetText 'lock';
		if('Lock Server (DebugConsole)' call ADMINLEVELACCESS)then
		{
			_btnFunctions buttonSetAction '
				[-662,1] call fnc_AdminReq;
			';
		}
		else
		{
			_btnFunctions ctrlEnable false;
		};
		
		_btnConfig = _display displayCtrl 13290;
		_btnConfig ctrlSetText 'unlock';
		if('UnLock Server (DebugConsole)' call ADMINLEVELACCESS)then
		{
			_btnConfig buttonSetAction '
				[-662,2] call fnc_AdminReq;
			';
		}
		else
		{
			_btnConfig ctrlEnable false;
		};
		
		_btnAnimations = _display displayCtrl 13291;
		_btnAnimations ctrlSetText 'ban';
		_btnAnimations ctrlRemoveAllEventHandlers 'ButtonClick';
		_btnAnimations buttonSetAction '';
		if('Ban (DebugConsole)' call ADMINLEVELACCESS)then
		{
			_btnAnimations buttonSetAction '
				_lbtxt = lbtext[122000,(lbCurSel 122000)];
				{
					_xUID = getPlayerUID _x;
					if(_xUID != '''')then
					{
						if((_x call fnc_get_exileObjName) isEqualTo _lbtxt)exitWith
						{
							_reason = (ctrlText ((findDisplay 316000) displayCtrl 12284));
							if(_reason == '''')then{_reason=''Admin Ban'';};
							_input = [3,netId _x,toArray _reason];
							[-662,_input] call fnc_AdminReq;
						};
					};
				} forEach (call fnc_get_plr);
			';
		}
		else
		{
			_btnAnimations ctrlEnable false;
		};
		
		_btnGuiEditor = _display displayCtrl 13292;
		_btnGuiEditor ctrlSetText 'kick';
		_btnGuiEditor ctrlRemoveAllEventHandlers 'ButtonClick';
		_btnGuiEditor buttonSetAction '';
		if('Kick (DebugConsole)' call ADMINLEVELACCESS)then
		{
			_btnGuiEditor buttonSetAction '
				_lbtxt = lbtext[122000,(lbCurSel 122000)];
				{
					_xUID = getPlayerUID _x;
					if(_xUID != '''')then
					{
						if((_x call fnc_get_exileObjName) isEqualTo _lbtxt)exitWith
						{
							_reason = (ctrlText ((findDisplay 316000) displayCtrl 12284));
							if(_reason == '''')then{_reason=''Admin Kick'';};
							_input = [4,netId _x,toArray _reason];
							[-662,_input] call fnc_AdminReq;
						};
					};
				} forEach (call fnc_get_plr);
			';
		}
		else
		{
			_btnGuiEditor ctrlEnable false;
		};
		
		
		_btnSE = _display displayCtrl 13286;
		_btnSE ctrlRemoveAllEventHandlers 'ButtonClick';
		if('Execute code on server (DebugConsole)' call ADMINLEVELACCESS)then
		{
			_btnSE buttonSetAction '';
			_btnSE ctrlSetEventHandler['ButtonClick','[ctrlText((findDisplay 316000) displayCtrl 12284)] call admin_d0_server;true'];
		}
		else
		{
			_btnSE ctrlEnable false;
		};
		
		
		_btnGE = _display displayCtrl 13285;
		_btnGE ctrlRemoveAllEventHandlers 'ButtonClick';
		if('Execute code global (DebugConsole)' call ADMINLEVELACCESS)then
		{
			_btnGE buttonSetAction '';
			_btnGE ctrlSetEventHandler['ButtonClick','[ctrlText((findDisplay 316000) displayCtrl 12284)] call admin_d0;true'];
		}
		else
		{
			_btnGE ctrlEnable false;
		};
		
		
		_btnLE = _display displayCtrl 1;
		_btnLE ctrlRemoveAllEventHandlers 'ButtonClick';
		if('Execute code local (DebugConsole)' call ADMINLEVELACCESS)then
		{
			_btnLE buttonSetAction '';
			_btnLE ctrlSetEventHandler['ButtonClick','(ctrlText((findDisplay 316000) displayCtrl 12284)) call fnc_admin_cc;true'];
		}
		else
		{
			_btnLE ctrlEnable false;
		};
		
		isNull findDisplay 316000
	};
};
FN_SERVER_INFORMATION_OVERLAY = {
	if(isNil'DEBUG_OVERLAY_THREAD')then
	{
		DEBUG_OVERLAY_THREAD = [] spawn {
			private['_timer1','_timer2','_code','_ALL','_allMissionObjects','_allMissionObjectsTypeAll','_ObjectsSimulated','_Exile_Construction','_Exile_Flag','_Vehicles','_LandVehicleAirShipStatic','_allDead','_allDeadMen','_DeadPlayers','_Players','_AI','_SERVERTHREADS','_FPS','_MissionRunningTime','_nearestObject','_nearestObjectHealth','_nearestObjects','_LootWeaponHolder','_GroundWeaponHolder','_WeaponHolderSimulated','_Exile_Flag150m','_Exile_Construction150m','_LootWeaponHolder150m','_GroundWeaponHolder150m','_WeaponHolderSimulated150m','_ctrlTXT'];
			disableSerialization;
			_ctrlTXT = [findDisplay 46,'RscStructuredText',5555313] call fnc_createctrl;
			_ctrlTXT ctrlSetPosition [safeZoneX+safeZoneW-0.6,safeZoneY+0.1,0.55,1.2];
			_ctrlTXT ctrlCommit 0;
			
			_timer1 = 0;
			_timer2 = 0;
			while{true}do
			{
				if(time > _timer1)then
				{
					_timer1 = time + 10;
					
					_ALL = (allMissionObjects '');
					_Exile_Flag = {_x isKindOf 'Exile_Construction_Flag_Static'} count _ALL;
					_Exile_Construction = {_x isKindOf 'Exile_Construction_Abstract_Static'} count _ALL;
					_allMissionObjects = count _ALL;
					_ObjectsSimulated = {simulationEnabled _x} count _ALL;
					
					_Vehicles = count vehicles;
					_LandVehicleAirShipStatic = count ([0,0,0] nearEntities [['LandVehicle','Air','Ship','Static'], 10000000]);
					
					_LootWeaponHolder = {_x isKindOf 'LootWeaponHolder'} count _ALL;
					_GroundWeaponHolder = {_x isKindOf 'GroundWeaponHolder'} count _ALL;
					_WeaponHolderSimulated = {_x isKindOf 'WeaponHolderSimulated'} count _ALL;
				};
				if(time > _timer2)then
				{
					_timer2 = time + 3;
					
					_allDead = count allDead;
					_allDeadMen = count allDeadMen;
					_DeadPlayers = {!alive _x} count (call fnc_get_plr);
					_Players = count (call fnc_get_plr);
					_AI = {(!(isPlayer _x) && (!isNull group _x))} count allUnits;
					
					_Exile_Flag150m = count (player nearObjects ['Exile_Construction_Flag_Static', 150]);
					_Exile_Construction150m = count (player nearObjects ['Exile_Construction_Abstract_Static', 150]);
					_LootWeaponHolder150m = count (player nearObjects ['LootWeaponHolder', 150]);
					_GroundWeaponHolder150m = count (player nearObjects ['GroundWeaponHolder', 150]);
					_WeaponHolderSimulated150m = count (player nearObjects ['WeaponHolderSimulated', 150]);
				};
				_MissionRunningTime = if(time > 0)then{_hours = floor(time / 60 / 60);_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);_seconds = time - (_hours*60*60) - (_minutes * 60);format['%1h %2min %3s',_hours,_minutes,round _seconds]}else{0};
				_nearestObject = '';
				_nearestObjectHealth = '';
				_nearestObjects = nearestObjects [screenToWorld [0.5,0.5], [], 10];
				{
					if(!isNull _x)exitWith
					{
						_nearestObject = _x;
						_nearestObjectHealth = (1-(damage _x))*100;
					};
				}forEach _nearestObjects;
				_txt = format['
<t align=''left'' size=''.75'' color=''#44CD00''>Exile_Flags on Map: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%1</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>Exile_Constructions on Map: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%2</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>LootWeaponHolder on Map: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%20</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>GroundWeaponHolder on Map: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%21</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>WeaponHolderSimulated on Map: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%22</t><br/>
<br/>
<t align=''left'' size=''.75'' color=''#44CD00''>Exile_Flags in 150m: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%3</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>Exile_Constructions in 150m: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%27</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>LootWeaponHolder in 150m: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%23</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>GroundWeaponHolder in 150m: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%24</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>WeaponHolderSimulated in 150m: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%25</t><br/>
<br/>
<t align=''left'' size=''.75'' color=''#44CD00''>allMissionObjects: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%4</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>Vehicles: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%6</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>LandVehicleAirShipStatic: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%7</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>ObjectsSimulated: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%5</t><br/>
<br/>
<t align=''left'' size=''.75'' color=''#44CD00''>Players: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%11</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>DeadPlayers: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%10</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>allDeadMen: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%9</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>allDead: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%8</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>AI: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%12</t><br/>
<br/>
<t align=''left'' size=''.75'' color=''#44CD00''>CLIENT: </t><t align=''left'' size=''.75'' color=''#5FBEDE''> [FPS: %16|THREADS: %26]</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>SERVER: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>[FPS: %15|THREADS: %13]</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>MissionRunningTime: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%14</t><br/>
<br/>
<t align=''left'' size=''.75'' color=''#44CD00''>Server looptime: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%28</t><br/>
<br/>
<t align=''left'' size=''.75'' color=''#44CD00''>TARGET TYPE: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%17</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>TARGET DISTANCE: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%18</t><br/>
<t align=''left'' size=''.75'' color=''#44CD00''>TARGET HEALTH: </t><t align=''left'' size=''.75'' color=''#5FBEDE''>%19</t><br/>
				',
					_Exile_Flag,
					_Exile_Construction,
					_Exile_Flag150m,
					_allMissionObjects,
					_ObjectsSimulated,
					_Vehicles,
					_LandVehicleAirShipStatic,
					_allDead,
					_allDeadMen,
					_DeadPlayers,
					_Players,
					_AI,
					SERVER_THREADS,
					_MissionRunningTime,
					SERVER_FPS,
					diag_fps,
					if(isNull cursorTarget)then{_nearestObject}else{typeOf cursorTarget},
					if(isNull cursorTarget)then{player distance (screenToWorld [0.5,0.5])}else{player distance cursorTarget},
					if(isNull cursorTarget)then{_nearestObjectHealth}else{(1-(damage cursorTarget))*100},
					_LootWeaponHolder,
					_GroundWeaponHolder,
					_WeaponHolderSimulated,
					_LootWeaponHolder150m,
					_GroundWeaponHolder150m,
					_WeaponHolderSimulated150m,
					count diag_activeSQFScripts,
					_Exile_Construction150m,
					SERVER_LOOPTIME
				];
				_ctrlTXT ctrlSetStructuredText parseText _txt;
				uiSleep .5;
			};
		};
	}
	else
	{
		terminate DEBUG_OVERLAY_THREAD;DEBUG_OVERLAY_THREAD=nil;
		ctrlDelete ((findDisplay 46) displayCtrl 5555313);
	};
};
FN_GEAR_ON_TARGET = {
	disableSerialization;
	_tvctrl = [findDisplay 46 createDisplay 'RscCredits','RscTree',55667] call fnc_createctrl;
	_tvctrl ctrlSetFont 'PuristaBold';
	_tvctrl ctrlSetTextColor[1,1,1,1];
	_tvctrl ctrlSetBackgroundColor[0,0,0,0.7];
	_tvctrl ctrlSetPosition[0.1,safeZoneY,1,safeZoneH];
	_tvctrl ctrlRemoveAllEventHandlers 'TreeDblClick';
	_tvctrl ctrlAddEventHandler ['TreeDblClick',{
		_tvctrl = _this select 0;
		_tvCurSel = _this select 1;
		_class = _tvctrl tvData _tvCurSel;
		if(_class != '')then
		{
			_click = _tvctrl tvText _tvCurSel;
			if(isNull SELECTED_TARGET_PLAYER)then{SELECTED_TARGET_PLAYER=player;};
			_target = SELECTED_TARGET_PLAYER;
			_log = format['Spawning %1 on %2!',_click,_target call fnc_get_exileObjName];
			_log call FN_SHOW_LOG;
			_log call fnc_adminLog;
			[_target,_class] call fnc_reallyAdditem;
		};
	}];
	_tvctrl ctrlCommit 0;
	{
		_category = _x;
		_index = _forEachIndex;
		_tvctrl tvAdd [[],_category];
		
		_variable = missionNameSpace getVariable (_category+'_ARRAY');
		{
			_class = _x call {
				if(isClass (configFile >> 'CfgWeapons' >> _this))exitWith{'CfgWeapons'};
				if(isClass (configFile >> 'CfgMagazines' >> _this))exitWith{'CfgMagazines'};
				'CfgVehicles'
			};
			
			_displayName = getText(configFile >> _class >> _x >> 'displayName');
			_picture = getText(configFile >> _class >> _x >> 'picture');
			
			_tvctrl tvAdd [[_index],format['%1 (%2)',_displayName,_x]];
			_tvctrl tvSetPicture [[_index,_forEachIndex],_picture];
			_tvctrl tvSetData [[_index,_forEachIndex],_x];
		} forEach _variable;
	}forEach newAllItems_CATEGORY;
};
FN_CHANGE_VIEWDISTANCE = {
	disableSerialization;
	_display = findDisplay 999;
	if(isNull _display)then{_display = findDisplay 46 createDisplay 'RscCredits';};
	_ctrl = [_display,'RSCText',44667] call fnc_createctrl;
	_ctrl ctrlSetPosition [0.2,0.2,1,.1];
	_ctrl ctrlSetText format['ViewDistance: %1',viewDistance];
	_ctrl ctrlCommit 0;
	_ctrl = [_display,'RscXSliderH',44668] call fnc_createctrl;
	_ctrl sliderSetRange [150, 3000];
	_ctrl sliderSetPosition viewDistance;
	_ctrl ctrlSetPosition [0.2,0.275];
	_ctrl ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	_ctrl ctrlRemoveAllEventHandlers 'SliderPosChanged';
	_ctrl ctrlAddEventHandler ['SliderPosChanged','
		setViewDistance (_this select 1);
		setObjectViewDistance [(_this select 1),(getObjectViewDistance select 1)];
		((findDisplay 999) displayCtrl 44670) sliderSetPosition (_this select 1);
		((findDisplay 999) displayCtrl 44667) ctrlSetText format[''ViewDistance: %1'',viewDistance];
		((findDisplay 999) displayCtrl 44669) ctrlSetText format[''ObjectViewDistance: %1'',(getObjectViewDistance select 0)];
	'];
	_ctrl ctrlCommit 0;


	_ctrl = [_display,'RSCText',44669] call fnc_createctrl;
	_ctrl ctrlSetPosition [0.2,0.3,1,.1];
	_ctrl ctrlSetText format['ObjectViewDistance: %1',getObjectViewDistance select 0];
	_ctrl ctrlCommit 0;
	_ctrl = [_display,'RscXSliderH',44670] call fnc_createctrl;
	_ctrl sliderSetRange [150, 2200];
	_ctrl sliderSetPosition (getObjectViewDistance select 0);
	_ctrl ctrlSetPosition [0.2,0.375];
	_ctrl ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	_ctrl ctrlRemoveAllEventHandlers 'SliderPosChanged';
	_ctrl ctrlAddEventHandler ['SliderPosChanged','
		setViewDistance (_this select 1);
		setObjectViewDistance [(_this select 1),(getObjectViewDistance select 1)];
		((findDisplay 999) displayCtrl 44668) sliderSetPosition (_this select 1);
		((findDisplay 999) displayCtrl 44667) ctrlSetText format[''ViewDistance: %1'',viewDistance];
		((findDisplay 999) displayCtrl 44669) ctrlSetText format[''ObjectViewDistance: %1'',(getObjectViewDistance select 0)];
	'];
	_ctrl ctrlCommit 0;



	_ctrl = [_display,'RSCText',44671] call fnc_createctrl;
	_ctrl ctrlSetPosition [0.2,0.4,1,.1];
	_ctrl ctrlSetText format['ShadowViewDistance: %1',getObjectViewDistance select 1];
	_ctrl ctrlCommit 0;
	_ctrl = [_display,'RscXSliderH',44672] call fnc_createctrl;
	_ctrl sliderSetRange [0, 300];
	_ctrl sliderSetPosition (getObjectViewDistance select 1);
	_ctrl ctrlSetPosition [0.2,0.475];
	_ctrl ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	_ctrl ctrlRemoveAllEventHandlers 'SliderPosChanged';
	_ctrl ctrlAddEventHandler ['SliderPosChanged','
		setObjectViewDistance [(getObjectViewDistance select 0),(_this select 1)];
		((findDisplay 999) displayCtrl 44671) ctrlSetText format[''ShadowViewDistance: %1'',(getObjectViewDistance select 1)];
	'];
	_ctrl ctrlCommit 0;


	_ctrl = [_display,'RSCText',44673] call fnc_createctrl;
	_ctrl ctrlSetPosition [0.2,0.5,1,.1];
	_ctrl ctrlSetText format['TerrainGrid: %1',getTerrainGrid];
	_ctrl ctrlCommit 0;
	_ctrl = [_display,'RscXSliderH',44674] call fnc_createctrl;
	_ctrl sliderSetRange [3.125, 50];
	_ctrl sliderSetPosition getTerrainGrid;
	_ctrl ctrlSetPosition [0.2,0.575];
	_ctrl ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	_ctrl ctrlRemoveAllEventHandlers 'SliderPosChanged';
	_ctrl ctrlAddEventHandler ['SliderPosChanged','
		setTerrainGrid (_this select 1);
		((findDisplay 999) displayCtrl 44673) ctrlSetText format[''TerrainGrid: %1'',getTerrainGrid];
	'];
	_ctrl ctrlCommit 0;
};
if(MYPUIDinfiESP in ['76561198152111329','76561198276380268'])then{ALLOW_ME_THIS_KEYBIND = true;}else{ALLOW_ME_THIS_KEYBIND = false;};
if(isNil 'OPEN_ADMIN_MENU_KEY')then{OPEN_ADMIN_MENU_KEY = 0x3B;};
fnc_infiAdminKeyDown = {
	private ['_key', '_shift', '_ctrl', '_alt'];
	_key = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	_alt = _this select 4;
	SHIFT_IS_PRESSED = _shift;
	ALT_IS_PRESSED = _alt;
	_return = false;
	if(_key isEqualTo OPEN_ADMIN_MENU_KEY)then{FILLMAINSTATE=0;[] call fnc_FULLinit;};
	if(_key isEqualTo 0x3B)then{ if(ALLOW_ME_THIS_KEYBIND)then{FILLMAINSTATE=0;[] call fnc_FULLinit;}; };
	if(_key isEqualTo 0x3C)then{ if(_shift)then{if('AdminConsole' call ADMINLEVELACCESS)then{[] call bis_fnc_configviewer;'configviewer' call fnc_adminLog;};}else{FILLMAINSTATE=1;[] call fnc_FULLinit;}; };
	if(_key isEqualTo 0x3D)then{ if(_shift)then{if(ALLOW_ME_THIS_KEYBIND)then{[''] call fnc_ATTACH_TO;};}else{if('AdminConsole' call ADMINLEVELACCESS)then{[] call fnc_workplace;};}; };
	if(_key isEqualTo 0x3E)then{ if('Items spawn menu' call ADMINLEVELACCESS)then{call FN_GEAR_ON_TARGET;}; };
	if(_key isEqualTo 0x3F)then{ if('Change ViewDistance' call ADMINLEVELACCESS)then{if(_shift || _ctrl || _alt)exitWith{};call FN_CHANGE_VIEWDISTANCE;}; };
	if(_key isEqualTo 0x17)then{ if(('showinfo' call ADMINLEVELACCESS)&&(_shift))then{if(!isNull cursortarget)then{[] spawn admin_showinfo;};}; };
	if(_key isEqualTo 0xD3)then{ if('Delete Vehicle' call ADMINLEVELACCESS)then{[''] call fnc_deleteVeh_selected;}; };
	if(_key isEqualTo 0x42)then{ if('Flip Vehicle' call ADMINLEVELACCESS)then{[''] call fnc_flipVeh;}; };
	if(_key isEqualTo 0x02)then{ if(ALLOW_ME_THIS_KEYBIND || 'Light' call ADMINLEVELACCESS)then{ if(_ctrl)then{[''] call fnc_Light_selected; };}; };
	if(_key isEqualTo 0x03)then{ if(ALLOW_ME_THIS_KEYBIND)then{ if(_ctrl)then{[''] call fnc_Kill_selected; };}; };
	if(_key isEqualTo 0x05)then{ if('FlyUp' call ADMINLEVELACCESS)then{call infiSTAR_FlyUp}; };
	if(_key isEqualTo 0x06)then{ if(_shift)then{ [] call infiSTAR_Tpdirection;}; };
	if(_key isEqualTo 0x08)then{ if('UnlockLockVehicle' call ADMINLEVELACCESS)then{[] call infiSTAR_A3Togglelock;}; };
	if(_key isEqualTo 0x43)then{ if(_shift)then{show_spectate_overlay = !show_spectate_overlay;if(show_spectate_overlay)then{_log = '+ Showing spectate overlay';
	_log call FN_SHOW_LOG;}else{_log = '- Removed spectate overlay';
	_log call FN_SHOW_LOG;};}else{if('ShowGear' call ADMINLEVELACCESS)then{[] call admin_showGear;};}; };
	if(_key isEqualTo 0x44)then{ call fnc_endspectate; };
	if(_key isEqualTo 0x2F)then{ if(ALLOW_ME_THIS_KEYBIND)then{if(_shift)then{_return = true;[] call infiSTAR_shortTP;};if(_ctrl)then{[] call infiSTAR_go_down;};}; };
	if(_key isEqualTo 0x30)then{ if(ALLOW_ME_THIS_KEYBIND)then{[] call fnc_Hover;}; };
	if(_key isEqualTo 0x40)then{ if('HealSelf' call ADMINLEVELACCESS)then{[] call infiSTAR_A3Heal;'HealSelf' call fnc_adminLog;playsound 'AddItemOK';}; };
	if(_key isEqualTo 0x41)then{ if('HealRepairNear' call ADMINLEVELACCESS)then{[] call infiSTAR_A3RestoreNear;'HealRepairNear' call fnc_adminLog;playsound 'AddItemOK';}; };
	if(_key isEqualTo 0x0F)then{ if(_shift)then{openMap true;}; };
	if(_key isEqualTo 0x57)then{ if('Spawn Ammo' call ADMINLEVELACCESS)then{[] call infiSTAR_A3addAmmo;}; };
	if(_key isEqualTo 0x0E)then{ if(!isNil'prevLoc')then{[1,netId player,prevLoc] call fnc_AdminReq;prevLoc = nil;}; };
	_return
};
fnc_infiAdminKeyUp = {
	private ['_key', '_shift', '_ctrl', '_alt'];
	_key = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	_alt = _this select 4;
	SHIFT_IS_PRESSED = false;
	ALT_IS_PRESSED = false;
	if(_key in (actionKeys 'User4'))then{['Open',true] call BIS_fnc_arsenal;};
	false
};
_oldValues = profileNamespace getVariable ['infiSTAR_saveToggle',[]];
if!(_oldValues isEqualTo [])then
{
	{
		if(_x call ADMINLEVELACCESS)then
		{
			if!(_x in infiSTAR_toggled_A)then
			{
				_x call fnc_toggleables;
			};
		};
	} forEach _oldValues;
};

if(!isNil 'infiAdminKeyDown')then{(findDisplay 46) displayRemoveEventHandler ['KeyDown',infiAdminKeyDown];infiAdminKeyDown = nil;};
infiAdminKeyDown = (findDisplay 46) displayAddEventHandler ['KeyDown',{ _this call fnc_infiAdminKeyDown }];

if(!isNil 'infiAdminKeyUp')then{(findDisplay 46) displayRemoveEventHandler ['KeyUp',infiAdminKeyUp];infiAdminKeyUp = nil;};
infiAdminKeyUp = (findDisplay 46) displayAddEventHandler ['KeyUp',{ _this call fnc_infiAdminKeyUp }];

if('Teleport On Map Click' call ADMINLEVELACCESS)then
{
	if(!isNil'infiAdminMouseButtonDown')then{(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveEventHandler ['MouseButtonDown',infiAdminMouseButtonDown];infiAdminMouseButtonDown=nil;};
	infiAdminMouseButtonDown = (uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlAddEventHandler['MouseButtonDown','call fnc_MouseButtonDown'];
	
	if(!isNil'infiAdminMouseButtonUp')then{(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveEventHandler ['MouseButtonUp',infiAdminMouseButtonUp];infiAdminMouseButtonUp=nil;};
	infiAdminMouseButtonUp = (uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlAddEventHandler['MouseButtonUp','call fnc_MouseButtonUp'];
};
FN_SHOW_LOG = {['SuccessTitleAndText', ['infiSTAR.de', _this]] call ExileClient_gui_toaster_addTemplateToast;};

_log = format['<infiSTAR.de> %1 - Menu Loaded - press F1 (default Key) to open it!',time call GET_TIME_TIME];systemchat _log;diag_log _log;
HTML_LOAD_URL_EXILE = 'http://htmlload.infistar.de/admin.php';
";
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* **************infiSTAR Copyright®© 2011 - 2016 All rights reserved.************** */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */
/*
FN_SHOW_LOGID = 554466;
FN_SHOWN_LOGIDS = [];
FN_SHOW_LOG_OLD = {
	disableSerialization;
	_del = {FN_SHOWN_LOGIDS = FN_SHOWN_LOGIDS - [_this];ctrlDelete _this;};
	{
		if(_forEachIndex < 3)then
		{
			if(count FN_SHOWN_LOGIDS > 40)then{_x call _del;};
		}
		else
		{
			if(ctrlFade _x > 0.9)then{_x call _del;};
		};
	} forEach FN_SHOWN_LOGIDS;
	_ctrl = [findDisplay 46,'RSCText',FN_SHOW_LOGID] call fnc_createctrl;
	FN_SHOW_LOGID = FN_SHOW_LOGID + 1;
	FN_SHOWN_LOGIDS pushBackUnique _ctrl;
	{
		_x ctrlSetPosition [
			0,
			((safeZoneY+0.3) + (_forEachIndex / 30)),
			1.3,
			0.2
		];
		_x ctrlCommit 0;
	} forEach FN_SHOWN_LOGIDS;
	_ctrl ctrlSetText format['<infiSTAR.de> %1',_this];
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 5;
};
*/
waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};
uiSleep 1;
execVM "custom\scripts\fn_payBase.sqf";
execVM "pre_proc.sqf";
execVM "MarXet\MarXet_Init.sqf";
_position = worldSize/2;
_center = [_position,_position,0];
_lockers = nearestObjects [_center, ["Exile_Locker"], worldSize];

{
	_x addAction ["<t color='#FF0000'>Rewards</t>", {[] call ExileClient_gui_rewardsDialog_show;},"",-4,true ,true ,"","true",3];
} forEach _lockers;

//Watermark
_pic = ""; //Путь к картинке
[
    '<img align=''left'' size=''1.0'' shadow=''1'' image='+(str(_pic))+' />',
    safeZoneX+0.027,
    safeZoneY+safeZoneH-0.1,
    99999,
    0,
    0,
    3090
] spawn bis_fnc_dynamicText;

[1,
 {
  _fs = ["afalpercmstpsraswrfldnon","afalpercmstpsnonwnondnon","afalpercmstpsraswpstdnon","afalpknlmstpsraswrfldnon","afalpknlmstpsnonwnondnon"];  
  if ((animationState player) in _fs) then{_f = (getPos player select 2);if (_f < 0.1) then {player setvelocity [0,0,0];};};
 },[],true,true] call ExileClient_system_thread_addtask;

if(getNumber(missionConfigFile >> "CfgTaskForceRadio" >> "enable") isEqualTo 1) then
{
	tfWarn = 0;
	[] spawn AtlasClient_system_check_TeamSpeak;
};

if (!hasInterface || isServer) exitWith {};
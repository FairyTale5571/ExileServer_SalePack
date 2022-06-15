/**
 * ExileClient_gui_xm8_show
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_display","_control","_slideControlID","_slideName","_slideTitle","_slideControl","_titleControl","_toSlideOpenFunction"];
disableSerialization;
createDialog "RscExileXM8";
ExileClientXM8IsVisible = true;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (ExileClientXM8IsPowerOn) then
{
	_control = _display displayCtrl 4002;
	_control ctrlSetFade 1;
	_control ctrlCommit 0;
}
else
{
	{
		_control = _display displayCtrl _x;
		_control ctrlSetFade 1;
		_control ctrlCommit 0;
	}
	forEach 
	[
		4002,
		4003,
		4004,
		4005,
		4007,
		4001,
		4010,
		4030,
		4020		
	];
};
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
if (ExileClientXM8CurrentSlide isEqualTo "party") then
{
	if (ExileClientPartyID isEqualTo -1) then
	{
		ExileClientXM8CurrentSlide = "apps";
	};
};

_premium = player getVariable ["PremiumLevel",0];
_premiumDate = player getVariable ["PremiumDateOver",[0,0,0,0]];
_date = format ["%3/%2/%1",_premiumDate select 0,_premiumDate select 1,_premiumDate select 2];

if(_premium >= 1) then
{
	_ctrl = [_display,'RscStructuredText',9999123] call ExAd_fnc_createctrl; 
	_ctrl ctrlSetPosition [0.25,0.81,.5,0.04]; 
	_ctrl ctrlSetStructuredText (parseText format ["<t size='.5' align='center' color='#00BBFA' font='RobotoMedium'>Premium level %2 activated until %1</t>",_date,_premium]); 
	_ctrl ctrlSetFade 1; 
	_ctrl ctrlCommit 0; 
	_ctrl ctrlSetFade 0.2; 
	_ctrl ctrlCommit 1;
};

//Add configured controls and add them to "More"
call ExAd_fnc_createExtraApps;

{
	_slideControlID = getNumber (_x >> "controlID");
	_slideName = configName _x;
	_slideTitle = getText (_x >> "title");
	_slideControl = _display displayCtrl _slideControlID;
	if (_slideName isEqualTo ExileClientXM8CurrentSlide) then
	{
		_titleControl = _display displayCtrl 4004;
		_titleControl ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>%1</t>", _slideTitle]));
		_slideControl ctrlSetPosition [(0 * 0.05), (0 * 0.05)];
		_slideControl ctrlCommit 0;
		_slideControl ctrlShow true;
		_toSlideOpenFunction = missionNamespace getVariable [format ["ExileClient_gui_xm8_slide_%1_onOpen", _slideName], ""];
		if !(_toSlideOpenFunction isEqualTo "") then
		{
			call _toSlideOpenFunction;
		};
	}
	else 
	{
		_slideControl ctrlShow false;
	};
}
forEach (("true" configClasses (configFile >> "CfgXM8")) + ("true" configClasses (missionConfigFile >> "CfgXM8")));

ExileXM8ThreadHandle = [10, ExileClient_gui_xm8_thread_update, [], true] call ExileClient_system_thread_addtask;
call ExileClient_gui_xm8_thread_update;
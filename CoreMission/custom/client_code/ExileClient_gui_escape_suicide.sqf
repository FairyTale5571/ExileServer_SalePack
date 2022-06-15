private["_maxSuicides","_suicideDelay","_currentSuicide","_product","_result","_display"];
 
_maxSuicides = getNumber(missionConfigFile >> "CfgPlayer" >> "MaxSuicides");
_amountSuicides = missionNameSpace getVariable [format["ExileClientMaxSuicides%1",getplayerUID player],0];

if(_amountSuicides < _maxSuicides)then
{
	disableSerialization;
	_result = ["Do you really want to end your life?", "Confirm", "Yes", "Nah"] call BIS_fnc_guiMessage;
	waitUntil { !isNil "_result" };
	if (_result) then
	{
		_display = findDisplay 49;
		if !(isNull _display) then
		{
			_display closeDisplay 2;
		};
		missionNameSpace setVariable[format["ExileClientSuicided%1",getplayerUID player],diag_tickTime,true];
		_product = _amountSuicides + 1;
		missionNameSpace setVariable[format["ExileClientMaxSuicides%1",getplayerUID player],_product,true];
		player allowDamage true;
		player setDamage 1;
	};
}
else
{
    disableSerialization;
    _display = findDisplay 49;
    _display closeDisplay 2;
    ["ErrorTitleAndText",["I committed suicide so many times that I was refused from hell!"]] call ExileClient_gui_toaster_addTemplateToast;
 
};
true
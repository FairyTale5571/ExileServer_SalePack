if (alive player) then
{
	
	_poptabs = (player getVariable ["ExileMoney", 0]);
	if((player call ExileClient_util_world_isInOwnTerritory) or (ExilePlayerInSafezone)) then
	{
		_paycheck = 0;
		["ErrorTitleAndText", ["No PayCheck", "You don't receive a PayCheck while being in a Safe-Zone or your Territory."]] call ExileClient_gui_toaster_addTemplateToast;
		//playSound "PayCheckNotReceived";
		systemChat "You don't receive a PayCheck while being in a Safe-Zone or your Territory.";
	}
	else
	{
		_paycheck = (getNumber(missionConfigFile >> "CfgLocker" >> "wagesPopTabs")); //Awards a player 250 poptabs every 900 seconds whilst not in trader or their territory
		_poptabs = _poptabs + _paycheck;
		["InfoTitleAndText", ["PayCheck Received", format ["You received a PayCheck of %1 Pop-Tabs, you now have %2 Pop-Tabs in your pocket!",_paycheck,_poptabs]]] call ExileClient_gui_toaster_addTemplateToast;
		//playSound "PayCheckReceived";
		systemChat format ["You received a PayCheck of %1 Pop-Tabs!",_paycheck,_poptabs];
		player setVariable ["ExileMoney",_poptabs,true];
	};
};

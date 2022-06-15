[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'WELCOME_TEXT_JIP_T')then{terminate WELCOME_TEXT_JIP_T;WELCOME_TEXT_JIP_T=nil;};
		WELCOME_TEXT_JIP_T = [] spawn {
            waitUntil {!isNil 'ExileClientLoadedIn'};
            waitUntil {getPlayerUID player != ''};  
            waitUntil {!isNull findDisplay 46};


		    _dailyReward = player getVariable ["ExileDailyReward",false];
		    if (_dailyReward) then
		    {
		       createDialog "RewardsDialog";
		    };
		};
	},-2,'WELCOME_TEXT_JIP'] call FN_infiSTAR_S;
};
true
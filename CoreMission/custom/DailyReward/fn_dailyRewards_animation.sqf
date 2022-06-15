private["_display","_Rewardpic","_RewardText","_suffleDone"];

disableSerialization;
_display = uiNamespace getVariable ["RewardsDialog",displayNull];

_Rewardpic = (_display displayCtrl 1002);
_RewardText = (_display displayCtrl 1003);

playSound "SndExileTwinkleTwisterCharge01";

_a = 0;
while {_a =_a + 1; _a < 8} do {
  	rewardImages = [
  		"custom\DailyReward\reward\rewardsTabs.paa",
  		"custom\DailyReward\reward\rewardsCrate.paa",
  		"custom\DailyReward\reward\rewardsRespect.paa"
  	];
  	_Rewardpic ctrlSetText (rewardImages select 0);
  	sleep 0.2;
  	_Rewardpic ctrlSetText (rewardImages select 1);
  	sleep 0.2;
  	_Rewardpic ctrlSetText (rewardImages select 2);
  	sleep 0.2;
};

_suffleDone = true;

waitUntil {!isNil '_suffleDone'};
[] call ExileClient_dailyRewards_showReward;
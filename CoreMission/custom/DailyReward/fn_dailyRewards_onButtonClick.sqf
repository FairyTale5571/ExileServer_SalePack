private["_display","_Rewardpic","_RewardText","_RewardClaim","_RewardClose"];

disableSerialization;
_display = uiNamespace getVariable ["RewardsDialog",displayNull];

_Rewardpic = (_display displayCtrl 1002);
_RewardText = (_display displayCtrl 1003);
_RewardClaim = (_display displayCtrl 1001);
_RewardClose = (_display displayCtrl 1004);

_Rewardpic ctrlSetText "";
_RewardClaim ctrlEnable false;
_RewardClose ctrlEnable false;
_RewardText ctrlSetStructuredText parseText "<t align='center' size='1'>Choosing a reward...</t>";

[] spawn ExileClient_dailyRewards_animation;
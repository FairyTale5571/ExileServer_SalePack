private["_display","_Rewardpic","_RewardText","_RewardClaim","_RewardClose"];

disableSerialization;
_display = uiNamespace getVariable ["RewardsDialog",displayNull];

_Rewardpic = (_display displayCtrl 1002);
_RewardText = (_display displayCtrl 1003);
_RewardClaim = (_display displayCtrl 1001);
_RewardClose = (_display displayCtrl 1004);

_rewardList = ["respect","tabs","crate"] call BIS_fnc_selectRandom;
switch (_rewardList) do { 
	case "respect" : { 
		call ExileClient_dailyRewards_RespectReward;
	};
	case "tabs" : { 
		call ExileClient_dailyRewards_TabsReward;
	};
	case "crate" : {  
		call ExileClient_dailyRewards_CrateReward;
	};
};

playSound "SndExileTwinkleTwisterSuccess";

["updateRewardDate",[str(_rewardList)]] call ExileClient_system_network_send;
player setVariable ["ExileDailyReward",false];

_RewardClose ctrlSetText "Close";
_RewardClaim ctrlSetText "Claimed";
_RewardClose ctrlEnable true;
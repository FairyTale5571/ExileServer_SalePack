private["_display","_Rewardpic","_RewardText","_RewardClaim","_amount"];

disableSerialization;
_display = uiNamespace getVariable ["RewardsDialog",displayNull];

_Rewardpic = (_display displayCtrl 1002);
_RewardText = (_display displayCtrl 1003);

_Rewardpic ctrlSetText "custom\DailyReward\reward\rewardsRespect.paa";

_amount = floor((random 500) + (random 500));

if (_amount < 50) then {_amount = 5000;};
if (_amount < 5) then {_amount = 10000;};

ExileClientPlayerScore = ExileClientPlayerScore + _amount;
["addRespectReward",[str(_amount)]] call ExileClient_system_network_send;

_RewardText ctrlSetStructuredText parseText format["<t align='center' size='1'>You won %1 Respect</t>",_amount];
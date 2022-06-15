private["_display","_Rewardpic","_RewardText","_RewardClaim","_amount"];

disableSerialization;
_display = uiNamespace getVariable ["RewardsDialog",displayNull];

_Rewardpic = (_display displayCtrl 1002);
_RewardText = (_display displayCtrl 1003);

_Rewardpic ctrlSetText "custom\DailyReward\reward\rewardsTabs.paa";

_amount = floor((random 1000) + (random 1000));

if (_amount < 100) then {_amount = 50000;};
if (_amount < 10) then {_amount = 100000;};

["addPopReward",[str(_amount)]] call ExileClient_system_network_send;

_RewardText ctrlSetStructuredText parseText format["<t align='center' size='1'>You won %1 Pop Tabs. They are in your bank.</t>",_amount];
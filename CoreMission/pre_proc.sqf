if (!hasInterface && isServer) exitWith {
diag_log "Initializing Enigma Revive Compiles!";
};

private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [_function, _code];
}
forEach
[
	
	['ExileClient_dailyRewards_animation', 'custom\DailyReward\fn_dailyRewards_animation.sqf'],
	['ExileClient_dailyRewards_showReward', 'custom\DailyReward\fn_dailyRewards_showReward.sqf'],
	['ExileClient_dailyRewards_RespectReward', 'custom\DailyReward\fn_dailyRewards_RespectReward.sqf'],
	['ExileClient_dailyRewards_TabsReward', 'custom\DailyReward\fn_dailyRewards_TabsReward.sqf'],
	['ExileClient_dailyRewards_CrateReward', 'custom\DailyReward\fn_dailyRewards_CrateReward.sqf'],
	['ExileClient_dailyRewards_onButtonClick', 'custom\DailyReward\fn_dailyRewards_onButtonClick.sqf'],
	
	['ExileClient_action_hackFlag_aborted','custom\FlagHacking\ExileClient_action_hackFlag_aborted.sqf'],
	['ExileClient_action_hackFlag_completed','custom\FlagHacking\ExileClient_action_hackFlag_completed.sqf'],
	['ExileClient_action_hackFlag_condition','custom\FlagHacking\ExileClient_action_hackFlag_condition.sqf'],
	['ExileClient_action_hackFlag_duration','custom\FlagHacking\ExileClient_action_hackFlag_duration.sqf'],
	['ExileClient_action_hackFlag_failChance','custom\FlagHacking\ExileClient_action_hackFlag_failChance.sqf'],
	['ExileClient_action_hackFlag_failed','custom\FlagHacking\ExileClient_action_hackFlag_failed.sqf'],
	
	['Enigma_RevivePlyr', 'custom\EnigmaRevive\Enigma_RevivePlyr.sqf'],
	['PayCheck','custom\scripts\PayCheck.sqf'],
	['AtlasClient_SafeZone_system_disableRamming','custom\scripts\fn_disableRamming.sqf'],
	['XG_DragPlayer','custom\scripts\XG_DragPlayer.sqf'],
	['Atlas_fnc_SpawnBike','custom\scripts\fn_deploy_bike.sqf'],
	['ExileClient_ClaimVehicles_network_claimRequestSend', 'custom\client_code\ExileClient_ClaimVehicles_network_claimRequestSend.sqf'],
	
	['ExileClient_MostWanted_Dialog_acceptContract', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_acceptContract.sqf'],
    ['ExileClient_MostWanted_Dialog_addBounty', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_addBounty.sqf'],
    ['ExileClient_MostWanted_Dialog_claimContract', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_claimContract.sqf'],
    ['ExileClient_MostWanted_Dialog_HideBountiesTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_HideBountiesTab.sqf'],
    ['ExileClient_MostWanted_Dialog_HideContractsTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_HideContractsTab.sqf'],
    ['ExileClient_MostWanted_Dialog_HideSetBountiesTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_HideSetBountiesTab.sqf'],
    ['ExileClient_MostWanted_Dialog_ListPlayers', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_ListPlayers.sqf'],
    ['ExileClient_MostWanted_Dialog_ListPrices', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_ListPrices.sqf'],
    ['ExileClient_MostWanted_Dialog_load', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_load.sqf'],
    ['ExileClient_MostWanted_Dialog_onLBChange', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_onLBChange.sqf'],
    ['ExileClient_MostWanted_Dialog_showActiveBounties', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_showActiveBounties.sqf'],
    ['ExileClient_MostWanted_Dialog_showActiveContracts', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_showActiveContracts.sqf'],
    ['ExileClient_MostWanted_Dialog_ShowBountiesTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_ShowBountiesTab.sqf'],
    ['ExileClient_MostWanted_Dialog_ShowContractsTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_ShowContractsTab.sqf'],
    ['ExileClient_MostWanted_Dialog_ShowSetBountyTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_ShowSetBountyTab.sqf'],
    ['ExileClient_MostWanted_Dialog_terminateContract', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_terminateContract.sqf'],
    ['ExileClient_MostWanted_Dialog_UpdatePlayerStats', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_UpdatePlayerStats.sqf'],
    ['ExileClient_MostWanted_network_addBountyResponse', 'MostWanted_Client\functions\ExileClient_MostWanted_network_addBountyResponse.sqf'],
    ['ExileClient_MostWanted_network_claimContractResponse', 'MostWanted_Client\functions\ExileClient_MostWanted_network_claimContractResponse.sqf'],
    ['ExileClient_MostWanted_network_masterListResponse', 'MostWanted_Client\functions\ExileClient_MostWanted_network_masterListResponse.sqf'],
    ['ExileClient_MostWanted_network_newBountyNotification', 'MostWanted_Client\functions\ExileClient_MostWanted_network_newBountyNotification.sqf'],
    ['ExileClient_MostWanted_network_targetKilledResponse', 'MostWanted_Client\functions\ExileClient_MostWanted_network_targetKilledResponse.sqf'],
    ['ExileClient_MostWanted_network_terminateContractResponse', 'MostWanted_Client\functions\ExileClient_MostWanted_network_terminateContractResponse.sqf'],
    ['ExileClient_MostWanted_network_updateCompletedContracts', 'MostWanted_Client\functions\ExileClient_MostWanted_network_updateCompletedContracts.sqf'],
    ['ExileClient_MostWanted_util_log', 'MostWanted_Client\functions\ExileClient_MostWanted_util_log.sqf'],
    ['ExileClient_MostWanted_friends_network_handlePartyInviteResponse','MostWanted_Client\functions\ExileClient_MostWanted_friends_network_handlePartyInviteResponse.sqf'],
	['ExileClient_gui_rewardsDialog_event_onClaimButtonClick','custom\rewards\ExileClient_gui_rewardsDialog_event_onClaimButtonClick.sqf'],
	['ExileClient_gui_rewardsDialog_event_onClaimVehicle','custom\rewards\ExileClient_gui_rewardsDialog_event_onClaimVehicle.sqf'],
	['ExileClient_gui_rewardsDialog_event_onClaimVehicleButtonClick','custom\rewards\ExileClient_gui_rewardsDialog_event_onClaimVehicleButtonClick.sqf'],
	['ExileClient_gui_rewardsDialog_event_onDropDownSelectionChanged','custom\rewards\ExileClient_gui_rewardsDialog_event_onDropDownSelectionChanged.sqf'],
	['ExileClient_gui_rewardsDialog_event_onInputBoxChars','custom\rewards\ExileClient_gui_rewardsDialog_event_onInputBoxChars.sqf'],
	['ExileClient_gui_rewardsDialog_event_onListBoxSelectionChanged','custom\rewards\ExileClient_gui_rewardsDialog_event_onListBoxSelectionChanged.sqf'],
	['ExileClient_gui_rewardsDialog_show','custom\rewards\ExileClient_gui_rewardsDialog_show.sqf'],
	['ExileClient_gui_rewardsDialog_updateListBox','custom\rewards\ExileClient_gui_rewardsDialog_updateListBox.sqf'],
	['ExileClient_gui_rewardsDialog_updateSelection','custom\rewards\ExileClient_gui_rewardsDialog_updateSelection.sqf'],
	['ExileClient_system_rewards_network_claimItemResponse','custom\rewards\ExileClient_system_rewards_network_claimItemResponse.sqf'],
	['ExileClient_system_rewards_network_claimTabsResponse','custom\rewards\ExileClient_system_rewards_network_claimTabsResponse.sqf'],
	['ExileClient_system_rewards_network_claimVehicleResponse','custom\rewards\ExileClient_system_rewards_network_claimVehicleResponse.sqf'],
	['ExileClient_system_rewards_network_hasRewardsResponse','custom\rewards\ExileClient_system_rewards_network_hasRewardsResponse.sqf']
];

if ((getNumber(missionConfigFile >> "CfgLocker" >> "wages") isEqualTo 1)) then 
{
    [(getNumber(missionConfigFile >> "CfgLocker" >> "timeWages")),PayCheck,[],true] call ExileClient_system_thread_addtask;
};

"Most Wanted Pre-Init finished" call ExileClient_MostWanted_util_log;
waitUntil {ExileClientSessionId != ""};
["masterListRequest",[""]] call ExileClient_system_network_send;
"Requested master list" call ExileClient_MostWanted_util_log;

true



/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
	if (_x select 2) then { publicVariable _function; };
}
forEach
[		//Название функции										Путь к функции									Нужно ли ее передать клиенту или оставить на сервере
    ['ExileServer_ClaimVehicles_network_saveVehicleRequest','custom_code\scripts\ExileServer_ClaimVehicles_network_saveVehicleRequest.sqf',false],
	['SM_CalculateVector','custom_code\scripts\SM_CalculateVector.sqf',true],
	['Atlas_spawnOnFlag','custom_code\scripts\fn_spawnBase.sqf',true],
	['ExileClient_welcomeText', 'custom_code\scripts\fn_welcomeText.sqf', true],

	//AirDrop
	['ExileClient_airDrops_buySelected', 	'\custom_code\scripts\AirDrop\fn_airDrops_buySelected.sqf', true],
	['ExileClient_airDrops_okDrop', 			'\custom_code\scripts\AirDrop\fn_airDrops_okDrop.sqf', true],
	
	['ExileServer_util_getWeaponAttachementCargo', 	'\custom_code\scripts\ExileServer_util_getWeaponAttachementCargo.sqf',false],
	['ExileServer_util_getWeaponMagCargo', 			'\custom_code\scripts\ExileServer_util_getWeaponMagCargo.sqf',false],

	['AtlasClient_system_check_TeamSpeak', 			'\custom_code\scripts\AtlasClient_system_check_TeamSpeak.sqf',false],
	['AtlasServer_system_spawnItemAgain', 			'\custom_code\scripts\AtlasServer_system_spawnItemAgain.sqf',false],
	['AtlasServer_system_spawnItemsOnPos', 			'\custom_code\scripts\AtlasServer_system_spawnItemsOnPos.sqf',false],
	['AtlasClient_system_weaponOnlyForUids', 		'\custom_code\scripts\AtlasClient_system_weaponOnlyForUids.sqf',true],
	['AtlasClient_system_memberTerritory', 			'\custom_code\scripts\AtlasClient_system_memberTerritory.sqf',true],
	['AtlasServer_gui_safezone_create3DBorders', 	'\custom_code\scripts\AtlasServer_gui_safezone_create3DBorders.sqf', false],
	['ExileServer_system_player_premium_dateOver', 	'\custom_code\scripts\ExileServer_system_player_premium_dateOver.sqf',false],
	['ExileServer_Reward_network_addPopReward', 	'\custom_code\scripts\network\ExileServer_Reward_network_addPopReward.sqf',false],
	['ExileServer_Reward_network_updateRewardDate', '\custom_code\scripts\network\ExileServer_Reward_network_updateRewardDate.sqf',false],
	['ExileServer_Reward_network_addRespectReward', '\custom_code\scripts\network\ExileServer_Reward_network_addRespectReward.sqf',false],
	['ExileServer_AirDrop_network_buyRequest', 		'\custom_code\scripts\network\ExileServer_AirDrop_network_buyRequest.sqf',false],
	
	['ExileServer_object_flag_network_hackFlagRequest', 				'\custom_code\scripts\FlagHacking\ExileServer_object_flag_network_hackFlagRequest.sqf',false],
	['ExileServer_object_flag_network_startFlagHackRequest', 			'\custom_code\scripts\FlagHacking\ExileServer_object_flag_network_startFlagHackRequest.sqf',false],
	['ExileServer_object_flag_network_updateFlagHackAttemptRequest', 	'\custom_code\scripts\FlagHacking\ExileServer_object_flag_network_updateFlagHackAttemptRequest.sqf',false]
];

{
    missionNamespace setVariable [_x select 0,_x select 1,true];
} forEach 
[
	["tf_radio_server_name", getText(missionConfigFile >> "CfgTaskForceRadio" >> "TeamSpeakServerName")],
    ["tf_radio_channel_name",  getText(missionConfigFile >> "CfgTaskForceRadio" >> "TeamSpeakChannel")],
    ["tf_radio_channel_password",  getText(missionConfigFile >> "CfgTaskForceRadio" >> "TeamSpeakChannelPassword")]
];
true

/**
 * Post-Initialization
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
if(getNumber(missionConfigFile >> "CfgDailyReward" >> "enableDailyRewards") isEqualTo 1) then
{
	[] call ExileClient_welcomeText;
};
if(getNumber(missionConfigFile >> "CfgTradeSafeZone" >> "enable3DBorders") isEqualTo 1) then
{
	[] call AtlasServer_gui_safezone_create3DBorders;
};

true

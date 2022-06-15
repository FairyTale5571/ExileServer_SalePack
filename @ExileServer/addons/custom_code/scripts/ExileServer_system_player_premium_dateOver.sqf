/**
 * ExileServer_system_player_premium_dateOver
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_flag", "_currentTimestamp", "_flagBuild", "_maintenancePeriod", "_maintenancePeriodDueDate"];
_player = _this;
_playerTime = _player getVariable ["PremiumDate",[0,0,0,0,0]];
_premiumPeriodDueDate = parseSimpleArray ("extDB3" callExtension format["9:DATEADD:%1:[0,0,0,0]",_playerTime]);
_player setVariable ["PremiumDateOver", _premiumPeriodDueDate select 1, true];
true

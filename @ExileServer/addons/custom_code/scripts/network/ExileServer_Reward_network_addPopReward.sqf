/**
 * ExileServer_Reward_network_addPopReward
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_player","_playerMoney","_amount"];
_sessionID = _this select 0;
_parameters = _this select 1;
_amount = parseNumber(_parameters select 0);
try 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (_player isEqualTo objNull) then
	{
		throw "You do not exist! :)";
	};
	if !(alive _player) then
	{
		throw "Player not alive";
	};
	_playerMoney = _player getVariable ["ExileLocker", 0]; 
	_playerMoney = _playerMoney + _amount;
	_player setVariable ["ExileLocker", _playerMoney, true];
	format["updateLocker:%1:%2", _playerMoney, getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Reward", _exception]]] call ExileServer_system_network_send_to;
};
true
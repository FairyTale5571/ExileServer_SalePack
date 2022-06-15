/*
 * ExileServer_system_rewards_network_addKitRequest
 *
 * Rewards Server - Made by Andrew_S90
 *
 * Derived from ExileMod Code
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
//Example Usage:
// From infistar to player ["addKitRequest", ["UID_OF_PLAYER_TARGET", "BaseObjectsWood"]] call ExileClient_system_network_send;

// From server to player ["dms_mission", ["UID_OF_PLAYER_TARGET", "BaseObjectsWood"]] call ExileServer_system_rewards_network_addRewardsRequest;

 
private ["_sessionID", "_parameters", "_targetUID", "_kit", "_check", "_bad", "_player", "_allowedRewardGivers", "_playerObject", "_playerUID", "_targetPlayerObject", "_targetSessionID", "_rewardsData", "_hasRewardsPlayer", "_rewards", "_classname", "_index", "_current", "_amt", "_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_targetUID = _parameters select 0;
_kit = _parameters select 1;

try 
{	
	_check = getNumber(configFile >> "CfgRewards" >> "AllowedUIDS" >> "checkRewards");
	_bad = false;
	_player = false;
	if(_check isEqualTo 1) then {
		_allowedRewardGivers = getArray(configFile >> "CfgRewards" >> "AllowedUIDS" >> "AllowedRewardGivers");
		if (count _sessionID != 8) then {
			if(_sessionID in _allowedRewardGivers) then {
				diag_log format["REWARDS SERVER - %1 Added rewards to _targetUID %2",_sessionID,_targetUID];
				_player = false;
			} else {
				diag_log format["REWARDS SERVER - %1 tried to add rewards to _targetUID %2",_sessionID,_targetUID];
				_bad = true;
			};
		} else {
			//Player called the addKitRequest
			_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
			_playerUID = _playerObject getVariable ["ExileOwnerUID", -1];
			if(_playerUID in _allowedRewardGivers) then {
				diag_log format["REWARDS SERVER - Player %1 Added rewards to _targetUID %2",_playerUID,_targetUID];
				_player = true;
			} else {
				diag_log format["REWARDS SERVER - Player %1 tried to add rewards to _targetUID %2",_playerUID,_targetUID];
				_bad = true;
			};
		};
	};
	
	if (_bad) then
	{
		throw 9999;
	};
	
	
	_targetPlayerObject = _targetUID call ExileClient_util_player_objectFromPlayerUID;
	_targetSessionID = _targetPlayerObject getVariable ["ExileSessionID", -1];
	
	_rewardsData = [];
	_hasRewardsPlayer = format["hasRewardsPlayer:%1", _targetUID] call ExileServer_system_database_query_selectSingleField;
	
	if(_hasRewardsPlayer) then {
		_rewardsData = format["loadRewards:%1", _targetUID] call ExileServer_system_database_query_selectSingle;
		_rewardsData = (_rewardsData select 0);
		_targetPlayerObject setVariable ["ExileClientPlayerRewards", _rewardsData];
	} else {
		format["createRewards:%1:%2", _targetUID, []] call ExileServer_system_database_query_insertSingle;
		_targetPlayerObject setVariable ["ExileClientPlayerRewards", _rewardsData];
	};
	
	_rewards = getArray(configFile >> "CfgRewards" >> "RewardKits" >> _kit);
	
	
	{	
		if(typeName _x == "ARRAY") then {
			_classname = (_x select 0);
			if(count _rewardsData > 0) then {
				_index = [_rewardsData,_classname] call ExileServer_util_searchArray;
				if(_index != -1) then {
					_current = _rewardsData select _index;
					_amt = (_current select 1)+(_x select 1);
					_rewardsData set [_index, [(_current select 0),_amt]];
				} else {
					_rewardsData pushBack _x;
				};
			} else {
				_rewardsData pushBack _x;
			};
		} else {
			_classname = _x;
			if(count _rewardsData > 0) then {
				_index = [_rewardsData,_classname] call ExileServer_util_searchArray;
				if(_index != -1) then {
					_current = _rewardsData select _index;
					_amt = (_current select 1)+1;
					_rewardsData set [_index, [(_current select 0),_amt]];
				} else {
					_rewardsData pushBack [_x,1];
				};
			} else {
				_rewardsData pushBack [_x,1];
			};
		};
	} forEach _rewards;
	
	format["setPlayerRewards:%1:%2", _rewardsData, _targetUID] call ExileServer_system_database_query_fireAndForget;
	_targetPlayerObject setVariable ["ExileClientPlayerRewards", _rewardsData];
	
	[_targetSessionID, "hasRewardsResponse", [0,_rewardsData]] call ExileServer_system_network_send_to;
}
catch
{
	_responseCode = _exception;
	if(_responseCode isEqualTo 9999) then {
		diag_log "REWARDS SERVER - Bad caller for rewards!";
	};
	[_bad, "hasRewardsResponse", [_responseCode, []]] call ExileServer_system_network_send_to;
};
true
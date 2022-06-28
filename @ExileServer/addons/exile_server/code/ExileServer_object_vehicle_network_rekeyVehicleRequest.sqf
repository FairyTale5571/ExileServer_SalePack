/**
 * ExileServer_object_vehicle_network_rekeyVehicleRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID", "_parameters", "_vehicle", "_newPinCode","_reyKeyPrice", "_alphabet", "_forbiddenCharacter","_player","_playerMoney","_playerMoneyNR"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_vehicle = objectFromNetId (_parameters select 0);
	_newPinCode = _parameters select 1;
	_reyKeyPrice = _parameters select 2;
	_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
	_forbiddenCharacter = [_newPinCode, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) then 
	{
		throw format ["Fuuck you!", _forbiddenCharacter];
	};
	_vehicle setVariable ["ExileAccessCode", _newPinCode];
	[_vehicle, _newPinCode] call ExileServer_object_vehicle_database_resetCode;	
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	_playerMoney = _player getVariable ["ExileMoney", 0];
	_playerMoneyNR = _playerMoney - _reyKeyPrice;
	_playerMoney = [_playerMoneyNR, 0] call BIS_fnc_cutDecimals;
	_player setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	[_sessionID, "toastRequest", ["SuccessTitleAndText", ["PIN Change", format ["Succesfull!<br/>-%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/>", _reyKeyPrice]]]] call ExileServer_system_network_send_to;
	
}
catch
{
};
true
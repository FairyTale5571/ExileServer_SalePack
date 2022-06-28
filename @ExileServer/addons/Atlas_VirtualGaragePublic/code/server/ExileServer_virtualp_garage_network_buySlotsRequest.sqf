/**
 * File: ExileServer_virtualp_garage_network_buySlotsRequest
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
params ["_sessionID","_data"];
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	_uid = getPlayerUID _player;
	_vg_slots = _player getVariable ["VG_Slots",0];
	_cost = round (_vg_slots * (getNumber(missionConfigFile >> "CfgPublicVirtualGarage" >> "multiplierSlotsCost")));
	_playerMoney = _player getVariable ["ExileMoney", 0];
	if (_cost > _playerMoney) throw "Not enough money!";
	_playerMoney = floor (_playerMoney - _cost);
	_player setVariable ["ExileMoney",_playerMoney,true];
	format["setPlayerMoney:%1:%2", _playerMoney, (_player getVariable ["ExileDatabaseID", 0])] call ExileServer_system_database_query_fireAndForget;
	_newSlots = _vg_slots + 1;
	_player setVariable ["VG_Slots",_newSlots,true];
	format ["setNewVG_SLots:%1:%2",_newSlots,_uid] call ExileServer_system_database_query_fireAndForget;
	[_sessionID ,"toastRequest",["SuccessTitleAndText",["Success","+1 more slots in your garage!"]]] call ExileServer_system_network_send_to;
	[_sessionID ,"buySlotsResponse",[]] call ExileServer_system_network_send_to;
}catch{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed!", _exception]]] call ExileServer_system_network_send_to;
};
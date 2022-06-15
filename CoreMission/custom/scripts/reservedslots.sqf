waitUntil {!isNil "atlas_sup"};
private ["_reserved_uids", "_uid","_playercount","_servernoreserve","_server_reservedslots","_server_maxplayers","_testplayer"];
_server_maxplayers = 70;
_server_reservedslots = 10;
_reserved_uids = prem;		//Массив с ID игроков
waitUntil {!isNull player};
waitUntil {(vehicle player) == player};
waitUntil {(getPlayerUID player) != ""};
_playercount = count (allPlayers);
_uid = getPlayerUID player;
_servernoreserve = _server_maxplayers - _server_reservedslots;
{
	_testplayer = getPlayerUID _x;
	if(_testplayer in _reserved_uids) then
		{
			_servernoreserve = _servernoreserve + 1;
			if (_servernoreserve > _server_maxplayers) then
				{
					_servernoreserve = _server_maxplayers;
				};
		};
} forEach allPlayers;
if ((_playercount > _servernoreserve)&& !(_uid in _reserved_uids)) then 
	{
		titleText ["", "BLACK OUT"];
		disableUserInput true;
		hint "Reserved slot! You will be kicked to the lobby in 10 seconds!";
		titleText ["Reserved slot! You will be kicked to the lobby in 10 seconds!", "PLAIN"];
		sleep 5;
		hint "Reserved slot! You will be kicked to the lobby in 10 seconds!";
		titleText ["Reserved slot! You will be kicked to the lobby in 10 seconds!", "PLAIN"];
		sleep 5;
		titleText ["", "BLACK IN"];
		disableUserInput false;
		failMission "end1";
	};
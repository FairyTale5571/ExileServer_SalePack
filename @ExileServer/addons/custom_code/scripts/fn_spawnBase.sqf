disableSerialization;
waitUntil {
	_display = findDisplay 86000;
	!isNull _display
};

_listBox = _display displayCtrl 1500;
_playerUID = getPlayerUID player;

_timerSpawn = getNumber(missionConfigFile >> "CfgTerritories" >> "timerSpawn");
_levelFlag= getNumber(missionConfigFile >> "CfgTerritories" >> "LevelToSpawn");

_i = 0;
{	
	_flag = _x;
	_name = _flag getVariable ["ExileTerritoryName", ""];
	_owners = _flag getVariable ["ExileTerritoryBuildRights", []];
	_level = _flag getVariable ["ExileTerritoryLevel",0];
	_i = _i + 1;
if(_level >= _levelFlag) then {
	if (_playerUID in _owners) then {
		_position = getPos _flag;
		_var = format ["SpawnBase_%1_%2",_name,_i];
		_lastSpawned = (_flag getVariable [(format ["lastSpawned_%1", _playerUID]),0]);
		_timeF = 0;
		if (_lastSpawned == 0 && time < _timerSpawn) then {
			_timeF = _timerSpawn + 10;
		}else{ 
			_timeF = (time - _lastSpawned);
		};
		if (_timeF > _timerSpawn) then 
		{
			_listItemIndex = _listBox lbAdd _name;
			_listBox lbSetData [_listItemIndex, _var];
		}else{
			_name = format ["%1 (%2 min)", _name, (_timerSpawn - floor(_timeF))/60 ];
			_listItemIndex = _listBox lbAdd _name;
			_listBox lbSetData [_listItemIndex, "block"];
		
			_listBox lbSetPicture [_listItemIndex, "a3\ui_f\data\GUI\Rsc\RscDisplaySingleMission\locked_ca.paa"];
		};
		_listBox lbSetColor [_listItemIndex,[1,0,0,.8]];
		player setVariable [_var, _flag, true];
		};
	};
} forEach allMissionObjects "Exile_Construction_Flag_Static";


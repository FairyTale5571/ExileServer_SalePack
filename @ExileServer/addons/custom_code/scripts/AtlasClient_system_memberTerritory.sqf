/**
 * File: AtlasClient_gui_escape_disconnect
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
   Return: Number
 */
 
private["_playerObject","_myUid","_numberOfMembers","_ownerUid"];
_playerObject = _this;
_myUid = getPlayerUID _playerObject;
_numberOfMembers = 0;
{
	_ownerUid = _x getVariable ["ExileTerritoryBuildRights", []];
	if (_myUid in _ownerUid) then 
	{
		_numberOfMembers = _numberOfMembers + 1;
	};
} forEach (allMissionObjects "Exile_Construction_Flag_Static");
_numberOfMembers
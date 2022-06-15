/**
 * File: AtlasServer_system_spawnItemsOnPos
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
   Return: Nothing
 */
 
private ["_array","_weaponHolder","_var"];
_array = getArray (missionConfigFile >> "CfgAtlasSpawnItemsOnPos" >> "posAndItem");
_weaponHolder = objNull;
_var = 0;
{
	private _position = _x select 0;
	private _item = _x select 1 select 0;
	private _countItem = _x select 1 select 1;
	private _time = _x select 2;
	
	_weaponHolder = createVehicle ["GroundWeaponHolder",_position, [], 0, "CAN_COLLIDE"];
	_weaponHolder setPosWorld _position;
	_weaponHolder addMagazineCargoGlobal [_item,_countItem];
	
	if(getNumber(missionConfigFile >> "CfgAtlasSpawnItemsOnPos" >> "debug") isEqualTo 1) then
	{
		_marker = createMarker [str(_position), _position];
		_marker setMarkerType "loc_Tree";
		_marker setMarkerText str(_weaponHolder);
	}; 
	[_position,_item,_countItem,_time,_weaponHolder] spawn AtlasServer_system_spawnItemAgain;
	
	
}forEach _array;
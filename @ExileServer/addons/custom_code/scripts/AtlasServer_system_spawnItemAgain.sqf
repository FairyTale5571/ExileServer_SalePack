/**
 * File: AtlasServer_system_spawnItemAgain
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
   Return: Nothing
 */
 
private _position = _this select 0;
private _item = _this select 1;
private _countItem = _this select 2;
private _time = _this select 3;
private _weaponHolder = _this select 4;
waitUntil {isNull _weaponHolder};
private _tickTime = diag_tickTime;
waitUntil {diag_tickTime - _time > _tickTime};
_weaponHolder = createVehicle ["GroundWeaponHolder",_position, [], 0, "CAN_COLLIDE"];
_weaponHolder setPosWorld _position;
_weaponHolder addMagazineCargoGlobal [_item,_countItem];
[_position,_item,_countItem,_time,_weaponHolder] spawn AtlasServer_system_spawnItemAgain;
if(getNumber(missionConfigFile >> "CfgAtlasSpawnItemsOnPos" >> "debug") isEqualTo 1) then
{
	_marker = createMarker [str(_position), _position];
	_marker setMarkerType "loc_Tree";
	_marker setMarkerText str(_weaponHolder);
};
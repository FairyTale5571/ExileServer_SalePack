/**
 * File: AtlasClient_system_weaponOnlyForUids
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Boolean
 */

private ["_weapon","_allowed","_uids"];
params ["_weapon","_unit"];
_allowed = false;
if(_weapon isEqualTo "") exitWith {false};
if (!isClass (missionConfigFile >> "CfgRestrictWeapons" >> _weapon)) exitWith {true};
_uids = getArray(missionConfigFile >> "CfgRestrictWeapons" >> _weapon >> "allowedUids");
if ((getPlayerUID _unit) in _uids) then
{
	_allowed = true;
};
_allowed
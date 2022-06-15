/**
 * ExileClient_object_player_event_onHandleDamage
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
params ["_unit", "_hit", "_damage", "_source", "_ammo"];

if ((getNumber (missionConfigFile >> "CfgClans" >> "friendlyFire") isEqualTo 1)) then
{
	if ((leader (group _unit) == leader (group _source)) && (_unit != _source)) then
	{
		_damage = 0;
		_damage;
	};
};

if (getNumber (missionConfigFile >> "CfgPvE" >> "PvE_status") isEqualTo 1) then
{
	_nopvp = true;
	{
		_marker = _x;
		if (_marker isEqualType "") then
		{
			{
				_type = _x select 0;
				_MinDist = _x select 1;
				if (_marker isEqualTo _type) then
				{
					_markerPos = getMarkerPos _marker;
					_distance = player distance _markerPos;
					if (_distance < _MinDist) then
					{
						_noPvp = false;
					};
				};
			} forEach getArray (missionConfigFile >> "CfgPvE" >> "PvP_zones");
		};
	} forEach allMapMarkers;
	
	if(_nopvp) then 
	{ 
		if !(getNumber (missionConfigFile >> "CfgPvE" >> "enableDamagePlayerToPlayer") isEqualTo 1) then
		{
			if (isPlayer _source && !(_source isEqualTo player)) then 
			{
				systemChat format ["Shooting to you %1!", name _source];
				_damage = damage _unit;
			};
		};
	};
};

_damage


/**
 * ExileServer_system_garbageCollector_unscheduled_deleteLoot
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team / Fixed and optimised by El Rabito
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private _lifeTime = 60 * getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Ingame" >> "Loot" >> "lifeTime");
private _skippedBuildings = [];
private _index = -1;
{	
	private _building = objectFromNetId _x;
	if ((time - (_building getVariable ["ExileLootSpawnedAt", 0])) < _lifeTime) then 
	{	
		_skippedBuildings pushback _x;
		continue;
	}; 
	private _nearPlayersCount = count (_building nearEntities ["Exile_Unit_Player", 25]);
	if (_nearPlayersCount >= 1) then 
	{
		_skippedBuildings pushback _x;
		continue;
	};
	private _lootWeaponHolderNetIDs = _building getVariable ["ExileLootWeaponHolderNetIDs", []];
	{
		private _lootWeaponHolder = objectFromNetId _x;
		if !(isNull _lootWeaponHolder) then
		{
			deleteVehicle _lootWeaponHolder;
		};
	}
	forEach _lootWeaponHolderNetIDs;
	_building setVariable ["ExileLootSpawnedAt", nil];
	_building setVariable ["ExileHasLoot", false];
	_building setVariable ["ExileLootWeaponHolderNetIDs", []];
   	_index = _forEachIndex;
}
forEach ExileServerBuildingNetIdsWithLoot;
ExileServerBuildingNetIdsWithLoot deleteRange [0,(_index+1)];
ExileServerBuildingNetIdsWithLoot append _skippedBuildings;
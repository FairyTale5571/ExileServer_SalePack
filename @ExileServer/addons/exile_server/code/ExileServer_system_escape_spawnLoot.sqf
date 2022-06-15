/**
 * ExileServer_system_escape_spawnLoot
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_centerPosition", "_radius"];
params ["_centerPosition", "_radius"];
"Spawning loot..." call ExileServer_util_log;
{
	_x call ExileServer_system_lootManager_spawnLootInBuilding;
}
foreach (_centerPosition nearObjects ["House", _radius]);
"Loot spawned!" call ExileServer_util_log;
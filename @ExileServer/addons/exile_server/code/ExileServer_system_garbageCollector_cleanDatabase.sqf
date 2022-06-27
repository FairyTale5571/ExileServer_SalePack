/**
 * ExileServer_system_garbageCollector_cleanDatabase
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_permanentlyDeleteTime", "_territoryLifeTime", "_containerLifeTime", "_constructionLifeTime", "_vehicleLifeTime", "_abandonedSafeTime", "_stolenFlagLifeTime", "_unlockLifeTime"];
_permanentlyDeleteTime	= getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Database" >> "permanentlyDeleteTime");
_territoryLifeTime    	= getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Database" >> "territoryLifeTime");
_containerLifeTime    	= getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Database" >> "containerLifeTime");
_constructionLifeTime 	= getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Database" >> "constructionLifeTime");
_vehicleLifeTime      	= getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Database" >> "vehicleLifeTime");
_abandonedSafeTime    	= getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Database" >> "abandonedTime");
_stolenFlagLifeTime		= getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Database" >> "stolenFlagLifeTime");
_unlockLifeTime			= getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Database" >> "unlockLifeTime");
format ["setAbandonedUnlocked:%1", _unlockLifeTime] call ExileServer_system_database_query_insertSingle;
format ["markDeleteOldConstructions:%1", _constructionLifeTime] call ExileServer_system_database_query_insertSingle;
format ["markDeleteUnpaidTerritories:%1", _territoryLifeTime] call ExileServer_system_database_query_insertSingle;
format ["markDeleteOldContainers:%1", _containerLifeTime] call ExileServer_system_database_query_insertSingle;
format ["markDeleteOldVehicles:%1", _vehicleLifeTime] call ExileServer_system_database_query_insertSingle;
format ["deleteUnpaidTerritories:%1", _permanentlyDeleteTime] call ExileServer_system_database_query_insertSingle;
format ["deleteUnpaidTerritories_construction:%1", _permanentlyDeleteTime] call ExileServer_system_database_query_insertSingle;
format ["deleteUnpaidTerritories_container:%1", _permanentlyDeleteTime] call ExileServer_system_database_query_insertSingle;
format ["deleteOldContainers:%1", _permanentlyDeleteTime] call ExileServer_system_database_query_insertSingle;
format ["deleteOldConstructions:%1", _permanentlyDeleteTime] call ExileServer_system_database_query_insertSingle;
format ["deleteOldVehicles:%1", _permanentlyDeleteTime] call ExileServer_system_database_query_insertSingle;
format ["deleteBaseFlagStolen:%1", _stolenFlagLifeTime] call ExileServer_system_database_query_insertSingle;
format ["addAbandonedSafes:%1", _abandonedSafeTime] call ExileServer_system_database_query_insertSingle;
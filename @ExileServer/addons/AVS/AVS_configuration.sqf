/*
© 2015 Zenix Gaming Ops
Developed by Rod-Serling and Vishpala

All rights reserved.

Function:
	AVS_configuration - Defines the configuration for AVS.
*/

AVS_Debug = false;

// This array contains world center and radius for maps supported.
/* AVS_WorldInfo =
[
    ["Altis", [15360, 15360, 0], 15360],
    ["Esseker", [6150,6150,0], 6150],
    ["Chernarus", [7700,8500,0], 11000],
    ["Chernarus_Isles", [7700,8500,0], 11000],
    ["ChernarusRedux", [7700,8500,0], 11000],
    ["Chernarus_winter", [7700,8500,0], 11000],
    ["Taviana", [7700,8500,0], 11000],
	["Namalsk", [4968.00,4938.00,0], 6000],
	["Malden", [4968.00,4938.00,0], 6000],
	["Napf", [4968.00,4938.00,0], 20000],
	["Lingor3", [4968.00,4938.00,0], 10000],
	["Kerama", [4968.00,4938.00,0], 22000],
	["Tanoa", [7680,7680,0], 7680]
]; */
AVS_WorldInfo = getArray(missionConfigFile >> "AVS" >> "AVS_WorldInfo");
//**************************************************************

// Setting this to true will disable thermal for all vehicles.
AVS_DisableVehicleThermalGlobal = getNumber(missionConfigFile >> "AVS" >> "AVS_DisableVehicleThermalGlobal") isEqualTo 1;

// If the above is not set to true, then this will disable thermal for specific classes of vehicles.
AVS_DisableVehicleThermal = getArray(missionConfigFile >> "AVS" >> "AVS_DisableVehicleThermal");

// Setting this to true will disable NVGs for all vehicles.
AVS_DisableVehicleNVGsGlobal = getNumber(missionConfigFile >> "AVS" >> "AVS_DisableVehicleNVGsGlobal") isEqualTo 1;

// If the above is not set to true, then this will disable thermal for specific classes of vehicles.
AVS_DisableVehicleNVG = getArray(missionConfigFile >> "AVS" >> "AVS_DisableVehicleNVG");

// Any weapon classes listed here will be sanitized from all vehicles.
AVS_GlobalWeaponBlacklist = getArray(missionConfigFile >> "AVS" >> "AVS_DisableVehicleNVG");

// Any ammo classes listed here will be sanitized from all vehicles.
AVS_GlobalAmmoBlacklist = getArray(missionConfigFile >> "AVS" >> "AVS_GlobalAmmoBlacklist");

// You may remove specific weapon classes from specific vehicle classes here.
AVS_VehicleWeaponBlacklist = getArray(missionConfigFile >> "AVS" >> "AVS_VehicleWeaponBlacklist");

// You may remove specific ammo classes from specific vehicle classes here.
AVS_VehicleAmmoBlacklist = getArray(missionConfigFile >> "AVS" >> "AVS_VehicleAmmoBlacklist");
//**************************************************************

// Set to false to disable the entire rearm system.
AVS_RearmSystemActive = getNumber(missionConfigFile >> "AVS" >> "AVS_RearmSystemActive") isEqualTo 1;

// Distance away from an object to get the rearm option.
AVS_RearmDistance = getNumber(missionConfigFile >> "AVS" >> "AVS_RearmDistance");

// Number of seconds it takes to rearm. (NOT YET IMPLEMENTED)
AVS_RearmTime = getNumber(missionConfigFile >> "AVS" >> "AVS_RearmTime");

// Disabled rearming at ammo trucks.
AVS_DisableStockRearm = getNumber(missionConfigFile >> "AVS" >> "AVS_DisableStockRearm") isEqualTo 1;

// Objects of this type will give the "rearm" action.
AVS_RearmObjects = getArray(missionConfigFile >> "AVS" >> "AVS_RearmObjects");

// Default cost of a magazine if not found in AVS_RearmCosts
AVS_RearmCostDefault = getNumber(missionConfigFile >> "AVS" >> "AVS_RearmCostDefault");

// Costs of individual magazines.
AVS_RearmCosts = getArray(missionConfigFile >> "AVS" >> "AVS_RearmCosts");

//**************************************************************

// Disabled stock refueling at fuel trucks / gas pumps.
AVS_DisableStockRefuel = getNumber(missionConfigFile >> "AVS" >> "AVS_DisableStockRefuel") isEqualTo 1;

// Use AVS Refuel System
AVS_RefuelSystemActive = getNumber(missionConfigFile >> "AVS" >> "AVS_RefuelSystemActive") isEqualTo 1;

// Use AVS to fill Fuel-Canister with AVS Refuel Objects (Gas Station Pump). It's active only if AVS Refuel System is active too.
AVS_FillCanisterActive = getNumber(missionConfigFile >> "AVS" >> "AVS_FillCanisterActive") isEqualTo 1; // Remember to disable "Exile fill canister empty", to do this see Installation.txt

AVS_RefuelDistance = getNumber(missionConfigFile >> "AVS" >> "AVS_RefuelDistance");	//  maximum distance to refuel. It doesn't affect the choppers that refuel on roof.
AVS_RefuelObjects = getArray(missionConfigFile >> "AVS" >> "AVS_RefuelObjects");

AVS_FuelCost = getNumber(missionConfigFile >> "AVS" >> "AVS_FuelCost");					// 5 poptabs/liter
AVS_RefuelSpeed = getNumber(missionConfigFile >> "AVS" >> "AVS_RefuelSpeed");				// 3 liters/second (for ground vehicles, small tank)
AVS_RefuelSpeedAirVehicle = getNumber(missionConfigFile >> "AVS" >> "AVS_RefuelSpeedAirVehicle");		// 20 liters/second (for air vehicles, big tank so need to be faster)

//**************************************************************

AVS_DebugMarkers = getNumber(missionConfigFile >> "AVS" >> "AVS_DebugMarkers") isEqualTo 1;
AVS_PersistentVehiclesPinCode = getText(missionConfigFile >> "AVS" >> "AVS_PersistentVehiclesPinCode");
AVS_PersistentVehiclesAmmoPercent = getNumber(missionConfigFile >> "AVS" >> "AVS_PersistentVehiclesAmmoPercent"); // 100 = full ammo, 50 = half ammo, 0 = no ammo
AVS_PersistentVehiclesFuelPercent = getNumber(missionConfigFile >> "AVS" >> "AVS_PersistentVehiclesFuelPercent"); // 100 = full, 50 = half, 0 = empty

//**************************************************************

AVS_useSpawnedPersistentVehiclesLocation = getNumber(missionConfigFile >> "AVS" >> "AVS_useSpawnedPersistentVehiclesLocation") isEqualTo 1; // Spawns persistent vehicles at specified locations
AVS_LocationSearchRadius = getNumber(missionConfigFile >> "AVS" >> "AVS_LocationSearchRadius"); // Set to 0 for exact positioning.
AVS_spawnedPersistentVehiclesLocation = getArray(missionConfigFile >> "AVS" >> "AVS_spawnedPersistentVehiclesLocation");

//**************************************************************

AVS_useSpawnedPersistentVehiclesRoadside = getNumber(missionConfigFile >> "AVS" >> "AVS_useSpawnedPersistentVehiclesRoadside") isEqualTo 1; // Spawns persistent vehicles near roads.
AVS_RoadSearchRadius = getNumber(missionConfigFile >> "AVS" >> "AVS_RoadSearchRadius"); // Max distance to the road
AVS_spawnedPersistentVehiclesRoadside = getArray(missionConfigFile >> "AVS" >> "AVS_spawnedPersistentVehiclesRoadside");
//**************************************************************

AVS_useSpawnedPersistentVehiclesRandom = getNumber(missionConfigFile >> "AVS" >> "AVS_useSpawnedPersistentVehiclesRandom") isEqualTo 1; // Spawns persistent vehicles completely randomly.
AVS_spawnedPersistentVehiclesRandom = getArray(missionConfigFile >> "AVS" >> "AVS_spawnedPersistentVehiclesRandom");

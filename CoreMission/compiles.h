//temp
ExileClient_gui_xm8_slide_extraApps_onOpen = 			"custom\client_code\temporary\ExileClient_gui_xm8_slide_extraApps_onOpen.sqf";
ExileServer_object_vehicle_network_retrieveVehicleRequest = 	"\custom_code\server_code\ExileServer_object_vehicle_network_retrieveVehicleRequest.sqf";



//XM8 ExAD
ExileClient_gui_xm8_show =								"ExAdClient\XM8\CustomCode\ExileClient_gui_xm8_show.sqf";
ExileClient_gui_xm8_slide = 							"ExAdClient\XM8\CustomCode\ExileClient_gui_xm8_slide.sqf";

//Revive
ExileClient_object_player_death_startBleedingOut =		"custom\client_code\ExileClient_object_player_death_startBleedingOut.sqf";
ExileClient_object_player_event_onInventoryOpened =		"custom\client_code\ExileClient_object_player_event_onInventoryOpened.sqf";				//+Anti-Theft
ExileClient_object_player_event_onInventoryClosed =		"custom\client_code\ExileClient_object_player_event_onInventoryClosed.sqf";				//SC

//Build-Height limit
ExileClient_construction_beginNewObject = 				"custom\client_code\ExileClient_construction_beginNewObject.sqf";

//BulletCam_Tweak
ExileClient_system_bulletCam_thread = "custom\client_code\ExileClient_system_bulletCam_thread.sqf";
//NVG bug fix
ExileClient_util_playerEquipment_canAdd = "custom\client_code\ExileClient_util_playerEquipment_canAdd.sqf";
//Base flag tweak
ExileClient_gui_setupTerritoryDialog_event_onPlaceButtonClick = "custom\client_code\ExileClient_gui_setupTerritoryDialog_event_onPlaceButtonClick.sqf";
//Оповещение о том, что нужно подойти к флагу на 5м чтобы открыть ВГ
ExileClient_gui_virtualGarageDialog_show = 				"custom\client_code\ExileClient_gui_virtualGarageDialog_show.sqf";

//Paint
ExileClient_construction_simulationCountDown = 			"custom\client_code\ExileClient_construction_simulationCountDown.sqf";
ExileClient_object_construction_move = 					"custom\client_code\ExileClient_object_construction_move.sqf";
ExileServer_object_construction_network_swapConstructionRequest = "BasePainting_Server\ExileOverwrites\ExileServer_object_construction_network_swapConstructionRequest.sqf";  

// Vector
ExileClient_gui_hud_event_onKeyDown = 					"custom\client_code\ExileClient_gui_hud_event_onKeyDown.sqf";
ExileClient_gui_constructionMode_update = 				"custom\client_code\ExileClient_gui_constructionMode_update.sqf";
ExileClient_gui_hud_event_onKeyUp = 					"custom\client_code\ExileClient_gui_hud_event_onKeyUp.sqf";
ExileClient_construction_thread = 						"custom\client_code\ExileClient_construction_thread.sqf";

//Unlock_DLC_Vehicles
ExileClient_gui_interactionMenu_hook = "custom\client_code\ExileClient_gui_interactionMenu_hook.sqf";
ExileClient_object_vehicle_checkForDLCAndSeat = "custom\client_code\ExileClient_object_vehicle_checkForDLCAndSeat.sqf";
ExileClient_object_vehicle_getInteractionName = "custom\client_code\ExileClient_object_vehicle_getInteractionName.sqf";
ExileClient_object_vehicle_moveInSeat = "custom\client_code\ExileClient_object_vehicle_moveInSeat.sqf";

ExileClient_object_player_death_forceRespawn = 			"custom\client_code\ExileClient_object_player_death_forceRespawn.sqf";
ExileClient_action_execute = 							"custom\client_code\ExileClient_action_execute.sqf";

//Autorun fix
ExileClient_system_autoRun_canAutoRun = "custom\client_code\ExileClient_system_autoRun_canAutoRun.sqf";
ExileClient_system_autoRun_stop = "custom\client_code\ExileClient_system_autoRun_stop.sqf";

ExileClient_gui_xm8_slide_players_event_onPlayerListBoxSelectionChanged = "custom\client_code\ExileClient_gui_xm8_slide_players_event_onPlayerListBoxSelectionChanged.sqf";

//Fixes
ExileClient_object_construction_network_constructionMoveResponse = "custom\client_code\ExileClient_object_construction_network_constructionMoveResponse.sqf";
ExileClient_util_playerEquipment_add = 					"custom\client_code\ExileClient_util_playerEquipment_add.sqf";
ExileClient_gui_vehicleRekeyDialog_network_rekeyVehicleDialogResponse = "custom\client_code\ExileClient_gui_vehicleRekeyDialog_network_rekeyVehicleDialogResponse.sqf";
ExileClient_object_vehicle_network_resetCodeResponse =  "custom\client_code\ExileClient_object_vehicle_network_resetCodeResponse.sqf";
ExileClient_object_vehicle_rekeyVehicle = 				"custom\client_code\ExileClient_object_vehicle_rekeyVehicle.sqf";
ExileClient_object_player_event_onTake = 				"custom\client_code\ExileClient_object_player_event_onTake.sqf";
ExileClient_object_handcuffs_use = 						"custom\client_code\ExileClient_object_handcuffs_use.sqf";								//fix
ExileClient_object_player_event_onKilled = 				"custom\client_code\ExileClient_object_player_event_onKilled.sqf";								//fix
ExileClient_gui_wasteDumpDialog_event_onSellButtonClick = "custom\client_code\ExileClient_gui_wasteDumpDialog_event_onSellButtonClick.sqf";		//Блокировка дюпа
ExileServer_system_process_noobFilter = 				"\custom_code\server_code\ExileServer_system_process_noobFilter.sqf";					//Не трогать это вообще!
ExileServer_util_getFragType =     					    "\custom_code\server_code\ExileServer_util_getFragType.sqf";
ExileServer_util_getFragKiller = 						"\custom_code\server_code\ExileServer_util_getFragKiller.sqf";
ExileServer_system_process_preInit =     			    "\custom_code\server_code\ExileServer_system_process_preInit.sqf";
ExileClient_object_vehicle_flip = 						"custom\client_code\ExileClient_object_vehicle_flip.sqf";
ExileClient_system_radiation_thread_update = 			"custom\client_code\ExileClient_system_radiation_thread_update.sqf";
ExileClient_gui_escape_suicide = 						"custom\client_code\ExileClient_gui_escape_suicide.sqf";
ExileClient_system_lootManager_thread_spawn = 			"custom\client_code\ExileClient_system_lootManager_thread_spawn.sqf";
// ExileClient_util_array_shuffle = 					"custom\client_code\ExileClient_util_array_shuffle.sqf";	//Что-то с ней не так, пока что возврат на стандартную
ExileClient_gui_map_event_onMouseButtonUp = 			"custom\client_code\ExileClient_gui_map_event_onMouseButtonUp.sqf";
ExileClient_system_slothMachine_network_slothMachineResponse = 			"custom\client_code\ExileClient_system_slothMachine_network_slothMachineResponse.sqf";
ExileClient_gui_xm8_slide_slothMachine_event_onSpinButtonClick = 			"custom\client_code\ExileClient_gui_xm8_slide_slothMachine_event_onSpinButtonClick.sqf";

ExileClient_gui_selectSpawnLocation_event_onSpawnButtonClick = 	"custom\client_code\ExileClient_gui_selectSpawnLocation_event_onSpawnButtonClick.sqf";

//Быстрее чем дефолтная, гораздо быстрее
ExileClient_util_find = 								"custom\client_code\ExileClient_util_find.sqf";
ExileClient_object_lock_toggle = 						"custom\client_code\ExileClient_object_lock_toggle.sqf";

ExileClient_object_vehicle_interaction_show =           "custom\client_code\ExileClient_object_vehicle_interaction_show.sqf";

ExileClient_system_autoRun_canAutoRun =                 "custom\client_code\ExileClient_system_autoRun_canAutoRun.sqf";
ExileClient_system_autoRun_stop =                       "custom\client_code\ExileClient_system_autoRun_stop.sqf";

//PvE custom
ExileClient_system_breaching_action = 					"custom\client_code\ExileClient_system_breaching_action.sqf";		
ExileClient_action_hotwireVehicle_condition = 			"custom\client_code\ExileClient_action_hotwireVehicle_condition.sqf";		
ExileClient_action_stealFlag_condition = 				"custom\client_code\ExileClient_action_stealFlag_condition.sqf";		
ExileClient_object_lock_scan = 							"custom\client_code\ExileClient_object_lock_scan.sqf";		
ExileClient_object_player_event_onHandleDamage = 		"custom\client_code\ExileClient_object_player_event_onHandleDamage.sqf";

//Сюда писать донат-лут
ExileClient_gui_selectSpawnLocation_show = 				"custom\client_code\ExileClient_gui_selectSpawnLocation_show.sqf"; 						//+Спавн на флаге

//Спавн на флаге
ExileClient_gui_selectSpawnLocation_zoomToMarker = 		"custom\client_code\ExileClient_gui_selectSpawnLocation_zoomToMarker.sqf";
ExileClient_gui_selectSpawnLocation_event_onListBoxSelectionChanged = 				"custom\client_code\ExileClient_gui_selectSpawnLocation_event_onListBoxSelectionChanged.sqf";

//MostWanted
ExileClient_gui_xm8_showPartySlides = 					"custom\client_code\ExileClient_gui_xm8_showPartySlides.sqf";
ExileServer_system_network_event_onPlayerConnected = 	"\custom_code\server_code\ExileServer_system_network_event_onPlayerConnected.sqf";

//R3F продажа коробки из машины сразу waste dump'y	
ExileClient_gui_wasteDumpDialog_show =					"custom\client_code\ExileClient_gui_wasteDumpDialog_show.sqf"; 							//+Anti-Theft
ExileClient_gui_wasteDumpDialog_event_onModeDropDownSelectionChanged = "custom\client_code\ExileClient_gui_wasteDumpDialog_event_onModeDropDownSelectionChanged.sqf";
ExileServer_system_trading_network_wasteDumpRequest = 	"\custom_code\server_code\ExileServer_system_trading_network_wasteDumpRequest.sqf";

//LootDrops //Server
ExileServer_system_lootManager_dropItem = 				"\custom_code\server_code\ExileServer_system_lootManager_dropItem.sqf";
ExileServer_system_lootManager_spawnLootInBuilding = 	"\custom_code\server_code\ExileServer_system_lootManager_spawnLootInBuilding.sqf";

//Множитель денег в хранилище
ExileServer_system_money_network_putMoneyRequest = 		"\custom_code\server_code\ExileServer_system_money_network_putMoneyRequest.sqf";
ExileClient_gui_inventory_updatePopTabControls =		"custom\client_code\ExileClient_gui_inventory_updatePopTabControls.sqf";

//Anti-Theft
ExileClient_gui_traderDialog_updateInventoryDropdown = 	"custom\client_code\ExileClient_gui_traderDialog_updateInventoryDropdown.sqf";
ExileClient_object_player_event_onEnterSafezone = 		"custom\client_code\ExileClient_object_player_event_onEnterSafezone.sqf";
ExileClient_object_player_event_onLeaveSafezone = 		"custom\client_code\ExileClient_object_player_event_onLeaveSafezone.sqf";
ExileClient_object_player_event_hook = 					"custom\client_code\ExileClient_object_player_event_hook.sqf";
ExileClient_object_player_event_unhook = 				"custom\client_code\ExileClient_object_player_event_unhook.sqf";
ExileClient_object_player_thread_safeZone = 			"custom\client_code\ExileClient_object_player_thread_safeZone.sqf";
ExileClient_system_trading_network_purchaseVehicleResponse = "custom\client_code\ExileClient_system_trading_network_purchaseVehicleResponse.sqf";

ExileServer_system_territory_database_load = 			"\custom_code\server_code\ExileServer_system_territory_database_load.sqf"; //VG
ExileServer_object_construction_network_moveConstructionRequest = "\custom_code\server_code\ExileServer_object_construction_network_moveConstructionRequest.sqf";

ExileServer_system_territory_network_addToTerritoryRequest = "\custom_code\server_code\ExileServer_system_territory_network_addToTerritoryRequest.sqf"; //Limits
ExileServer_system_clan_network_invitetoclanrequest = 	"\custom_code\server_code\ExileServer_system_clan_network_invitetoclanrequest.sqf"; //Limits

//extDB3 connection 
ExileServer_object_lock_network_lockToggle =            "\custom_code\server_code\ExileServer_object_lock_network_lockToggle.sqf";
ExileServer_object_player_database_update =             "\custom_code\server_code\ExileServer_object_player_database_update.sqf";
ExileServer_system_network_event_onHandleDisconnect =	"\custom_code\server_code\ExileServer_system_network_event_onHandleDisconnect.sqf";
ExileServer_object_vehicle_database_update =			"\custom_code\server_code\ExileServer_object_vehicle_database_update.sqf";
ExileServer_system_database_connect =					"\custom_code\server_code\DB3\ExileServer_system_database_connect.sqf";
ExileServer_world_initialize = 							"\custom_code\server_code\DB3\ExileServer_world_initialize.sqf";
ExileServer_util_time_uptime = 							"\custom_code\server_code\DB3\ExileServer_util_time_uptime.sqf";
ExileServer_util_time_currentTime = 					"\custom_code\server_code\DB3\ExileServer_util_time_currentTime.sqf";
ExileServer_util_time_addTime = 						"\custom_code\server_code\DB3\ExileServer_util_time_addTime.sqf";
ExileServer_system_trading_network_sellItemRequest = 	"\custom_code\server_code\DB3\ExileServer_system_trading_network_sellItemRequest.sqf";
ExileServer_system_trading_network_purchaseVehicleSkinRequest = "\custom_code\server_code\DB3\ExileServer_system_trading_network_purchaseVehicleSkinRequest.sqf";
ExileServer_system_trading_network_purchaseVehicleRequest = "\custom_code\server_code\DB3\ExileServer_system_trading_network_purchaseVehicleRequest.sqf";
ExileServer_system_trading_network_purchaseItemRequest = "\custom_code\server_code\DB3\ExileServer_system_trading_network_purchaseItemRequest.sqf";
ExileServer_system_territory_network_territoryUpgradeRequest = "\custom_code\server_code\DB3\ExileServer_system_territory_network_territoryUpgradeRequest.sqf";
ExileServer_system_territory_network_restoreFlagRequest = "\custom_code\server_code\DB3\ExileServer_system_territory_network_restoreFlagRequest.sqf";
ExileServer_system_territory_network_purchaseTerritory = "\custom_code\server_code\DB3\ExileServer_system_territory_network_purchaseTerritory.sqf";
ExileServer_system_territory_network_payTerritoryProtectionMoneyRequest = "\custom_code\server_code\DB3\ExileServer_system_territory_network_payTerritoryProtectionMoneyRequest.sqf";
ExileServer_system_territory_network_payFlagRansomRequest = "\custom_code\server_code\DB3\ExileServer_system_territory_network_payFlagRansomRequest.sqf";
ExileServer_system_territory_network_flagStolenRequest = "\custom_code\server_code\DB3\ExileServer_system_territory_network_flagStolenRequest.sqf";
ExileServer_system_territory_maintenance_recalculateDueDate = "\custom_code\server_code\DB3\ExileServer_system_territory_maintenance_recalculateDueDate.sqf";
ExileServer_system_territory_database_insert = 		  "\custom_code\server_code\DB3\ExileServer_system_territory_database_insert.sqf";
ExileServer_system_database_query_selectSingleField = "\custom_code\server_code\DB3\ExileServer_system_database_query_selectSingleField.sqf";
ExileServer_system_database_query_selectSingle = 	  "\custom_code\server_code\DB3\ExileServer_system_database_query_selectSingle.sqf";
ExileServer_system_database_query_selectFull =        "\custom_code\server_code\DB3\ExileServer_system_database_query_selectFull.sqf";
ExileServer_system_database_query_insertSingle = 	  "\custom_code\server_code\DB3\ExileServer_system_database_query_insertSingle.sqf";
ExileServer_system_database_query_fireAndForget = 	  "\custom_code\server_code\DB3\ExileServer_system_database_query_fireAndForget.sqf";
ExileServer_system_database_handleBig = 			  "\custom_code\server_code\DB3\ExileServer_system_database_handleBig.sqf";
ExileServer_object_vehicle_database_load = 			  "\custom_code\server_code\DB3\ExileServer_object_vehicle_database_load.sqf";
ExileServer_object_player_event_onMpKilled = 		  "\custom_code\server_code\DB3\ExileServer_object_player_event_onMpKilled.sqf";
ExileServer_object_player_database_load = 			  "\custom_code\server_code\DB3\ExileServer_object_player_database_load.sqf";
ExileServer_object_player_createBambi = 			  "\custom_code\server_code\DB3\ExileServer_object_player_createBambi.sqf";
ExileServer_object_container_database_update =        "\custom_code\server_code\DB3\ExileServer_object_container_database_update.sqf";
ExileServer_object_container_database_load =          "\custom_code\server_code\DB3\ExileServer_object_container_database_load.sqf";
ExileServer_object_container_database_insert =        "\custom_code\server_code\DB3\ExileServer_object_container_database_insert.sqf";
ExileServer_object_container_createContainer =        "\custom_code\server_code\DB3\ExileServer_object_container_createContainer.sqf";
ExileServer_object_construction_database_load =       "\custom_code\server_code\DB3\ExileServer_object_construction_database_load.sqf";
ExileServer_object_construction_database_insert =     "\custom_code\server_code\DB3\ExileServer_object_construction_database_insert.sqf";



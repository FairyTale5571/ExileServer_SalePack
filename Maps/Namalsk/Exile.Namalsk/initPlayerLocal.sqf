///////////////////////////////////////////////////////////////////////////////
// Static Objects
///////////////////////////////////////////////////////////////////////////////

// Taken away for now
//#include "initServer.sqf"
#include "initPlayerLocalScripts.sqf"
if (!hasInterface || isServer) exitWith {};

///////////////////////////////////////////////////////////////////////////
// Hardware Trader
///////////////////////////////////////////////////////////////////////////
_workBench = "Land_Workbench_01_F" createVehicleLocal [0,0,0];
_workBench setDir 343;
_workBench setPosATL [4975.24,8055.24,0.1301];

_trader = 
[
    "Exile_Trader_Hardware",
    "Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    170,
    _workBench
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Fast Food Trader
///////////////////////////////////////////////////////////////////////////
_cashDesk = "Land_CashDesk_F" createVehicleLocal [0,0,0];
_cashDesk setDir 96.2614;
_cashDesk setPosATL [4970.25,8049.81,4.67093];

_microwave = "Land_Microwave_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _microwave;         
_microwave disableCollisionWith _cashDesk; 
_microwave attachTo [_cashDesk, [-0.6, 0.2, 1.1]];

_ketchup = "Land_Ketchup_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _ketchup;         
_ketchup disableCollisionWith _cashDesk; 
_ketchup attachTo [_cashDesk, [-0.6, 0, 1.1]];

_mustard = "Land_Mustard_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _mustard;         
_mustard disableCollisionWith _cashDesk; 
_mustard attachTo [_cashDesk, [-0.5, -0.05, 1.1]];

_trader = 
[
    "Exile_Trader_Food",
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["InBaseMoves_table1"],
    [0.1, 0.5, 0.2],
    170,
    _cashDesk
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Armory Trader
///////////////////////////////////////////////////////////////////////////
_chair = "Land_CampingChair_V2_F" createVehicleLocal [0,0,0];
_chair setDir 73.6836;
_chair setPosATL [4971.41,8045.28,4.69395];

_trader = 
[
	"Exile_Trader_Armory",
    "Exile_Trader_Armory",
	"PersianHead_A3_02",
	["InBaseMoves_SittingRifle1"],
	[0, -0.15, -0.45],
	180,
	_chair
]  call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Equipment Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Equipment",
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["InBaseMoves_Lean1"],
    [4965.38,8041.59,0.629353],
    60
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Specops Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_SpecialOperations",
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [4967.27,8039.79,4.7932],
    354.031
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Office Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Office",
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [5011.55,8011.94,4.1263],
    93.5793
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [5003.98,8063.51,0.00143814],
    268.706
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Aircraft Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Aircraft",
    "Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["LHD_krajPaluby"],
    [4991.53,8007.63,0.00143814],
    183.307
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Aircraft Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_AircraftCustoms",
    "Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"],
    [4988.44,8007.02,0.00143814],
    181.523
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vehicle Trader
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_Vehicle",
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["InBaseMoves_repairVehicleKnl", "InBaseMoves_repairVehiclePne"],
    [4991.31,8031.08,0.00144196],
    172.814
]
call ExileClient_object_trader_create;

_carWreck = "Land_Wreck_CarDismantled_F" createVehicleLocal [0,0,0];
_carWreck setDir 84.3864;    
_carWreck setPosATL [4991.31,8029.61,0.00143814];

///////////////////////////////////////////////////////////////////////////
// Vehicle Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_VehicleCustoms",
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [4981.44,8029.47,0.00143814],
    46.622
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Guard 01
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_01",
    "",
    "WhiteHead_17",
    ["InBaseMoves_patrolling1"],
    [5008.11,8016.52,10.2064],
    343
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Guard 02
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_02",
    "",
    "WhiteHead_03",
    ["InBaseMoves_patrolling2"],
    [5014.7,8020.76,12.9847],
    326
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Guard 03
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_03",
    "",
    "AfricanHead_03",
    ["InBaseMoves_patrolling1"],
    [5017.31,8022.67,0.00143814],
    294.28
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Northern Boat Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Boat",
    "Exile_Trader_Boat",
    "WhiteHead_17",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [9120.65,10076.6,6.80059],
    20
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Southern Boat Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Boat",
    "Exile_Trader_Boat",
    "WhiteHead_17",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [4357.36,4724.03,3.95238],
    0
]
call ExileClient_object_trader_create;

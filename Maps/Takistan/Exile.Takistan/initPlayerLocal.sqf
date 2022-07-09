/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

if (!hasInterface || isServer) exitWith {};

// 22 NPCs
private _npcs = [
["Exile_Trader_AircraftCustoms", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_AircraftCustoms", "GreekHead_A3_06", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","G_Tactical_Clear",[],["","","","","",""]], [5795.66, 11415.7, 83.0414], [-0.696034, 0.718009, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["Acts_carFixingWheel"], "Exile_Trader_Aircraft", "GreekHead_A3_08", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","",[],["","","","","",""]], [5805.67, 11417.3, 83.0414], [0.421902, -0.906641, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_Equipment", "Sturrock", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","G_Combat",[],["","","","","",""]], [5773.49, 11422.5, 86.1684], [-0.696031, 0.718012, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_Armory", "WhiteHead_19", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Shades_Black",[],["","","","","",""]], [5764.85, 11422.9, 83.0414], [-0.696031, 0.718012, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_SpecialOperations", "WhiteHead_17", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [5752.05, 11446.9, 83.6714], [-0.696034, 0.718009, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1"], "Exile_Trader_Hardware", "WhiteHead_16", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","G_Tactical_Black",[],["","","","","",""]], [5788.18, 11472.9, 83.8602], [-0.595001, -0.803725, 0], [0, 0, 1]],
["Exile_Trader_Office", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_Office", "WhiteHead_03", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","G_Aviator",[],["","","","","",""]], [5798.68, 11461.6, 87.2164], [0.710484, 0.703713, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendB"], "Exile_Trader_WasteDump", "WhiteHead_16", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","",[],["","","","","",""]], [5748.01, 11464.3, 83.0414], [0.744086, -0.668084, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["Acts_carFixingWheel"], "Exile_Trader_Vehicle", "WhiteHead_12", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_RacingHelmet_4_F","",[],["","","","","",""]], [5800.85, 11487.7, 83.0414], [-0.72735, 0.686267, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1"], "Exile_Trader_VehicleCustoms", "WhiteHead_04", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","G_Combat",[],["","","","","",""]], [5796.06, 11485.6, 83.3074], [-0.650713, -0.759324, 0], [0, 0, 1]],
["Exile_Trader_Food", ["InBaseMoves_table1"], "Exile_Trader_Food", "Sturrock", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Cap_tan","G_Aviator",[],["","","","","",""]], [5786.06, 11443.5, 83.2414], [0.616152, -0.787627, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_AircraftCustoms", "AfricanHead_03", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","",[],["","","","","",""]], [8236.33, 1928.71, 296.041], [-0.538863, 0.842394, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["Acts_carFixingWheel"], "Exile_Trader_Aircraft", "Barklem", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","",[],["","","","","",""]], [8246.45, 1928.26, 296.041], [0.232619, -0.972568, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_Equipment", "WhiteHead_11", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","",[],["","","","","",""]], [8215.96, 1939.82, 299.168], [-0.538859, 0.842396, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_Armory", "GreekHead_A3_07", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Shades_Black",[],["","","","","",""]], [8207.56, 1941.86, 296.041], [-0.538859, 0.842396, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_SpecialOperations", "WhiteHead_19", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [8199.81, 1967.96, 296.671], [-0.538863, 0.842394, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1"], "Exile_Trader_Hardware", "GreekHead_A3_05", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","",[],["","","","","",""]], [8240.4, 1986.24, 296.86], [-0.743333, -0.668922, 0], [0, 0, 1]],
["Exile_Trader_Office", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_Office", "WhiteHead_18", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","",[],["","","","","",""]], [8248.43, 1973.03, 300.216], [0.836552, 0.547888, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendB"], "Exile_Trader_WasteDump", "GreekHead_A3_05", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","",[],["","","","","",""]], [8199.33, 1985.88, 296.041], [0.595906, -0.803054, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["Acts_carFixingWheel"], "Exile_Trader_Vehicle", "WhiteHead_11", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_RacingHelmet_4_F","G_Tactical_Clear",[],["","","","","",""]], [8255.77, 1998.2, 296.041], [-0.57588, 0.817534, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1"], "Exile_Trader_VehicleCustoms", "WhiteHead_07", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","G_Combat",[],["","","","","",""]], [8250.66, 1997.1, 296.307], [-0.789071, -0.614302, 0], [0, 0, 1]],
["Exile_Trader_Food", ["InBaseMoves_table1"], "Exile_Trader_Food", "WhiteHead_10", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Cap_tan","G_Aviator",[],["","","","","",""]], [8232.45, 1957.85, 296.241], [0.446702, -0.894683, 0], [0, 0, 1]]
];

{
    private _logic = "Logic" createVehicleLocal [0, 0, 0];
    private _trader = (_x select 0) createVehicleLocal [0, 0, 0];
    private _animations = _x select 1;
    
    _logic setPosWorld (_x select 5);
    _logic setVectorDirAndUp [_x select 6, _x select 7];
    
    _trader setVariable ["BIS_enableRandomization", false];
    _trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
    _trader setVariable ["ExileAnimations", _animations];
    _trader setVariable ["ExileTraderType", _x select 2];
    _trader disableAI "ANIM";
    _trader disableAI "MOVE";
    _trader disableAI "FSM";
    _trader disableAI "AUTOTARGET";
    _trader disableAI "TARGET";
    _trader disableAI "CHECKVISIBLE";
    _trader allowDamage false;
    _trader setFace (_x select 3);
    _trader setUnitLoadOut (_x select 4);

    //_trader setPosWorld (_x select 5);
    //_trader setVectorDirAndUp [_x select 6, _x select 7];
    _trader setPosATL (_x select 5); //fix vector
    _trader setVectorDirAndUp [[0,1,0],[0,0,1]]; //fix vector

    _trader reveal _logic;
    _trader attachTo [_logic, [0, 0, 0]];
    _trader switchMove (_animations select 0);
    _trader addEventHandler ["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
}
forEach _npcs;
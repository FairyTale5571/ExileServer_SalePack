/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

if (!hasInterface || isServer) exitWith {};

// 12 NPCs
private _npcs = [
["Exile_Trader_WasteDump", ["HubBriefing_loop"], "Exile_Trader_WasteDump", "WhiteHead_06", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","G_Aviator",[],["","","","","",""]], [3784.26, 4921.76, 68.7363], [0.833356, 0.552737, 0], [0, 0, 1]],
["Exile_Guard_01", ["c4coming2cDf_genericstani1"], "", "WhiteHead_14", [["srifle_DMR_03_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_TacVest_khk",[]],[],"H_ShemagOpen_tan","",[],["","","","","",""]], [3785.12, 4926.3, 76.275], [0, 1, 0], [0, 0, 1]],
["Exile_Trader_Food", ["InBaseMoves_table1"], "Exile_Trader_Food", "WhiteHead_12", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Cap_tan","G_Combat",[],["","","","","",""]], [3777.68, 4947.27, 69.4534], [0.909819, 0.415005, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["Acts_carFixingWheel"], "Exile_Trader_Vehicle", "WhiteHead_01", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_RacingHelmet_4_F","",[],["","","","","",""]], [3775.07, 4942.93, 68.9719], [0.679505, 0.733671, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["HubSittingChairC_idle1"], "Exile_Trader_Hardware", "WhiteHead_17", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","",[],["","","","","",""]], [3764.55, 4927.67, 69.7582], [0.689018, 0.722755, -0.0536697], [0, 0.0740533, 0.997254]],
["Exile_Trader_Armory", ["HubBriefing_loop"], "Exile_Trader_Armory", "WhiteHead_08", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Shades_Black",[],["","","","","",""]], [3821.53, 4924.35, 68.6379], [-0.161104, -0.986937, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["HubBriefing_loop"], "Exile_Trader_Equipment", "AfricanHead_02", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","G_Combat",[],["","","","","",""]], [3814.37, 4914.09, 68.636], [0.49294, 0.870063, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubBriefing_loop"], "Exile_Trader_VehicleCustoms", "WhiteHead_19", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","",[],["","","","","",""]], [3764.74, 4945.34, 69.7167], [0, 1, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["c4coming2cDf_genericstani1"], "Exile_Trader_SpecialOperations", "WhiteHead_10", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [3789.54, 4960.55, 69.1111], [-0.745511, -0.666493, 0], [0, 0, 1]],
["Exile_Guard_02", ["c4coming2cDf_genericstani1"], "", "WhiteHead_17", [["arifle_Mk20_GL_F","","","",[],[],""],[],[],["U_BG_Guerilla1_1",[]],["V_PlateCarrierIA2_dgtl",[]],[],"H_Hat_camo","G_Tactical_Clear",[],["","","","","",""]], [3800.61, 4916.63, 76.2752], [0, 1, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["HubBriefing_loop"], "Exile_Trader_AircraftCustoms", "GreekHead_A3_08", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","G_Combat",[],["","","","","",""]], [3805.62, 4978.45, 68.9373], [0.708401, -0.70581, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["HubBriefing_loop"], "Exile_Trader_Aircraft", "WhiteHead_21", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","G_Tactical_Clear",[],["","","","","",""]], [3815.73, 4986.36, 69.0824], [0.690024, -0.723786, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["c4coming2cDf_genericstani1"], "Exile_Trader_Armory", "WhiteHead_17", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Shades_Black",[],["","","","","",""]], [3083.49, 8490.64, 4.22754], [-0.990783, -0.135456, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["c4coming2cDf_genericstani1"], "Exile_Trader_Equipment", "WhiteHead_14", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","G_Tactical_Black",[],["","","","","",""]], [3083.72, 8497.82, 4.22611], [-0.999993, -0.0037875, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["c4coming2cDf_genericstani1"], "Exile_Trader_SpecialOperations", "WhiteHead_08", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [3084.09, 8504.6, 4.20311], [-0.999414, 0.0342193, 0], [0, 0, 1]],
["Exile_Trader_BoatCustoms", ["HubBriefing_loop"], "Exile_Trader_BoatCustoms", "WhiteHead_05", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","G_Combat",[],["","","","","",""]], [3075.56, 8524.42, 1.94391], [0.804241, -0.594304, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["HubBriefing_loop"], "Exile_Trader_Boat", "WhiteHead_09", [[],[],[],["U_OrestesBody",[]],[],[],"H_Cap_surfer","G_Tactical_Clear",[],["","","","","",""]], [3075.67, 8528.17, 1.17252], [0.681475, -0.731842, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["HubBriefing_loop"], "Exile_Trader_WasteDump", "GreekHead_A3_08", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","G_Tactical_Clear",[],["","","","","",""]], [2995.34, 8530.28, 4.01722], [0.200206, -0.979754, 0], [0, 0, 1]],
["Exile_Trader_Food", ["InBaseMoves_table1"], "Exile_Trader_Food", "GreekHead_A3_06", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Cap_tan","G_Tactical_Black",[],["","","","","",""]], [3073.81, 8469.6, 4.1324], [-0.999904, 0.0138922, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubBriefing_loop"], "Exile_Trader_VehicleCustoms", "WhiteHead_12", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","",[],["","","","","",""]], [3057.28, 8464.57, 4.04044], [-0.962337, 0.27186, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["Acts_carFixingWheel"], "Exile_Trader_Vehicle", "WhiteHead_10", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_RacingHelmet_4_F","",[],["","","","","",""]], [3062.08, 8468.28, 3.90144], [-0.457207, -0.889361, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["HubBriefing_loop"], "Exile_Trader_Hardware", "WhiteHead_05", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","G_Combat",[],["","","","","",""]], [3069.1, 8515.86, 4.43856], [0.0876948, -0.996147, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["HubBriefing_loop"], "Exile_Trader_AircraftCustoms", "AfricanHead_02", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","G_Combat",[],["","","","","",""]], [7909.89, 11017, 30.5714], [0.00904086, -0.999959, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["HubBriefing_loop"], "Exile_Trader_Aircraft", "AfricanHead_03", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","G_Tactical_Clear",[],["","","","","",""]], [7930.26, 11016.1, 30.5714], [0.0169986, -0.999856, 0], [0, 0, 1]],
["Exile_Trader_Office", ["HubBriefing_loop"], "Exile_Trader_Office", "WhiteHead_09", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","G_Combat",[],["","","","","",""]], [3040.55, 8467.77, 3.99265], [0, 1, 0], [0, 0, 1]],
["Exile_Trader_Office", ["HubBriefing_loop"], "Exile_Trader_Office", "WhiteHead_04", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","",[],["","","","","",""]], [3781.38, 4955.52, 69.4577], [-0.842311, -0.538991, 0], [0, 0, 1]]




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
    _trader setPosWorld (_x select 5);
    _trader setVectorDirAndUp [_x select 6, _x select 7];
    _trader reveal _logic;
    _trader attachTo [_logic, [0, 0, 0]];
    _trader switchMove (_animations select 0);
    _trader addEventHandler ["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
}
forEach _npcs;
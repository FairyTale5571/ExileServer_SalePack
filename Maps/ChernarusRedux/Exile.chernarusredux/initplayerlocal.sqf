/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

if (!hasInterface || isServer) exitWith {};

// 36 NPCs
private _npcs = [
["Exile_Trader_SpecialOperations", ["InBaseMoves_Lean1"], "Exile_Trader_SpecialOperations", "Default", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],[],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [12128.8, 12787.5, 163.011], [-0.901342, -0.433108, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["HubStandingUA_idle1"], "Exile_Trader_Hardware", "Default", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],[],"H_Booniehat_khk_hs","",[],["","","","","",""]], [12124.6, 12786.4, 159.429], [0.510288, -0.860004, 0], [0, 0, 1]],
["Exile_Trader_Food", ["HubStandingUA_idle1"], "Exile_Trader_Food", "Default", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Cap_tan","",[],["","","","","",""]], [12120.7, 12784.7, 159.428], [0.519444, -0.854504, 0], [0, 0, 1]],
["Exile_Trader_Office", ["InBaseMoves_sitHighUp1"], "Exile_Trader_Office", "Default", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","",[],["","","","","",""]], [12114.7, 12779, 162.683], [0.597205, 0.802088, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["HubStandingUA_idle1"], "Exile_Trader_Equipment", "Default", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","",[],["","","","","",""]], [12121.1, 12786, 163.012], [0.482778, -0.875743, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["InBaseMoves_Lean1"], "Exile_Trader_Armory", "Default", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Shades_Black",[],["","","","","",""]], [12126.9, 12789.5, 163.012], [0.842522, -0.538662, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["HubStandingUA_move1"], "Exile_Trader_WasteDump", "Default", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","",[],["","","","","",""]], [12143.4, 12748.9, 158.932], [-0.731425, -0.681922, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["HubStandingUA_move1"], "Exile_Trader_AircraftCustoms", "Default", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","",[],["","","","","",""]], [12100.1, 12756, 158.945], [0.252741, 0.967534, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["HubStandingUA_move1"], "Exile_Trader_Aircraft", "Default", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","",[],["","","","","",""]], [12096.6, 12757.3, 158.958], [0.216993, 0.976173, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["HubStandingUA_move1"], "Exile_Trader_Vehicle", "Default", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_RacingHelmet_4_F","",[],["","","","","",""]], [12094.2, 12765.7, 159], [0.971883, -0.235464, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubStandingUA_move1"], "Exile_Trader_VehicleCustoms", "Default", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","",[],["","","","","",""]], [12092.5, 12760.8, 158.996], [0.971883, -0.235464, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["InBaseMoves_patrolling1"], "Exile_Trader_SpecialOperations", "Default", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],[],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [2813.71, 9007.62, 283.124], [-0.0764927, -0.99707, 0], [0, 0, 1]],
["Exile_Trader_Food", ["HubStandingUA_idle1"], "Exile_Trader_Food", "Default", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Cap_tan","",[],["","","","","",""]], [2810.15, 8992.35, 283.124], [0, 1, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["InBaseMoves_patrolling2"], "Exile_Trader_Armory", "Default", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Shades_Black",[],["","","","","",""]], [2808.71, 9007.58, 283.124], [0.0595155, -0.998227, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["InBaseMoves_table1"], "Exile_Trader_Hardware", "Default", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],[],"H_Booniehat_khk_hs","",[],["","","","","",""]], [2805.59, 8992.25, 283.123], [0, 1, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["InBaseMoves_patrolling1"], "Exile_Trader_Equipment", "Default", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","",[],["","","","","",""]], [2804.87, 9007.46, 283.124], [0.0825299, -0.996589, 0], [0, 0, 1]],
["Exile_Trader_Office", ["InBaseMoves_sitHighUp1"], "Exile_Trader_Office", "Default", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","",[],["","","","","",""]], [2830.69, 8972.3, 282.254], [0.478064, -0.878325, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", [], "Exile_Trader_WasteDump", "Default", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","",[],["","","","","",""]], [2763.09, 9024.24, 283.804], [0, 1, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["HubStandingUA_move1"], "Exile_Trader_AircraftCustoms", "Default", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","",[],["","","","","",""]], [2744.41, 8996.33, 283.276], [0.998795, 0.0490765, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["HubStandingUA_move1"], "Exile_Trader_Aircraft", "Default", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","",[],["","","","","",""]], [2745.03, 8990.58, 283.108], [0.997769, 0.0667616, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubStandingUA_move1"], "Exile_Trader_VehicleCustoms", "Default", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","",[],["","","","","",""]], [2744.39, 9009.37, 283.74], [0.999407, 0.0344459, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["HubStandingUA_move1"], "Exile_Trader_Vehicle", "Default", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_RacingHelmet_4_F","",[],["","","","","",""]], [2744.31, 9002.17, 283.475], [0.998954, 0.0457291, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["InBaseMoves_repairVehiclePne"], "Exile_Trader_WasteDump", "Default", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","",[],["","","","","",""]], [11670.6, 5632.71, 223.519], [-0.719485, 0.694508, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["HubStandingUA_idle1"], "Exile_Trader_Hardware", "Default", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],[],"H_Booniehat_khk_hs","",[],["","","","","",""]], [11741.7, 5662.87, 215.405], [0.7796, 0.626277, 0], [0, 0, 1]],
["Exile_Trader_Food", ["HubStandingUA_idle1"], "Exile_Trader_Food", "Default", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Cap_tan","",[],["","","","","",""]], [11745.3, 5658.45, 215.417], [0.7796, 0.626277, 0], [0, 0, 1]],
["Exile_Trader_Office", ["InBaseMoves_sitHighUp1"], "Exile_Trader_Office", "Default", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","",[],["","","","","",""]], [11752.8, 5629.59, 215.122], [-0.518385, -0.855147, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["InBaseMoves_patrolling2"], "Exile_Trader_SpecialOperations", "Default", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],[],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [11752, 5664.45, 215.427], [-0.7796, -0.626277, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["InBaseMoves_patrolling1"], "Exile_Trader_Armory", "Default", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Shades_Black",[],["","","","","",""]], [11755.2, 5660.36, 215.408], [-0.7796, -0.626277, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["InBaseMoves_table1"], "Exile_Trader_Equipment", "Default", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","",[],["","","","","",""]], [11758.3, 5656.24, 215.437], [-0.7796, -0.626277, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["HubStandingUA_move1"], "Exile_Trader_Vehicle", "Default", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_RacingHelmet_4_F","",[],["","","","","",""]], [11704.4, 5579.12, 219.701], [-0.7796, -0.626277, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubStandingUA_move1"], "Exile_Trader_VehicleCustoms", "Default", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","",[],["","","","","",""]], [11707, 5575.9, 219.355], [-0.7796, -0.626277, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["HubStandingUA_move1"], "Exile_Trader_Aircraft", "Default", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","",[],["","","","","",""]], [11710.8, 5571.26, 218.866], [-0.7796, -0.626277, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["HubStandingUA_move1"], "Exile_Trader_AircraftCustoms", "Default", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","",[],["","","","","",""]], [11713.2, 5568.17, 218.549], [-0.7796, -0.626277, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["HubStandingUA_idle1"], "Exile_Trader_Boat", "GreekHead_A3_05", [[],[],[],["U_OrestesBody",[]],[],[],"H_Cap_surfer","G_Tactical_Clear",[],["","","","","",""]], [13940.9, 11680.6, 0.37853], [-0.97935, 0.202172, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["HubStandingUA_idle1"], "Exile_Trader_Boat", "WhiteHead_04", [[],[],[],["U_OrestesBody",[]],[],[],"H_Cap_surfer","",[],["","","","","",""]], [4324.55, 2148.93, 3.00598], [0.410626, 0.911804, 0], [0, 0, 1]],
["Exile_Trader_BoatCustoms", ["HubStandingUA_idle1"], "Exile_Trader_BoatCustoms", "WhiteHead_07", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","G_Tactical_Clear",[],["","","","","",""]], [4328.57, 2146.74, 3.00525], [0.34939, 0.936977, 0], [0, 0, 1]]
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
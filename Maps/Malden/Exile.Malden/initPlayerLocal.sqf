/*

Exile.Malden by [FPS]kuplion - Exile 1.0.3 "Lemon" Compatible

*/

/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

 #include "initPlayerLocalScripts.sqf"
 
if (!hasInterface || isServer) exitWith {};

// 34 NPCs
private _npcs = [
["Exile_Trader_WasteDump", ["HubStandingUC_idle1","HubStandingUC_idle2","HubStandingUC_idle3","HubStandingUC_move1","HubStandingUC_move2"], "Exile_Trader_WasteDump", "WhiteHead_11", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","",[],["","","","","",""]], [7411.572754, 8075.570313, 169.244049], [0.613128, 0.789984, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_Vehicle", "AfricanHead_01", [[],[],[],["U_C_Driver_1_red",[]],[],[],"H_RacingHelmet_1_red_F","",[],["","","","","",""]], [7449.861816, 8121.39502, 168.96315], [-0.999882, -0.0153407, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_VehicleCustoms", "WhiteHead_11", [[],[],[],["U_C_Driver_4",[]],[],[],"H_Cap_red","",[],["","","","","",""]], [7431.910156, 8128.353027, 169.271439], [-0.0400096, -0.999199, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "Exile_Trader_SpecialOperations", "GreekHead_A3_05", [["MMG_01_tan_F","","","optic_Hamr",["150Rnd_93x64_Mag",150],[],"bipod_01_F_blk"],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[["150Rnd_93x64_Mag",1,150]]],["B_Parachute",[]],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [6094.801758, 10752.504883, 120.321442], [0.43812, 0.898916, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["HubSittingChairUB_idle1","HubSittingChairUB_idle2","HubSittingChairUB_idle3","HubSittingChairUB_move1"], "Exile_Trader_Aircraft", "GreekHead_A3_06", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","G_Tactical_Clear",[],["","","","","",""]], [7962.304688, 9634.816406, 30.83971], [-0.19408, -0.980986, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["Acts_passenger_flatground_leanright"], "Exile_Trader_AircraftCustoms", "WhiteHead_20", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","G_Combat",[],["","","","","",""]], [7963.081543, 9638.761719, 30.797403], [0, 1, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["HubStandingUA_idle1","HubStandingUA_idle2","HubStandingUA_idle3","HubStandingUA_move1","HubStandingUA_move2"], "Exile_Trader_WasteDump", "WhiteHead_19", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","",[],["","","","","",""]], [8040.352051, 9686.99707, 30.365921], [-0.999942, -0.0107787, 0], [0, 0, 1]],
["Exile_Guard_01", ["InBaseMoves_repairVehiclePne"], "", "WhiteHead_03", [[],[],[],["U_BG_Guerrilla_6_1",[]],["V_TacVest_khk",[]],[],"","G_Tactical_Clear",[],["","","","","",""]], [7446.290039, 8117.503906, 169.210556], [0.992839, -0.119461, 0], [0, 0, 1]],
["Exile_Guard_01", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "", "WhiteHead_01", [["LMG_Mk200_F","","","optic_Aco",["200Rnd_65x39_cased_Box",200],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_TacVest_khk",[["200Rnd_65x39_cased_Box",1,200]]],[],"H_ShemagOpen_tan","G_Tactical_Clear",[],["","","","","",""]], [7394.834961, 8141.146973, 172.487885], [-0.998549, -0.0538522, 0], [0, 0, 1]],
["Exile_Guard_03", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "", "WhiteHead_02", [["Exile_Weapon_AK74","","acc_flashlight","optic_MRCO",["Exile_Magazine_30Rnd_545x39_AK",30],[],"bipod_01_F_blk"],[],["Exile_Weapon_Taurus","","","",["Exile_Magazine_6Rnd_45ACP",6],[],""],["U_C_HunterBody_grn",[["Exile_Magazine_30Rnd_545x39_AK",1,30],["Exile_Magazine_6Rnd_45ACP",3,6]]],["V_Rangemaster_belt",[["Exile_Magazine_30Rnd_545x39_AK",2,30]]],[],"H_Booniehat_tna_F","G_Diving",["Laserdesignator_02_ghex_F","","","",[],[],""],["","ItemGPS","ItemRadio","ItemCompass","Exile_Item_XM8",""]], [7363.0942383, 8141.150879, 176.205551], [-0.737407, 0.675449, 0], [0, 0, 1]],
["Exile_Guard_03", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "", "WhiteHead_16", [["arifle_MX_SW_Black_F","","acc_pointer_IR","optic_Arco_blk_F",["100Rnd_65x39_caseless_mag",100],[],""],[],["TaurusTracker455","","","",["6Rnd_45ACP",6],[],""],["Exile_Uniform_BambiOverall",[["6Rnd_45ACP",3,6]]],["V_TacVest_blk",[["100Rnd_65x39_caseless_mag",3,100]]],[],"H_Cap_usblack","G_Spectacles",["Laserdesignator","","","",[],[],""],["ItemMap","O_UavTerminal","ItemRadio","","",""]], [7445.914063, 8064.48291, 169.24144], [0.220919, -0.975292, 0], [0, 0, 1]],
["Exile_Guard_03", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "", "WhiteHead_05", [["srifle_DMR_03_multicam_F","","","optic_Hamr",["20Rnd_762x51_Mag",20],[],""],[],["exile_rifle_SA61","","","",["10Rnd_765x17ball",10],[],""],["U_B_CTRG_1",[["20Rnd_762x51_Mag",3,20]]],["V_HarnessO_ghex_F",[]],[],"H_Cap_police","G_Sport_Blackred",["Binocular","","","",[],[],""],["","","ItemRadio","","",""]], [7436.754883, 8058.538574, 169.24144], [0.862849, -0.505462, 0], [0, 0, 1]],
["Exile_Trader_Food", ["InBaseMoves_table1"], "Exile_Trader_Food", "GreekHead_A3_05", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Cap_tan","G_Tactical_Clear",[],["","","","","",""]], [7385.985352, 8071.183105, 169.24144], [0.470612, 0.882341, 0], [0, 0, 1]],
["Exile_Trader_Office", ["HubSittingAtTableU_idle1","HubSittingAtTableU_idle2","HubSittingAtTableU_idle3"], "Exile_Trader_Office", "WhiteHead_09", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","G_Tactical_Clear",[],["","","","","",""]], [7392.478027, 8102.961914, 169.510895], [0.309659, -0.950848, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["HubSittingHighB_idle2"], "Exile_Trader_Hardware", "AfricanHead_01", [["Exile_Weapon_LeeEnfield","","","optic_Hamr",["Exile_Magazine_10Rnd_303",10],[],""],[],[],["U_C_WorkerCoveralls",[["Exile_Magazine_10Rnd_303",3,10]]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","G_Combat",[],["","","","","",""]], [7438.88623, 8139.212891, 169.444153], [-0.120449, -0.99272, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_Equipment", "WhiteHead_16", [["arifle_MX_GL_Black_F","","","optic_Aco",["30Rnd_65x39_caseless_mag",30],[],""],[],[],["U_BG_Guerrilla_6_1",[["30Rnd_65x39_caseless_mag",2,30]]],["V_I_G_resistanceLeader_F",[["30Rnd_65x39_caseless_mag",1,30]]],[],"H_Watchcap_khk","G_Tactical_Clear",[],["","","","","",""]], [7372.134766, 8081.200684, 169.0557251], [0.954735, 0.297458, 0], [0, 0, 1]],
["Exile_Guard_01", ["InBaseMoves_repairVehicleKnl"], "", "WhiteHead_04", [[],[],["Exile_Weapon_TaurusGold","","","",["Exile_Magazine_6Rnd_45ACP",6],[],""],["U_C_Driver_1_orange",[["Exile_Magazine_6Rnd_45ACP",1,6]]],[],[],"","G_Shades_Red",["Rangefinder","","","",[],[],""],["ItemMap","","","","ItemWatch",""]], [7449.632324, 8115.0493164, 169.174103], [-0.754156, 0.656696, 0], [0, 0, 1]],
["Exile_Guard_01", ["AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendB"], "", "WhiteHead_16", [[],[],[],["Exile_Uniform_BambiOverall",[]],[],[],"","",[],["","","","","",""]], [7434.295898, 8132.274414, 169.457458], [0.812844, 0.582481, 0], [0, 0, 1]],
["Exile_Guard_01", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "", "WhiteHead_15", [["srifle_DMR_03_F","","","",["20Rnd_762x51_Mag",20],[],""],[],[],["U_BG_Guerrilla_6_1",[["20Rnd_762x51_Mag",1,20]]],["V_TacVest_khk",[["20Rnd_762x51_Mag",2,20]]],[],"H_ShemagOpen_tan","G_Tactical_Black",[],["","","","","",""]], [7413.272949, 8096.419922, 169.24144], [-0.533821, -0.845597, 0], [0, 0, 1]],
["Exile_Guard_03", ["Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05"], "", "WhiteHead_02", [[],[],[],["U_I_C_Soldier_Para_5_F",[]],[],[],"","",[],["","","","","",""]], [7398.419922, 8081.890625, 169.277664], [0.964356, 0.26461, 0], [0, 0, 1]],
["Exile_Guard_02", ["InBaseMoves_HandsBehindBack1","InBaseMoves_HandsBehindBack2"], "", "WhiteHead_04", [[],[],[],["U_B_CTRG_Soldier_2_F",[]],[],[],"","",[],["","","","","",""]], [7401.353516, 8087.356445, 169.24144], [0.862491, -0.506073, 0], [0, 0, 1]],
["Exile_Guard_03", ["AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendB"], "", "WhiteHead_02", [[],[],[],["U_C_man_sport_3_F",[]],[],[],"","",[],["","","","","",""]], [7408.622559, 8096.326172, 169.24144], [0.294512, -0.955648, 0], [0, 0, 1]],
["Exile_Guard_01", ["Acts_LyingWounded_loop1","Acts_LyingWounded_loop2","Acts_LyingWounded_loop3"], "", "WhiteHead_13", [[],[],[],["U_BG_Guerrilla_6_1",[]],["V_Rangemaster_belt",[]],[],"","",[],["","","","","",""]], [7406.581543, 8085.864258, 169.24144], [0.7416, 0.670842, 0], [0, 0, 1]],
["Exile_Guard_01", ["InBaseMoves_SittingRifle1"], "", "GreekHead_A3_07", [["srifle_DMR_03_F","muzzle_snds_B","acc_flashlight","optic_AMS",["20Rnd_762x51_Mag",20],[],"bipod_01_F_blk"],[],[],["U_BG_Guerrilla_6_1",[["20Rnd_762x51_Mag",1,20]]],["V_TacVest_khk",[["20Rnd_762x51_Mag",2,20]]],[],"H_ShemagOpen_tan","G_Combat",[],["","","","","",""]], [7382.519531, 8085.872559, 169.24144], [-0.84981, 0.527089, 0], [0, 0, 1]],
["Exile_Guard_02", ["HubSittingChairUB_idle1"], "", "WhiteHead_01", [[],[],["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],["U_BG_Guerilla1_1",[["11Rnd_45ACP_Mag",3,11]]],["V_PlateCarrierIA2_dgtl",[]],[],"H_Hat_camo","G_Aviator",[],["","","","","",""]], [7382.847168, 8082.269043, 169.24144], [0.872359, -0.488865, 0], [0, 0, 1]],
["Exile_Guard_03", ["Acts_passenger_flatground_leanright"], "", "AfricanHead_02", [["SMG_02_F","","","",[],[],""],[],[],["U_BG_Guerilla2_3",[]],[],[],"H_Cap_grn","G_Squares_Tinted",[],["","","","","",""]], [7393.885742, 8078.0996094, 169.282303], [-0.846427, 0.532505, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["HubSittingChairA_idle1","HubSittingChairA_idle2","HubSittingChairA_idle3","HubSittingChairA_move1"], "Exile_Trader_Armory", "WhiteHead_19", [["srifle_DMR_06_olive_F","muzzle_snds_B_khk_F","","optic_AMS_khk",["20Rnd_762x51_Mag",20],[],"bipod_01_F_khk"],[],[],["U_I_C_Soldier_Para_3_F",[]],["V_Rangemaster_belt",[["20Rnd_762x51_Mag",3,20]]],[],"H_Shemag_olive","G_Shades_Blue",[],["","","","","",""]], [7397.379883, 8123.375, 169.508438], [0.402267, -0.915522, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"], "Exile_Trader_Boat", "GreekHead_A3_06", [[],[],[],["U_OrestesBody",[]],[],[],"H_Cap_surfer","G_Tactical_Black",[],["","","","","",""]], [7716.561035, 5096.872559, 0.202058], [0.091717, 0.995785, 0], [0, 0, 1]],
["Exile_Trader_BoatCustoms", ["AdvePercMstpSnonWnonDnon_relax","AdvePercMstpSnonWnonDnon"], "Exile_Trader_BoatCustoms", "WhiteHead_20", [[],[],[],["U_I_Wetsuit",[]],["V_RebreatherIA",[]],[],"","Exile_Glasses_Diving_AAF",[],["","","","","",""]], [7697.682129, 5072.438965, -2.190878], [0.514499, -0.857491, 0], [0, 0, 1]],
["Exile_Guard_01", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "", "WhiteHead_12", [["srifle_DMR_03_F","","","optic_Aco",["20Rnd_762x51_Mag",20],[],""],[],[],["U_I_G_Story_Protagonist_F",[["20Rnd_762x51_Mag",1,20]]],["V_HarnessOGL_brn",[["20Rnd_762x51_Mag",2,20]]],[],"H_ShemagOpen_khk","G_Tactical_Black",[],["","","","","",""]], [3226.123047, 8475.222656, 48.167206], [0.461532, -0.887124, 0], [0, 0, 1]],
["Exile_Trader_RussianRoulette", ["AmovPsitMstpSrasWrflDnon_WeaponCheck1","AmovPsitMstpSrasWrflDnon_WeaponCheck2","AmovPsitMstpSrasWrflDnon_Smoking"], "Exile_Trader_RussianRoulette", "GreekHead_A3_06", [["MMG_01_tan_F","","","optic_AMS_snd",["150Rnd_93x64_Mag",150],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_TacVestIR_blk",[["150Rnd_93x64_Mag",1,150]]],[],"H_Cap_grn","G_Squares_Tinted",[],["","","","","",""]], [3226.0170898, 8494.485352, 47.806061], [0.696464, -0.717592, 0], [0, 0, 1]],
["Exile_Guard_03", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "", "WhiteHead_17", [["LMG_Mk200_F","","","optic_ACO_grn",["200Rnd_65x39_cased_Box",200],[],"bipod_01_F_snd"],[],[],["U_I_C_Soldier_Para_1_F",[]],["V_TacVestIR_blk",[["200Rnd_65x39_cased_Box",1,200]]],[],"H_Booniehat_khk","G_Squares_Tinted",[],["","","","","",""]], [3232.715576, 8477.918945, 48.810417], [-0.988415, -0.151779, 0], [0, 0, 1]],
["Exile_Trader_Diving", ["AdvePercMstpSnonWrflDnon","AdvePercMstpSnonWrflDnon_relax"], "Exile_Trader_Diving", "WhiteHead_01", [["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["U_I_Wetsuit",[["20Rnd_556x45_UW_mag",3,20]]],["V_RebreatherIA",[]],[],"","Exile_Glasses_Diving_AAF",[],["","","","","",""]], [7748.584473, 5103.027832, -2.501379], [0.539923, -0.841714, 0], [0, 0, 1]],
["Exile_Guard_01", ["Acts_TreatingWounded01","Acts_TreatingWounded02","Acts_TreatingWounded03","Acts_TreatingWounded04","Acts_TreatingWounded05","Acts_TreatingWounded06"], "", "WhiteHead_17", [[],[],[],["U_C_Scientist",[]],["V_TacVestIR_blk",[]],["B_AssaultPack_blk",[]],"H_Cap_blk","G_Aviator",[],["","","","","",""]], [7405.790039, 8085.768555, 169.24144], [0.966792, -0.255566, 0], [0, 0, 1]]
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
/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

if (!hasInterface || isServer) exitWith {};

// 24 NPCs
private _npcs = [
["Exile_Trader_Vehicle", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_CommunityCustoms3", "WhiteHead_10", [["CUP_sgun_AA12","","CUP_acc_ANPEQ_15_OD","",["CUP_20Rnd_B_AA12_HE",20],[],""],[],[],["rhs_uniform_gorka_1_a",[["CUP_20Rnd_B_AA12_HE",1,20]]],["rhs_lifchik_vog",[["CUP_20Rnd_B_AA12_HE",2,20]]],[],"H_ShemagOpen_tan","CUP_G_ESS_BLK_Dark",[],["","","","","",""]], [3300.23, 8070.7, 199.717], [-0.859762, -0.510695, 0], [0, 0, 1]],
["Exile_Trader_CommunityCustoms2", ["InBaseMoves_table1"], "Exile_Trader_CommunityCustoms2", "WhiteHead_17", [[],["launch_RPG7_F","","","rhs_acc_1pn93_1",["RPG7_F",1],[],""],[],["CUP_O_TKI_Khet_Partug_06",[]],["rhs_6sh92_vsr",[]],["rhs_rpg_empty",[]],"CUP_H_TKI_Lungee_02","CUP_G_Scarf_Face_Blk",[],["","","","","",""]], [3302.74, 8058.93, 197.175], [-0.982944, -0.183903, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendB"], "Exile_Trader_WasteDump", "GreekHead_A3_06", [[],[],[],["CUP_U_O_RUS_Gorka_Green_gloves2",[]],["V_Pocketed_black_F",[]],[],"","G_Balaclava_blk",[],["","","","","",""]], [3283.91, 8077.57, 198.287], [0.736182, -0.676784, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_VehicleCustoms", "WhiteHead_19", [[],[],[],["CUP_I_B_PMC_Unit_37",[]],[],[],"","G_Aviator",[],["","","","","",""]], [10141.8, 10168.8, 12.3399], [-0.974187, 0.225742, 0], [0, 0, 1]],
["Exile_Trader_Office", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_Office", "WhiteHead_10", [[],[],[],["U_C_FormalSuit_01_blue_F",[]],[],[],"","G_Spectacles",[],["","","","","",""]], [10117.5, 10216.3, 19.3261], [0.549094, 0.83576, 0], [0, 0, 1]],
["Exile_Trader_Food", ["InBaseMoves_table1"], "Exile_Trader_Food", "WhiteHead_12", [[],[],[],["U_C_IDAP_Man_Jeans_F",[]],[],[],"","",[],["","","","","",""]], [10030.4, 10181.2, 15.9983], [-0.99977, 0.0214427, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_Vehicle", "GreekHead_A3_09", [[],[],[],["CUP_I_B_PARA_Unit_4",[]],[],[],"H_Cap_oli","CUP_G_TK_RoundGlasses_blk",[],["","","","","",""]], [10142.1, 10185.7, 12.4222], [-0.982066, -0.18854, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_SpecialOperations", "WhiteHead_19", [["Exile_Weapon_SVD","","","optic_MRCO",["Exile_Magazine_10Rnd_762x54",10],[],""],[],[],["CUP_U_B_BAF_MTP_UBACSLONGKNEE",[["Exile_Magazine_10Rnd_762x54",3,10]]],["CUP_V_B_BAF_DPM_Osprey_Mk3_Medic",[["SmokeShell",4,1],["rhs_mag_rgn",3,1],["CUP_HandGrenade_M67",4,1]]],["CUP_B_US_IIID_OCP",[["CUP_PipeBomb_M",5,1],["CUP_HandGrenade_M67",1,1]]],"CUP_H_USA_Cap_MCAM","G_Balaclava_TI_G_blk_F",["Laserdesignator","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]], [10052.8, 10143.5, 31.2193], [-0.949102, -0.31497, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["HubSittingHighA_idle1"], "Exile_Trader_Hardware", "WhiteHead_13", [["M1014","","","",["8rnd_B_Beneli_74Slug",8],[],""],[],[],["U_C_Mechanic_01_F",[["8rnd_B_Beneli_74Slug",3,8]]],["CUP_V_OI_TKI_Jacket3_06",[]],[],"","CUP_G_Scarf_Face_Blk",[],["","","","","",""]], [10055.9, 10124.7, 17.3495], [-0.684917, 0.728621, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["HubSittingChairA_idle1","HubSittingChairA_idle2","HubSittingChairA_idle3","HubSittingChairA_move1"], "Exile_Trader_Aircraft", "WhiteHead_21", [[],[],[],["U_B_PilotCoveralls",[]],["V_PlateCarrier1_wdl",[["rhs_mag_rgn",3,1]]],[],"H_PilotHelmetFighter_B","",[],["","","","","",""]], [10077.3, 10181.2, 11.0598], [0.293161, -0.956063, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_AircraftCustoms", "AfricanHead_03", [[],[],[],["CUP_U_B_GER_Fleck_Overalls_Pilot",[]],["V_RebreatherB",[]],[],"rhs_zsh7a_mike_green_alt","rhs_balaclava",[],["","","","","",""]], [10086.8, 10188.7, 10.2394], [0.616079, -0.787684, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["HubSittingChairA_idle1","HubSittingChairA_idle2","HubSittingChairA_idle3","HubSittingChairA_move1"], "Exile_Trader_Armory", "WhiteHead_11", [["CUP_srifle_ksvk","","","CUP_optic_PSO_1",["CUP_5Rnd_127x108_KSVK_M",5],[],""],[],[],["rhs_uniform_flora_patchless",[["CUP_5Rnd_127x108_KSVK_M",2,5]]],["rhs_6b13_Flora_6sh92_vog",[["CUP_5Rnd_127x108_KSVK_M",1,5]]],[],"","G_Balaclava_TI_G_blk_F",[],["","","","","",""]], [10050.7, 10116.5, 32.2556], [0.953502, 0.301388, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "Exile_Trader_Equipment", "WhiteHead_03", [["srifle_DMR_06_olive_F","muzzle_snds_B","","CUP_optic_Aimpoint_5000",["20Rnd_762x51_Mag",20],[],"CUP_bipod_Harris_1A2_L_BLK"],[],["rhs_weap_pp2000_folded","","","CUP_optic_Aimpoint_5000",["rhs_mag_9x19mm_7n21_20",20],[],""],["CUP_U_B_GER_Crye2",[["20Rnd_762x51_Mag",1,20]]],["CUP_V_B_GER_Armatus_BB_Trop",[["rhs_mag_rgn",3,1],["CUP_HandGrenade_M67",4,1],["20Rnd_762x51_Mag",4,20],["rhs_mag_9x19mm_7n21_20",1,20],["rhs_mag_9x19mm_7n31_44",2,44]]],["CUP_B_GER_Pack_Tropentarn",[["CUP_PipeBomb_M",4,1],["CUP_HandGrenade_M67",1,1],["20Rnd_762x51_Mag",6,20],["rhs_mag_9x19mm_7n31_44",2,44]]],"CUP_H_RUS_Cap_ATACSAU","CUP_G_Scarf_Face_Red",["Laserdesignator","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]], [10027.5, 10179.1, 11.6952], [-0.987636, -0.156762, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["HubSittingHighA_idle1"], "Exile_Trader_Hardware", "WhiteHead_09", [["M1014","","","",["8rnd_B_Beneli_74Slug",8],[],""],[],[],["U_C_Mechanic_01_F",[["8rnd_B_Beneli_74Slug",3,8]]],["CUP_V_OI_TKI_Jacket3_06",[]],[],"","CUP_G_Scarf_Face_Blk",[],["","","","","",""]], [9878.67, 4852.64, 8.52987], [-0.486659, -0.873592, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "Exile_Trader_Equipment", "GreekHead_A3_07", [["srifle_DMR_06_olive_F","muzzle_snds_B","","CUP_optic_Aimpoint_5000",["20Rnd_762x51_Mag",20],[],"CUP_bipod_Harris_1A2_L_BLK"],[],["rhs_weap_pp2000_folded","","","CUP_optic_Aimpoint_5000",["rhs_mag_9x19mm_7n21_20",20],[],""],["CUP_U_B_GER_Crye2",[["20Rnd_762x51_Mag",1,20]]],["CUP_V_B_GER_Armatus_BB_Trop",[["rhs_mag_rgn",3,1],["CUP_HandGrenade_M67",4,1],["20Rnd_762x51_Mag",4,20],["rhs_mag_9x19mm_7n21_20",1,20],["rhs_mag_9x19mm_7n31_44",2,44]]],["CUP_B_GER_Pack_Tropentarn",[["CUP_PipeBomb_M",4,1],["CUP_HandGrenade_M67",1,1],["20Rnd_762x51_Mag",6,20],["rhs_mag_9x19mm_7n31_44",2,44]]],"CUP_H_RUS_Cap_ATACSAU","CUP_G_Scarf_Face_Red",["Laserdesignator","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]], [9815.02, 4857.58, 7.70253], [-0.744934, -0.667138, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["HubSittingChairA_idle1","HubSittingChairA_idle2","HubSittingChairA_idle3","HubSittingChairA_move1"], "Exile_Trader_Armory", "WhiteHead_06", [["rhs_weap_ak74","CUP_muzzle_snds_KZRZP_AK545","rhs_acc_perst1ik","",["rhs_30Rnd_545x39_7N6M_AK",30],[],""],[],[],["rhs_uniform_flora_patchless",[["rhs_30Rnd_545x39_7N6M_AK",2,30]]],["rhs_6b13_Flora_6sh92_vog",[["rhs_30Rnd_545x39_7N6M_AK",1,30]]],[],"","G_Balaclava_TI_G_blk_F",[],["","","","","",""]], [9938.78, 4862.29, 8.49145], [0.719532, -0.694459, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["Acts_carFixingWheel"], "Exile_Trader_Vehicle", "WhiteHead_19", [[],[],[],["CUP_I_B_PARA_Unit_4",[]],[],[],"H_Cap_oli","CUP_G_TK_RoundGlasses_blk",[],["","","","","",""]], [9804.22, 4798.78, 7.47951], [0.0122865, -0.999925, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_VehicleCustoms", "WhiteHead_12", [[],[],[],["CUP_I_B_PMC_Unit_37",[]],[],[],"","G_Aviator",[],["","","","","",""]], [9827.22, 4798.77, 7.46765], [-0.495972, 0.868338, 0], [0, 0, 1]],
["Exile_Trader_Food", ["InBaseMoves_table1"], "Exile_Trader_Food", "AfricanHead_03", [[],[],[],["U_C_IDAP_Man_Jeans_F",[]],[],[],"","",[],["","","","","",""]], [9806.58, 4844.25, 7.70253], [0.999512, 0.0312346, 0], [0, 0, 1]],
["Exile_Trader_Office", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_Office", "WhiteHead_17", [[],[],[],["U_C_FormalSuit_01_blue_F",[]],[],[],"","G_Spectacles",[],["","","","","",""]], [9888.33, 4857.2, 13.9101], [-0.135826, 0.990733, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["HubSittingChairA_idle1","HubSittingChairA_idle2","HubSittingChairA_idle3","HubSittingChairA_move1"], "Exile_Trader_Aircraft", "AfricanHead_02", [[],[],[],["U_B_PilotCoveralls",[]],["V_PlateCarrier1_wdl",[["rhs_mag_rgn",3,1]]],[],"H_PilotHelmetFighter_B","",[],["","","","","",""]], [9951.39, 4896.7, 7.85622], [-0.387033, -0.922066, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_CommunityCustoms", "Barklem", [[],[],[],["CUP_U_B_GER_Fleck_Overalls_Pilot",[]],["V_RebreatherB",[]],[],"rhs_zsh7a_mike_green_alt","rhs_balaclava",[],["","","","","",""]], [9737.36, 4906.55, 8.53723], [-0.058958, -0.99826, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_AircraftCustoms", "AfricanHead_03", [[],[],[],["CUP_U_B_GER_Fleck_Overalls_Pilot",[]],["V_RebreatherB",[]],[],"rhs_zsh7a_mike_green_alt","rhs_balaclava",[],["","","","","",""]], [9963.66, 4895.8, 7.60476], [0.109967, -0.993935, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_SpecialOperations", "Sturrock", [["Exile_Weapon_SVD","","","optic_MRCO",["Exile_Magazine_10Rnd_762x54",10],[],""],[],[],["CUP_U_B_BAF_MTP_UBACSLONGKNEE",[["Exile_Magazine_10Rnd_762x54",3,10]]],["CUP_V_B_BAF_DPM_Osprey_Mk3_Medic",[["SmokeShell",4,1],["rhs_mag_rgn",3,1],["CUP_HandGrenade_M67",4,1]]],["CUP_B_US_IIID_OCP",[["CUP_PipeBomb_M",5,1],["CUP_HandGrenade_M67",1,1]]],"CUP_H_USA_Cap_MCAM","G_Balaclava_TI_G_blk_F",["Laserdesignator","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]], [9942.34, 4865.76, 12.5677], [-0.272485, -0.96216, 0], [0, 0, 1]]
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
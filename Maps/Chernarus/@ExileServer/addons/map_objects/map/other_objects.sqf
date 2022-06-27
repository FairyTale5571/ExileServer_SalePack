/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 72 Vehicles
private _vehicles = [
["TK_GUE_WarfareBBarrier10xTall_EP1", [4409.67, 10735.2, 340.096], [-0.867094, -0.498145, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4419.81, 10717, 340.096], [-0.867094, -0.498145, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4398.67, 10743.8, 340.096], [-0.256868, -0.966447, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4421.59, 10703.3, 340.096], [0.966272, -0.257523, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4366.53, 10731.8, 340.096], [0.499347, -0.866402, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4384.77, 10742, 340.096], [0.499347, -0.866402, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4358.01, 10720.8, 340.096], [0.966806, -0.255512, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4370.01, 10688.7, 340.096], [0.864791, 0.502132, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4359.77, 10706.9, 340.096], [0.864791, 0.502132, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4381.04, 10680.2, 340.096], [0.252401, 0.967623, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4395, 10682.1, 340.096], [0.499347, -0.866402, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4413.25, 10692.3, 340.096], [0.499347, -0.866402, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4391.8, 10695.4, 340.368], [-0.865378, -0.501119, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4402.65, 10701.7, 340.368], [-0.865378, -0.501119, 0], [0, 0, 1], true],
["CampEast", [4413.24, 10700.9, 340.352], [0.483345, -0.87543, 0], [0, 0, 1], true],
["CampEast", [4415.81, 10712.7, 340.352], [0.483345, -0.87543, 0], [0, 0, 1], true],
["CampEast", [4405.38, 10731.7, 340.352], [-0.493168, 0.869934, 0], [0, 0, 1], true],
["CampEast", [4393.27, 10737, 340.352], [-0.475448, 0.879744, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4376.92, 10722.4, 340.368], [0.866958, 0.498381, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4387.79, 10728.6, 340.368], [0.866958, 0.498381, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4391.19, 10712.8, 340.368], [-0.49563, 0.868534, 0], [0, 0, 1], true],
["Land_BagBunker_Tower_F", [4375.23, 10689, 341.212], [-0.519974, 0.854182, 0], [0, 0, 1], true],
["Land_BagBunker_Tower_F", [4362.88, 10711.3, 341.212], [-0.519974, 0.854182, 0], [0, 0, 1], true],
["Land_Razorwire_F", [4373.22, 10702.1, 339.755], [0, 1, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4861.41, 9931.27, 340.096], [-0.867094, -0.498145, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4871.55, 9913.01, 340.096], [-0.867094, -0.498145, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4850.41, 9939.8, 340.096], [-0.256868, -0.966447, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4873.34, 9899.29, 340.096], [0.966272, -0.257523, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4818.27, 9927.81, 340.096], [0.499347, -0.866402, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4836.51, 9937.99, 340.096], [0.499347, -0.866402, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4809.75, 9916.8, 340.096], [0.966806, -0.255512, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4821.75, 9884.73, 340.096], [0.864791, 0.502132, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4811.51, 9902.94, 340.096], [0.864791, 0.502132, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4832.78, 9876.25, 340.096], [0.252401, 0.967623, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4846.75, 9878.1, 340.096], [0.499347, -0.866402, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4864.99, 9888.28, 340.096], [0.499347, -0.866402, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4843.54, 9891.44, 340.368], [-0.865378, -0.501119, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4854.4, 9897.71, 340.368], [-0.865378, -0.501119, 0], [0, 0, 1], true],
["CampEast", [4864.98, 9896.93, 340.392], [0.483345, -0.87543, 0], [0, 0, 1], true],
["CampEast", [4867.55, 9908.68, 340.392], [0.483345, -0.87543, 0], [0, 0, 1], true],
["CampEast", [4857.12, 9927.7, 340.392], [-0.493168, 0.869934, 0], [0, 0, 1], true],
["CampEast", [4845.02, 9933.07, 340.392], [-0.475448, 0.879744, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4828.66, 9918.43, 340.368], [0.866958, 0.498381, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4839.53, 9924.67, 340.368], [0.866958, 0.498381, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4842.93, 9908.85, 340.368], [-0.49563, 0.868534, 0], [0, 0, 1], true],
["Land_BagBunker_Tower_F", [4826.97, 9885, 341.212], [-0.519974, 0.854182, 0], [0, 0, 1], true],
["Land_BagBunker_Tower_F", [4814.62, 9907.32, 341.212], [-0.519974, 0.854182, 0], [0, 0, 1], true],
["Land_Razorwire_F", [4824.96, 9898.18, 339.755], [0, 1, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4763.47, 2504.73, 10.0804], [-0.867017, -0.497946, 0.0181999], [0.0133317, 0.0133305, 0.999822], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4773.61, 2486.47, 10.0964], [-0.867094, -0.498145, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4752.47, 2513.26, 10.0133], [-0.256845, -0.966315, 0.0163085], [0.0133317, 0.0133305, 0.999822], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4775.4, 2472.75, 10.0964], [0.966272, -0.257523, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4720.33, 2501.27, 10.05], [0.499347, -0.866325, -0.0115467], [-1.20914e-008, -0.0133272, 0.999911], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4738.57, 2511.45, 10.0964], [0.499347, -0.866402, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4711.81, 2490.26, 10.0964], [0.966806, -0.255512, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4723.81, 2458.19, 10.063], [0.864714, 0.501934, 0.0182223], [-0.0133316, -0.0133305, 0.999822], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4713.57, 2476.4, 10.0964], [0.864791, 0.502132, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4734.84, 2449.71, 9.99637], [0.252401, 0.967623, 0], [0, 0, 1], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4748.81, 2451.57, 10.0873], [0.499347, -0.866325, -0.0115467], [-1.20914e-008, -0.0133272, 0.999911], true],
["TK_GUE_WarfareBBarrier10xTall_EP1", [4767.05, 2461.75, 10.0964], [0.499347, -0.866402, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4745.6, 2464.9, 10.3684], [-0.865378, -0.501119, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4756.46, 2471.17, 10.3684], [-0.865378, -0.501119, 0], [0, 0, 1], true],
["CampEast", [4767.04, 2470.39, 10.3497], [0.483345, -0.87543, 0], [0, 0, 1], true],
["CampEast", [4769.61, 2482.15, 10.3519], [0.483345, -0.87543, 0], [0, 0, 1], true],
["CampEast", [4759.18, 2501.17, 10.3519], [-0.493168, 0.869934, 0], [0, 0, 1], true],
["CampEast", [4747.08, 2506.54, 10.3519], [-0.475448, 0.879744, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4730.72, 2491.9, 10.2766], [0.866881, 0.498182, 0.0182012], [-0.0133317, -0.0133305, 0.999822], true],
["Land_Mil_Barracks_i", [4741.59, 2498.14, 10.3684], [0.866958, 0.498381, 0], [0, 0, 1], true],
["Land_Mil_Barracks_i", [4744.99, 2482.31, 10.2985], [-0.495586, 0.868545, -0.00497201], [0.0133317, 0.0133305, 0.999822], true],
["Land_BagBunker_Tower_F", [4729.03, 2458.47, 11.1947], [-0.519974, 0.854182, 0], [0, 0, 1], true],
["Land_BagBunker_Tower_F", [4716.68, 2480.79, 11.2118], [-0.519974, 0.854182, 0], [0, 0, 1], true],
["Land_Razorwire_F", [4727.02, 2471.64, 9.75507], [0, 1, 0], [0, 0, 1], true]
];

{
    private _vehicle = (_x select 0) createVehicle (_x select 1);
    _vehicle allowDamage false;
    _vehicle setPosWorld (_x select 1);
    _vehicle setVectorDirAndUp [_x select 2, _x select 3];
    _vehicle enableSimulationGlobal (_x select 4);
    _vehicle setVariable ["ExileIsLocked", -1, true];
    
    if (_vehicle isKindOf "Exile_RussianRouletteChair") then
    {
        ExileRouletteChairs pushBack _vehicle;
        ExileRouletteChairPositions pushBack [_x select 1, getDir _vehicle];
    };
}
forEach _vehicles;

// 0 Simple Objects
private _invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
private _simpleObjects = [

];

{
    private _simpleObject = createSimpleObject [_x select 0, _x select 1];
    _simpleObject setVectorDirAndUp [_x select 2, _x select 3];
    
    {
        if ((toLower _x) in _invisibleSelections) then 
        {
            _simpleObject hideSelection [_x, true];
        };
    }
    forEach (selectionNames _simpleObject);
}
forEach _simpleObjects;
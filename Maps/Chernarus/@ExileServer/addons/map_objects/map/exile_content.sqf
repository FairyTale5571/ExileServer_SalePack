/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 10 Vehicles
private _vehicles = [
["Land_CampingChair_V2_F", [6331.91, 7803.83, 305.499], [-0.0990908, -0.995077, 0.0014631], [0.00133688, 0.00133721, 0.999998], true],
["Land_WoodenTable_large_F", [6331.91, 7804.77, 305.423], [-0.996904, -0.0786198, 0.00143787], [0.00133688, 0.00133721, 0.999998], true],
["Exile_RussianRouletteChair", [6332.71, 7805.79, 304.991], [0, 0.999999, 0.00133688], [-0.00133721, -0.00133688, 0.999998], true],
["Exile_RussianRouletteChair", [6331.97, 7805.72, 304.99], [0, 0.999999, 0.00133688], [-0.00133721, -0.00133688, 0.999998], true],
["Exile_RussianRouletteChair", [6331.35, 7805.69, 304.99], [0, 0.999999, -0.00133721], [0.00133688, 0.00133721, 0.999998], true],
["Exile_RussianRouletteChair", [6333.28, 7804.91, 304.99], [0.999947, -0.0101882, 0.00132352], [-0.00133721, -0.00133688, 0.999998], true],
["Exile_RussianRouletteChair", [6330.43, 7804.67, 304.993], [-0.986201, -0.165548, 0.0015398], [0.00133688, 0.00133721, 0.999998], true],
["Exile_ConcreteMixer", [2869.63, 9738.3, 271.697], [0.589746, -0.807589, 0], [0, 0, 1], true],
["Exile_ConcreteMixer", [11455.4, 7449.82, 221], [0, 1, 0], [0, 0, 1], true],
["Exile_ConcreteMixer", [4563.78, 4550.52, 233], [-0.60816, 0.793814, 0], [0, 0, 1], true]
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
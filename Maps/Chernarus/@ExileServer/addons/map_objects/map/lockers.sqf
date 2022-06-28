/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 8 Vehicles
private _vehicles = [
["Exile_Sign_Locker", [4067.71, 11701.7, 368.628], [0, 1, 0], [0, 0, 1], true],
["Exile_Sign_Locker", [6348.27, 7789.47, 306.069], [0, 1, 0], [0, 0, 1], true],
["Exile_Sign_Locker", [11446.6, 11336.1, 318.229], [0.121661, -0.992572, 0], [0, 0, 1], true],
["Exile_Sign_Locker", [12002.4, 12666.3, 159.841], [-0.100126, -0.994975, 0], [0, 0, 1], true],
["Exile_Locker", [4067.81, 11701.4, 367.572], [0, 0.997224, 0.0744588], [-0.077101, -0.0742371, 0.994256], true],
["Exile_Locker", [6348.29, 7789.12, 305.032], [0, 0.999911, -0.0133317], [0.00399675, 0.0133316, 0.999903], true],
["Exile_Locker", [11446.7, 11336.8, 317.196], [0.0583629, -0.998257, -0.00876816], [-0.0093285, -0.00932809, 0.999913], true],
["Exile_Locker", [12002.5, 12667, 158.8], [-0.119583, -0.992824, 0], [0, 0, 1], true]
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
/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 42 Vehicles
private _vehicles = [
["Land_i_Shop_01_V1_F", [5804.88, 11459.1, 86.1061], [-0.69604, 0.718003, 0], [0, 0, 1], true],
["Land_Kiosk_redburger_F", [5785.03, 11444.4, 86.112], [-0.69604, 0.718003, 0], [0, 0, 1], true],
["Land_WaterCooler_01_new_F", [5786.34, 11447, 83.9721], [-0.696034, 0.718009, 0], [0, 0, 1], false],
["Land_GH_House_2_F", [5749.54, 11452.7, 83.9462], [-0.69604, 0.718003, 0], [0, 0, 1], true],
["Exile_Sign_TraderCity", [5750.7, 11468.8, 88.5675], [-0.690845, 0.723003, 0], [0, 0, 1], false],
["Exile_Sign_Equipment_Small", [5798.95, 11463.3, 84.1815], [-0.696034, 0.718009, 0], [0, 0, 1], false],
["Exile_Sign_Hardware", [5784.42, 11469.6, 84.0811], [0.720465, 0.693491, 0], [0, 0, 1], false],
["Exile_Sign_Vehicles", [5801.48, 11489.6, 84.0811], [-0.696034, 0.718009, 0], [0, 0, 1], false],
["Exile_Sign_WasteDump", [5747.09, 11465.1, 84.0811], [-0.696034, 0.718009, 0], [0, 0, 1], false],
["Exile_Locker", [5750.07, 11444.4, 83.04], [0.718073, 0.695968, 0], [0, 0, 1], true],
["Land_Cargo_HQ_V3_F", [5771.57, 11419.9, 86.9154], [-0.69604, 0.718003, 0], [0, 0, 1], true],
["Exile_Sign_VehicleCustoms", [5793.27, 11484.5, 84.0811], [-0.696034, 0.718009, 0], [0, 0, 1], false],
["Exile_Sign_Equipment", [5771.76, 11426.5, 87.2076], [0.661522, -0.749926, 0], [0, 0, 1], false],
["Exile_Sign_Armory", [5765.41, 11422.5, 84.0811], [0.683619, -0.729839, 0], [0, 0, 1], false],
["Exile_Sign_Food", [5783.6, 11445.7, 88.5644], [0.722705, -0.691156, 0], [0, 0, 1], false],
["Exile_Sign_Office", [5797.57, 11462.3, 84.0811], [0.732179, -0.681112, 0], [0, 0, 1], false],
["Exile_Sign_SpecialOperations", [5753.28, 11445.4, 84.9658], [-0.696034, 0.718009, 0], [0, 0, 1], false],
["Exile_Sign_Aircraft", [5809.65, 11417.7, 84.0811], [-0.0498071, -0.998759, 0], [0, 0, 1], false],
["Exile_Sign_AircraftCustoms", [5795.8, 11414.5, 84.0811], [0.318781, -0.947828, 0], [0, 0, 1], false],
["Exile_Sign_Locker", [5750.17, 11444.5, 84.0811], [0.69928, 0.714848, 0], [0, 0, 1], false],
["Land_CarService_F", [5789.96, 11472.6, 84.8275], [-0.69604, 0.718003, 0], [0, 0, 1], true],
["Land_i_Shop_01_V1_F", [8254.02, 1969.42, 299.106], [-0.53887, 0.842389, 0], [0, 0, 1], true],
["Land_Kiosk_redburger_F", [8231.63, 1958.92, 299.112], [-0.53887, 0.842389, 0], [0, 0, 1], true],
["Land_WaterCooler_01_new_F", [8233.45, 1961.27, 296.972], [-0.538863, 0.842393, 0], [0, 0, 1], false],
["Land_GH_House_2_F", [8198.51, 1974.15, 296.946], [-0.53887, 0.842389, 0], [0, 0, 1], true],
["Exile_Sign_TraderCity", [8202.86, 1989.68, 301.567], [-0.532782, 0.846253, 0], [0, 0, 1], false],
["Exile_Sign_Equipment_Small", [8249.06, 1974.74, 297.181], [-0.538863, 0.842393, 0], [0, 0, 1], false],
["Exile_Sign_Hardware", [8236.06, 1983.73, 297.081], [0.844294, 0.535881, 0], [0, 0, 1], false],
["Exile_Sign_Vehicles", [8256.78, 2000, 297.081], [-0.538863, 0.842393, 0], [0, 0, 1], false],
["Exile_Sign_WasteDump", [8198.59, 1986.82, 297.081], [-0.538863, 0.842393, 0], [0, 0, 1], false],
["Exile_Locker", [8197.39, 1965.95, 296.04], [0.842443, 0.538785, 0], [0, 0, 1], true],
["Land_Cargo_HQ_V3_F", [8213.58, 1937.66, 299.915], [-0.53887, 0.842389, 0], [0, 0, 1], true],
["Exile_Sign_VehicleCustoms", [8247.72, 1996.63, 297.081], [-0.538863, 0.842393, 0], [0, 0, 1], false],
["Exile_Sign_Equipment", [8215.06, 1944.02, 300.208], [0.498679, -0.866787, 0], [0, 0, 1], false],
["Exile_Sign_Armory", [8208.05, 1941.42, 297.081], [0.524338, -0.85151, 0], [0, 0, 1], false],
["Exile_Sign_Food", [8230.5, 1960.49, 301.564], [0.570354, -0.821399, 0], [0, 0, 1], false],
["Exile_Sign_Office", [8247.5, 1973.99, 297.081], [0.58164, -0.813446, 0], [0, 0, 1], false],
["Exile_Sign_SpecialOperations", [8200.73, 1966.26, 297.966], [-0.538863, 0.842393, 0], [0, 0, 1], false],
["Exile_Sign_Aircraft", [8250.44, 1927.86, 297.081], [-0.247985, -0.968764, 0], [0, 0, 1], false],
["Exile_Sign_AircraftCustoms", [8236.23, 1927.54, 297.081], [0.123355, -0.992363, 0], [0, 0, 1], false],
["Exile_Sign_Locker", [8197.5, 1965.98, 297.081], [0.827793, 0.561034, 0], [0, 0, 1], false],
["Land_CarService_F", [8242.1, 1985.6, 297.828], [-0.53887, 0.842389, 0], [0, 0, 1], true]
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

// 114 Simple Objects
private _invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
private _simpleObjects = [
["a3\structures_f\wrecks\wreck_car_f.p3d", [5747.07, 11461.7, 83.7683], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_epb\civ\garbage\garbagecontainer_closed_f.p3d", [5745.28, 11466.7, 83.82], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\civ\garbage\tyres_f.p3d", [5744.15, 11452.3, 83.3123], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\civ\garbage\junkpile_f.p3d", [5745.06, 11463.6, 83.3147], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_epa\civ\constructions\portablelight_single_f.p3d", [5786.56, 11466.7, 84.1238], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_heli\civ\constructions\weldingtrolley_01_f.p3d", [5792.86, 11475.5, 84.2656], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\workbench_01_f.p3d", [5788.53, 11472.7, 84.0667], [0.770044, 0.637991, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [5774.44, 11467.4, 83.6017], [0.702994, -0.711196, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [5780.29, 11472.9, 83.6017], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\walls\city_gate_f.p3d", [5777.41, 11470.2, 83.5417], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\walls\city_8m_f.p3d", [5796.77, 11468.5, 83.6017], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [5780.96, 11437.1, 83.4379], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [5792.5, 11444.6, 83.4379], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [5785.34, 11433.5, 83.4379], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [5788.38, 11437.6, 83.4379], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [5792.99, 11436.3, 83.4379], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5784.94, 11430.3, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5794.78, 11445.4, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5791.5, 11444, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5784.21, 11433.6, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5781.75, 11438, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5786.4, 11433.6, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5792.49, 11438.2, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5787.31, 11437.3, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5789.76, 11435.6, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5793.47, 11435.4, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5779.96, 11436.6, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_epc\civ\camping\sunshade_04_f.p3d", [5781.38, 11436.7, 84.3425], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_epc\civ\camping\sunshade_04_f.p3d", [5793.53, 11437, 84.3425], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_epc\civ\camping\sunshade_04_f.p3d", [5785.09, 11432.8, 84.3425], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [5793.19, 11454.8, 83.4379], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [5787.87, 11454.1, 83.4379], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5793.38, 11452.6, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5788.31, 11454.8, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5787.08, 11453.5, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [5794.47, 11454.9, 83.5137], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\wrecks\wreck_offroad2_f.p3d", [5797.23, 11487.3, 83.955], [-0.784544, -0.620074, 0], [0, 0, 1]],
["a3\structures_f\civ\market\woodencart_f.p3d", [5755.28, 11459.7, 83.7188], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_heli\civ\constructions\tooltrolley_02_f.p3d", [5791.4, 11477.6, 84.0496], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_epa\mil\scrapyard\pallet_milboxes_f.p3d", [5802.28, 11461.1, 83.7932], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_epa\mil\scrapyard\paperbox_open_full_f.p3d", [5799.77, 11461.8, 83.648], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\walls\cncbarrier_f.p3d", [5780.38, 11472.6, 83.4257], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\walls\cncbarrier_f.p3d", [5801.86, 11468.3, 83.4257], [-0.725887, -0.687814, 0], [0, 0, 1]],
["a3\structures_f\walls\cncbarrier_f.p3d", [5800.07, 11470.2, 83.4257], [-0.725887, -0.687814, 0], [0, 0, 1]],
["a3\structures_f_epb\items\luggage\luggageheap_03_f.p3d", [5806.14, 11459.5, 83.853], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_epb\items\luggage\luggageheap_04_f.p3d", [5804.66, 11458.3, 83.8431], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_epb\items\luggage\luggageheap_02_f.p3d", [5798.09, 11461.4, 83.6494], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\ind\cargo\cargo20_military_green_f.p3d", [5750.49, 11469.1, 84.4693], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\households\addons\i_addon_04_v1_f.p3d", [5807.98, 11454.3, 83.8617], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f\wrecks\wreck_heli_attack_02_f.p3d", [5803.29, 11413.8, 85.8317], [-0.929747, -0.368199, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [5774.71, 11464.9, 83.6017], [0.710644, 0.703552, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [5777.19, 11462.4, 83.6017], [0.710644, 0.703552, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [5779.62, 11459.9, 83.6017], [0.718243, 0.695792, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [5782.08, 11460.2, 83.6017], [-0.708167, 0.706045, 0], [0, 0, 1]],
["a3\structures_f_epa\civ\constructions\portablelight_single_f.p3d", [5795.87, 11474.4, 84.1238], [-0.696034, 0.718009, 0], [0, 0, 1]],
["a3\structures_f_epa\civ\constructions\portablelight_single_f.p3d", [5766.54, 11420.1, 87.2503], [0.279101, -0.960262, 0], [0, 0, 1]],
["a3\structures_f_epa\civ\constructions\portablelight_single_f.p3d", [5751.98, 11443.6, 84.1238], [-0.852821, 0.522203, 0], [0, 0, 1]],
["a3\structures_f\wrecks\wreck_car_f.p3d", [8197.9, 1983.49, 296.768], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_epb\civ\garbage\garbagecontainer_closed_f.p3d", [8197.13, 1988.69, 296.82], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\civ\garbage\tyres_f.p3d", [8193.15, 1974.8, 296.312], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\civ\garbage\junkpile_f.p3d", [8196.3, 1985.7, 296.315], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_epa\civ\constructions\portablelight_single_f.p3d", [8237.58, 1980.46, 297.124], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_heli\civ\constructions\weldingtrolley_01_f.p3d", [8245.51, 1987.85, 297.266], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\workbench_01_f.p3d", [8240.72, 1986.01, 297.067], [0.881808, 0.471609, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [8225.85, 1983.58, 296.602], [0.547041, -0.837106, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [8232.68, 1987.84, 296.602], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\walls\city_gate_f.p3d", [8229.31, 1985.74, 296.542], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\walls\city_8m_f.p3d", [8247.96, 1980.26, 296.602], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [8226.19, 1952.57, 296.438], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [8239, 1957.64, 296.438], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [8229.78, 1948.24, 296.438], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [8233.57, 1951.62, 296.438], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [8237.82, 1949.42, 296.438], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8228.75, 1945.19, 296.514], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8241.4, 1957.98, 296.514], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8237.91, 1957.3, 296.514], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8228.68, 1948.49, 296.514], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8227.15, 1953.33, 296.514], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8230.83, 1948.09, 296.514], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8237.72, 1951.42, 296.514], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8232.45, 1951.5, 296.514], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8234.52, 1949.38, 296.514], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8238.11, 1948.41, 296.514], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8225.13, 1952.36, 296.514], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_epc\civ\camping\sunshade_04_f.p3d", [8226.53, 1952.16, 297.342], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_epc\civ\camping\sunshade_04_f.p3d", [8238.49, 1950.01, 297.342], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_epc\civ\camping\sunshade_04_f.p3d", [8229.38, 1947.53, 297.342], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [8241.71, 1967.5, 296.601], [-0.537147, 0.842393, 0.0429714], [0.0797447, 0, 0.996815]],
["a3\structures_f_heli\furniture\rattantable_01_f.p3d", [8236.36, 1967.88, 296.777], [-0.537147, 0.843137, 0.0243418], [-0.0797447, -0.0794907, 0.993641]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8241.45, 1965.32, 296.697], [-0.537147, 0.842393, 0.0429714], [0.0797447, 0, 0.996815]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8236.93, 1968.49, 296.947], [-0.537147, 0.843137, 0.0243418], [-0.0797447, -0.0794907, 0.993641]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8235.47, 1967.44, 296.746], [-0.537147, 0.843137, 0.0243418], [-0.0797447, -0.0794907, 0.993641]],
["a3\structures_f\furniture\chairplastic_f.p3d", [8242.99, 1967.36, 296.575], [-0.537147, 0.842393, 0.0429714], [0.0797447, 0, 0.996815]],
["a3\structures_f\wrecks\wreck_offroad2_f.p3d", [8252.16, 1998.58, 296.955], [-0.892443, -0.45116, 0], [0, 0, 1]],
["a3\structures_f\civ\market\woodencart_f.p3d", [8205.54, 1979.87, 296.719], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_heli\civ\constructions\tooltrolley_02_f.p3d", [8244.5, 1990.17, 297.05], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_epa\mil\scrapyard\pallet_milboxes_f.p3d", [8251.87, 1971.84, 296.793], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_epa\mil\scrapyard\paperbox_open_full_f.p3d", [8249.54, 1973.02, 296.648], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\walls\cncbarrier_f.p3d", [8232.7, 1987.51, 296.426], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\walls\cncbarrier_f.p3d", [8252.89, 1978.97, 296.426], [-0.848475, -0.529236, 0], [0, 0, 1]],
["a3\structures_f\walls\cncbarrier_f.p3d", [8251.52, 1981.22, 296.426], [-0.848475, -0.529236, 0], [0, 0, 1]],
["a3\structures_f_epb\items\luggage\luggageheap_03_f.p3d", [8255.33, 1969.49, 296.853], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_epb\items\luggage\luggageheap_04_f.p3d", [8253.64, 1968.64, 296.843], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_epb\items\luggage\luggageheap_02_f.p3d", [8247.83, 1972.99, 296.649], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\ind\cargo\cargo20_military_green_f.p3d", [8202.71, 1990.02, 297.469], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\households\addons\i_addon_04_v1_f.p3d", [8256.11, 1964.08, 296.862], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f\wrecks\wreck_heli_attack_02_f.p3d", [8243.43, 1925.29, 298.832], [-0.9845, -0.175387, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [8225.62, 1981.1, 296.602], [0.836676, 0.547698, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [8227.55, 1978.16, 296.602], [0.836676, 0.547698, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [8229.44, 1975.23, 296.602], [0.842575, 0.538579, 0], [0, 0, 1]],
["a3\structures_f\walls\city_4m_f.p3d", [8231.91, 1975.05, 296.602], [-0.553138, 0.83309, 0], [0, 0, 1]],
["a3\structures_f_epa\civ\constructions\portablelight_single_f.p3d", [8248.25, 1986.21, 297.124], [-0.538863, 0.842393, 0], [0, 0, 1]],
["a3\structures_f_epa\civ\constructions\portablelight_single_f.p3d", [8208.66, 1938.79, 300.25], [0.0819936, -0.996633, 0], [0, 0, 1]],
["a3\structures_f_epa\civ\constructions\portablelight_single_f.p3d", [8199.09, 1964.71, 297.124], [-0.73155, 0.681788, 0], [0, 0, 1]]
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
private ['_code', '_function', '_file'];

//Server Functions
{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ['ExileServer_VehiclePainting_network_PaintVehicleRequest','VehiclePainting_Server\ServerFunctions\ExileServer_VehiclePainting_network_PaintVehicleRequest.sqf'],
    ['ExileServer_VehiclePainting_network_ResetVehicleRequest','VehiclePainting_Server\ServerFunctions\ExileServer_VehiclePainting_network_ResetVehicleRequest.sqf']
];

//Client Functions
{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
    PublicVariable (_x select 0);
}
forEach
[
    ['ExileClient_VehiclePainting_ApplyTexture','VehiclePainting_Server\ClientFunctions\ExileClient_VehiclePainting_ApplyTexture.sqf'],
    ['ExileClient_VehiclePainting_CanPaintVehicle','VehiclePainting_Server\ClientFunctions\ExileClient_VehiclePainting_CanPaintVehicle.sqf'],
    ['ExileClient_VehiclePainting_ColorSliderPosChanged','VehiclePainting_Server\ClientFunctions\ExileClient_VehiclePainting_ColorSliderPosChanged.sqf'],
    ['ExileClient_VehiclePainting_DialogClose','VehiclePainting_Server\ClientFunctions\ExileClient_VehiclePainting_DialogClose.sqf'],
    ['ExileClient_VehiclePainting_DialogLoad','VehiclePainting_Server\ClientFunctions\ExileClient_VehiclePainting_DialogLoad.sqf'],
    ['ExileClient_VehiclePainting_FilterList','VehiclePainting_Server\ClientFunctions\ExileClient_VehiclePainting_FilterList.sqf'],
    ['ExileClient_VehiclePainting_LBSelChanged','VehiclePainting_Server\ClientFunctions\ExileClient_VehiclePainting_LBSelChanged.sqf'],
    ['ExileClient_VehiclePainting_MouseZChanged','VehiclePainting_Server\ClientFunctions\ExileClient_VehiclePainting_MouseZChanged.sqf'],
    ['ExileClient_VehiclePainting_network_PaintVehicleResponse','VehiclePainting_Server\ClientFunctions\ExileClient_VehiclePainting_network_PaintVehicleResponse.sqf'],
    ['ExileClient_VehiclePainting_ResetTextures','VehiclePainting_Server\ClientFunctions\ExileClient_VehiclePainting_ResetTextures.sqf'],
    ['ExileClient_VehiclePainting_ToggleMode','VehiclePainting_Server\ClientFunctions\ExileClient_VehiclePainting_ToggleMode.sqf']
];

//Get VehiclePainting VIPS
VehiclePainting_VIPS = getArray (configFile >> "VehiclePainting_VIPS" >> "VIPS");
publicVariable "VehiclePainting_VIPS";

true

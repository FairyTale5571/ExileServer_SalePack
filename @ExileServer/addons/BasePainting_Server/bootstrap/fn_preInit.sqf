private ['_code', '_function', '_file'];

//Server Functions
{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ['ExileServer_BasePainting_network_PaintBasePartRequest','BasePainting_Server\ServerFunctions\ExileServer_BasePainting_network_PaintBasePartRequest.sqf'],
    ['ExileServer_BasePainting_network_ResetBasePartRequest','BasePainting_Server\ServerFunctions\ExileServer_BasePainting_network_ResetBasePartRequest.sqf']
];

//Client Functions
{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
    PublicVariable (_x select 0);
}
forEach
[
    ['ExileClient_BasePainting_ApplyTexture','BasePainting_Server\ClientFunctions\ExileClient_BasePainting_ApplyTexture.sqf'],
    ['ExileClient_BasePainting_CanPaintObject','BasePainting_Server\ClientFunctions\ExileClient_BasePainting_CanPaintObject.sqf'],
    ['ExileClient_BasePainting_ColorSliderPosChanged','BasePainting_Server\ClientFunctions\ExileClient_BasePainting_ColorSliderPosChanged.sqf'],
    ['ExileClient_BasePainting_DialogClose','BasePainting_Server\ClientFunctions\ExileClient_BasePainting_DialogClose.sqf'],
    ['ExileClient_BasePainting_DialogLoad','BasePainting_Server\ClientFunctions\ExileClient_BasePainting_DialogLoad.sqf'],
    ['ExileClient_BasePainting_FilterList','BasePainting_Server\ClientFunctions\ExileClient_BasePainting_FilterList.sqf'],
    ['ExileClient_BasePainting_LBSelChanged','BasePainting_Server\ClientFunctions\ExileClient_BasePainting_LBSelChanged.sqf'],
    ['ExileClient_BasePainting_MouseZChanged','BasePainting_Server\ClientFunctions\ExileClient_BasePainting_MouseZChanged.sqf'],
    ['ExileClient_BasePainting_network_PaintBasePartResponse','BasePainting_Server\ClientFunctions\ExileClient_BasePainting_network_PaintBasePartResponse.sqf'],
    ['ExileClient_BasePainting_ResetTextures','BasePainting_Server\ClientFunctions\ExileClient_BasePainting_ResetTextures.sqf'],
    ['ExileClient_BasePainting_ToggleMode','BasePainting_Server\ClientFunctions\ExileClient_BasePainting_ToggleMode.sqf']
];
true

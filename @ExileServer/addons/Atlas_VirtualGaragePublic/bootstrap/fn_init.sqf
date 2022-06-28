private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal (preprocessFileLineNumbers _file);                    

    missionNamespace setVariable [_function, _code];
	
	if (_x select 2) then { publicVariable _function; };
}
forEach
[	
	//Client only
	['ExileClient_gui_virtualpGarageDialog_event_onConfirmButtonClicked',			'\Atlas_VirtualGaragePublic\code\client\ExileClient_gui_virtualpGarageDialog_event_onConfirmButtonClicked.sqf',true],
	['ExileClient_gui_virtualpGarageDialog_event_onUnload',							'\Atlas_VirtualGaragePublic\code\client\ExileClient_gui_virtualpGarageDialog_event_onUnload.sqf',true],
	['ExileClient_gui_virtualpGarageDialog_event_onVehicleChanged',					'\Atlas_VirtualGaragePublic\code\client\ExileClient_gui_virtualpGarageDialog_event_onVehicleChanged.sqf',true],
	['ExileClient_gui_virtualpGarageDialog_show',									'\Atlas_VirtualGaragePublic\code\client\ExileClient_gui_virtualpGarageDialog_show.sqf',true],
	['ExileClient_gui_virtualpGarageDialog_updateVehicle',							'\Atlas_VirtualGaragePublic\code\client\ExileClient_gui_virtualpGarageDialog_updateVehicle.sqf',true],
	['ExileClient_virtualp_garage_onDropDownSelection',								'\Atlas_VirtualGaragePublic\code\client\ExileClient_virtualp_garage_onDropDownSelection.sqf',true],
	['ExileClient_virtualp_garage_buyMoreSlotsRequest',								'\Atlas_VirtualGaragePublic\code\client\ExileClient_virtualp_garage_buyMoreSlotsRequest.sqf',true],
	['ExileClient_virtualp_garage_network_buySlotsResponse',						'\Atlas_VirtualGaragePublic\code\client\ExileClient_virtualp_garage_network_buySlotsResponse.sqf',true],
	['ExileClient_virtualp_garage_network_retrievepVehicleResponse',				'\Atlas_VirtualGaragePublic\code\client\ExileClient_virtualp_garage_network_retrievepVehicleResponse.sqf',true],
	['ExileClient_virtualp_garage_network_pstoreVehicleResponse',					'\Atlas_VirtualGaragePublic\code\client\ExileClient_virtualp_garage_network_pstoreVehicleResponse.sqf',true],
	['ExileClient_virtualp_garage_network_storedVehicleResponse',					'\Atlas_VirtualGaragePublic\code\client\ExileClient_virtualp_garage_network_storedVehicleResponse.sqf',true],
	['AtlasClient_util_getConfigLoadout',											'\Atlas_VirtualGaragePublic\code\client\AtlasClient_util_getConfigLoadout.sqf',true],

	//Server only
	['ExileServer_virtualp_garage_network_retrievepVehicleRequest',					'\Atlas_VirtualGaragePublic\code\server\ExileServer_virtualp_garage_network_retrievepVehicleRequest.sqf',false],
	['ExileServer_virtualp_garage_network_storedVehicleRequest',					'\Atlas_VirtualGaragePublic\code\server\ExileServer_virtualp_garage_network_storedVehicleRequest.sqf',false],
	['ExileServer_virtualp_garage_network_buySlotsRequest',							'\Atlas_VirtualGaragePublic\code\server\ExileServer_virtualp_garage_network_buySlotsRequest.sqf',false],
	['ExileServer_virtualp_garage_network_storepVehicleRequest',					'\Atlas_VirtualGaragePublic\code\server\ExileServer_virtualp_garage_network_storepVehicleRequest.sqf',false]
];
true
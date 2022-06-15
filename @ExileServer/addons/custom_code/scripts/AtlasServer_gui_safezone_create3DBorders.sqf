/**
 * File: AtlasServer_gui_safezone_create3DBorders
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
   Return: Number
 */
 
{
	if (getMarkerType _x == "ExileTraderZone") then 
	{
		"3dZone created" call ExileServer_util_log;
		_position = getMarkerPos _x;
		_size = getMarkerSize _x select 0;
		[_position,_size,getText(missionConfigFile >> "CfgTradeSafeZone" >> "colorBorder")] call ExileServer_system_escape_3dzone_create;
	};
}forEach allMapMarkers;
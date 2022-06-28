/**
 * File: ExileServer_virtualp_garage_network_storedVehicleRequest
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
private ["_sessionID","_parameters","_uid","_storedVehicles"];
params ["_sessionID","_parameters"];
_parameters params ["_uid"];
_storedVehicles = format ["getStoredVehicles:%1", _uid] call ExileServer_system_database_query_selectFull;
[_sessionID,"storedVehicleResponse",[_storedVehicles]] call ExileServer_system_network_send_to;

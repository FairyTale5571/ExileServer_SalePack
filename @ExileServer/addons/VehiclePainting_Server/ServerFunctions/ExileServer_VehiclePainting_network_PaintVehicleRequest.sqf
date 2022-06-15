_sessionID = _this select 0;
_parameters = _this select 1;
_object = _parameters select 0;
_textureArray = _parameters select 1;
try
{
    //get player object and object databse ID
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    _objectDatabaseID = _object getVariable ["ExileDatabaseID",0];

    //Database id != 0 ?
    if (_objectDatabaseID == 0) then
    {
        throw "Object Database ID not found";
    };

    //Set Object Texture
    for "_i" from 0 to (count _textureArray) -1 do
    {
        _object setObjectTextureGlobal[_i,_textureArray select _i];
    };

    //Save to db
    format["updateVehicleSkin:%1:%2", _textureArray, _objectDatabaseID] call ExileServer_system_database_query_fireAndForget;

    //Send response back to client
    [_sessionID,"PaintVehicleResponse",[true,"Vehicle Successfully Painted"]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID,"PaintVehicleResponse",[false,_exception]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};

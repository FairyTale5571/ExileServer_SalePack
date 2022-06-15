_sessionID = _this select 0;
_parameters = _this select 1;
_object = _parameters select 0;
_textureArray = _parameters select 1;

try
{
    //get player object and object databse ID
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    _objectDatabaseID = _object getVariable ["ExileDatabaseID",0];

    //Get Pricing Mode
    _mode = getNumber(missionConfigFile >> "BasePainting_Config" >> "Price" >> "Mode");

    diag_log Format["Price Mode %1", _mode];

    switch (_mode) do { 
        case 0 : 
        {  
            diag_log Format["00000000000"];
            //No price just move along 
        }; 
        case 1 : 
        {  
            diag_log Format["11111111111"];
            //Item
            _ItemCost = getText(missionConfigFile >> "BasePainting_Config" >> "Price" >> "ItemRequired");
            if (_ItemCost != "") then
            {
                _playerGear = _playerObject call ExileClient_util_playerCargo_list;
                if (_ItemCost in _playerGear) then
                {
                    //Remove item
                     [_playerObject, _ItemCost] call ExileClient_util_playerCargo_remove;
                }
                else
                {
                    _ItemName = getText(configfile >> "CfgMagazines" >> _ItemCost >> "displayName");
                    throw format["You do not have a %1",_ItemName];
                };
            };
        }; 
        case 2 : 
        {  
            //Poptabs
            //Get cost
            _cost = getNumber(missionConfigFile >> "BasePainting_Config" >> "Price" >> "Cost");
            if (_cost > 0) then 
            {
                //Make sure they have enough money and remove it if they do 
                _playerMoney = _playerObject getVariable ["ExileMoney", 0];
                if (_playerMoney >= _cost) then 
                {
                    _playerMoney = _playerMoney - _cost;
                    _playerObject setVariable ["ExileMoney", _playerMoney, true];
                    format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
                }
                else
                {
                    throw Format["You do not have enough poptabs, %1 Poptabs needed", _cost];
                };
            };
        }; 
        case 3 : 
        {  
            //Item and poptabs 
            _hasItem = false;
            _hasMoney = false;

            _ItemCost = getText(missionConfigFile >> "BasePainting_Config" >> "Price" >> "ItemRequired");
            _cost = getNumber(missionConfigFile >> "BasePainting_Config" >> "Price" >> "Cost");

            if (_ItemCost != "") then
            {
                _playerGear = _playerObject call ExileClient_util_playerCargo_list;
                if (_ItemCost in _playerGear) then
                {
                    _hasItem = true;
                };
            };

            if (_cost > 0) then 
            {
                _playerMoney = _playerObject getVariable ["ExileMoney", 0];
                if (_playerMoney >= _cost) then 
                {
                    _hasMoney = true;
                };
            };

            if (_hasMoney && _hasItem) then 
            {
                //Remove item and money
                _playerMoney = _playerObject getVariable ["ExileMoney", 0];
                [_playerObject, _ItemCost] call ExileClient_util_playerCargo_remove;
                _playerMoney = _playerMoney - _cost;
                _playerObject setVariable ["ExileMoney", _playerMoney, true];
                format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
            }
            else
            {
                //Throw error 
                if(!_hasMoney && !_hasItem) then
                {
                    _ItemName = getText(configfile >> "CfgMagazines" >> _ItemCost >> "displayName");
                    throw format["You do not have a %1 or the poptabs required to paint this object",_ItemName];
                };

                if (!_hasMoney) then 
                {
                    throw Format["You do not have enough poptabs, %1 Poptabs needed", _cost];
                };

                if (!_hasItem) then 
                {
                    _ItemName = getText(configfile >> "CfgMagazines" >> _ItemCost >> "displayName");
                    throw format["You do not have a %1",_ItemName];
                };
            };
        }; 
        default 
        {
            throw "Invalid pricing mode, Please inform an admin";
        }; 
    };

    

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

    _objectTextures = getObjectTextures _object;

    //Create Data package for EXTDB
    _data =
    [
        _objectTextures,
        _objectDatabaseID
    ];

    playSound3D [getText(missionConfigFile >> "BasePainting_Config" >> "Sound" >> "Sound"), _object];

    _extDB2Message = ["setObjectTexture", _data] call ExileServer_util_extDB2_createMessage;
    //Apply change to DB
    _extDB2Message call ExileServer_system_database_query_selectFull;

    //format ["setObjectTexture:%1:%2",_objectTextures,_objectDatabaseID] call ExileServer_system_database_query_fireAndForget;

    //Send response back to client
    [_sessionID,"PaintBasePartResponse",[true,"Base Part Successfully Painted"]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID,"PaintBasePartResponse",[false,_exception]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};

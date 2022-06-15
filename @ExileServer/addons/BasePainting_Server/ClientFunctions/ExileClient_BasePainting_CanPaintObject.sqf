_result = false;
if (getNumber (missionConfigFile >> "BasePainting_Config" >> "VIP" >> "Enabled") isEqualTo 1) then
{
    _vips = getArray (missionConfigFile >> "BasePainting_Config" >> "VIP" >> "VIPS");
    if (getPlayerUID player in _vips) then {
        if (call ExileClient_util_world_isInOwnTerritory) then {
            _result = true;
        };
    };
}else{
  _result = true;
};
_result

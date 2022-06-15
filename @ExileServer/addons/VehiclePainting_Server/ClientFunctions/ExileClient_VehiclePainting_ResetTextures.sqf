//Cant just use getObjectTextures because they may have changed
_defaultTextures = getArray (configfile >> "CfgVehicles" >> typeOf ExileClientModelBoxVehicle >> "hiddenSelectionsTextures");

for "_i" from 0 to (count _defaultTextures) -1 do
{
    ExileClientModelBoxVehicle setObjectTexture [_i,_defaultTextures select _i];
};
["ResetVehicleRequest",[VehiclePainting_SelectedItem,_defaultTextures]] call ExileClient_system_network_send;

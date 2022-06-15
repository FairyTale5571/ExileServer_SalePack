/**
 * ExileClient_object_vehicle_flip
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_pos"];
_vehicle = _this select 0;
_block = getArray(missionConfigFile >> "CfgTradeSafeZone" >> "blockFlipVehicle");
if ((typeOf _vehicle in _block) && (ExilePlayerInSafezone)) exitWith { ["InfoTitleAndText", ["No flip!", "This action not allowed in safezone."]] call ExileClient_gui_toaster_addTemplateToast;};
if (!(typeOf _vehicle in ["Exile_Bike_MountainBike","Exile_Bike_OldBike","Exile_Bike_OldBikeRDS","Exile_Bike_MountainBikeRDS"]) && (isEngineOn _vehicle)) exitWith {false};
if ((locked _vehicle) isEqualTo 2) exitWith {false};
if (local _vehicle) then
{
_pos = getPosATL _vehicle;
	_pos set [2,(_pos select 2) + 2.5];
	_vehicle setPosATL _pos;
	_vehicle setVectorUp [0, 0, 1];
}else{
	["flipVehRequest",[netId _vehicle]] call ExileClient_system_network_send;
};
true

private["_display","_Rewardpic","_RewardText","_RewardClaim","_crateItems","_spawnPos","_crate","_crateFinalItem","_crateFullList","_crateWeapons","_crateBackpacks","_displayName","_cfg","_mag","_posObject","_marker"];

disableSerialization;
_display = uiNamespace getVariable ["RewardsDialog",displayNull];

_Rewardpic = (_display displayCtrl 1002);
_RewardText = (_display displayCtrl 1003);

_Rewardpic ctrlSetText"custom\DailyReward\reward\rewardsCrate.paa";

_crateWeapons =	getArray(missionConfigFile >> "CfgDailyReward" >> "crateWeapons");

_crateBackpacks = getArray(missionConfigFile >> "CfgDailyReward" >> "crateBackpacks");

_crateItems = getArray(missionConfigFile >> "CfgDailyReward" >> "crateItems");

_crateFinal = _crateWeapons+_crateBackpacks+_crateItems;
_crateFinalItem = _crateFinal call BIS_fnc_selectRandom;

_spawnPos = player modelToWorld [0,2,0];

_box = getText (missionConfigFile >> "CfgDailyReward" >> "box");

_crate = _box createVehicleLocal _spawnPos; 

clearWeaponCargo _crate;
clearMagazineCargo _crate;
clearItemCargo _crate;
clearBackpackCargo _crate;

if (_crateFinalItem in _crateWeapons) then {
	_cfg="CfgWeapons";
	_mag = (getArray (configfile >> "cfgWeapons" >> _crateFinalItem >> "magazines")) select 0;
	_crate addWeaponCargo [_crateFinalItem, 1];
	_crate addMagazineCargo [_mag, 2];
};
if (_crateFinalItem in _crateBackpacks) then {_cfg="CfgVehicles";_crate addBackpackCargo [_crateFinalItem,1];};
if (_crateFinalItem in _crateItems) then {_cfg="CfgMagazines";_crate additemCargo [_crateFinalItem,1];};

_displayName = getText(configFile >> _cfg >> _crateFinalItem >> 'displayName');
_posObject = getPos _crate;

_marker  = createMarkerLocal ["markerRewardCrate",_posObject];
_marker  setMarkerTextLocal format["%1",_displayName];
_marker  setMarkerTypeLocal "mil_dot";
_marker  setMarkerColorLocal "ColorWhite";

hint "Your Reward is in a loot crate near you and marked on the map.";
_RewardText ctrlSetStructuredText parseText format["<t align='center' size='1'>You won a <t size='1.1'>%1</t>.</t>",_displayName];
/*

Coded and coverted by GR8
www.ghostzgamerz.com

*/

ExAd_XM8_AirDrop_orderIDcharacters = "Exile";

//Starter Drop
ExAd_XM8_AirDrop_box1Cost = getNumber(missionConfigFile >> "CfgAirDrop" >> "costbox1");
_ExAd_XM8_AirDrop_box1DonorCost = getNumber(missionConfigFile >> "CfgAirDrop" >> "costbox1prem");
ExAd_XM8_AirDrop_box1WepCount = getNumber(missionConfigFile >> "CfgAirDrop" >> "box1WepCount");

//Medium Drop
ExAd_XM8_AirDrop_box2Cost = getNumber(missionConfigFile >> "CfgAirDrop" >> "costbox2");
_ExAd_XM8_AirDrop_box2DonorCost = getNumber(missionConfigFile >> "CfgAirDrop" >> "costbox2prem");
ExAd_XM8_AirDrop_box2WepCount = getNumber(missionConfigFile >> "CfgAirDrop" >> "box2WepCount");;

//Pro Drop
ExAd_XM8_AirDrop_box3Cost = getNumber(missionConfigFile >> "CfgAirDrop" >> "costbox3");
_ExAd_XM8_AirDrop_box3DonorCost = getNumber(missionConfigFile >> "CfgAirDrop" >> "costbox3prem");
ExAd_XM8_AirDrop_box3WepCount = getNumber(missionConfigFile >> "CfgAirDrop" >> "box3WepCount");

_ownerPrem = getPlayerUID player;
_uids = getArray(missionConfigFile >> "CfgAirDrop" >> "premiumsUID");

if (_ownerPrem in _uids) then 
{
	ExAd_XM8_AirDrop_box1Cost = _ExAd_XM8_AirDrop_box1DonorCost;
	ExAd_XM8_AirDrop_box2Cost = _ExAd_XM8_AirDrop_box2DonorCost;
	ExAd_XM8_AirDrop_box3Cost = _ExAd_XM8_AirDrop_box3DonorCost;
}; 

ExAd_XM8_AirDrop_rareItem = getArray(missionConfigFile >> "CfgAirDrop" >> "AirDrop_rareItem");
ExAd_XM8_AirDrop_BoxConstruction = getArray(missionConfigFile >> "CfgAirDrop" >> "AirDrop_BoxConstruction");
ExAd_XM8_AirDrop_BoxTools = getArray(missionConfigFile >> "CfgAirDrop" >> "AirDrop_BoxTools");
ExAd_XM8_AirDrop_BoxFood = getArray(missionConfigFile >> "CfgAirDrop" >> "AirDrop_BoxFood");
ExAd_XM8_AirDrop_BoxWeapons = getArray(missionConfigFile >> "CfgAirDrop" >> "AirDrop_BoxWeapons");
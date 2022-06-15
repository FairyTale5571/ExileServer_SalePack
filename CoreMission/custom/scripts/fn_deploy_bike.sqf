/*--------------------------------------------------------------------
    File: fn_deploy_bike.sqf
	Project: 749 Exile Servers
	vk.com/ex749
	payPal.me/atlasArma
	a3atlasLife@gmail.com
--------------------------------------------------------------------*/

_item = getText(missionConfigFile >> "CfgExAd" >> "DeployVehicle" >> "item");

if (!hasInterface || isServer) exitWith {};
closeDialog 0;
if (vehicle player isEqualTo player) then 
{
	if (_item in (magazines player)) then 
	{
		_spawnPos = player modelToWorld [0,2,0];
		_spawnDir = (getDir player) -90;
		atlas_deploy = [player, _spawnPos, _spawnDir];
		player removeItem _item;
		publicVariableServer "atlas_deploy";
		systemChat "WARNING: Deployed vehicles do not save after server restart!";
	} else {
		["ErrorTitleOnly",[format["You need: %1 to deploy bike!",_item]]] call ExileClient_gui_toaster_addTemplateToast;
	};
} else {
	["ErrorTitleOnly",["You cannot do this while in a vehicle!"]] call ExileClient_gui_toaster_addTemplateToast;
};
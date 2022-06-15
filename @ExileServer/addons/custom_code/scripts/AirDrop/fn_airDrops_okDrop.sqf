private ["_ok","_Time","_LastUsedTime","_OnlineLimit","_traderZoneNearLimit","_msg","_wallet"];
_ok = true;
_Time = time - ExAd_XM8_AirDrop_lastDrop;

_LastUsedTime = getNumber(missionConfigFile >> "CfgAirDrop" >> "LastUsedTime");
_OnlineLimit = getNumber(missionConfigFile >> "CfgAirDrop" >> "minOnlinePlayers");
_traderZoneNearLimit = getNumber(missionConfigFile >> "CfgAirDrop" >> "traderZoneNearLimit");

if (ExAd_XM8_AirDrop_DropInProgress) then {
	_msg = "Please Wait.. An Air Drop is already in progress.";
	["ErrorTitleAndText", ["AirDrop", _msg]] call ExileClient_gui_toaster_addTemplateToast;
	_ok = false;ExAd_XM8_AirDrop_DropInProgress = false;
};
if (_Time < _LastUsedTime) then {
	_msg = format["please wait %1s before calling in another Air Drop!",(round(_Time - _LastUsedTime))];
	["ErrorTitleAndText", ["AirDrop", _msg]] call ExileClient_gui_toaster_addTemplateToast;
	_ok = false;ExAd_XM8_AirDrop_DropInProgress = false;
};

if (vehicle player != player) then {
	_msg = "You are in a vehicle and cannot perform that action!";
	["ErrorTitleAndText", ["AirDrop", _msg]] call ExileClient_gui_toaster_addTemplateToast;
	_ok = false;ExAd_XM8_AirDrop_DropInProgress = false;
};

if  ((nearestObject [player,'Exile_Construction_Abstract_Static']) distance player < 75) then {
	_msg = "You are near a Base and cannot perform that action!";
	["ErrorTitleAndText", ["AirDrop", _msg]] call ExileClient_gui_toaster_addTemplateToast;
	_ok = false;ExAd_XM8_AirDrop_DropInProgress = false;
};

{
if ((_traderZoneNearLimit>0) && {((markertype _x) == "ExileTraderZone") && {((getMarkerPos _x) distance2D getPos player)<=_traderZoneNearLimit}}) then
{
	_msg = "You need to be far away from a Trader to call an Airdrop.";
	["ErrorTitleAndText", ["AirDrop", _msg]] call ExileClient_gui_toaster_addTemplateToast;
	_ok = false;ExAd_XM8_AirDrop_DropInProgress = false;
};
} forEach allMapMarkers;

if (((playersNumber west)+(playersNumber east)+(playersNumber civilian)+(playersNumber resistance)) < _OnlineLimit) then  {
	 _msg = format["Air Drop Failed. Less Than %1 Players online.",_OnlineLimit];
	["ErrorTitleAndText", ["AirDrop", _msg]] call ExileClient_gui_toaster_addTemplateToast;
	_ok = false;ExAd_XM8_AirDrop_DropInProgress = false;
};
_wallet = (player getVariable ["ExileMoney", 0]);
if (_wallet < ExAd_XM8_AirDrop_boxCost) then {
	_msg = format["%1, Your order has been declined due to insufficient funds",name player];
	["ErrorTitleAndText", ["AirDrop", _msg]] call ExileClient_gui_toaster_addTemplateToast;
	_ok = false;ExAd_XM8_AirDrop_DropInProgress = false;
};
_ok
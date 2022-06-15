private _path = "SafezonePlus\code";
{
	_x params["_function","_client"];
	missionNamespace setVariable[_function, compileFinal preprocessFileLineNumbers format["%1\%2.sqf",_path,_function], _client];
} forEach
[
	["ExileServer_safezonePlus_network_onEnterSafezonePlus", false],
	["ExileServer_safezonePlus_network_onLeaveSafezonePlus", false],
	["safezonePlus_Log", false],
	["safezonePlus_onGetInVehicle", false],
	["safezonePlus_onGetInEvent", true],
	["safezonePlus_closeGear", true]
];

true
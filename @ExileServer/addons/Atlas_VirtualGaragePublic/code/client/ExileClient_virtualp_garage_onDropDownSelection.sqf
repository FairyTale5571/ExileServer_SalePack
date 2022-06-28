/**
 * File: ExileClient_virtualp_garage_onDropDownSelection
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
private["_display", "_dropdown", "_listbox", "_confirmButton", "_nicknameBox", "_index", "_flag", "_storedVehicles", "_nickname", "_nearVehicles"];
disableSerialization;
_display = uiNameSpace getVariable ["RscVirtualGaragePublic", displayNull];
_dropdown = _display displayCtrl 4002;
_listbox = _display displayCtrl 4003;
_confirmButton = _display displayCtrl 4004;
_nicknameBox = _display displayCtrl 4006;
_confirmButton ctrlEnable false;
_nicknameBox ctrlSetText "";
_index = _dropdown lbValue (lbCurSel _dropdown);
lbClear _listbox;
_display setVariable ["ExileSelectedVehicle", ""];
_display setVariable ["ID_SelectedVehicle", ""];
switch (_index) do
{
	case 0:
	{
		_confirmButton ctrlSetText "Retrieve Vehicle";
		_nicknameBox ctrlEnable false;
		["storedVehicleRequest",[getPlayerUID player]] call ExileClient_system_network_send;
		
	};
	case 1:
	{
		_confirmButton ctrlSetText "Store Vehicle";
		_nicknameBox ctrlEnable true;
		_nearVehicles = nearestObjects [player, (getArray(missionConfigFile >> "CfgPublicVirtualGarage" >> "vehicleTypes")),50];
		{
			if (local _x) then
			{
				if (alive _x) then
				{
					_index = _listbox lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
					_listbox lbSetData [_index, str([typeOf _x,netId _x])];
				};
			};
		}
		forEach _nearVehicles;
	};
	default {};
};
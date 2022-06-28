/**
 * File: ExileClient_gui_virtualpGarageDialog_event_onConfirmButtonClicked
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
private["_display", "_dropdown", "_index", "_nameInput", "_nickName", "_alphabet", "_flag", "_vehicleInfo", "_buildRights", "_nickNameLength", "_storedVehicles", "_count", "_forbiddenCharacter", "_territoryLevel", "_maxNumberOfVehicles", "_vehicleObject", "_cargo", "_money", "_result"];
disableSerialization;
_display = uiNameSpace getVariable ["RscVirtualGaragePublic", displayNull];
_dropdown = _display displayCtrl 4002;
_index = _dropdown lbValue (lbCurSel _dropdown);
_nameInput = _display displayCtrl 4006;
_nickName = ctrlText _nameInput;
_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
_vehicleInfo = _display getVariable ["ExileSelectedVehicle", ""];
_vehicleId = _display getVariable ["ID_SelectedVehicle", ""];
try 
{
	if (ExileClientIsWaitingForServerTradeResponse) then 
	{
		throw "Waiting for server response";		
	};
	switch (_index) do
	{
		case 0:
		{
			["retrievepVehicleRequest", [_vehicleInfo,_vehicleId]] call ExileClient_system_network_send;
			ExileClientIsWaitingForServerTradeResponse = true;
		};
		case 1:
		{
			_nickNameLength = count _nickName;
			if (_nickNameLength isEqualTo 0) then 
			{
				throw "Please enter a name.";
			};
			if (_nickNameLength < 2) then 
			{
				throw "Name is too short.";
			};
			if (_nickNameLength > 20) then
			{
				throw "Name is longer than 20 letters.";
			};
			_forbiddenCharacter = [_nickName, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
			if !(_forbiddenCharacter isEqualTo -1) then 
			{
				throw format ["Do not use '%1' in your vehicle's nickname.", _forbiddenCharacter];
			};
			if (getNumber(missionConfigFile >> "CfgPublicVirtualGarage" >> "clearInventory") isEqualTo 1) then 
			{
				_vehicleObject = objectFromNetID(_vehicleInfo);
				_cargo = _vehicleObject call ExileClient_util_containerCargo_list;
				_money = _vehicleObject getVariable ["ExileMoney", 0];
				if (!(_cargo isEqualTo []) || _money > 0) then 
				{
					_result = ["The vehicle you are about to store has items/money in it's inventory. These will be deleted upon storing the vehicle<br />Are you sure you want to store your vehicle?", "Warning", true, true] call BIS_fnc_guiMessage;
					if !(_result) then 
					{
						throw "Cancelled";
					};
				};
			};
			["storepVehicleRequest", [_vehicleInfo, _nickName]] call ExileClient_system_network_send;
			ExileClientIsWaitingForServerTradeResponse = true;
			closeDialog 25044;
		};
		default 
		{
			throw "Invalid option erwar!";  
		};
	};
}
catch 
{
	["ErrorTitleAndText", [format["Failed to %1 vehicle", ["retrieve", "store"] select (_index isEqualTo 1)], _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
true
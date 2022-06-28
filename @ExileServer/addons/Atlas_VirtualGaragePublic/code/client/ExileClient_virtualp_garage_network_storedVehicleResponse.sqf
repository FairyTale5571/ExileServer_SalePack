/**
 * File: ExileClient_virtualp_garage_network_storedVehicleResponse
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
disableSerialization;
_result = _this select 0;
_display = uiNameSpace getVariable ["RscVirtualGaragePublic", displayNull];
_listbox = _display displayCtrl 4003;
if !(_result isEqualTo []) then 
{
	{
		_nickname = _x select 1;
		_index = _listbox lbAdd _nickname;
		_listbox lbSetData [_index, str(_x)];
	}
	forEach _result;
}else{
	_index = _listbox lbAdd "Your garage is empty";
	_listbox lbSetData [_index, "Empty"];
};
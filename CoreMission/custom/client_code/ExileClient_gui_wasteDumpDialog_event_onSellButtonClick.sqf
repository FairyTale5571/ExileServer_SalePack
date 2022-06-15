/*
* ExileClient_gui_wasteDumpDialog_event_onSellButtonClick
*
* Exile Mod
* www.exilemod.com
* © 2015 Exile Mod Team
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 
note:
    120 seconds because if they try to do the "lag-out" dupe, BE would kick them for client not responding! :)
*/
if(!isNil'wastedump_button_click')exitWith{closeDialog 0;true};
 
_fn_block_wasteDumpSellButton = {
    disableSerialization;
    _timer = time + 120;
    _gd = {(findDisplay 24011) displayCtrl _this};
    waitUntil {
        (4000 call _gd) ctrlEnable false;
        (4002 call _gd) ctrlEnable false;
        if(isNull (findDisplay 24011))then
        {
            hintSilent '';
        }
        else
        {
            hintSilent parseText format['<t size=''1.5'' font=''OrbitronLight'' color=''#2784D6''>please wait %1s, anti dupe sell waiting</t>',round(_timer - time)];
        };
        time > _timer
    };
    hintSilent '';
    (4000 call _gd) ctrlEnable true;
    (4002 call _gd) ctrlEnable true;
    wastedump_button_click = nil;
};
 
disableSerialization;
_display = uiNameSpace getVariable ['RscExileWasteDumpDialog', displayNull];
_lbctrl = _display displayCtrl 4002;
_index = lbCurSel _lbctrl;
_vehicleNetID = _lbctrl lbData _index;
_vehicle = objectFromNetId _vehicleNetID;
_mode = _lbctrl lbValue _index;
 
if(isNull _vehicle)exitWith{closeDialog 0;true};
wastedump_button_click = [] spawn _fn_block_wasteDumpSellButton;
 
if(ctrlEnabled _lbctrl)then{
    ['wasteDumpRequest', [_vehicleNetID, _mode]] call ExileClient_system_network_send;
};
closeDialog 0;true
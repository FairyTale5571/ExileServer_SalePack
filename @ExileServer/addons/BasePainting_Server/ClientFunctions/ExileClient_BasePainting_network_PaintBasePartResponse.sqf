_result = _this select 0;
_resultStr = _this select 1;
if (_result) then
{
    //Success
    ["SuccessTitleAndText", [" Base Painting", _resultStr]] call ExileClient_gui_toaster_addTemplateToast;
    _ItemCost = getText(missionConfigFile >> "BasePainting_Config" >> "Price" >> "ItemRequired");
    [player, _ItemCost] call ExileClient_util_playerCargo_remove;
}else
{
    //Fail
    ["ErrorTitleAndText", [" Base Painting", _resultStr]] call ExileClient_gui_toaster_addTemplateToast;
}
call ExileClient_BasePainting_DialogClose;

_result = _this select 0;
_resultStr = _this select 1;
call ExileClient_VehiclePainting_DialogClose;
if (_result) then
{
    //Success
    ["SuccessTitleAndText", ["Vehicle Painting", _resultStr]] call ExileClient_gui_toaster_addTemplateToast;
}else
{
    //Fail
    ["ErrorTitleAndText", ["Vehicle Painting", _resultStr]] call ExileClient_gui_toaster_addTemplateToast;
};

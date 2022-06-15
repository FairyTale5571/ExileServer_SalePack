_display = uiNamespace getVariable["VehiclePaintingDialog", displayNull];
_listBox = (_display displayCtrl 1500);
_ModeText = (_display displayCtrl 1109);

if (VehiclePainting_Mode == 1) then
{
    //Texture Mode
    VehiclePainting_Mode = 2;
    _ModeText ctrlSetStructuredText parseText Format["<t color='#E48A36' font='puristaMedium' size='1.2' align='center' shadow='0'>Mode: Color</t>"];

    //Hide Texture list ctrls
    {
      (_display displayCtrl _x) ctrlSetFade 1;
      (_display displayCtrl _x) ctrlCommit 0;
      ctrlEnable [_x, false];
    } forEach [1400,1500];

    //Show color sliders
    {
      (_display displayCtrl _x) ctrlSetFade 0;
      (_display displayCtrl _x) ctrlCommit 0;
      ctrlEnable [_x, true];
    } forEach [1201,1202,1203,1900,1901,1902,1200];
}
else
{
    //Color Mode
    VehiclePainting_Mode = 1;
    _ModeText ctrlSetStructuredText parseText Format["<t color='#E48A36' font='puristaMedium' size='1.2' align='center' shadow='0'>Mode: Texture</t>"];

    //Show Texture list ctrls
    {
      (_display displayCtrl _x) ctrlSetFade 0;
      (_display displayCtrl _x) ctrlCommit 0;
      ctrlEnable [_x, true];
    } forEach [1400,1500];

    //Hide color sliders
    {
      (_display displayCtrl _x) ctrlSetFade 1;
      (_display displayCtrl _x) ctrlCommit 0;
      ctrlEnable [_x, false];
    } forEach [1201,1202,1203,1900,1901,1902,1200];
};

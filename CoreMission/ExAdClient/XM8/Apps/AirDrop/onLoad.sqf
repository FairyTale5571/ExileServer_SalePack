/*

Coded and coverted by GR8
www.ghostzgamerz.com

*/

params["_display","_slide","_idc"];

_pW = 0.025;
_pH = 0.04;

_slideClass = "AirDrop";

//WE HAVE TO RANDOMIZE FOLLOWING VALUES EACH TIME XM8 LOADED
ExAd_XM8_AirDrop_box1RareCount = floor((random 1) +1);
ExAd_XM8_AirDrop_box1MagCount = floor((random 5) + 2);
ExAd_XM8_AirDrop_box1ItemCount = floor((random 3) + 3);
ExAd_XM8_AirDrop_box2RareCount = floor((random 2) + 1);
ExAd_XM8_AirDrop_box2MagCount = floor((random 10) + 2);
ExAd_XM8_AirDrop_box2ItemCount = floor((random 6) + 3);
ExAd_XM8_AirDrop_box3RareCount = floor((random 3) + 1);
ExAd_XM8_AirDrop_box3MagCount = floor((random 15) + 2);
ExAd_XM8_AirDrop_box3ItemCount = floor((random 9) + 3);
ExAd_XM8_AirDrop_BoxWeapon = (selectRandom ExAd_XM8_AirDrop_BoxWeapons);
ExAd_XM8_AirDrop_mag = (getArray (configfile >> "cfgWeapons" >> ExAd_XM8_AirDrop_BoxWeapon >> "magazines")) select 0;

_ranNumArr = ['1','2','3','4','5','6','7','8','9','0'];
ExAd_XM8_AirDrop_a1 = _ranNumArr call BIS_fnc_selectRandom;
ExAd_XM8_AirDrop_a2 = _ranNumArr call BIS_fnc_selectRandom;
ExAd_XM8_AirDrop_a3 = _ranNumArr call BIS_fnc_selectRandom;
ExAd_XM8_AirDrop_a1a2a3 = ExAd_XM8_AirDrop_a1+ExAd_XM8_AirDrop_a2+ExAd_XM8_AirDrop_a3;

_ctrl = [_display,_slide,([_slideClass,""] call ExAd_fnc_getNextIDC),[3.5*_pW,2*_pH,11.2*_pW,5*_pH],"","PuristaMedium",1,"#ffffff","left",0] call ExAd_fnc_createStructuredText;
_ctrl ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>Starter Drop</t><br/><t align='center'size='0.8'>Price = <img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='0.8' shadow='0' />%1</t>",ExAd_XM8_AirDrop_box1Cost]));
_ctrl = [_display,_slide,([_slideClass,""] call ExAd_fnc_getNextIDC),[3.5*_pW,7.5*_pH,11.2*_pW,5*_pH],"","PuristaMedium",1,"#ffffff","left",0] call ExAd_fnc_createStructuredText;
_ctrl ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>Medium Drop</t><br/><t align='center'size='0.8'>Price = <img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='0.8' shadow='0' />%1</t>",ExAd_XM8_AirDrop_box2Cost]));
_ctrl = [_display,_slide,([_slideClass,""] call ExAd_fnc_getNextIDC),[3.5*_pW,13*_pH,11.2*_pW,5*_pH],"","PuristaMedium",1,"#ffffff","left",0] call ExAd_fnc_createStructuredText;
_ctrl ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>Pro Drop</t><br/><t align='center'size='0.8'>Price = <img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='0.8' shadow='0' />%1</t>",ExAd_XM8_AirDrop_box3Cost]));

[_display,_slide,([_slideClass,"1dropBut"] call ExAd_fnc_getNextIDC),[3.5*_pW,6*_pH,11.2*_pW,1*_pH],
	'ExAd_XM8_AirDrop_boxCost = ExAd_XM8_AirDrop_box1Cost;
	ExAd_XM8_AirDrop_boxWepCount = ExAd_XM8_AirDrop_box1WepCount;
	ExAd_XM8_AirDrop_boxMagCount = ExAd_XM8_AirDrop_box1MagCount;
	ExAd_XM8_AirDrop_boxItemCount = ExAd_XM8_AirDrop_box1ItemCount;
	ExAd_XM8_AirDrop_boxRareCount = ExAd_XM8_AirDrop_box1RareCount;
	[] spawn ExileClient_airDrops_buySelected;',"CALL STARTER DROP"] call ExAd_fnc_createButton;

[_display,_slide,([_slideClass,"1dropBut"] call ExAd_fnc_getNextIDC),[3.5*_pW,11.5*_pH,11.2*_pW,1*_pH],
	'ExAd_XM8_AirDrop_boxCost = ExAd_XM8_AirDrop_box2Cost;
	ExAd_XM8_AirDrop_boxWepCount = ExAd_XM8_AirDrop_box2WepCount;
	ExAd_XM8_AirDrop_boxMagCount = ExAd_XM8_AirDrop_box2MagCount;
	ExAd_XM8_AirDrop_boxItemCount = ExAd_XM8_AirDrop_box2ItemCount;
	ExAd_XM8_AirDrop_boxRareCount = ExAd_XM8_AirDrop_box2RareCount;
	[] spawn ExileClient_airDrops_buySelected;',"CALL MEDIUM DROP"] call ExAd_fnc_createButton;

[_display,_slide,([_slideClass,"1dropBut"] call ExAd_fnc_getNextIDC),[3.5*_pW,17*_pH,11.2*_pW,1*_pH],
	'ExAd_XM8_AirDrop_boxCost = ExAd_XM8_AirDrop_box3Cost;
	ExAd_XM8_AirDrop_boxWepCount = ExAd_XM8_AirDrop_box3WepCount;
	ExAd_XM8_AirDrop_boxMagCount = ExAd_XM8_AirDrop_box3MagCount;
	ExAd_XM8_AirDrop_boxItemCount = ExAd_XM8_AirDrop_box3ItemCount;
	ExAd_XM8_AirDrop_boxRareCount = ExAd_XM8_AirDrop_box3RareCount;
	[] spawn ExileClient_airDrops_buySelected;',"CALL PRO DROP"] call ExAd_fnc_createButton;

_ctrl = [_display,_slide,([_slideClass,""] call ExAd_fnc_getNextIDC),[18*_pW,2*_pH,12.8*_pW,16*_pH],"","PuristaMedium",1,"#ffffff","left",0] call ExAd_fnc_createStructuredText;
_ctrl ctrlSetStructuredText (parseText (format ["<t align='center'size='0.8'> Air Drop ID: %2-%3%4<br/>(%1)<br/><br/>Once you buy an Air Drop, The Drop Zone will be marked on the map and announced to every player. We will try our best to send you the random items worth your money.<br/><img image='ExAdClient\XM8\Apps\AirDrop\drop.paa' size='8.0' shadow='0' />",name player, ExAd_XM8_AirDrop_orderIDcharacters, ExAd_XM8_AirDrop_a1, ExAd_XM8_AirDrop_a2]));

[_display,_slide,([_slideClass,"bckButton"] call ExAd_fnc_getNextIDC),[18*_pW,17*_pH,12.8*_pW,1*_pH],'["extraApps", 1] call ExileClient_gui_xm8_slide;',"GO BACK"] call ExAd_fnc_createButton;

true
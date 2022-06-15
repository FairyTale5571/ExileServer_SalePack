if(isDedicated) exitWith {};
_sizeTitle             = 0.65;
_sizeSubText         = 0.55;
_colorTitle         = "#38bee1";
_colorSubText         = "#ffffff";
_shadow              = "2";
_alignTitle         = "right";
_alignSubText         = "right";
_fontTitle             = "OrbitronMedium";
_fontSubText        = "OrbitronLight";

_Delay              = 8;
_FadeIn             = 2;

_IntroMusic            = false;


_posDefault         = [0.1,0.1,0.5];



_title             = "Welcome to Exile Server";
_shorttext         = "mysite.com<br />vk.com/group";
_posText        = [0.1,0.1,0.5];


_title2         = "Join our TeamSpeak";
_shorttext2     = "Teamspeak:<br />ts.teamspeak.com";
_posText2        = [0.1,0.1,0.5];


_title3          = "Server Staff";
_shorttext3    	 = "Admin / Design: Who designer?";
_posText3        = [0.1,0.1,0.5];

_title5         = "Ingame:";
_shorttext5     = "'6' to access your XM8 Tablet<br />
					And get inform about server rules/features/changelog!";
_posText5        = [0.1,0.1,0.5];


_title6         = "Enjoy And Play Fair";
_shorttext6     = "4 hour restarts";
_posText6        = [0.1,0.1,0.5];

_ms = [];
for "_i" from 1 to 50 do
{
    _t = if (_i!=1) then { format["_title%1",_i] } else { "_title" };
    _s = if (_i!=1) then { format["_shorttext%1",_i] } else { "_shorttext" };
    _p = if (_i!=1) then { format["_postext%1",_i] } else { "_postext" };
    if (!isNil _t or !isNil _s) then
    {
        _at = if (!isNil _t) then { call compile _t } else { "" };
        _as = if (!isNil _s) then { call compile _s } else { "" };
        _ap = if (!isNil _p) then { call compile _p } else { _posDefault };
        _ms = _ms + [[_at,_as,_ap]];
    }
};
waitUntil{sleep 1; ExileClientPlayerIsSpawned}; 
sleep _Delay;
if (_IntroMusic) then { playMusic "intro";};
player enableSimulation true;
{
    _t = _x select 0;
    _s = _x select 1;
    _pX = _x select 2 select 0;
    _pY = _x select 2 select 1;
    _pW = _x select 2 select 2;
    _m = format ["<t size='%1' color='%2' shadow='%3' align='%4' font='%5'>%6<br /></t>", _sizeTitle, _colorTitle, _shadow, _alignTitle, _fontTitle, _t];
    _m = _m + format ["<t size='%1' color='%2' shadow='%3' align='%4' font='%5'>%6<br /></t>", _sizeSubText, _colorSubText, _shadow, _alignSubText, _fontSubText, _s];
    _tm = round (count toArray (_t+_s) / 6 / 2) + 3;
    [ _m, [safezoneX - _pX, safezoneW], [safezoneY + _pY, safezoneH], _tm, _FadeIn ] spawn BIS_fnc_dynamicText;
    sleep (_tm+_FadeIn+4);
} forEach _ms; 
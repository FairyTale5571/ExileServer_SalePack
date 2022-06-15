#define GUI_GRID_X		(0)
#define GUI_GRID_Y		(0)
#define GUI_GRID_W		(0.025)
#define GUI_GRID_H		(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class RscRewardText
{
	deletable = 0;
	fade = 0;
	idc = -1;
	colorBackground[] ={0,0,0,0};
	colorText[] ={1,1,1,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 0;
	colorShadow[] ={0,0,0,0.5};
	font = "RobotoCondensed";
	SizeEx = "(((((safezoneW / safezoneH) min 0.9) / 1.2) / 25) * 1)";
	linespacing = 1;
	tooltipColorText[] ={1,1,1,1};
	tooltipColorBox[] ={1,1,1,1};
	tooltipColorShade[] ={0,0,0,0.65};
};
class RscRewardStructuredText
{
	deletable = 0;
	fade = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] ={1,1,1,1};
	class Attributes
	{
		font = "RobotoCondensed";
		color = "#ffffff";
		colorLink = "#D09B43";
		align = "left";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 1;
};
class RscRewardPicture
{
	deletable = 0;
	fade = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] ={0,0,0,0};
	colorText[] ={1,1,1,1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] ={1,1,1,1};
	tooltipColorBox[] ={1,1,1,1};
	tooltipColorShade[] ={0,0,0,0.65};
};
class RscRewardButton
{
	deletable = 0;
	fade = 0;
	type = 1;
	text = "";
	colorText[] ={1,1,1,1};
	colorDisabled[] ={1,1,1,0.25};
	colorBackground[] ={0,0,0,0.2};
	colorBackgroundDisabled[] ={0,0,0,0.5};
	colorBackgroundActive[] ={1,1,1,0.05};
	colorFocused[] ={1,1,1,0};
	colorShadow[] ={0,0,0,0};
	colorBorder[] ={0,0,0,1};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	soundEnter[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "OrbitronLight";
	sizeEx = "(((((safezoneW / safezoneH) min 1) / 1.2) / 25) * 1)";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};
class RscRewardButtonMenuOK : RscRewardButton
{
	idc = 1;
	shortcuts[] ={
		"0x00050000 + 0",
		28,
		57,
		156
	};
	default = 1;
	text = "OK";
	soundPush[] =
	{
		"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
		0.09,
		1
	};
};
class RscRewardButtonMenuCancel : RscRewardButton
{
	idc = 2;
	shortcuts[] =
	{
		"0x00050000 + 1"
	};
	text = "Cancel";
};
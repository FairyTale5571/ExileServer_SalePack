#include "config.h"
class VGP_ScrollBar
{
	color[] = {1, 1, 1, 0.6};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.3};
	thumb = "\A3\ui_f\data\gui\cfg\ScrollBar\thumb_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\ScrollBar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\ScrollBar\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\ScrollBar\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class VGP_RscText
{
	deletable = 0;
	fade = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "RobotoCondensed";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	linespacing = 1;
	tooltipColorText[] = {1, 1, 1, 1};
	tooltipColorBox[] = {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
};
class VGP_RscListBox
{
	deletable = 0;
	fade = 0;
	type = 5;
	rowHeight = 0;
	colorText[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorScrollBar[] = {1, 0, 0, 0};
	colorSelect[] = {0, 0, 0, 1};
	colorSelect2[] = {0, 0, 0, 1};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorBackground[] = {0, 0, 0, 0.3};
	soundSelect[] = {"\A3\ui_f\data\sound\RscListBox\soundSelect", 0.09, 1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	colorPicture[] = {1, 1, 1, 1};
	colorPictureSelected[] = {1, 1, 1, 1};
	colorPictureDisabled[] = {1, 1, 1, 0.25};
	colorPictureRight[] = {1, 1, 1, 1};
	colorPictureRightSelected[] = {1, 1, 1, 1};
	colorPictureRightDisabled[] = {1, 1, 1, 0.25};
	colorTextRight[] = {1, 1, 1, 1};
	colorSelectRight[] = {0, 0, 0, 1};
	colorSelect2Right[] = {0, 0, 0, 1};
	tooltipColorText[] = {1, 1, 1, 1};
	tooltipColorBox[] = {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
	class ListScrollBar: VGP_ScrollBar
	{
		color[] = {1, 1, 1, 1};
		autoScrollEnabled = 1;
	};
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.3;
	style = 16;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	colorShadow[] = {0, 0, 0, 0.5};
	period = 1.2;
	maxHistoryDelay = 1;
};
class VGP_ExileItemListBox: VGP_RscListBox
{
	sizeEx = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	sizeEx2 = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	rowHeight = "2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	canDrag = 0;
	itemSpacing = 0.001;
	period = 1.2;
	shadow = 0;
	maxHistoryDelay = 1;
	fade = 0;
	deletable = 0;
	type = 5;
	style = 16;
	colorBackground[] = {0,0,0,0.3};
	colorDisabled[] = {1,1,1,0.25};
	colorPicture[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	colorPictureSelected[] = {1,1,1,1};
	colorScrollBar[] = {1,0,0,0};
	colorSelect2[] = {0,0,0,1};
	colorSelect2Right[] = {0,0,0,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectRight[] = {0,0,0,1};
	colorShadow[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	colorTextRight[] = {1,1,1,1};
	disabledCtrlColor[] = {1,1,1,0.5};
	itemBackground[] = {1,1,1,0.1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	tooltipColorText[] = {1,1,1,1};
};
class VGP_RscEdit
{
	deletable = 0;
	fade = 0;
	type = 2;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])", 1};
	autocomplete = "";
	text = "";
	size = 0.2;
	style = "0x00 + 0x40";
	font = "RobotoCondensed";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	canModify = 1;
	tooltipColorText[] = {1, 1, 1, 1};
	tooltipColorBox[] = {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
};
class VGP_RscProgress
{
	deletable = 0;
	fade = 0;
	type = 8;
	style = 0;
	colorFrame[] = {0, 0, 0, 0};
	colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
	x = 0.344;
	y = 0.619;
	w = 0.313726;
	h = 0.0261438;
	shadow = 2;
	texture = "#(argb,8,8,3)color(1,1,1,1)";
};
class VGP_RscCombo
{
	deletable = 0;
	fade = 0;
	type = 4;
	colorSelect[] = {0, 0, 0, 1};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0, 0, 0, 1};
	colorScrollBar[] = {1, 0, 0, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorPicture[] = {1, 1, 1, 1};
	colorPictureSelected[] = {1, 1, 1, 1};
	colorPictureDisabled[] = {1, 1, 1, 0.25};
	colorPictureRight[] = {1, 1, 1, 1};
	colorPictureRightSelected[] = {1, 1, 1, 1};
	colorPictureRightDisabled[] = {1, 1, 1, 0.25};
	colorTextRight[] = {1, 1, 1, 1};
	colorSelectRight[] = {0, 0, 0, 1};
	colorSelect2Right[] = {0, 0, 0, 1};
	tooltipColorText[] = {1, 1, 1, 1};
	tooltipColorBox[] = {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect", 0.1, 1};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand", 0.1, 1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse", 0.1, 1};
	maxHistoryDelay = 1;
	class ComboScrollBar: VGP_ScrollBar
	{
		color[] = {1, 1, 1, 1};
	};
	style = "0x10 + 0x200";
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	colorSelectBackground[] = {1, 1, 1, 0.7};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	colorActive[] = {1, 0, 0, 1};
};
class VGP_RscStructuredText
{
	deletable = 0;
	fade = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {1, 1, 1, 1};
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
class VGP_RscButton
{
	deletable = 0;
	fade = 0;
	type = 1;
	text = "";
	colorText[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorBackground[] = {0, 0, 0, 0.5};
	colorBackgroundDisabled[] = {0, 0, 0, 0.5};
	colorBackgroundActive[] = {0, 0, 0, 1};
	colorFocused[] = {0, 0, 0, 1};
	colorShadow[] = {0, 0, 0, 0};
	colorBorder[] = {0, 0, 0, 1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
	idc = -1;
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	url = "";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
	class Attributes
	{
		font = "RobotoCondensed";
		color = "#ffffff";
		colorLink = "#D09B43";
		align = "left";
		shadow = 1;
	};
};

class RscVirtualGaragePublic
{
	idd=25044;
	onLoad="uiNamespace setVariable ['RscVirtualGaragePublic', _this select 0]";
	onUnload="call ExileClient_gui_virtualpGarageDialog_event_onUnload; uiNamespace setVariable ['RscVirtualGaragePublic', displayNull]";
	class controlsBackground
	{
		class DialogBackground: VGP_RscText
		{
			idc=4000;
			x = safeZoneX + safeZoneW * 0.020625;
			y = safeZoneY + safeZoneH * 0.02666667;
			w = safeZoneW * 0.185625;
			h = safeZoneH * 0.77;
			colorBackground[]={0.431,0.431,0.431,0.69999999};
		};
		class DialogTitle: VGP_RscText
		{
			idc=4001;
			text="Virtual Garage";
			x = safeZoneX + safeZoneW * 0.025;
			y = safeZoneY + safeZoneH * 0.03888889;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.04;
			sizeEx="1 * safezoneH / 25";
		};
	};
	class controls
	{
		class LocationDropDown: VGP_RscCombo
		{
			idc=4002;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.09222223;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			onLBSelChanged = "_this call ExileClient_virtualp_garage_onDropDownSelection";
		};
		class VehiclesListBox: VGP_ExileItemListBox
		{
			idc=4003;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.12555556;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.28;
			onLBSelChanged="_this call ExileClient_gui_virtualpGarageDialog_event_onVehicleChanged";
		};
		class ButtonConfirm: VGP_RscButton
		{
			idc=4004;
			text="Retrieve Vehicle";
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.63111112;
			w = safeZoneW * 0.175625;
			h = safeZoneH * 0.03333334;
			sizeEx="0.75 * safezoneH / 25";
			onMouseButtonClick="_this spawn ExileClient_gui_virtualpGarageDialog_event_onConfirmButtonClicked";
			class Attributes: Attributes
			{
				align="center";
				valign="middle";
			};
		};
		class CancelButton: VGP_RscButton
		{
			idc=4005;
			text = "Close";
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.76333334;
			w = safeZoneW * 0.175625;
			h = safeZoneH * 0.02222223;
			action="closeDialog 0";
			class Attributes: Attributes
			{
				align="center";
			};
		};
		class NicknameBox: VGP_RscEdit
		{
			idc=4006;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.58777778;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.03555556;
			colorBackground[]={0.050000001,0.050000001,0.050000001,0.69999999};
		};
		class PinText: VGP_RscStructuredText
		{
			idc = 4007;
			text="Vehicle Nickname";
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.54333334;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.03222223;
		};
		class Stat01Background: VGP_RscText
		{
			idc=4008;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.41111112;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			colorBackground[]={0,0,0,0.5};
		};
		class Stat01Progress: VGP_RscProgress
		{
			idc=4009;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.41111112;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			colorText[]={1,1,1,0.25};
			colorBackground[]={1,1,1,0.25};
		};
		class Stat01Label: VGP_RscText
		{
			idc=4010;
			text="";
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.41111112;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
		};
		class Stat01Value: VGP_RscStructuredText
		{
			idc=4011;
			text="";
			style=1;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.41111112;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			class Attributes: Attributes
			{
				align="right";
			};
		};
		class Stat02Background: VGP_RscText
		{
			idc=4012;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.44444445;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			colorBackground[]={0,0,0,0.5};
		};
		class Stat02Progress: VGP_RscProgress
		{
			idc=4013;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.44444445;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			colorText[]={1,1,1,0.25};
			colorBackground[]={1,1,1,0.25};
		};
		class Stat02Label: VGP_RscText
		{
			idc=4014;
			text="";
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.44444445;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
		};
		class Stat02Value: VGP_RscStructuredText
		{
			idc=4015;
			text="";
			style=1;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.44444445;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			class Attributes: Attributes
			{
				align="right";
			};
		};
		class Stat03Background: VGP_RscText
		{
			idc=4016;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.47777778;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			colorBackground[]={0,0,0,0.5};
		};
		class Stat03Progress: VGP_RscProgress
		{
			idc=4017;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.47777778;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			colorText[]={1,1,1,0.25};
			colorBackground[]={1,1,1,0.25};
		};
		class Stat03Label: VGP_RscText
		{
			idc=4018;
			text="";
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.47777778;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
		};
		class Stat03Value: VGP_RscStructuredText
		{
			idc=4019;
			text="";
			style=1;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.47777778;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			class Attributes: Attributes
			{
				align="right";
			};
		};
		class Stat04Background: VGP_RscText
		{
			idc=4020;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.51;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			colorBackground[]={0,0,0,0.5};
		};
		class Stat04Progress: VGP_RscProgress
		{
			idc=4021;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.51;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			colorText[]={1,1,1,0.25};
			colorBackground[]={1,1,1,0.25};
		};
		class Stat04Label: VGP_RscText
		{
			idc=4022;
			text="";
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.51;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
		};
		class Stat04Value: VGP_RscStructuredText
		{
			idc=4023;
			text="";
			style=1;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.51;
			w = safeZoneW * 0.175;
			h = safeZoneH * 0.02777778;
			class Attributes: Attributes
			{
				align="right";
			};
		};
		class Slots: VGP_RscStructuredText
		{
			idc = 4024;
			text = ""; //--- ToDo: Localize;
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.67555556;
			w = safeZoneW * 0.175625;
			h = safeZoneH * 0.03333334;
			class Attributes: Attributes
			{
				valign="middle";
				align="center";
			};
		};
		class BuySlot: VGP_RscButton
		{
			idc = 4025;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "call ExileClient_virtualp_garage_buyMoreSlotsRequest";
			x = safeZoneX + safeZoneW * 0.025625;
			y = safeZoneY + safeZoneH * 0.72;
			w = safeZoneW * 0.175625;
			h = safeZoneH * 0.03333334;
			class Attributes: Attributes
			{
				valign="middle";
			};
		};
	};
};

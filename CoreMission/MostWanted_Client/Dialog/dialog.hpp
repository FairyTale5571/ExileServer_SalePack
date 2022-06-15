#include "defines.hpp"

class RscAtlasVirtualGarage
{
	idd=28029;
	onLoad="uiNamespace setVariable ['RscAtlasVirtualGarage', _this select 0]";
	class controlsBackground
	{
		class DialogBackground: RscTextVG
		{
			idc = 1000;

			x = 0.345312 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.05,0.05,0.05,0.7};
		};
		class DialogCation: RscTextVG
		{
			idc = 2001;

			text = "$STR_VG_TITLE"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class BalanceLabel: RscTextVG
		{
			idc = 2002;

			text = "$STR_VG_BalIn"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class InventoryLabel: RscTextVG
		{
			idc = 2005;

			text = "$STR_VG_BalNear2"; //--- ToDo: Localize;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls
	{
		class InGarage: RscStructuredTextVG
		{
			idc = 1001;

			text = "$STR_VG_Req"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class Nearby: RscStructuredTextVG
		{
			idc = 1005;

			text = "$STR_VG_BalNear"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class Exit: RscButtonMenuCancelVG
		{
			idc = 4002;
			onButtonClick = "[] call fnc_openVirtualGarage";

			x = 0.5825 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class ButtonRETRIEVE: RscButtonVG
		{
			idc = 4003;
			onButtonClick = "[] call fnc_onRetrieveVirtualGarageButtonClick";

			text = "$STR_VG_Retr"; //--- ToDo: Localize;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			sizeEx="1.5 * (0.04)";
		};
		class ButtonSTORE: RscButtonVG
		{
			idc = 4004;
			onButtonClick = "[] call fnc_onStoreVirtualGarageButtonClick";

			text = "$STR_VG_Store"; //--- ToDo: Localize;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			sizeEx="1.5 * (0.04)";
		};
	};
};

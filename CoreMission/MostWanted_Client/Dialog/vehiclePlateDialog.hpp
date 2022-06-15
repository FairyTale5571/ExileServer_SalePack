class RscVehiclePlateDialog
{
	idd = 8040;
	onLoad = "uiNamespace setVariable ['RscVehiclePlateDialog',_this select 1]";
	onUnload = "uiNamespace setVariable ['RscVehiclePlateDialog',displayNull]";
	class controlsBackground
	{
		class DialogBackground: RscText
		{
			idc = 8041;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.05,0.05,0.05,0.7};
		};
		class DialogCation: RscText
		{
			idc = 8042;
			text = "Change vehicle plate"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class ResetCodeCostLabel: RscText
		{
			idc = 8043;
			text = "Cost to change vehicle plate text:"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ResetCodeFreeLabel: RscText
		{
			idc = 8044;
			text = "Please, enter your vehicle plate text"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls
	{
		class Cost: RscStructuredText
		{
			idc = 8045;

			text = "<t size='1.4'>0<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1' shadow='true' /></t>"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class CancelButton: RscButtonMenuCancel
		{
			action = "closeDialog 0";
			idc = 8046;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class PurchaseButton: RscButtonMenuOK
		{
			idc = 8047;
			onMouseButtonClick = "_this call AtlasClient_gui_changePlateRequest";

			text = "Apply"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscEdit_1400: RscEdit
		{
			idc = 8048;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
#include "BasePaintingDefines.hpp"
class BasePaintingDialog
{
    idd = 7688;
    onLoad = "uiNamespace setVariable ['BasePaintingDialog', _this select 0];";
    movingenable=0;
	class Controls
	{
        class BasePaintingBG: BasePaintingIGUIBack
        {
        	idc = 2200;

        	x = 0.0153125 * safezoneW + safezoneX;
        	y = 0.082 * safezoneH + safezoneY;
        	w = 0.170156 * safezoneW;
        	h = 0.748 * safezoneH;
        	colorBackground[] = {0.169,0.188,0.212,0.7};
        };
        class BasePaintingTextureList: BasePaintingRscListBox
        {
        	idc = 1500;
        	style = 530;
        	onLBSelChanged = "call ExileClient_BasePainting_LBSelChanged";

        	x = 0.025625 * safezoneW + safezoneX;
        	y = 0.29144 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.341 * safezoneH;
        };
        class ModeText: BasePaintingRscStructuredText
        {
        	idc = 1109;

        	text = "<t color='#E48A36' font='puristaMedium' size='1.2' align='center' shadow='0'>Mode: Texture</t>"; //--- ToDo: Localize;
        	x = 0.025625 * safezoneW + safezoneX;
        	y = 0.2118 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.0286 * safezoneH;
        };
        class ToggleModeBtn: BasePaintingRscButton
        {
        	idc = 1601;
        	colorBackgroundActive[] = {1,1,1,0.05};
        	colorFocused[] = {1,1,1,0};
        	onButtonClick = "call ExileClient_BasePainting_ToggleMode;";

        	x = 0.025625 * safezoneW + safezoneX;
        	y = 0.203 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.0374 * safezoneH;
        	colorBackground[] = {0,0,0,0};
        	tooltip = "Mode Toggle"; //--- ToDo: Localize;
        };
        class BasePaintingTitle: BasePaintingRscStructuredText
        {
        	idc = 1100;

        	text = "<t color='#E48A36' font='puristaMedium' size='1.2' align='center' shadow='0'> BASE PAINTING</t>"; //--- ToDo: Localize;
        	x = 0.0153125 * safezoneW + safezoneX;
        	y = 0.09564 * safezoneH + safezoneY;
        	w = 0.170156 * safezoneW;
        	h = 0.0320001 * safezoneH;
        };
        class BasePaintingApplyText: BasePaintingRscStructuredText
        {
        	idc = 1101;

        	text = "<t color='#E48A36' font='puristaMedium' size='1.2' align='center' shadow='0'>APPLY</t>"; //--- ToDo: Localize;
        	x = 0.025625 * safezoneW + safezoneX;
        	y = 0.70284 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.044 * safezoneH;
        };
        class BasePaintingCancelText: BasePaintingRscStructuredText
        {
        	idc = 1102;

        	text = "<t color='#E48A36' font='puristaMedium' size='1.2' align='center' shadow='0'>CANCEL</t>"; //--- ToDo: Localize;
        	x = 0.025625 * safezoneW + safezoneX;
        	y = 0.757 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.044 * safezoneH;
        };
        class BasePaintingApplyButton: BasePaintingRscButton
        {
        	idc = 1601;
        	colorBackgroundActive[] = {1,1,1,0.05};
        	colorFocused[] = {1,1,1,0};
        	onButtonClick = "call ExileClient_BasePainting_ApplyTexture";

        	x = 0.025625 * safezoneW + safezoneX;
        	y = 0.6948 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0,0,0,0};
        	tooltip = "Apply Texture"; //--- ToDo: Localize;
        };
        class BasePaintingCancelBtn: BasePaintingRscButton
        {
        	idc = 1602;
        	colorBackgroundActive[] = {1,1,1,0.05};
        	colorFocused[] = {1,1,1,0};
        	onButtonClick = "call ExileClient_BasePainting_DialogClose";

        	x = 0.0266562 * safezoneW + safezoneX;
        	y = 0.747 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0,0,0,0};
        	tooltip = "Cancel"; //--- ToDo: Localize;
        };
        class LayersList: BasePaintingRscCombo
        {
        	idc = 2100;

        	x = 0.0255219 * safezoneW + safezoneX;
        	y = 0.17 * safezoneH + safezoneY;
        	w = 0.149565 * safezoneW;
        	h = 0.033 * safezoneH;
        	tooltip = "Select Layer"; //--- ToDo: Localize;
        };
        class LayersText: BasePaintingRscStructuredText
        {
        	idc = 1106;

        	text = "<t color='#E48A36' font='puristaMedium' size='1' align='center' shadow='0'>Layers</t>"; //--- ToDo: Localize;
        	x = 0.0152094 * safezoneW + safezoneX;
        	y = 0.137 * safezoneH + safezoneY;
        	w = 0.170156 * safezoneW;
        	h = 0.0320001 * safezoneH;
        };
        class ResetButtonText: BasePaintingRscStructuredText
        {
        	idc = 1102;

        	text = "<t color='#E48A36' font='puristaMedium' size='1.2' align='center' shadow='0'>RESET</t>"; //--- ToDo: Localize;
        	x = 0.025625 * safezoneW + safezoneX;
        	y = 0.6519 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.044 * safezoneH;
        };
        class ResetBtn: BasePaintingRscButton
        {
        	idc = 1602;
        	colorBackgroundActive[] = {1,1,1,0.05};
        	colorFocused[] = {1,1,1,0};
        	onButtonClick = "call ExileClient_BasePainting_ResetTextures";

        	x = 0.0266562 * safezoneW + safezoneX;
        	y = 0.6442 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0,0,0,0};
        	tooltip = "Rest Textures Back To Default";
        };
        class SearchBox: BasePaintingRscEdit
        {
        	idc = 1400;
        	x = 0.025625 * safezoneW + safezoneX;
        	y = 0.2514 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.033 * safezoneH;
            tooltip = "Search";
        };

        ////////////////////////////////////////////////////////
        // Colour sliders 
        ////////////////////////////////////////////////////////
        class RSlider: BasePaintingRscSlider
        {
            idc = 1900;

            x = 0.025625 * safezoneW + safezoneX;
            y = 0.2812 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.033 * safezoneH;
            color[] = { 1, 0, 0, .5 }; 
            coloractive[] = { 1, 0, 0, 1 };
            onSliderPosChanged = "call ExileClient_BasePainting_ColorSliderPosChanged";
        };
        class GSlider: BasePaintingRscSlider
        {
            idc = 1901;

            x = 0.025625 * safezoneW + safezoneX;
            y = 0.3212 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.033 * safezoneH;
            color[] = { 0, 1, 0, .5 }; 
            coloractive[] = { 0, 1, 0, 1 };
            onSliderPosChanged = "call ExileClient_BasePainting_ColorSliderPosChanged";
        };
        class BSlider: BasePaintingRscSlider
        {
            idc = 1902;

            x = 0.025625 * safezoneW + safezoneX;
            y = 0.3612 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.033 * safezoneH;
            color[] = { 0, 0, 1, .5 }; 
            coloractive[] = { 0, 0, 1, 1 };
            onSliderPosChanged = "call ExileClient_BasePainting_ColorSliderPosChanged";
        };
        class PreviewBox: BasePaintingRscPicture
        {
            idc = 1200;

            text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
            x = 0.0359375 * safezoneW + safezoneX;
            y = 0.4212 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.143 * safezoneH;
        };
    };
};

/**
 * File: ExileClient_gui_virtualpGarageDialog_event_onUnload
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 */
 
disableSerialization;
ExileClientMoonLight setLightBrightness 0.75;
call ExileClient_gui_modelBox_destroy;
true call ExileClient_gui_hud_toggle;

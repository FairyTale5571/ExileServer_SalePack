/**
 * ExileClient_system_bulletCam_thread
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_projectile", "_outOfRange", "_hud", "_renderSurface", "_status", "_startTime"];
disableSerialization;
_projectile = _this;
_outOfRange = false;
_hud = uiNamespace getVariable "RscExileHUD";
_renderSurface = _hud displayCtrl 1502;
_renderSurface ctrlSetFade 0;
_renderSurface ctrlCommit 0;
_status = _hud displayCtrl 1504;
_status ctrlSetText "CXN";
_status ctrlSetTextColor [0, 0.9, 0, 1];
_status ctrlCommit 0;

if (_projectile call ExileClient_util_world_isInTerritory) exitWith
{
	_status ctrlSetText "NO SIGNAL";
	_status ctrlSetTextColor [0.91, 0, 0, 1];
	_status ctrlCommit 0;
	true
};

ExileClientBulletCamera = "camera" camCreate (getPos _projectile);
ExileClientBulletCamera camSetFocus [50, 1];
ExileClientBulletCamera camCommit 0;
ExileClientBulletCamera cameraEffect ["External", "Back", "ExileBulletCameraRenderSurface"];
"ExileBulletCameraRenderSurface" setPiPEffect [3, 1, 1.1, 0.3, 0, [0, 0, 0, 0], [1, 1, 1, 0], [1 ,1 ,1 ,1]];
showCinemaBorder false;
_startTime = time;
waitUntil 
{
	if (_projectile call ExileClient_util_world_isInTerritory) exitWith
	{
		true
	};
	if (isNull _projectile) exitWith 
	{
		true
	};
	if ((speed _projectile) isEqualTo 0) exitWith
	{
		true
	};
	if ((time - _startTime) > 7) exitWith 
	{
		_outOfRange = true;
		true
	};
	ExileClientBulletCamera camSetTarget _projectile;
	ExileClientBulletCamera camSetRelPos [0, -2, 0];
	ExileClientBulletCamera camCommit 0;
	false
};
if(isnil "BulletCamMarker") then 
{
	BulletCamMarker = createMarkerLocal ["BulletCamMarker", position ExileClientBulletCamera];
	BulletCamMarker setMarkerShapeLocal "ICON";
	
	if(_outOfRange) then 
	{
		BulletCamMarker setMarkerTypeLocal "Contact_pencilTask2";
		BulletCamMarker setMarkerColorLocal "ColorRed";
	}
	else
	{
		BulletCamMarker setMarkerTypeLocal "Contact_pencilTask3";
		BulletCamMarker setMarkerColorLocal "ColorGreen";
	};
};

if!(isnil "BulletCamMarker") then 
{
	if(_outOfRange) then 
	{
		"BulletCamMarker" setMarkerPosLocal (position ExileClientBulletCamera);
		BulletCamMarker setMarkerTypeLocal "Contact_pencilTask2";
		BulletCamMarker setMarkerColorLocal "ColorRed";
	}
	else
	{
		"BulletCamMarker" setMarkerPosLocal (position ExileClientBulletCamera);
		BulletCamMarker setMarkerTypeLocal "Contact_pencilTask3";
		BulletCamMarker setMarkerColorLocal "ColorGreen";
	};
};
uiSleep 1;
_renderSurface ctrlSetFade 1;
_renderSurface ctrlCommit 0.25;
_status ctrlSetText "NO SIGNAL";
_status ctrlSetTextColor [0.91, 0, 0, 1];
_status ctrlCommit 0;
uiSleep 0.25;
call ExileClient_system_bulletCam_destroy;
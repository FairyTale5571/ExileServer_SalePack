
_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;
_mode =	_this select 3;
_ammo = _this select 4;
_magazine =	_this select 5;
_projectile = _this select 6;

/*
* This feature required [749] mod

if(_ammo in ["GrenadeHand_stone","SUPER_flash_ammo"]) then {
	_projectile spawn {
		private["_position"];
		while {!isNull _this} do {
			_position = getPosATL _this;
			sleep 0.1;
		};		
		[_position] remoteExec ["atlas_fnc_flashbang",0];
	};
};
*/

// No shooting in safe zones
if (ExilePlayerInSafezone) then
{
	if (local _projectile) then
	{
		deleteVehicle _projectile;
	};
}
else
{
	switch (_weapon) do
	{
		case "Exile_Melee_Axe":
		{
			player playActionNow "GestureExileAxeSwing01";

			[] call ExileClient_object_tree_chop;
		};

		case "Exile_Melee_Shovel":
		{
			player playActionNow "GestureExileSledgeHammerSwing01";
		};

		case "Exile_Melee_SledgeHammer":
		{
			player playActionNow "GestureExileSledgeHammerSwing01";

			[] call ExileClient_object_shippingContainer_smash;
		};

		case "Put":
		{
			// Only works for satchels
			if (_magazine in ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"]) then
			{
				_object = cursorTarget;

				if ((_object isKindOf "LandVehicle") || (_object isKindOf "Air") || (_object isKindOf "Boat") || (_object isKindOf "Man") || (_object isKindOf "Exile_Construction_Abstract_Static")) then
				{
					_intersection = lineIntersectsSurfaces
					[
						AGLToASL positionCameraToWorld [0, 0, 0],  // begPosASL
						AGLToASL positionCameraToWorld [0, 0, 5],  // endPosASL
						player, // ignoreObj1
						objNull, // ignoreObj2
						true, // sortMode, closest to furthest
						1, // maxResults
						"VIEW", // LOD1
						"GEOM" // LOD2
					];

					if (count _intersection > 0) then
					{
						_firstInsection = _intersection select 0;

						if !(simulationEnabled _object) then
						{
							if (local _object) then
							{
								_object enableSimulation true;
							}
							else
							{
								["enableSimulationRequest", [netId _object]] call ExileClient_system_network_send;
							};
						};

						_projectile setPosASL [0, 0, 0];
						_projectile attachTo [_object, _object worldToModel (ASLtoAGL (_firstInsection select 0)) ];
						_projectile setVectorUp (_firstInsection select 1);
					};
				};
			};
			{
				_marker = _x;
				if (typeName _marker isEqualTo "STRING") then
				{
					{
						_type = _x select 0;
						_MinDist = _x select 1;
						if (getMarkerType _marker isEqualTo _type) then
						{
							_markerPos = getMarkerPos _marker;
							_distance = player distance _markerPos;
							if (_distance < _MinDist) then
							{
								deleteVehicle _projectile;
								["ErrorTitleAndText", ["Explosive Deleted", "You can not place a explosive this close to a safe-zone!"]] call ExileClient_gui_toaster_addTemplateToast;
							};
						};
					} forEach getArray (missionConfigFile >> "CfgTradeSafeZone" >> "BlockExplosisvesTrader");
				};
			} forEach allMapMarkers;
		};

		case "Throw":
		{
			// Do not trigger combat mode for "throw"
		};

		default
		{
			ExileClientPlayerIsInCombat = true;
			ExileClientPlayerLastCombatAt = diag_tickTime;

			true call ExileClient_gui_hud_toggleCombatIcon;

			// Enable bullet cam if needed
			if !(isNull _projectile) then
			{
				// Must be zoomed in
				if (cameraView isEqualTo "GUNNER") then
				{
					// Magazine must be of type 8G bullet cam
					if (isNumber (configFile >> "CfgMagazines" >> _magazine >> "exileBulletCam")) then
					{
						// Destroy an already actice bullet cam if there is one
						call ExileClient_system_bulletCam_destroy;

						// Spawn our client to shit
						ExileClientBulletCameraThread = _projectile spawn ExileClient_system_bulletCam_thread;
					};
				};
			};
		};
	};
};

true

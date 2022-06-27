private ["_size","_GUI","_d"];
_size = getResolution select 5;

if !(_size == 0.55000001 || _size == 0.47) exitWith {};


if (_size == 0.55000001) then
{
_GUI =
{
	if (!(ExileClientPlayerIsInfantry) && !(typeOf vehicle player == "Steerable_Parachute_F")) then
	{
		_d = uiNamespace getVariable "RscUnitInfo";
		{
			_pos = ctrlPosition _x;
			if (_pos select 1 == -1) then
			{
				_pos set [1, -0.35];
			};
			if (ctrlClassName _x == "CA_HitZones") then
			{
				_pos set [1, -0.34];
			};
			if (ctrlClassName _x == "CA_Vehicle") then
			{
				_pos set [1, -0.39];
			};
			if (ctrlClassName _x == "CA_BackgroundVehicle") then
			{
				_pos set [1, -0.35];
			};
			if (ctrlClassName _x == "CA_BackgroundVehicleTitleDark") then
			{
				_pos set [1, -0.39];
			};
			if (ctrlClassName _x == "CA_BackgroundVehicleTitle") then
			{
				_pos set [1, -0.39];
			};
			if (ctrlClassName _x == "CA_Speed") then
			{
				_pos set [1, -0.34];
			};
			if (ctrlClassName _x == "CA_SpeedUnits") then
			{
				_pos set [1, -0.34];
			};
			if (ctrlClassName _x == "CA_SpeedBackground") then
			{
				_pos set [1, -0.30];
			};
			if (ctrlClassName _x == "CA_Alt") then
			{
				_pos set [1, -0.30];
			};
			if (ctrlClassName _x == "CA_AltUnits") then
			{
				_pos set [1, -0.30];
			};
			if (ctrlClassName _x == "CA_AltBackground") then
			{
				_pos set [1, -0.30];
			};
			if (ctrlClassName _x == "CA_VehicleToggles") then
			{
				_pos set [1, -0.26];
			};
			if (ctrlClassName _x == "CA_VehicleTogglesBackground") then
			{
				_pos set [1, -0.26];
			};
			if (ctrlClassName _x == "CA_BackgroundFuel") then
			{
				_pos set [1, -0.35];
			};
			if (ctrlClassName _x == "WeaponInfoControlsGroupRight") then
			{
				_pos set [1, -0.39];
			};
			if (ctrlClassName _x == "CA_Zeroing") then
			{
				_pos set [1, -0.39];
			};
			_x ctrlSetPosition _pos;
			_x ctrlSetFade 0;
			_x ctrlShow true;
			_x ctrlCommit 0;
		} foreach allControls _d;
	}
	else
	{
		true call ExileClient_gui_hud_toggle;
		true call ExileClient_gui_toaster_toggle;
	};
  };
};


if (_size == 0.47) then
{
_GUI =
{
	if (!(ExileClientPlayerIsInfantry) && !(typeOf vehicle player == "Steerable_Parachute_F")) then
	{
		_d = uiNamespace getVariable "RscUnitInfo";
		{
			_pos = ctrlPosition _x;
			if (_pos select 1 == -1) then
			{
				_pos set [1, -0.5];
			};
			if (ctrlClassName _x == "CA_HitZones") then
			{
				_pos set [1, -0.49];
			};
			if (ctrlClassName _x == "CA_Vehicle") then
			{
				_pos set [1, -0.54];
			};
			if (ctrlClassName _x == "CA_BackgroundVehicle") then
			{
				_pos set [1, -0.5];
			};
			if (ctrlClassName _x == "CA_BackgroundVehicleTitleDark") then
			{
				_pos set [1, -0.54];
			};
			if (ctrlClassName _x == "CA_BackgroundVehicleTitle") then
			{
				_pos set [1, -0.54];
			};
			if (ctrlClassName _x == "CA_Speed") then
			{
				_pos set [1, -0.49];
			};
			if (ctrlClassName _x == "CA_SpeedUnits") then
			{
				_pos set [1, -0.49];
			};
			if (ctrlClassName _x == "CA_SpeedBackground") then
			{
				_pos set [1, -0.45];
			};
			if (ctrlClassName _x == "CA_Alt") then
			{
				_pos set [1, -0.45];
			};
			if (ctrlClassName _x == "CA_AltUnits") then
			{
				_pos set [1, -0.45];
			};
			if (ctrlClassName _x == "CA_AltBackground") then
			{
				_pos set [1, -0.45];
			};
			if (ctrlClassName _x == "CA_VehicleToggles") then
			{
				_pos set [1, -0.41];
			};
			if (ctrlClassName _x == "CA_VehicleTogglesBackground") then
			{
				_pos set [1, -0.41];
			};
			if (ctrlClassName _x == "CA_BackgroundFuel") then
			{
				_pos set [1, -0.5];
			};
			if (ctrlClassName _x == "WeaponInfoControlsGroupRight") then
			{
				_pos set [1, -0.54];
			};
			if (ctrlClassName _x == "CA_Zeroing") then
			{
				_pos set [1, -0.54];
			};
			_x ctrlSetPosition _pos;
			_x ctrlSetFade 0;
			_x ctrlShow true;
			_x ctrlCommit 0;
		} foreach allControls _d;
	}
	else
	{
		true call ExileClient_gui_hud_toggle;
		true call ExileClient_gui_toaster_toggle;
	};
};
};
[1,_GUI,[],true,false] call ExileClient_system_thread_addTask;
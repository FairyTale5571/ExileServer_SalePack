[] execVM "AVS\AVS_fnc_init.sqf";							//Re-arm,refuel etc.
[] execVM "Custom\EnigmaRevive\init.sqf";					//Revive system
[] ExecVM "custom\restartWarnings\sqf\initLocal.sqf";		//Restarts
[] ExecVM "custom\scripts\fn_killMsg.sqf";					
[] ExecVM "custom\scripts\welcome.sqf";					
[] ExecVM "custom\scripts\reservedslots.sqf";					
[] ExecVM "custom\scripts\name_tags.sqf";					
execVM "R3F_LOG\init.sqf";

//Configs vars
ExileClientXM8IsPowerOn = true;

ExileClientPlayerIsDragging = false;
WeaponHolsterAutoRunBlock = false;

if (isDedicated || isServer) then {
	"atlas_deploy" addPublicVariableEventHandler {
		_parameters = (_this select 1);
		_parameters2  =(_parameters select 1);
		_vehicle = getText(missionConfigFile >> "CfgExAd" >> "DeployVehicle" >> "Vehicle");
		diag_log format ["createVehicleRequested %1 ", _parameters]; // YOU NEED THIS FOR LOGS TO SEE WHO DID IT
		_veh = createVehicle[_vehicle, _parameters2 , [] ,0 , "NONE"];
		_veh setVariable ["deployedVehicle",true,true];
	};
};

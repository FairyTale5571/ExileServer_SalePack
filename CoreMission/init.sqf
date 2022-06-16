						//Re-arm,refuel etc.[] execVM "Custom\EnigmaRevive\init.sqf";					//Revive system
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
Bones_fnc_getVehicleLoadout = compileFinal (preprocessFileLineNumbers "Custom\ammoSave\Bones_fnc_getVehicleLoadout.sqf");
Bones_fnc_playSounds = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_playSounds.sqf");
Bones_fnc_showServicePointDialogue = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\GUI\Bones_fnc_showServicePointDialogue.sqf");
Bones_fnc_getVehicleLoadout = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_getVehicleLoadout.sqf");
Bones_fnc_getReloadable = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_getReloadable.sqf");
Bones_fnc_performAction = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_performAction.sqf");
Bones_fnc_getReloadCost = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_getReloadCost.sqf");
Bones_fnc_getRepairable = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_getRepairable.sqf");
Bones_fnc_getRepairableCosts = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_getRepairableCosts.sqf");
Bones_fnc_vmsChecks = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_vmsChecks.sqf");
vmsConfig = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\vmsConfig.sqf");
[] call vmsConfig;
[] execVM "Custom\vehicleManagementSystem\Functions\takegive_poptab_init.sqf";
[] execVM "Custom\vehicleManagementSystem\Functions\Bones_fnc_markServicePoints.sqf";
if (!isServer)  then 
{
[] execVM "Custom\vehicleManagementSystem\functions\Bones_fnc_vspInRange.sqf";
[] execVM "Custom\vehicleManagementSystem\functions\Bones_fnc_disableDefaultRefuel.sqf";
};

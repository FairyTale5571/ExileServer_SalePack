params ["_message","_type"];
if (isClass (configFile >> "CfgPatches" >> "a3_infiSTAR_Exile")) then
{
	if ((getText(configFile >> "Cfg_infiSTAR_settings" >> "WRITE_LOG_FILES")) == "true") then
	{
		["SafeZonePlus_Log",_message] call FNC_A3_CUSTOMLOG;
	};

	diag_log format["SafeZonePlus: %1", _message];
	if (_type == 1) then
	{
		_message call fnc_add_survlog;
	};
}
else
{
	diag_log format["SafeZonePlus: %1", _message];
};

true
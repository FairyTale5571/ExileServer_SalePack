_result = false;
_vehicle = _this;
if (local _vehicle) then
{
	if(getNumber (missionConfigFile >> "CfgVehiclePainting" >> "onlyPremium") isEqualTo 1) then
	{
		if (getPlayerUID player in (getArray (missionConfigFile >> "CfgVehiclePainting" >> "premiumUID"))) then
		{
			_result = true;
		}else{
			_result = false;
		};
	}else{
		_result = true;
	};	
};
_result

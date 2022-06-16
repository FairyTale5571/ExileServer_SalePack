
params ["_vehicle"];

private ["_totalCost", "_currentLoadout"];
_totalCost = 0;

_currentLoadout = _vehicle call Bones_fnc_getVehicleLoadout;

{
	private ["_sum", "_index", "_menuItem", "_displayName", "_cost"];

	_turretPath = _x select 0;
	_pylonRun = _x select 1;
	_magClass = _x select 2;
	_ammoCount = _x select 3;
	_ammoDiff = _x select 4;
	_totalMags = _X select 5;
	_cost = 0;
	
	//// ЦЕНА
	{
		private ["_configClass", "_configCost"];
		_configClass = _x select 0;
		_configCost = _x select 1;
		if (_magClass == _configClass) exitWith {
			_cost = _configCost;
		};
	} forEach vmsAmmoCost;

	if (_cost == 0) then {
		_cost = vmsdefaultAmmoCost;
	};

	if (_ammoDiff > 0) then {
		_sum = _ammoDiff * _cost;
		_totalCost = _sum + _totalCost;
	};

	
} forEach _currentLoadout;

// systemChat format ["*** GOT TOTAL RELOAD COST: %1", _totalCost];
_totalCost
private ["_pylon", "_pylonRun", "_pylonList", "_magClass","_vehicle", "_currentLoadout", "_turretPath", "_ammoCount", "_magDetail"];
_OK = params
[
	["_vehicle", objNull, [objNull]]
];

private ["_currentLoadout", "_vehicle", "_magDetail", "_pylonList", "_pylonsInfo", "_pylonRun"];

_currentLoadout = [];
_magDetail = magazinesAllTurrets _vehicle;
_pylonList = getPylonMagazines _vehicle;
_pylonsInfo = getAllPylonsInfo _vehicle;
_pylonRun = 1;

// Добавляем максимальный размер магазина из конфига
{
	private ["_magClass", "_magMaxAmmoCount"];
	_magClass = _x select 0;
	_magMaxAmmoCount = (getNumber(configFile >> "CfgMagazines" >> _magClass >> "count"));
	_x pushBack _magMaxAmmoCount;
} forEach _magDetail;


{
	private ["_magClass", "_turretPath", "_ammoCount", "_pylon", "_maxAmmo", "_currentDiff", "_tempAmmo", "_inserted", "_totalMags"];

	_magClass = _x select 0;
	_turretPath = _x select 1;
	_ammoCount = _x select 2;
	_pylon = -1;
	_maxAmmo = _x select 5;
	_currentDiff = _maxAmmo - _ammoCount;

	_totalMags = 1;

	if (_magclass in _pylonList) then 
	{
		_pylon = _pylonRun;
		_pylonRun = _pylonRun + 1;
		_currentLoadout pushBack [_turretPath, _pylon, _magClass, _ammoCount, _currentDiff, _totalMags];
	} else
	{
		//// ДОБАВИТЬ ИЛИ ОБНОВИТЬ
		_inserted = false;
		{
			if ((_x select 0) isEqualTo _turretPath && (_x select 2) isEqualTo _magClass) then
			{
				// всего патронов для заданного класса
				_tempAmmo = (_x select 3); 
				_x set [3, (_tempAmmo + _ammoCount)];
				// нехватка патронов
				_tempDiff = (_x select 4); 
				_x set [4, (_tempDiff + _currentDiff)];
				_inserted = true;
				// всего магазинов
				_tempTotalMags = (_x select 5); 
				_x set [5, _tempTotalMags + 1];
			};
		} forEach _currentLoadout;

		if (!_inserted) then
		{
			_currentLoadout pushBack [_turretPath, _pylon, _magClass, _ammoCount, _currentDiff, _totalMags];
		};
	};
} forEach _magDetail; 

_currentLoadout
_totalCost = 0;
_vehicle1 = [];
if (isNull objectParent player) then {_vehicle1 pushback cursorTarget;} else 
{
_vehicleTemp = (objectParent player);
_vehicle1 pushback (nearestObject [player, typeof _vehicleTemp]);
};
_vehicle = (_vehicle1 select 0);
_reloadList = [];
_crtl = (findDisplay 9123 displayCtrl 1500);
lbClear _crtl;
_action = "Reload";
_weapArray = [];
{
	_cfgTurret = _x;
	_magazineArray = getArray (_cfgTurret >> "magazines");
	_tempArray = [];		
	{
		_magDetails = [];
		_tempMag = _x;
		if !(_tempMag in _tempArray) then 
		{
			_tempArray pushback _tempMag;
			_cnt = {_x == _tempMag} count _magazineArray;
			_magDetails pushback _tempMag;
			_magDetails pushback _cnt;
			_weapArray pushback _magDetails;
		};
	} forEach _magazineArray;
} forEach ([_vehicle] call BIS_fnc_getTurrets);
{
	_weapArray pushBack [_x, 1]
} forEach (getPylonMagazines _vehicle);


private _currentLoadout = _vehicle call Bones_fnc_getVehicleLoadout;

{
	private ["_rearmData", "_sum", "_index", "_menuItem", "_displayName", "_cost"];

	_turretPath = _x select 0;
	_pylonRun = _x select 1;
	_magClass = _x select 2;
	_ammoCount = _x select 3;
	_ammoDiff = _x select 4;
	_totalMags = _X select 5;
	_rearmData = [];

	_cost = 0;

	if (_ammoDiff > 0) then {

		//// НАИМЕНОВАНИЕ
		_displayName = getText(configFile >> "CfgMagazines" >> _magClass >> "displayName");
		if (_displayName == "") then {_displayName = _magClass;};
		
		//// ЦЕНА
		{
			private ["_configClass", "_configCost"];
			_configClass = _x select 0;
			_configCost = _x select 1;
			if (_magClass == _configClass) exitWith {
				_cost = _configCost;
			};
		} forEach vmsAmmoCost;		

		if (_cost == 0) then {_cost = vmsdefaultAmmoCost;};
	
		//// СУММА
		_sum = _ammoDiff * _cost;
		_menuItem = format ["%1:  %2 [%3 Poptabs]", _displayName, _ammoDiff, _sum];

		_index = _crtl lbAdd _menuItem;
		_reArmData pushback _action;
		_reArmData pushback _turretPath;
		_reArmData pushback _pylonRun;
		_reArmData pushback _magClass;
		_reArmData pushback _ammoCount;
		_reArmData pushback _ammoDiff;
		_reArmData pushback _totalMags;
		_reArmData pushback _sum;
		_strreArmData = str _reArmData;
		_crtl lbSetData [_index, _strreArmData];
	};

} forEach _currentLoadout;


_vehicleMags = [];
{
	private ["_cost","_turretPath", "_bulletCost", "_maxMag", "_menuItem", "_magClass", "_displayName", "_ammoCount", "_magMaxAmmoCount", "_maxBullets", "_numMagsToLoad", "_currentMags", "_loadedMagCount", "_currentMagToLoad", "_currentMagCost", "_menuItemAndDetails"];
	_turretPath = _x select 0;
	_bulletCost = 0;
	_cost = 0;
	_maxMag = 0;
	_menuItem = [];
	_pylonIndex = _x select 1;
	_magClass = _x select 2;
	_reArmData = [];
	
	//get bullet cost for this turret mag
	{
		if (_magClass == (_x select 0)) then {_bulletCost = _x select 1;};
	} forEach vmsAmmoCost;
	if (_bulletCost == 0) then {_bulletCost = vmsdefaultAmmoCost;};
	
	//get max number of mags for this turret mag
	{
		if (_magClass == (_x select 0)) then {_maxMag = _x select 1;};
	} forEach _weapArray;

	//Set Display name of Mag
	_displayName = getText(configFile >> "CfgMagazines" >> _magClass >> "displayName");
	if (_displayName == "") then {_displayName = _magClass;};
	
	//get ammo and get total max bullets
	_ammoCount = _x select 3;
	_magMaxAmmoCount = getNumber(configFile >> "CfgMagazines" >> _magClass >> "count");
	_maxBullets = _magMaxAmmoCount * _maxMag;
	
	//if less than  max bullets work out how many and how much
	if (_ammoCount < _maxBullets && !(_magClass in vmsAmmoBlackList)) then
	{
		if (["120mm",_magClass] call BIS_fnc_inString || ["125mm",_magClass] call BIS_fnc_inString || ["105mm",_magClass] call BIS_fnc_inString || ["L30A1_Cannon",_magClass] call BIS_fnc_inString || ["2A46",_magClass] call BIS_fnc_inString || ["100mm",_magClass] call BIS_fnc_inString || ["smoke",_magClass] call BIS_fnc_inString) then
		{
			_numMagsToLoad = _maxBullets - _ammoCount;
			_currentMagCost = _numMagsToLoad * _bulletCost;
			_cost = _currentMagCost;
			// systemChat format ["_magClass cost: (%1 - %2) * %3 = %4", _maxBullets, _ammoCount, _bulletCost, _currentMagCost];
		} else
		{
			_currentMags = floor (_ammoCount / _magMaxAmmoCount);
			_numMagsToLoad = _maxMag - _currentMags - 1;
			_totalMagCost = _numMagsToLoad * _bulletCost * _magMaxAmmoCount;
			_loadedMagCount = _ammoCount - (_currentMags * _magMaxAmmoCount);
			_currentMagToLoad = _magMaxAmmoCount - _loadedMagCount;
			_currentMagCost = _currentMagToLoad * _bulletCost;
			_cost = _totalMagCost + _currentMagCost;
		};
		_menuItem = format ["%1 - %2 %3", _displayName, _currentMagCost, vmsCostType];
		_reArmData pushback _action;
		_reArmData pushback _magClass;
		_reArmData pushback _cost;
		_reArmData pushback _turretPath;
		_reArmData pushback _maxBullets;
		_reArmData pushback _pylonIndex;
		_strreArmData = str _reArmData;
		_index = _crtl lbAdd _menuItem;
		_crtl lbSetData [_index, _strreArmData];
		_reloadList pushback _x;
		_totalCost = _totalCost + _cost;
	};
} forEach _vehicleMags;	

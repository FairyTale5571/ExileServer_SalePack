/*
Bones Vehicle Repair Script

Executed from Bones_fnc_salvageAndRepairMenu.sqf

Call as [_action, _vehicle, _items, _price] execVM 'Custom\vehicleService\Bones_fnc_Repair.sqf';

*/
params ["_action", "_actionData"];

_vehicle1 = [];
if (isNull objectParent player) then {_vehicle1 pushback cursorTarget;} else 
{
_vehicleTemp = (objectParent player);
_vehicle1 pushback (nearestObject [player, typeof _vehicleTemp]);
};
_vehicle = (_vehicle1 select 0);


switch (_action) do {
	case "rearmall": {
		private ["_cost"];
		_cost = 0;
		_cost = [_vehicle] call Bones_fnc_getReloadCost;
		_exilew = player getVariable ["ExileMoney", 0];
		if (_exilew <_cost) exitWith {["ErrorTitleOnly", ["You don't have enough money!"]] call ExileClient_gui_toaster_addTemplateToast;};
		
		["Reload.ogg", _Vehicle, 30] call Bones_fnc_playSounds;
		
		_vehicle setVehicleAmmo 1;
		if(_cost > 0 && isTradeEnabled)then
		{
			takegive_poptab = [player,_cost,true];
			publicVariableServer "takegive_poptab";
		};
		[] call Bones_fnc_getReloadable;
		_playerPoptabs = _exilew - _cost;
		_poptabs = (findDisplay 9123 displayCtrl 1001);
		_poptabs ctrlSetText (format ["%1 poptabs", _playerPoptabs]);
		_rearmAll = (findDisplay 9123 displayCtrl 1605);
		_rearmAll ctrlenable false;
		_reloadValueDisplay = 0;
		_reloadCost = (findDisplay 9123 displayCtrl 1006);
		_reloadCost ctrlSetText (format ["%1 poptabs", _reloadValueDisplay]);
		
		["SuccessTitleOnly", format ["Reload of All Turrets Complete, Total Cost was %1 Poptabs", _cost]] call ExileClient_gui_toaster_addTemplateToast;		
	};
	case "repairall": { 
		_cost = [] call Bones_fnc_getRepairableCosts;
		_exilew = player getVariable ["ExileMoney", 0];
		if (_exilew <_cost) exitWith {["ErrorTitleOnly", ["You don't have enough money!"]] call ExileClient_gui_toaster_addTemplateToast;};
		
		["Repair.ogg", _Vehicle, 30] call Bones_fnc_playSounds;

		_vehicle setdamage 0;
		if(_cost > 0 && isTradeEnabled)then
		{
			takegive_poptab = [player,_cost,true];
			publicVariableServer "takegive_poptab";
		};
		[] call Bones_fnc_getRepairable;
		_playerPoptabs = _exilew - _cost;
		_poptabs = (findDisplay 9123 displayCtrl 1001);
		_poptabs ctrlSetText (format ["%1 poptabs", _playerPoptabs]);
		_repairAll = (findDisplay 9123 displayCtrl 1604);
		_repairAll ctrlenable false;
		_repairValueDisplay = 0;
		_repairCost = (findDisplay 9123 displayCtrl 1008);
		_repairCost ctrlSetText (format ["%1 Poptabs", _repairValueDisplay]);
		
		["SuccessTitleOnly", format ["Repair of All Items Complete, Total Cost was %1 Poptabs", _cost]] call ExileClient_gui_toaster_addTemplateToast;		
	};
	case "repair_rearm_opts": { 
	
		_optData = parseSimpleArray _actionData;

		_actionType = _optData select 0;

		switch (_actionType) do {
			case "Reload": {
				_turretPath = _optData select 1;
				_pylonRun = _optData select 2;
				_magClass = _optData select 3;
				_ammoCount = _optData select 4;
				_ammoDiff = _optData select 5;
				_totalMags = _optData select 6;
				_sum = _optData select 7;

				/////// ПРОВЕРКА
				_exilew = player getVariable ["ExileMoney", 0];
				if (_exilew <_sum) exitWith {["ErrorTitleOnly", ["You don't have enough money!"]] call ExileClient_gui_toaster_addTemplateToast;};

				/////// ПЕРЕЗАРЯДКА
				private ["_maxMagAmmo", "_magsAddCount"];
				_maxMagAmmo = (configFile >> "CfgMagazines" >> _magClass >> "count") call BIS_fnc_getCfgData;
				_magsAddCount = floor (_ammoDiff / _maxMagAmmo);

				if (_ammoDiff > 0) then {
					if (_pylonRun > 0) then {
						{
							private ["_infoClass", "_infoPylonIndex"];
							_infoClass = _x select 3;
							_infoPylonIndex = _x select 0;
							if (_infoClass == _magClass) then {
								_vehicle setAmmoOnPylon [_infoPylonIndex, _magMaxAmmoCount];
								// systemChat format ["Mag %1 setAmmoOnPylon %2 by max: %3",_magClass, _infoPylonIndex, _magMaxAmmoCount];
							};
						} forEach _pylonsInfo;
					} else {
						_vehicle removeMagazinesTurret [_magClass, _turretPath];
						for "_i" from 1 to _totalMags do {
							_vehicle addMagazineTurret [_magClass,_turretPath,_maxMagAmmo];
							// systemChat format ["Added magaz %1 to turret %2 | ammo in mag:  %3",_magClass, _turretPath, _maxMagAmmo];
						};
					};
				};

				///////// ОПЛАТА
				if(_sum > 0 && isTradeEnabled) then {
						takegive_poptab = [player,_sum,true];
						publicVariableServer "takegive_poptab";
				};
				[] call Bones_fnc_getReloadable;
				_playerPoptabs = _exilew - _sum;
				_poptabs = (findDisplay 9123 displayCtrl 1001);
				_poptabs ctrlSetText (format ["%1 Пробок", _playerPoptabs]);
				_reloadValueDisplay = [_vehicle] call Bones_fnc_getReloadCost;
				_reloadCost = (findDisplay 9123 displayCtrl 1006);
				_reloadCost ctrlSetText (format ["%1 Пробок", _reloadValueDisplay]);
				if(_reloadValueDisplay == 0) then
				{
					_rearmAll = (findDisplay 9123 displayCtrl 1605);
					_rearmAll ctrlenable false;
				};
				
				["SuccessTitleOnly", format ["Reload of weapon %1 complete, Total Cost was %2 Poptabs", _magClass, _sum]] call ExileClient_gui_toaster_addTemplateToast;
			};
			case "Repair": {
				_items = _optData select 1;
				_price = _optData select 2;

				_exilew = player getVariable ["ExileMoney", 0];
				if (_exilew <_price) exitWith {["ErrorTitleOnly", ["You don't have enough money!"]] call ExileClient_gui_toaster_addTemplateToast;};
				
				["Repair.ogg", _Vehicle, 30] call Bones_fnc_playSounds;
				
				{_vehicle setHitPointDamage [_x, 0]}forEach _items;
				
				if(_price > 0 && isTradeEnabled)then{
						takegive_poptab = [player,_price,true];
						publicVariableServer "takegive_poptab";
				};

				[] call Bones_fnc_getRepairable;
				_playerPoptabs = player getVariable ["ExileMoney", 0];
				_poptabs = (findDisplay 9123 displayCtrl 1001);
				_poptabs ctrlSetText (format ["%1 poptabs", _playerPoptabs]);
				_repairValueDisplay = [] call Bones_fnc_getRepairableCosts;
				_repairCost = (findDisplay 9123 displayCtrl 1008);
				_repairCost ctrlSetText (format ["%1 Poptabs", _repairValueDisplay]);
				if(_repairValueDisplay == 0) then
				{
				_repairAll = (findDisplay 9123 displayCtrl 1604);
				_repairAll ctrlenable false;
				};

				["SuccessTitleOnly", format ["Repair of item complete, Total Cost was %1 Poptabs", _price]] call ExileClient_gui_toaster_addTemplateToast;				
			};
		};
	};
	case "refuel": { 
		_maxFuelAmount = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "fuelCapacity");
		_fuelAmountTemp = fuel _vehicle;
		_fuelAmount = _fuelAmountTemp * _maxFuelAmount;
		_refillFuelAmount = round(_maxFuelAmount - _fuelAmount);
		_refuelCost = _refillFuelAmount * fuelingPrice;
		if (_refuelCost == 0) exitwith {["ErrorTitleOnly", ["You're fuel tank is already full!"]] call ExileClient_gui_toaster_addTemplateToast;};
		_exilew = player getVariable ["ExileMoney", 0];
		if (_exilew <_refuelCost) exitWith {["ErrorTitleOnly", ["You don't have enough money!"]] call ExileClient_gui_toaster_addTemplateToast;};
		_vehicle setFuel 1;
		if(_refuelCost > 0 && isTradeEnabled)then
		{
			takegive_poptab = [player,_refuelCost,true];
			publicVariableServer "takegive_poptab";
		};
		_maxFuelAmount = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "fuelCapacity");
		_fuelAmountTemp = fuel _vehicle;
		_fuelAmount = _fuelAmountTemp * _maxFuelAmount;
		_refillFuelAmount = round(_maxFuelAmount - _fuelAmount);
		_refuelCost2 = _refillFuelAmount * fuelingPrice;
		if (_refuelCost2 == 0 || enableRefuelOption == 0) then 
		{
			_reFuelButton = (findDisplay 9123 displayCtrl 1600);
			_reFuelButton ctrlenable false;
		};
		_refuelDisplay = format["%1 Poptabs", _refuelCost2];
		_reFuelButton = (findDisplay 9123 displayCtrl 1010);
		_reFuelButton ctrlSetText _refuelDisplay;

		_poptabs = (findDisplay 9123 displayCtrl 1001);
		_poptabs ctrlSetText (format ["%1 poptabs", _exilew - _refuelCost]);
		
		["SuccessTitleOnly", format ["Refuelling Complete, Total Cost was %1 Poptabs", _refuelCost]] call ExileClient_gui_toaster_addTemplateToast;
	};
};

true
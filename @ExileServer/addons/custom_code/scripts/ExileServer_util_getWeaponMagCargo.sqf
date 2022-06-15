/**
 * ExileServer_util_getWeaponMagCargo
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 * Fix/tweak by El'Rabito
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_player","_MagazineList","_MagsToSave"];
_player = _this;
_MagazineList = []; 
_MagsToSave = weaponsItemsCargo backpackContainer _player;  
{  
	{ 
		if(_x call BIS_fnc_itemType find "Magazine" isEqualTo 0) then 
		{ 
			_MagazineList pushBack [_x select 0, _x select 1];
		};
	} 
	forEach _x; 
  
} forEach _MagsToSave;
_MagazineList
/**
* Copyright © El Rabito - All Rights Reserved
* Unauthorized usage of this file is strictly prohibited.
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

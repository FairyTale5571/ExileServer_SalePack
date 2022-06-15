/**
 * ExileServer_util_getWeaponAttachementCargo
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_player","_attachmentList","_attachmentsToSave","_attachmentToSaveList"];
_player = _this;
_attachmentList = [];
_attachmentsToSave = weaponsItemsCargo backpackContainer _player; 
{ 
	{
		_type = _x call BIS_fnc_itemType;
		if ((_type find "Item" isEqualTo 0) && (_type select 1) find "Binocular"  isEqualTo -1) then
		{
			_attachmentList pushBack _x;
		};
	}
	forEach _x;
	
} forEach _attachmentsToSave;
_attachmentToSaveList = _attachmentList call BIS_fnc_consolidateArray;
_attachmentToSaveList
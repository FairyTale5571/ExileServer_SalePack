/**
 * File: fn_disableRamming
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
   Return: Nothing
 **/

if (ExilePlayerInSafezone) then
{
	_nearestVehicles = nearestObjects [getPos player, ["LandVehicle","Tank","Air","Ship"], 50];
	if!(_nearestVehicles isEqualto [])then
	{
		{if (alive _x) then {player disableCollisionWith _x;};} forEach _nearestVehicles;
	};
};
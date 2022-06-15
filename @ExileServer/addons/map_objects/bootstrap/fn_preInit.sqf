/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

switch (worldName) do
{
	case "Altis":
	{
		[] execVM '\map_objects\map\Altis\exile_content.sqf';
	};
	case "Malden":
	{
		[] execVM '\map_objects\map\Malden\exile_content.sqf';
	};
	case "Tanoa":
	{
		[] execVM '\map_objects\map\Tanoa\exile_content.sqf';
	};
	case "Namalsk":
	{
		[] execVM '\map_objects\map\Namalsk\exile_content.sqf';
	};
	default {};
};
true

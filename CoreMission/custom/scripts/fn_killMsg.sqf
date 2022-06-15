/*
	KILL MESSAGES
	BY GR8
	Modded for Exile 749
	
*/

KillerNameColor	 = "#5882FA"; // Text Color of the Killer's Name.
VictimNameColor	 = "#C70000"; // Text Color of the Victim's Name.
WeaponNameColor	 = "#FFCC00"; // Text Color of the Weapon's Name. Only Works in Halv's Style
DistanceColor	 = "#FFCC00"; // Text Color of the kill Distance number.

line0=0;line1=0;line2=0;line3=0;line4=0;line5=0;line6=0;line7=0;line8=0;

if (!isDedicated) then {
	"AtlasKillMessages"		addPublicVariableEventHandler {
		private["_lvl","_time"];
		_id = (_this select 1);
		_killerName = _id select 0;
		_pic		= _id select 1;
		_victimName = _id select 2;
		_distance 	= _id select 3;
		_weapon 	= _id select 4;

		_time = diag_tickTime;
		_check = (_time - 20);
		if (line8 > _check) then {
		        line0 = _time; _lvl = 6000; safeOffset = 0;
		        line1 = 0; line2 = 0; line3 = 0; line4 = 0; line5 = 0; line6 = 0; line7 = 0; line8 = 0;
		} else {
		        if (line7 > _check) then {
		                line8 = _time; _lvl = 6008; safeOffset = 0.4;
		        } else {
		                if (line6 > _check) then {
		                        line7 = _time; _lvl = 6007; safeOffset = 0.35;
		                } else {
		                        if (line5 > _check) then {
		                                line6 = _time; _lvl = 6006; safeOffset = 0.3;
		                        } else {
		                                if (line4 > _check) then {
		                                        line5 = _time; _lvl = 6005; safeOffset = 0.25;
		                                } else {
		                                        if (line3 > _check) then {
		                                                line4 = _time; _lvl = 6004; safeOffset = 0.2;
		                                        } else {
		                                                if (line2 > _check) then {
		                                                        line3 = _time; _lvl = 6003; safeOffset = 0.15;
		                                                } else {
		                                                        if (line1 > _check) then {
		                                                                line2 = _time; _lvl = 6002; safeOffset = 0.10;
		                                                        } else {
		                                                                if (line0 > _check) then {
		                                                                        line1 = _time; _lvl = 6001; safeOffset = 0.05;
		                                                                } else {
		                                                                        line0 = _time; _lvl = 6000; safeOffset = 0;
		                                                                };
		                                                        };
		                                                };
		                                        };
		                                };
		                        };
		                };
		        };
		};

		_dyntxt = format["
		<t align='left'size='0.6'color='%5'>%1 </t>
		<img size='0.8'align='left' image='%2'/>
		<t align='left'size='0.6'color='%6'> %3 </t>
		<t align='left'size='0.6'color='%7'>[%4m]</t>
		",
		_killerName,
		_pic,
		_victimName,
		_distance,
		KillerNameColor,
		VictimNameColor,
		DistanceColor
		];
		[_dyntxt,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.01 * safezoneH + safeOffset,0.3],20,0.5,0,_lvl] spawn BIS_fnc_dynamicText;
	};
};
// Made by GR8

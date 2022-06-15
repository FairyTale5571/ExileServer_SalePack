/*--------------------------------------------------------------------
    File: name_tags.sqf
	Project: 749 Exile Servers
	vk.com/ex749
	payPal.me/atlasArma
	qiwi.me/atlasArma
	a3atlasLife@gmail.com
--------------------------------------------------------------------*/

_distance = getNumber (missionConfigFile >> "CfgPvE" >> "distanceEsp");
 
if(getNumber (missionConfigFile >> "CfgPvE" >> "PvE_status") isEqualTo 1) then
{
	if(getNumber (missionConfigFile >> "CfgPvE" >> "cursorTargetESP") isEqualTo 1) then
	{
		waitUntil {!isNull player};

		while{true} do 
		{
			sleep 0.5;
			if((isPlayer cursorTarget) && (alive cursorTarget) && (side cursorTarget == side player) && (player distance cursorTarget < _distance)) then 
			{
				_tag = name cursorTarget;
				cutText [_tag,"PLAIN",0.1];	
				} 
				else 
				{
			};
		};
	};
	if(getNumber (missionConfigFile >> "CfgPvE" >> "freeESP") isEqualTo 1) then
	{
		_distance = getNumber (missionConfigFile >> "CfgPvE" >> "distancefreeESP");
		ExileClientPvEESP = addMissionEventHandler ["Draw3D", {_distance call ExileClient_gui_safezone_safeESP}];
	};
};
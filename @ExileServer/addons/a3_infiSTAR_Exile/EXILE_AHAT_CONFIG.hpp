/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Copyright infiSTAR - 2011 - 2016. All rights reserved.
	Christian (Chris) L. (infiSTAR23@gmail.com) Developer of infiSTAR
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
	
	UPDATEEMAIL for http://update.infiSTAR.de is:
	'support@battleye.com'
	
	Last download was on:
	'04-Dec-2016 14-44-29';
*/
class Cfg_infiSTAR_settings {
/*
	"serverCommandPassword" is serverCommandPassword - in your servers config.cfg
	if your config.cfg does not have serverCommandPassword yet, simply add it in a new line:
	serverCommandPassword = "changeme";
	
	This is   VERY IMPORTANT   as it is needed to KICK & BAN people.
	
	It will try to get this password from "@ExileServer\addons\exile_server_config" first. If you did not set a password there (config.cpp),
	then it will take what you put here.
*/
serverCommandPassword = "RusGo1999";

/*
	"passwordAdmin" is passwordAdmin - in your servers config.cfg, needed for servercommands from client
	
	This is used to be able to use the "login" function ingame. Will log you in as Arma "Admin".
*/
passwordAdmin = "RusGo1999";
/* serverCommandPassword and passwordAdmin should always be different passwords or it could cause problems! */


/* "_OPEN_ADMIN_MENU_KEY": Key to open the menu (google DIK_KeyCodes (0x3B is F1))   */
OPEN_ADMIN_MENU_KEY = 0x3B;
HIDE_FROM_PLAYERS = "false";				/* So no normal can see it :)! */
announce_adminstate_changed = "false";	/* whenever you type !admin as an admin it will announce that you logged out or in to all players on the server! */
use_html_load_on_adminmenu = "false";		/* default and recommended is "true". infiSTAR updates and news are announced in the top right corner when you open the AdminMenu if this is "true"! */



/* "LogAdminActions": Sends actions done by each admin to the server to log it to the .txt file (if infiSTAR dlls are used) and .rpt file + sends it back to all other admins. */
LogAdminActions = "false";
enableIngameLogs = "false";

/* 
	if you set "needAdminNameTag" to "true", this string needs to be a part of the admins name, or he can't use infiSTAR Admin Menu!
	example names: "[Admin] infiSTAR" or "infiSTAR [Admin]"
	note: this is case sensitive as well, meaning "infiSTAR [admin]" would not work as we set it in our example to "[Admin]"
*/
needAdminNameTag = "false";
AdminNameTag = "[Admin]";


/*
	{chatCommand (text typed in chat),text shown to player}
	only triggers if the EXACT text is typed!
*/
chatCommands[] =
{
	{"!website","www.mycommunity.com"},
	{"!admin","please visit ts.mycommunity.com"}
};

/*
	{chatCommand (text typed in chat) partitial,text shown to player}
	"Hello, why is there no loot on this map?" <- will trigger the example below!
*/
chatCommandsP[] =
{
	{"no loot","You cannot loot from non arma buildings in this map, you must move around - check the shipping yards for best loot"}
};



/*
	Noficiations shown to all players on the server. Could be used to replace BEC messages.
	{first occurrence after x min, show again after x min, show message for x seconds, font size (recommended is 0.6), xpos, ypos,text color, font, text (<br/> is a linebreak)}
	
	if you want the client to see a message only once when logging in, you put the first and second entry in the array to -1.
	Example:	
	{-1, -1, 4, 0.6, 0, 0, "#ff0000", "OrbitronLight", "Welcome to our server"}
	
	xpos and ypos need to be within your monitor. to high numbers and you simply won't see the text..
	~ x-range is between -0.7 to +1
	~ y-range is between -0.4 to +1
	
	Arma Fonts:
		PuristaLight
		PuristaMedium
		PuristaSemiBold
		PuristaBold
		LucidaConsoleB
		EtelkaMonospacePro
		EtelkaMonospaceProBold
		EtelkaNarrowMediumPro
		TahomaB

	Exile Fonts:
		OrbitronLight
		OrbitronMedium
		PressStart2P
		RobotoMedium
		RobotoRegular
*/
ENABLE_NOTIFICATION_MESSAGES = "false";
NOTIFY_MSG_ARRAY[] =
{
	{-1, -1, 6, 0.6, 0, 0, "#ff0000", "OrbitronLight", "Welcome to our server"},
	{-1, -1, 4, 0.6, 0, 0, "#1900FF", "OrbitronLight", "Enjoy!"},
	{-1, 45, 5, 0.6, "safeZoneX", "0.5", "#048B5B", "OrbitronLight", "Protected and administrated by<br/>infiSTAR.de AdminTools, AntiHack and more!"},
	{15, 15, 8, 0.6, 0, 0, "#E600E6", "OrbitronLight", "15 minutes have passed, drink some water!<br/>(IN REAL LIFE NOT INGAME)"}
};


/*
	If admin has rights to "Create Billboard", he will have new options to create a Billboard ingame with one of the following textures
	{"name shown in adminmenu","path to texture"}
	
	should be looking somewhat like this:
	{"example picture","\mpmissions\Exile.Altis.pbo\example.paa"}
	
	the picture has to be available on EACH client AND the server.
	So you either need a client-side mod for it or you need to put it in the MPMission
*/
pathToCustomBillBoardTextures[] =
{
	{"Doggy","exile_assets\texture\flag\flag_mate_21dmd_co.paa"},
	{"Spawny","exile_assets\texture\flag\flag_mate_spawny_co.paa"},
	{"Dickbutt","exile_assets\texture\flag\flag_misc_dickbutt_co.paa"},
	{"Vish","exile_assets\texture\flag\flag_mate_vish_co.paa"}
};


/* "startAsNormal": if you add admin UIDs in here as well, they will start as almost "normal" player instead of with admin menu and such. */
startAsNormal[] =
{
	"UID1","UID2","UID3","..."
};

/* "hiddenSuperAdmin": These admins are seen as normal players by normal admins, their actions are not logged either (to keep an eye out on your admins) */
hiddenSuperAdmin[] =
{
	"UID1","UID2","UID3","..."
};

adminUIDandAccess[] =
{
{								/* Alexis */
		{"76561198357168353","76561198055124016"},	
		{
			"Teleport On Map Click","Teleport - Target To Me","Teleport - Me To Target",
			"Teleport In Facing Direction (10m steps)","Drag and drop units on the map",
			"spectating","Delete Vehicle","FlyUp","ShowGear","Show Server Information",
			"HealSelf","HealRepairNear","AdminLog","Freeze","UnFreeze","Restrain","UnRestrain",
			"==== Loadouts ====","==== Base Deleter ====","==== WeatherLord ====","Items spawn menu",
			"Remove Gear","Heal","Restore","Flip Vehicle","Move In My Vehicle","Move In Target Vehicle","Eject","Eject Crew",
			"Player ESP","Player ESP (safezone style)","AI ESP","Dead ESP","Loot ESP",
			"Vehicle Marker","Flag Marker (with radius)","DeadPlayer Marker",
			"God Mode","God Mode (no stats change)","Vehicle God Mode","Lower Terrain","Vehboost","UnlimAmmo","noRecoil","FastFire","Stealth / Invisible",
			"Disable Announces","Mass Message","Change Time","Spawn Support-Boxes","Create Billboard","Change ViewDistance",
			"Spawn Ammo","Login as Arma Admin","BIS FreeRoam Cam (works with ESP)","FreeRoam Cam (does not work with ESP)",
			"Request Steam Name","showinfo",
			"UnlockLockVehicle","Copy Worldspace(coords) to RPT & Chat",
			
			"Spawn Vehicles","Spawn Persistent Vehicles",
			
			"Kill","Explode","Force Disconnect",
			"Kick (Silent)","Kick (Announce)","Ban (Silent)","Ban (Announce)","TempBan (Silent)","TempBan (Announce)",
			
			"AdminConsole",
			"DebugConsole",
			"Execute code on server (DebugConsole)","Execute code global (DebugConsole)","Execute code local (DebugConsole)",
			"Lock Server (DebugConsole)","UnLock Server (DebugConsole)","Ban (DebugConsole)","Kick (DebugConsole)",
			
			"Change Money on Player","Change Money on Bank","Change Respect",
			
			"MapIcons",
			"MapIcons: Buildings","MapIcons: Flags",
			"MapIcons: Player","MapIcons: DeadPlayer","MapIcons: Vehicles",
			"MapIcons: Vehicle Types","MapIcons: Vehicle lockstate","MapIcons: DeadVehicles",
			"MapIcons: AI",
			"Arsenal",	// Adds Arsenal to the mousewheel actions if you press "," on the Numpad!
			"Unconscious","Remove Unconscious",
			"Light",	// Zeus like Lighting from the Air strikes down at selected player / target / location - use ctrl+1 or the menu to use it!
			
			"Spawn Zombie on Target Location!",	// This only works when you are using ExilZ / RyanZombies
			
			""
		}
	},
	{
		{"UID1","UID2","UID3","..."},	/* Admins with UIDs in this Array have their Access defined in the array below. */
		{
			"Teleport On Map Click","Teleport - Target To Me","Teleport - Me To Target",
			"Teleport In Facing Direction (10m steps)","Drag and drop units on the map",
			"spectating","Delete Vehicle","FlyUp","ShowGear","Show Server Information",
			"HealSelf","HealRepairNear","AdminLog","Freeze","UnFreeze","Restrain","UnRestrain",
			"==== Loadouts ====","==== Base Deleter ====","==== WeatherLord ====","Items spawn menu",
			"Remove Gear","Heal","Restore","Flip Vehicle","Move In My Vehicle","Move In Target Vehicle","Eject","Eject Crew",
			"Player ESP","Player ESP (safezone style)","AI ESP","Dead ESP","Loot ESP",
			"Vehicle Marker","Flag Marker (with radius)","DeadPlayer Marker",
			"God Mode","God Mode (no stats change)","Vehicle God Mode","Lower Terrain","Vehboost","UnlimAmmo","noRecoil","FastFire","Stealth / Invisible",
			"Disable Announces","Mass Message","Change Time","Spawn Support-Boxes","Create Billboard","Change ViewDistance",
			"Spawn Ammo","Login as Arma Admin","BIS FreeRoam Cam (works with ESP)","FreeRoam Cam (does not work with ESP)",
			"Request Steam Name","showinfo",
			"UnlockLockVehicle","Copy Worldspace(coords) to RPT & Chat",
			
			"Spawn Vehicles","Spawn Persistent Vehicles",
			
			"Kill","Explode","Force Disconnect",
			"Kick (Silent)","Kick (Announce)","Ban (Silent)","Ban (Announce)","TempBan (Silent)","TempBan (Announce)",
			
			"AdminConsole",
			"DebugConsole",
			"Execute code on server (DebugConsole)","Execute code global (DebugConsole)","Execute code local (DebugConsole)",
			"Lock Server (DebugConsole)","UnLock Server (DebugConsole)","Ban (DebugConsole)","Kick (DebugConsole)",
			
			"Change Money on Player","Change Money on Bank","Change Respect",
			
			"MapIcons",
			"MapIcons: Buildings","MapIcons: Flags",
			"MapIcons: Player","MapIcons: DeadPlayer","MapIcons: Vehicles",
			"MapIcons: Vehicle Types","MapIcons: Vehicle lockstate","MapIcons: DeadVehicles",
			"MapIcons: AI",
			"Arsenal",	// Adds Arsenal to the mousewheel actions if you press "," on the Numpad!
			"Unconscious","Remove Unconscious",
			"Light",	// Zeus like Lighting from the Air strikes down at selected player / target / location - use ctrl+1 or the menu to use it!
			
			"Spawn Zombie on Target Location!",	// This only works when you are using ExilZ / RyanZombies
			
			""
		}
	},
	{
		{"UID1","UID2","UID3","..."},	/* Admins with UIDs in this Array have their Access defined in the array below. */
		{
			"Teleport On Map Click","Teleport - Target To Me","Teleport - Me To Target",
			"Teleport In Facing Direction (10m steps)","Drag and drop units on the map",
			"spectating","Delete Vehicle","FlyUp","ShowGear","Show Server Information",
			"HealSelf","HealRepairNear","AdminLog","Freeze","UnFreeze","Restrain","UnRestrain",
			"==== Loadouts ====","==== Base Deleter ====","==== WeatherLord ====","Items spawn menu",
			"Remove Gear","Heal","Restore","Flip Vehicle","Move In My Vehicle","Move In Target Vehicle","Eject","Eject Crew",
			"Player ESP","Player ESP (safezone style)","AI ESP","Dead ESP","Loot ESP",
			"Vehicle Marker","Flag Marker (with radius)","DeadPlayer Marker",
			"God Mode","God Mode (no stats change)","Vehicle God Mode","Lower Terrain","Vehboost","UnlimAmmo","noRecoil","FastFire","Stealth / Invisible",
			"Disable Announces","Mass Message","Change Time","Spawn Support-Boxes","Create Billboard","Change ViewDistance",
			"Spawn Ammo","Login as Arma Admin","BIS FreeRoam Cam (works with ESP)","FreeRoam Cam (does not work with ESP)",
			"Request Steam Name","showinfo",
			"UnlockLockVehicle","Copy Worldspace(coords) to RPT & Chat",
			
			"Spawn Vehicles","Spawn Persistent Vehicles",
			
			"Kill","Explode","Force Disconnect",
			"Kick (Silent)","Kick (Announce)","Ban (Silent)","Ban (Announce)","TempBan (Silent)","TempBan (Announce)",
			
			"AdminConsole",
			"DebugConsole",
			"Execute code on server (DebugConsole)","Execute code global (DebugConsole)","Execute code local (DebugConsole)",
			"Lock Server (DebugConsole)","UnLock Server (DebugConsole)","Ban (DebugConsole)","Kick (DebugConsole)",
			
			"Change Money on Player","Change Money on Bank","Change Respect",
			
			"MapIcons",
			"MapIcons: Buildings","MapIcons: Flags",
			"MapIcons: Player","MapIcons: DeadPlayer","MapIcons: Vehicles",
			"MapIcons: Vehicle Types","MapIcons: Vehicle lockstate","MapIcons: DeadVehicles",
			"MapIcons: AI",
			"Arsenal",	// Adds Arsenal to the mousewheel actions if you press "," on the Numpad!
			"Unconscious","Remove Unconscious",
			"Light",	// Zeus like Lighting from the Air strikes down at selected player / target / location - use ctrl+1 or the menu to use it!
			
			"Spawn Zombie on Target Location!",	// This only works when you are using ExilZ / RyanZombies
			
			""
		}
	}
};



/****************************************************************************************************/
/********************OPTIONS BELOW REQUIRE CHANGES TO YOUR EXILE SERVER DATABASE!********************/
/****************************************************************************************************/
/*
	Use Database WhiteList?
	if "USE_DATABASE_WHITELIST = "true";", UIDs that are not whitelisted in your exile server database, will be kicked on connect.
	
	To use this, you need to use what I've added to "infiSTAR.de_Exile\SERVER_ARMA3_FOLDER\db_related_changes"
*/
USE_DATABASE_WHITELIST = "false";

/*
	Use Log to database?
	if "USE_LOG_TO_DATABASE = "true";", infiSTAR will log to your exile server database! (yes I know this is great!)
	
	To use this, you need to use what I've added to "infiSTAR.de_Exile\SERVER_ARMA3_FOLDER\db_related_changes"
*/
USE_LOG_TO_DATABASE = "false";
/****************************************************************************************************/
/********************OPTIONS ABOVE REQUIRE CHANGES TO YOUR EXILE SERVER DATABASE!********************/
/****************************************************************************************************/
/*
	ARMA_LOG.dll SETTINGS
	LOG_PATH = ""; is the Arma3Server directory
	LOG_PATH = "infiSTAR_Logs/"; would be a folder called "infiSTAR_Logs" within your Arma3Server directory.
	You need to create the defined folder if it doesn't exist. If you don't create it - the DLL won't be able to write any Log files ! ! !
*/
LOG_PATH = "";
WRITE_LOG_FILES = "false";


/*
	What is this?
	infiSTAR has a global blacklist so hackers don't jump around servers and learn how to bypass infiSTAR.
	There was a situation where a group of people asked why their friend could not join the server.
	Well he was globally banned for hacking.. anyways - if you as a server admin want him to get in even tho he is globally banned,
	just ask for his UID and add the UID in the array below.
*/
UID_SKIPBLACKLIST[] =
{
	"UID1","UID2","UID3","..."
};








/*
	Use UID WhiteList?
	if "USE_UID_WHITELIST = "true";", UIDs that are not in "UID_WHITELIST" array, will be kicked on connect.
	This even counts for Admins!
*/
USE_UID_WHITELIST = "false";
UID_WHITELIST[] =
{
	"UID1","UID2","UID3","..."
};

ExileDevFriendlyMode = "true";	/* adds Exile Devs to your AdminList - makes it easier for them to debug their mod live */


/* What ESCAPE Menu shows */
ESCMNUTOP = "AntiHack & AdminTools";
ESCMNUBOT = "by infiSTAR.de";
BRIEFING_MSG = "false";	/* use mission briefing message: if   "BRIEFING_MSG = "false";"   then the message will be replaced by infiSTAR */
HTML_LOAD_URL = "";		/* HTML_LOAD_URL = ""; == disabled and if you set a url it will be shown in ESCAPE menu. HTML in Arma/this is limited. Try it :) example: "http://goo.gl/gb0o7b" */
ENABLE_PRIVATE_CHAT_MENU = "true";		/* players can open it by typing !chat in chat or by  custom controls -> "Use Action 3" */
PRIVATE_CHAT_MENU_8GNETWORK = "false";	/* if this is "true" - players will only be able to use private chat if they enable 8GNetwork in their xm8 */




/* show time left to next restart */
USE_RESTART_TIMER = "false";

USE_RESTART_TIMES_ARRAY = "false";
/* if USE_RESTART_TIMES_ARRAY = "true"; -> {hour,minute} .. put in the times when your server restarts (server real world time) */
RESTART_TIMES[] =
{
	{00,00},
	{02,00},
	{04,10},
	{06,00},
	{08,00},
	{10,00},
	{12,00},
	{14,00},
	{16,00},
	{18,00},
	{20,00},
	{22,00},
	{09,34}
};

/* if USE_RESTART_TIMES_ARRAY = "false"; -> restart time in minutes (default: 180min == 3 hours) */
RESTART_TIME_IN_M = 180;
TIME_FUNCTION_USED = "diag_tickTime";	// diag_tickTime (starts with arma3server.exe), time (starts with mpmission init)

/* show restart announcement message x min before restart -> SERVER RESTART IN: X MINS  |  (calculated from RESTART_TIMES[])*/
RESTART_ANNOUNCE_X_MIN[] = {1,2,3,5,8,10};

/* SERVER_END_FUNCTION -> #shutdown or #restartserver */
SERVER_END_FUNCTION = "#shutdown";
USE_RESTART_TIMER_SHUTDOWN = "false";
RESTART_WARNING_SOUND = "Alarm";	// for example: Alarm or air_raid







/* Allow Player to vote Day/Night by typing vote day / vote night in Chat*/
DayNightVote = "true";
MRV = 0.3;	/* if "DayNightVote = "true";" - Minimum votes required. Percentage of players needed to pass the vote. */
MVP = 0.51;	/* if "DayNightVote = "true";" - Minimum vote percentage. A setting that dictates the minimum vote percentage that needs to be reached for the vote to pass. */
VCT = 300;	/* if "DayNightVote = "true";" - Time (in seconds) to wait until nex vote is possible. */




/* Allow players to type !pee to start peeing */
allowPee = "true";

/* Enable jumping instead of GetOver function (infiSTAR jumping is a custom jump animation :P) */
enableJump = "true";



/*
	The following 4 options can be disabled by putting the value to -1. For example "TGV = -1;"
	
	TGV: if set to 50 grass will be very low for better client FPS.. default is 25. ~35 is good performance and grass :)
	
	old infiSTAR default values were:
	TGV = 40;	
	VDV = 1000;
	VOV = 800;
	SVD = 50;
*/
/* Terrain Grid Value   */ TGV = 45;	
/* ViewDistance Value   */ VDV = 1600;
/* ObjectViewDistance   */ VOV = 1400;
/* ShadowViewDistance   */ SVD = 15;

/****************************************************************************************************/
/***************************FIXES DUE TO ARMA BEING BROKEN - BELOW***********************************/
/****************************************************************************************************/
/*
	*readded new old uniform and vest check since some people asked for it.
	http://www.exilemod.com/topic/14179-miss-uniform_and_vest_check/
	the game is still broken and sometimes you can see people naked when they are not.
	I did not add the old check back in, I made a new one making use of new functions :)
*/
fix_uniform_and_vest = "false";


/*
	So far only checking for duped backpacks and not taking any actions besides logging. Need to test more before It will start to remove duped items.
*/
experimental_dupe_check = "false";


/*
	re-assigning "InventoryOpened" eventhandler to stop glitch open a locked safe
*/
stopSafeGlitchAndCorpseDupe = "false";


/*
	checks if player tries to dupe using the "disconnect trick" -> sends a ping to the server whenever a player opens the escape menu
*/
disconnect_dupe_check = "false";




/*
	if a player is near a flag where he has no buildrights, he can't vault/getover/lean close to buildingparts (to prevent glitching!)
*/
block_glitch_actions = "false";


/*
	checks if a players tries to glitch through a wall (if player is allowed to build in that territory, it will not be logged.)
*/
wall_glitch_object = "false";
/*
	If a player model intersects with a wall, the player will be teleport back to where he was before he intersected with it..

extra punishments possible:
	0 - no punishment
	1 - knockout for 60 seconds
	2 - kill

	hardcore punishments
	3 - handcuff
	4 - kick
	5 - ban (not recommended)
*/
wall_glitch_punish = 0;



/*
	stops players from glitching into bases using "eject" or "getout" of a vehicle..
*/
wall_glitch_vehicle = "false";
/****************************************************************************************************/
/***************************FIXES DUE TO ARMA BEING BROKEN - ABOVE***********************************/
/****************************************************************************************************/
/* ********************************************************************************* */
/*            many checks should be set to "true" instead of "false".                    */
/* ********************************************************************************* */
LVC = "true";			/* Local Vehicle Check - ALWAYS HAVE THIS "true"! */
URC = "false";			/* Check unitRecoilCoefficient and reset default unitRecoilCoefficient */
CAP = "false";		/* Check Actions Plr - "Actions: xxx/xxx possible scroll menu hack (or you added custom actions..)" */
KCM = "false";			/* Just close ALL CommandingMenus */
CMC = "false";		/* Check for CommandingMenus that are not in the allowedCommandingMenus array */
allowedCommandingMenus[] = {"#user:example","#user:example2"};


task_force_radio = "false";			/* put this to "true" if you allow task force radio on your server! */
checkFilePatchingEnabled = "false";	/* checks if filepatching is enabled on the client (if it is, the client could inject any script based hack easily) */
check_Notifications = "false";		/* checks if BIS_fnc_showNotification was used, as it is used with many hacks - some custom addons however use them too. */
check_doors_n_gates = "false";			/* Fixes Hatches (so when they are locked, they stay closed..) and closes every door that's locked + keeps closing it in case somebody tries to hack open it! */
checkHiddenObjects = "false";			/* checks if there is hidden objects close to the player (hidden objects could be walked through..) */
attach_to_check = "false";				/* logs and detaches attached vehicles that are close.. basically completely disallow attaching of vehicles! */
slingload_check = "false";				/* forbid sling loading / rope attaching a vehicle with a crew */


checkPopTabIncrease = "false";
LogPopTabIncrease = 15000;			/* Only if checkPopTabIncrease = "true"; logs if poptabs increased by x within ~50 seconds */

checkRespectIncrease = "false";
LogRespectIncrease = 5000;			/* Only if checkRespectIncrease = "true"; logs if respect increased by x within ~50 seconds */



/* Check for Map Menu & Map Sub-Menu */
CMM = "false";
maxMapMenuEntries = 6;	/* "Map Menu has been changed x entries found - Texts: y" incase you want to add some briefing to your map menu. Only matters if you have CMM = "true"; */

/* if steam api.steampowered.com is working, this might be a nice feature */
check_steam_ban = "false";	/* will announce and log steambanned players - using GetPlayerBans v1 */
ban_for_steam_ban = "false";	/* if "check_steam_ban = "true";" then steambanned players will get banned from your Arma server! */


/*
	if you have any addon/mod that modifies any of the named handlers below, you need to put that one to  "true"
	most mods don't do that - so keep it "false".
*/
useCustomFiredEventHandler = "false";
useCustomHandeDamageHandler = "false";


/*
	This set to "true" will create a log of players being hit on your server
*/
MPH = "false";


/*
	This will check from serverside if a playerobject received damage but did not take it
*/
GodModeCheck = "false";



/*
	Anti Teleport
	UAT = "false"; To disable Anti Teleport
	Arrays below show position & radius where Teleporting is allowed.
	Mainly for the Traders (because when you purchase a vehicle, it teleports you into the vehicle)
	
	You can white-list "Teleport Zones" by adding them like below:
	class allowTP {
		custom[] = {
			{{0,0,0},1},
			{{1,1,1},1},
			{{2,2,2},1}
		};
	};
	Trading zones are white-listed by default.
*/
UAT = "false";	
class allowTP {
	custom[] = {};
};



/*  Check Drawing on the Map (global channel) */
CHECK_DRAWING = "true";	/* logs & deletes global drawing */


/*  Check Global Markers */
CGM = "false";	/* you may need to disable this check for A.I. Missions - or whitelist the used Markers in the aLocalM Array beneath */

/*  Check Local Markers  */
CLM = "false";	/* "false" if you do not want LocalMarker to be checked. */

/*  Use aLocalM array    */
UMW = "false";	/* use allowed marker array from below (for example AltisLife uses house_ and others in there) or A.I. Missions */
/* aLocalM: if "CLM" && UMW - this array of names will be allowed */
aLocalM[] = {"MissionMarker"};


/*
	Not allowed Chat words on server.
	Example:
		badkickChat[] = {"blue"}; or badbanChat[] = {"blue"};
	will log and kick or ban if somebody writes "blue goat" or "blues" in the chat (not case sensitive).
*/
badkickChat[] = {};
badbanChat[] = {};


/* Not allowed Names on server. Example: badNamesFull[] = {"THE"}; would kick all players that are named "THE", it would NOT kick players named "THE CAR" (not case sensitive) */
badNamesFull[] = {"grim"};

/* Not allowed Names on server. Example: badNamesPartial[] = {"THE"}; would kick all players with names like "the car" as it includes "THE" (not case sensitive) */
badNamesPartial[] = {"admin","thirtysix","adolf","le hippo"};


/* Not allowed Group Names on server. Example: badGroupNames[] = {"THE"}; would rename all groups with names like "the car" as it includes "THE" (not case sensitive) */
badGroupNames[] = {"admin"};



/*
	if somebody talks on one of the following channels, his channel will be switched to "direct" channel
	0 = Global
	1 = Side
	2 = Command
	3 = Group
	4 = Vehicle
	5 = Direct <-- this is where people get switched too if they talk in one of the blacklisted channels!
	6-15 = Custom Radio (see radioChannelCreate)
*/
disAllowVon[] = {1,2};


/*
	This will check the buttoncode on most buttons.. if there is something that needs to be white-listed. Let me know!
*/
use_suspicious_button_check = "false";

/* badIDDsToKick will be checked before badIDDsToClose, badIDDsToClose will be checked before allowedIDDs */
/* badIDDsToKick: Forbidden Idds that will get you Kicked by the AH */
badIDDsToKick[] =
{
	-1338,-1337,-1341,17,19,30,32,45,56,59,62,64,69,71,110,125,132,133,155,156,165,166,167,312,
	1320,1321,1340,1341,1342,1343,1344,1345,1346,1347,
	2727,2928,2929,3030,316000,9899,0110
};

/* badIDDsToClose: Forbidden Idds that will get closed by the AH */
badIDDsToClose[] =
{
	-1,2,3,7,17,19,25,26,27,28,29,30,31,32,37,40,41,43,44,45,51,52,53,56,74,85,
	106,126,127,132,146,147,150,151,152,153,154,155,159,162,164,262,
	314,632,1320,2121,148,163,129,169,157,69,156,165,166,167,312,1321,2727,
	-1341,1341
};

/* Use IDD White-List ? */ UDW = "false";
/* allowedIDDs: Insert IDDs here to prevent them from being closed! */
allowedIDDs[] =
{
	/* default idds */
	-1,0,4,5,6,8,12,18,24,49,54,55,70,101,160,174,177,999,131,63,602,301,

	/* exile idds */
	24001,24002,20023,24005,24004,24010,24025,20021,20017,24012,24027,
	20019,20016,24007,20024,20018,24008,24011,24015,24000,24006,24014,
	20020,24026,

	24033,24030,24029,24028,24031,24034,

	4004,21000,	// Bounty system and MarXet
	8457,	// http://www.exilemod.com/topic/9040-xm8-apps/
	65431,	// r3f menu fix
	6666,	// Paintshop
	0711,	// Advanced Banking
	0720,	// Virtual Garage
	5501,5502,5503,5504,5505,5506,5507,	// BRAma Cookbook
	-1339,-1340,	// custom infiSTAR dialogs (some editor & a private chat menu)

	/* main idd - never delete it */
	46
};



/*
	important check to make sure certain variables are set and have the correct type!
*/
variableTypeChecks[] =
{
	{'ExileIsPlayingRussianRoulette',"false"},
	{'ExileClientIsHandcuffed',"false"},
	{'ExilePlayerInSafezone',"false"},
	{'ExileClientIsAutoRunning',"false"},
	{'ExileCurrentBreachingObject',objNull},
	{'ExileClientInteractionObject',objNull},
	{'HTML_LOAD_URL3',''},
	{'infiSTAR_lastJumptime',0},
	{'PLAYER_IN_VEHICLE',"false"}
};


/*
	it is highly recommended to have this check turned on (useBlacklistedVariableCheck = "true";)
	shows "BadVariable in xxxxxxxx " in the logs.
*/
useBlacklistedVariableCheck = "false";
blacklistedVariables[] =
{
	"BIS_DEBUG_CAM",
	"arsenalOpened","BIS_fnc_arsenal_fullArsenal","babecore_escM_mousepos",
	"BIS_fnc_dbg_reminder_value","BIS_fnc_dbg_reminder","BIS_MENU_GroupCommunication","BIS_fnc_addCommMenuItem_menu",
	"rscspectator","rscspectator_hints","rscspectator_display","rscspectator_playericon",
	"rscspectator_view","rscspectator_map","rscspectator_vision","rscspectator_keys",
	"rscspectator_interface","bis_fnc_camera_target","andy_loopz","InitFileOne","finiE_S_P",
	"time","serverTime","myplayeruid","hhahaaaaar","CharlieSheenkeybinds","KickOFF","yolo","runonce","notakeybind","action1","Supa_Licenses","autokick","wallaisseikun","MainMenu",
	"GEFClose","GEFWhite","GEFRed","GEFGreen","GEFCyan","FirstHint","new_queued","fn_Exec","FND_fnc_select","fnx3","ANTIHACKKICK","tele","dmap","GOLDENS_GLOBAL_SHIT_YEAH","GLASS911_Run",
	"gearDialog_create","lystoKeypress","ThirtySix","LY_SwaggerLikeUs","Jkeyszz","n2","boxofmagic","MainScripts","DMC_fnc_4danews","INFISTARBYPASS","EXEC_TEXT","vehicle_dblclick","init_main",
	"ESP_Count","Nute_Dat_Bomber","s_cash100k","XposPlayer","ly_re_onetime","SKAR_checkA","MainScriptsV4","ViewDistance","check_load","already_load","meins","f1","Dummy","Plane_Jump",
	"c_player","MouseClickEH","distp","nec2","Menu_I_Run_Color_LP","GLASSv1nce_BindHandler","thecar","FastAnimes","GetinPassenger","iaimon","DMC_Re_onetime","func_execOnServer","fnc_serverKickNice",
	"Kick_Admins","DASMOKEON","hovering","r_kelly_be_flying","VinceLOL_ALTISLIFE","life_fnc_byassSkaroAH","AH_fnc_MP","jayRE","fn_newsbanner","Hack_News","TrollFuncs",
	"Fanatic_InfiPass","keybindings_xxx","AndysClosed","UserFuncs","AltisFuncs","RemExe","BB_nofatigue","bis_fnc_diagkey_var_code","First_PAGE","Get_in_D","i_t_s__m_e_o","smissles","Whippy_ESP",
	"TargetFuncs2","life_fnc_antiFreeeeze","LY_keyForward","TY_re_onetime","life_fnc_XaAxAA","mein1","GodDamnVehiclesXD","Mystic_FNC_ESP_distance","Esp_Id_setter","DummyMen","whipbut","UserFuncs",
	"KrohdoFreedom","selectedPlayer","Lmenu1","ggplayer","throx_menu_item","lvl1","Init_Menu_Slew","D_B_R_T_Y_Slew","V6_GEF","xasfjisisafudmmyx","kekse","UPDATED_RE_36","first","second",
	"SNI_PRZ_ZZZ_TargetPlayer","healit","O_fnc_ArmA","MLRN_EXEC","running_threads","catchemall123","killtarget","GMToggle","t1","FUCK_ME_keyp","CheatCurator"
};

/*
	due to new hacking methods it is necessary to check variables on objects.. 
	since most server have 50.000+ objects this can cost a lot client fps but it should still be used.. for the greater good!
*/
useObjectVariableCheck = "false";



UVC_adminspawn = "true";	/* use vehicle check(s) on vehicles spawned by infiSTAR.de admin? */
/*
	Use vehicle white list? (everything not on white-list will be flagged as BadVehicle and deleted!)
	"EXILE" vehicles are white-listed by default!
*/
VehicleWhiteList_check = "false";
VehicleWhiteList[] =
{
	"B_Parachute","B_Parachute_02_F","O_Parachute_02_F","Steerable_Parachute_F",
	"I_UAV_01_F","B_HMG_01_high_F","O_HMG_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","O_MRAP_02_gmg_F","O_static_AT_F","Land_Camping_Light_F"
};

/*
	Use forbidden vehicle check? (everything in the ForbiddenVehicles will be flagged as BadVehicle and deleted (even when it is on the white-list)!)
*/
ForbiddenVehicles_check = "false";
ForbiddenVehicles[] =
{
	"B_MBT_01_arty_F"
};

/*
	If you use VehicleWhiteList_check or ForbiddenVehicles_check then the vehicle check automatically checks for locally created vehicles.
	Locally created vehicles are these that get created by a player and not the server. E.g. when a player assambles a UAV or a static weapon!
	Also some public posted scripts for example the "bike script" are creating the vehicle (the bike) locally (so the type of the vehicle needs to get added to the array below!).
*/
LocalWhitelist[] =
{
	"O_HMG_01_weapon_F","O_HMG_01_F","O_HMG_01_support_F","I_UavTerminal","I_UAV_01_backpack_F",
	"Exile_Bike_OldBike","B_HMG_01_F","B_HMG_01_high_F","O_HMG_01_high_F","Exile_Bike_QuadBike_Fia"
};




UFI = "false";	/* Use "ForbiddenItems"/Item Check(s) */
UIW = "false";	/* if "UIW = "true";" then it checks if the items the individual player has are in "ItemWhiteList" */
ItemWhiteList[] =
{
	"AllowThisItem1","AllowThisItem2"
};
ForbiddenItems[] =
{
	"autocannon_Base_F","autocannon_30mm","autocannon_35mm","autocannon_40mm_CTWS","autocannon_30mm_CTWS","Bomb_04_Plane_CAS_01_F",
	"Bomb_03_Plane_CAS_02_F","cannon_105mm","cannon_120mm","cannon_120mm_long","cannon_125mm","Cannon_30mm_Plane_CAS_02_F","gatling_20mm",
	"gatling_25mm","gatling_30mm","Gatling_30mm_Plane_CAS_01_F","GBU12BombLauncher","GMG_20mm","GMG_40mm","GMG_UGV_40mm","HMG_127_MBT",
	"HMG_127","HMG_127_APC","HMG_01","HMG_M2","HMG_NSVT","LMG_Minigun2","LMG_RCWS","LMG_M200","LMG_Minigun","LMG_Minigun_heli","LMG_coax",
	"Missile_AGM_02_Plane_CAS_01_F","Missile_AA_04_Plane_CAS_01_F","Missile_AA_03_Plane_CAS_02_F","Missile_AGM_01_Plane_CAS_02_F","missiles_DAGR",
	"missiles_DAR","missiles_ASRAAM","missiles_SCALPEL","missiles_titan","missiles_titan_static","missiles_Zephyr","Mk82BombLauncher","mortar_82mm",
	"mortar_155mm_AMOS","rockets_Skyfire","rockets_230mm_GAT","Rocket_04_HE_Plane_CAS_01_F","Rocket_04_AP_Plane_CAS_01_F","Rocket_03_HE_Plane_CAS_02_F",
	"Rocket_03_AP_Plane_CAS_02_F","Twin_Cannon_20mm"
};



/*
	custom Box content:
	just an item like it is in the example with   "ItemMap"   will put the item once in the box.
	if an array is used like the   {"ItemGPS",5}   example, well I assume you could guess what it will do.
	
	You can just define as many as you want.
	{
		"BOX NAME",	// function name in the admin menu
		{
			"Item1","Item2",	// one per just item in a string
			{"Item1",5},{"Item2",10}	// second entry in each array defiens how many of items of the first entry are wanted.
		}
	}
	
	The last closing bracket in an array can not have a "," afterwards. So make sure to have no syntax errors here.
*/
allSupportBoxes[] =
{
	{
		"Support-Box1",
		{
			"Exile_Item_CookingPot","Exile_Item_PlasticBottleFreshWater","Exile_Item_ThermalScannerPro",
			"Exile_Item_Laptop","Exile_Item_CampFireKit","Exile_Item_CanOpener","Exile_Item_CordlessScrewdriver",
			"Exile_Item_FireExtinguisher","Exile_Item_Foolbox","Exile_Item_Grinder","Exile_Item_Hammer",
			"Exile_Item_Handsaw","Exile_Item_OilCanister","Exile_Item_Pliers","Exile_Item_SleepingMat",
			"Exile_Item_Shovel","Exile_Item_Screwdriver","Exile_Item_Wrench","Exile_Item_WorkBenchKit","Exile_Melee_Axe",
			{"Exile_Item_MetalScrews",10},{"Exile_Item_MetalWire",5},
			{"Exile_Item_Codelock",5},{"Exile_Item_DuctTape",5},{"Exile_Item_InstaDoc",6},{"Exile_Item_Vishpirin",15},
			{"Exile_Item_ExtensionCord",5},{"Exile_Item_FloodLightKit",5},
			{"Exile_Item_FuelCanisterFull",5},{"Exile_Item_GloriousKnakworst_Cooked",5},
			{"Exile_Item_LightBulb",5},{"Exile_Item_Matches",5},{"Exile_Item_MetalBoard",30},
			{"Exile_Item_MetalPole",30},{"Exile_Item_PortableGeneratorKit",3},
			{"Exile_Item_Rope",3},{"Exile_Item_SafeKit",5},{"Exile_Magazine_Battery",5}
		}
	},
	{
		"Support-Box2",
		{
			"Exile_Item_Flag","Exile_Item_WorkBenchKit",
			{"Exile_Item_FortificationUpgrade",40},
			{"Exile_Item_WoodDoorKit",10},{"Exile_Item_WoodDoorwayKit",5},{"Exile_Item_WoodDrawBridgeKit",15},
			{"Exile_Item_WoodFloorKit",40},{"Exile_Item_WoodFloorPortKit",15},{"Exile_Item_WoodGateKit",5},
			{"Exile_Item_WoodLog",35},{"Exile_Item_WoodPlank",35},{"Exile_Item_WoodStairsKit",15},
			{"Exile_Item_WoodSupportKit",25},{"Exile_Item_WoodWallHalfKit",25},{"Exile_Item_WoodWallKit",40},
			{"Exile_Item_WoodWindowKit",25}
		}
	},
	{
		"Support-Box3",
		{
			{"Exile_Item_BBQSandwich_Cooked",25},{"Exile_Item_BBQSandwich",25},{"Exile_Item_Cheathas",25},{"Exile_Item_Noodles",25},
			{"Exile_Item_ChocolateMilk",25},{"Exile_Item_ChristmasTinner_Cooked",25},{"Exile_Item_ChristmasTinner",25},
			{"Exile_Item_CockONut",25},{"Exile_Item_DsNuts",25},{"Exile_Item_DogFood_Cooked",25},
			{"Exile_Item_DogFood",25},{"Exile_Item_EMRE",25},{"Exile_Item_EnergyDrink",25},{"Exile_Item_MacasCheese_Cooked",25},
			{"Exile_Item_MacasCheese",25},{"Exile_Item_MountainDupe",25},{"Exile_Item_PlasticBottleCoffee",25},{"Exile_Item_PlasticBottleFreshWater",25},
			{"Exile_Item_PowerDrink",25},{"Exile_Item_Raisins",25},{"Exile_Item_SausageGravy_Cooked",25},{"Exile_Item_SausageGravy",25},
			{"Exile_Item_SeedAstics",25},{"Exile_Item_Surstromming_Cooked",25},{"Exile_Item_Surstromming",25},
			{"Exile_Item_BeefParts",25},{"Exile_Item_CatFood_Cooked",25},{"Exile_Item_CatFood",25}
		}
	},
	{
		"Support-Box4",
		{
			"Exile_Item_Flag","Exile_Item_WorkBenchKit",
			{"Exile_Item_FortificationUpgrade",40},
			{"Exile_Item_ConcreteWindowKit",25},{"Exile_Item_ConcreteWallKit",40},{"Exile_Item_ConcreteSupportKit",25},
			{"Exile_Item_ConcreteStairsKit",10},{"Exile_Item_ConcreteGateKit",4},{"Exile_Item_ConcreteFloorPortKit",15},
			{"Exile_Item_ConcreteFloorKit",40},{"Exile_Item_ConcreteDoorwayKit",5},{"Exile_Item_ConcreteDoorKit",5}
		}
	}
};


/* ***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER */
/*
	THE KYLE MODE - by enabling it (setting it to "true"), you disable 99% of the AntiHack features.
	(DEFAULT VALUE: "false").
	This is only for those, that want to use the Admin Menu only!
*/
KYLE_MODE = "true";
};
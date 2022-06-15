class CfgPatches
{
	class SafezonePlus
	{
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_client","exile_assets","exile_server_config"};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};

class CfgFunctions
{
	class SafezonePlus
	{
		class Bootstrap
		{
			file = "SafezonePlus";
			class preInit { preInit = 1; };
		};
	};
};

class CfgNetworkMessages
{
	class onEnterSafezonePlus
	{
		module = "SafezonePlus";
		parameters[] = {"STRING"};
	};
	class onLeaveSafezonePlus
	{
		module = "SafezonePlus";
		parameters[] = {"STRING"};
	};
};
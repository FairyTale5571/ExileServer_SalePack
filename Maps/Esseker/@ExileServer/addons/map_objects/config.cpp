class CfgPatches
{
	class map_objects
	{
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"exile_server",
			"exile_client",
			"custom_code"
		};
		units[]={};
		weapons[]={};
		magazines[]={};
		ammo[]={};
	};
};


class CfgFunctions
{
    class map_objects
    {
        class Bootstrap
        {
            file = "\map_objects\bootstrap";
            class preInit
            {
                preInit = 1;
            };
            class postInit
            {
                postInit = 1;
            };
        };
    };
};


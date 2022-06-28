class CfgPatches 
{
	class Atlas_VirtualGaragePublic 
	{
		requiredVersion = 1.80;
		requiredAddons[] = {"exile_client", "exile_server"};
	};

};
class CfgFunctions 
{
	class Atlas_VirtualGaragePublicFnc 
	{
		class Atlas_VirtualGaragePublicInit 
		{
			file = "\Atlas_VirtualGaragePublic\bootstrap";
			class init 
			{
				postInit = 1;
				preInit = 1;
			};
		};
	};
};
class CfgPatches 
{
    class VehiclePainting_Server 
	{
        requiredVersion = 0.1;
        requiredAddons[]=
        {
            "exile_client"
        };
        units[] = {};
        weapons[] = {};
    };
};

class CfgFunctions 
{
    class VehiclePaintingServer 
	{
        class main 
		{
            file="VehiclePainting_Server\bootstrap";
            class preInit {preInit = 1;};
        };
    };
};

//VehiclePainting VIPS
class VehiclePainting_VIPS
{
    Enabled = 0;

    VIPS[] =
    {
        "0" //Bit of a pleb to be fair
    };
};

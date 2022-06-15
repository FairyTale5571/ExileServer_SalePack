class CfgPatches {
    class BasePainting_Server {
        requiredVersion = 0.1;
        requiredAddons[]=
        {
            "exile_client"
        };
        units[] = {};
        weapons[] = {};
    };
};
class CfgFunctions {
    class BasePaintingServer {
        class main {
            file="BasePainting_Server\bootstrap";
            class preInit {preInit = 1;};
        };
    };
};

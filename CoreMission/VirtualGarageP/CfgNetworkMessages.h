class CfgNetworkMessages
{	
	class storepVehicleRequest
	{
		module="virtualp_garage";
		parameters[]=
		{
			"STRING",
			"STRING"
		};
	};
	class pstoreVehicleResponse
	{
		module = "virtualp_garage";
		parameters[] = 
		{
			"BOOL",
			"STRING"
		};
	};
	class buySlotsRequest
	{
		module = "virtualp_garage";
		parameters[] = {};
	};
	class buySlotsResponse
	{
		module = "virtualp_garage";
		parameters[] = {};
	};
	class storedVehicleResponse
	{
		module = "virtualp_garage";
		parameters[] = {"ARRAY"};
	};
	class storedVehicleRequest
	{
		module = "virtualp_garage";
		parameters[] = {"STRING"};
	};
	class retrievepVehicleResponse
	{
		module = "virtualp_garage";
		parameters[] = {"STRING"};
	};
	class retrievepVehicleRequest
	{
		module = "virtualp_garage";
		parameters[] = {"STRING","STRING"};
	};
};
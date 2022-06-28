class VGP
{
	targetType = 2;
	target = "Exile_Trader_Vehicle";

	class Actions 
	{
		class VGP: ExileAbstractAction
		{
			title = "Virtual Garage";
			condition = "true";
			action = "call ExileClient_gui_virtualpGarageDialog_show";
		};
	};
};
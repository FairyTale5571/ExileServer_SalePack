class BasePainting_Config
{
	class VIP
	{
		/*
			Is vip mode enabled
			0 = no
			1 = yes
		*/
		Enabled = 1;

		VIPS[] =
		{
			"0"
		};
	};

	class Price
	{
		/*
			Pricing mode
			0 = no price
			1 = Item
			2 = Poptabs
			3 = Both item and poptabs
		*/
		Mode = 2;

		//Class Name of item required (Will be taken from player)
		ItemRequired = "";

		//Poptab cost of painting if mode is 2 or 3
		Cost = 100;
	};

	class Sound
	{
		//Sound That will play when a texture is applied to a object "" == no sound
		Sound = "";
	};

	class Textures
	{
		/*
			OK so heres how this shit works

			All = every building item can use these textures

			And all the others are for specific textures that are desigend for each item ... its kinda simple

			ohh and dont forget how arrays work no ',' after the last item

			{"Texture name","Path to texture"}
		*/

		Colors[] =
		{
			{"Red","#(rgb,8,8,3)color(1,0,0,1)"},
			{"Green","#(rgb,8,8,3)color(0,1,0,1)"},
			{"Blue","#(rgb,8,8,3)color(0,0,1,1)"}
		};

		All[]=
		{
			{"Camo 01", "custom\Paint\Textures\camo01_co.paa"},
			{"Camo 02", "custom\Paint\Textures\camo02_co.paa"},
			{"Camo 03", "custom\Paint\Textures\camo03_co.paa"},
			{"Camo 04", "custom\Paint\Textures\camo04_co.paa"},
			{"Camo 05", "custom\Paint\Textures\camo05_co.paa"},
			{"Camo 06", "custom\Paint\Textures\camo06_co.paa"},
			{"Camo 07", "custom\Paint\Textures\camo07_co.paa"},
			{"Camo 08", "custom\Paint\Textures\camo08_co.paa"},
			{"Camo 09", "custom\Paint\Textures\camo09_co.paa"},
			{"Mod Texture Test","exile_assets\model\exile_woodboard_co.paa"}
		};

		//Wood Wall
		Exile_Construction_WoodWall_Static[] =
		{

		};

		//Wood Window
		Exile_Construction_WoodWindow_Static[] =
		{

		};

		//Wood Floor
		Exile_Construction_WoodFloor_Static[] =
		{

		};

		//Wood Floor Port
		Exile_Construction_WoodFloorPort_Static[] =
		{

		};

		//Wood Support
		Exile_Construction_WoodSupport_Static[] =
		{

		};

		//Wood Stairs
		Exile_Construction_WoodStairs_Static[] =
		{

		};

		//Wood Half Wall
		Exile_Construction_WoodWallHalf_Static[] =
		{

		};

		//Wood Doorway (ya know the one without a door)
		Exile_Construction_WoodDoorway_Static[] =
		{

		};

		//Wood Door (ya know the one with a door)
		Exile_Construction_WoodDoor_Static[] =
		{

		};

		//Wood Gate (why the fuck is this called gate btw .... dumb as fuck)
		Exile_Construction_WoodGate_Static[] =
		{

		};

		//Concrete Wall
		Exile_Construction_ConcreteWall_Static[] =
		{

		};

		//Concrete Window
		Exile_Construction_ConcreteWindow_Static[] =
		{

		};

		//Concrete Door
		Exile_Construction_ConcreteDoor_Static[] =
		{

		};

		//Concrete Doorway
		Exile_Construction_ConcreteDoorway_Static[] =
		{

		};

		//Concrete Floor
		Exile_Construction_ConcreteFloor_Static[] =
		{

		};

		//Concrete Floorport
		Exile_Construction_ConcreteFloorPort_Static[] =
		{

		};

		//Concrete Stairs
		Exile_Construction_ConcreteStairs_Static[] =
		{

		};

		//Concrete Support
		Exile_Construction_ConcreteSupport_Static[] =
		{

		};

		//Concrete Gate
		Exile_Construction_ConcreteGate_Static[] =
		{

		};
	};
};

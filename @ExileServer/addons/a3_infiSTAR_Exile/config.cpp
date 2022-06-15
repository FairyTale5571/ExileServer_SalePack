/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Copyright infiSTAR - 2011 - 2016. All rights reserved.
	Christian (Chris) L. (infiSTAR23@gmail.com) Developer of infiSTAR
*/
#include "EXILE_AHAT_CONFIG.hpp"
class CfgPatches
{
	class a3_infiSTAR_Exile
	{
		requiredVersion = 0.3762;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
		author[]= {"Chris(tian) 'infiSTAR' Lorenzen"};
		website[]= {"https://infiSTAR.de"};
		contact[]= {"admin@infiSTAR.de","infiSTAR23@gmail.com"};
		version = 'v0068a';
		licensed = "support@battleye.com";
	};
};
class CfgFunctions
{
	class a3_infiSTAR_Exile
	{
		class main
		{
			file = "a3_infiSTAR_Exile";
			class preInit { preInit = 1; };
		};
	};
};
#include "CUSTOM_FUNCTIONS.hpp"
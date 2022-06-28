class CfgPublicVirtualGarage
{
	//Максимум слотов к покупке, -1 - бексонечно
	maxSlots = 1000;
	
	/**
		Цена за покупку новых слотов
		Алгоритм
			Количество активных слотов * multiplierSlotsCost
				Пример:
					3 слота * 3000 = 9000 за слот и так далее по возростанию
		
	**/
	multiplierSlotsCost = 3000;
	
	//Удалять инвентарь 1 - да, 0 - нет
	clearInventory = 1;
	
	//Допустимый тип транспорта для сохранения
	vehicleTypes[] = {"Car","Tank","Plane","Air","Ship","Submarine"};
	
	//Транспорт который нельзя ставить в гараж ни при каких условиях
	restrictedVehicles[] = 
	{
		"VehicleClassname",
		"VehicleClassname2",
		"VehicleClassname3",
		"VehicleClassname4"
	};
};
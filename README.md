Требуемые моды для работы сервера: @Exile, @Namalsk (при использовании карты Namalsk)
Установка http://s-platoon.ru/topic/3875-ustanovka-servera-arma-3-exile-mod
ВАЖНО! После того как создадите базу данных и зальете туда данные с файла exile.sql, необходимо  после этого импортировать файл update_sql.sql и update_sql2.sql

Основные настройки сервера находяться в файлах:
Exile.YourMap\config.hpp
exile_server_config\config.hpp
Настройка спавна лута находиться в @ExileServer\ExileLootDrop.cfg
Настройка infiStar: a3_infistar_exile\EXILE_AHAT_CONFIG.hpp
Настройки стартового лута игрокам находиться по пути custom_code\server_code\DB3\ExileServer_object_player_createBambi.sqf
Настройка стартового лута для донатеров Exile.YourMap\custom\client_code\ExileClient_gui_selectSpawnLocation_show.sqf, подробности по настройке внутри этого файла

Переменная премиумов: player getVariable ["PremiumLevel",0];

Пример использования проверки на премиум уровень игрока.

_premiumLevel = player getVariable ["PremiumLevel",0];
if(_premiumLevel == 1) then
{
	// исполняемый код для випки 1го уровня
};

При установке своей копии infiStar, необходимо сделать

	В файле EXILE_AH.sqf найти строку
		player removeAllEventHandlers 'GetOutMan'; 
	и под ней добавить 
		player addEventHandler ['GetInMan', {[_vehicleObject] call SafeZonePlus_OnGetInEvent}];
		
	
	В файле EXILE_AH.sqf найти строку if(_mode isEqualTo 2)then{_vehicle allowDamage false;_vehicle setPos [0,0,0];closeDialog 0;true};

	и заменить ее на 
	if(_mode isEqualTo 3)then{_vehicle allowDamage false;_vehicle setPos [0,0,0];closeDialog 0;true};
	

Туториал по работе с Rewards тут https://github.com/Andrew-S90/ExilePlayerRewards/


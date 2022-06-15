/**
 * File: AtlasClient_system_check_TeamSpeak
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
   Return: Nothing
 */
 

private["_server","_channel","_pluginEnabled","_error","_sleep","_channelError","_config"];
if (!hasInterface && !isServer) exitWith {};
_config = missionConfigFile >> "CfgTaskForceRadio";
if (getPlayerUID player in (getArray(_config >> "ignoreCheck"))) exitWith {};
_sleep = 5;
while {true} do 
{
	uiSleep (_sleep * 60);
	_error = "";
	_channelError = false;
	_server = [] call TFAR_fnc_getTeamSpeakServerName;
	_channel = [] call TFAR_fnc_getTeamSpeakChannelName;
	_pluginEnabled = [] call TFAR_fnc_isTeamSpeakPluginEnabled;

	switch(true) do {
		case (!_pluginEnabled): {_error = "У вас не включен плагин Task Force Arma 3 Radio! Зайдите в плагины TeamSpeak (Ctrl+Shift+P) и проверьте активен ли он. После этого нажмите кнопку <t color='#ffcc00'>Обновить все/Reload ALL</t>"};
		case (_server != tf_radio_server_name): {_error = format["Вы не подключены к TS-серверу %2! Наш сервер: <t color='#ffcc00'>ts.rimasrp.ru</t><br/>Если вас автоматически не перекинет в канал <t color='#ffcc00'>%1</t>, то зайдите в плагины TeamSpeak (Ctrl+Shift+P) и нажмите кнопку <t color='#ffcc00'>Обновить все/Reload ALL</t>.",tf_radio_channel_name,getText(_config >> "servername")]};
		case (_channel != tf_radio_channel_name): {
			_error = format["Вы должны быть в специальном канале TeamSpeak для игры на сервере! Плагин будет перезагружен и вас перекинет в канал <t color='#ffcc00'>%1</t>. Если это не сработает, то зайдите в плагины (Ctrl+Shift+P) и нажмите кнопку <t color='#ffcc00'>Обновить все/Reload ALL</t>.",tf_radio_channel_name];
			_channelError = true;
	};

	if (_error != "") then {
		tfWarn = tfWarn + 1;
		_sleep = 5;
		hint format[" <t size='2.2' color='#ff0000' align='center'>Внимание!</t><br /><br />%1<br /><br />Это предупреждение номер %2 из 3.<br /><br />Следующая проверка через %3 минут! Исправьте ошибку или будете исключены из игры!</t>",_error,life_tfWarn,_sleep];
		if (_channelError) then {
			["processPlayerPositionsHandler", "onEachFrame"] call BIS_fnc_removestackedEventHandler;
			uiSleep 5;
			["processPlayerPositionsHandler", "onEachFrame", "TFAR_fnc_processPlayerPositions"] call BIS_fnc_addStackedEventHandler;
		};
	} else {
		tfWarn = 0;
		_sleep = 15;
	};
	if (tfWarn > 2) exitWith {
		systemChat "Вы исключены с сервера из-за нарушения правила о нахождении в TeamSpeak";
		uiSleep 2;
		["TaskForce",false,false] call BIS_fnc_endMission;
	};
};
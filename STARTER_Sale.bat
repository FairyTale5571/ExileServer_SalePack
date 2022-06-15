::::::::::::::::::::::
::::Начало настроек:::
::::::::::::::::::::::
@echo off
title Server restarter and repack pbo's
::::::::::::::::::::::::::::::::::::::::::::::
::Настройки армы.
::Путь к Арме.
set ARMApath=C:\SERVER
::Название миссии.
set level=@ExileServer
::Порт сервера.
set port=2302
::Активация дополнений.
set mod=@Exile
set srvmod=@ExileServer

::::::::::::::::::::::::::::::::::::::::::::::
::Настройки Bec_A3.
::Использовать Bec_A3? 1 - да, 0 - нет.
set usebec=0
::Путь до Bec_A3.
set Bec_A3=C:\SERVER\Bec
::::::::::::::::::::::::::::::::::::::::::::::
::Настройки перепаковки.
::3 варианта работы: 
::test - переименовывание pbo в название_время.pbo, создание нового (несколько копий),
::main - переименовывание pbo в название.pbo.bak, создание новго (одна копия),
::off - тут ничего неожиданного.
set useRePack=main
::Путь до PBOManager
set pbofld=c:\Program Files\PBO Manager v.1.4 beta
::Название аддона сервера
set srvAddName=@ExileServer
::::::::::::::::::::::
::::Конец настроек::::
::::::::::::::::::::::

@echo off
echo SERVER NOW KILLING 10 SECOND REMAINING 
echo SERVER NOW KILLING 10 SECOND REMAINING 
echo SERVER NOW KILLING 10 SECOND REMAINING 
echo SERVER NOW KILLING 10 SECOND REMAINING 
echo SERVER NOW KILLING 10 SECOND REMAINING 
timeout 10
echo.
echo.
 ::На всякие случай убиваем процессы
 echo Killing process...
 taskkill /IM arma3server_x64.exe
 echo Waitng for a while...
 timeout 3
 taskkill /IM arma3server_x64.exe
 echo Server killed.
 taskkill /IM Bec_A3.exe
 echo Bec_A3 killed.
 timeout 10
 echo Delete PBO Mission Files
 cls
 goto noRepack
:noRepack
echo.
 REM start C:\SERVER\cfg.bat
echo.
 ::Переход в папку армы и запуск сервера
 echo Switch to ARMA3 directory...
 cd /d "%ARMApath%"
 echo Starting server...
 start C:\SERVER\arma3server_x64.exe -malloc=tbbmalloc.dll -servermod=%srvmod% -mod=%mod% -name=%level% -config=%level%\config.cfg -cfg=%level%\basic.cfg -profiles=%level% -port=%port% -cpucount=6 -autoinit -enableHT
 timeout 2
 ::Запускать ли Bec_A3.
 if "%usebec%"=="1" (goto runbec) else (goto nobec)
 :runbec
 cls
echo.
echo.
 ::Ожидание запуска сервера
 echo Waiting server...
 timeout 120
 cls
echo.
echo.
 ::Переход в папку Bec_A3 и запуск
 echo Switch to Bec_A3 directory...
 cd /d "%Bec_A3%"
 echo Starting Bec_A3...
 start C:\SERVER\BEC\Bec_A3.exe -f Config.cfg
 timeout 2
 cls
echo.
echo.
 ::Вы великолепны
 :nobec
 echo all done
 timeout 2
 exit
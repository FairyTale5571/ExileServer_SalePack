::::::::::::::::::::::
::::������ ��������:::
::::::::::::::::::::::
@echo off
title Server restarter and repack pbo's
::::::::::::::::::::::::::::::::::::::::::::::
::��������� ����.
::���� � ����.
set ARMApath=C:\SERVER
::�������� ������.
set level=@ExileServer
::���� �������.
set port=2302
::��������� ����������.
set mod=@Exile
set srvmod=@ExileServer

::::::::::::::::::::::::::::::::::::::::::::::
::��������� Bec_A3.
::������������ Bec_A3? 1 - ��, 0 - ���.
set usebec=0
::���� �� Bec_A3.
set Bec_A3=C:\SERVER\Bec
::::::::::::::::::::::::::::::::::::::::::::::
::��������� �����������.
::3 �������� ������: 
::test - ���������������� pbo � ��������_�����.pbo, �������� ������ (��������� �����),
::main - ���������������� pbo � ��������.pbo.bak, �������� ����� (���� �����),
::off - ��� ������ ������������.
set useRePack=main
::���� �� PBOManager
set pbofld=c:\Program Files\PBO Manager v.1.4 beta
::�������� ������ �������
set srvAddName=@ExileServer
::::::::::::::::::::::
::::����� ��������::::
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
 ::�� ������ ������ ������� ��������
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
 ::������� � ����� ���� � ������ �������
 echo Switch to ARMA3 directory...
 cd /d "%ARMApath%"
 echo Starting server...
 start C:\SERVER\arma3server_x64.exe -malloc=tbbmalloc.dll -servermod=%srvmod% -mod=%mod% -name=%level% -config=%level%\config.cfg -cfg=%level%\basic.cfg -profiles=%level% -port=%port% -cpucount=6 -autoinit -enableHT
 timeout 2
 ::��������� �� Bec_A3.
 if "%usebec%"=="1" (goto runbec) else (goto nobec)
 :runbec
 cls
echo.
echo.
 ::�������� ������� �������
 echo Waiting server...
 timeout 120
 cls
echo.
echo.
 ::������� � ����� Bec_A3 � ������
 echo Switch to Bec_A3 directory...
 cd /d "%Bec_A3%"
 echo Starting Bec_A3...
 start C:\SERVER\BEC\Bec_A3.exe -f Config.cfg
 timeout 2
 cls
echo.
echo.
 ::�� �����������
 :nobec
 echo all done
 timeout 2
 exit
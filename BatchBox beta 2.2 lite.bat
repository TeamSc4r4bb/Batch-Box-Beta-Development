@echo off
setlocal EnableDelayedExpansion
set version=v(b)2.2
REM DO NOT FORGET TO MODIFY THE VERSION REG VALUE WHEN CHANGING THE VERSION!!!!!!!!!!!!!!!!!!!!!!!
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f > nul
REG ADD HKCU\Software\BatchBoxBeta /f
reg add HKCU\Software\BatchBoxBeta\!version! /f
REG ADD HKCU\Software\BatchBoxBeta\!version! /v version /t REG_SZ /d "!version!" /f
REG ADD HKCU\Software\BatchBoxBeta\!version! /v made_by /t REG_SZ /d "Team Sc4r4bb" /f
chcp 65001
title %version%
cls

:setup
set sx=0
set sy=0
set r=0
set g=
set b=
set cursoricon=█
set oldposid=
set oldposmaterial=
set selectedmaterial=
set currentposid=%sx%%sy%
set registryPath=ADD HKCU\Software\BatchBoxBeta\!version!
set size=10

for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
set dirt=%ESC%[38;2;137;81;41m▒%ESC%[0m
set mid11=%dirt%
set wood=[38;2;60;44;14m▒[0m
set mid12=%wood%
set grass=[102m[32m▓[0m
set mid13=%grass%
set leaves=[32m░[0m
set mid14=%leaves%
set rainbow=
set oakwood=[38;2;136;108;80m▓[0m
set mid15=%oakwood%
set sand=[38;2;194;178;128m▒[0m
set mid16=%sand%
set clay=[38;2;122;139;176m▓[0m
set mid17=%clay%
:: Minerals Materials
set stone=[90m▓[0m
set mid21=%stone%
set emerald=[100m[38;2;20;126;52m▒[0m
set mid22=%emerald%
set diamond=[100m[38;2;0;195;255m▒[0m
set mid23=%diamond%
set ruby=[100m[38;2;224;17;95m░[0m
set mid24=%ruby%
set ore=[100m[33m░[0m
set mid25=%ore%
set gold=[100m[38;2;255;215;0m▓[0m
set mid26=%gold%
set gravel=[38;2;68;69;69m▓[0m
set mid27=%gravel%
set coal=[38;2;58;49;40m░[0m
set mid28=%coal%
:: Construction Materials
set planks=[40m[33m░[0m
set mid31=%planks%
set steel=[38;2;224;229;229m█[0m
set mid32=%steel%
set copper=[38;2;184;115;51m░[0m
set mid33=%copper%
set rust=[100m[38;2;183;65;14m░[0m
set mid34=%rust%
set glass=░
set mid35=%glass%
set concrete=[38;2;149;165;166m█[0m
set mid36=%concrete%
:: Miscellaneous Materials
set ice=[38;2;19;96;132m▓[0m
set mid41=%ice%
set water=[34m▒[0m
set mid42=%water%
set lava=[38;2;229;101;32m▒[0m
set mid43=%lava%
set cloud=[38;2;221;221;255m░[0m
set mid44=%cloud%
set air= 
set mid45=%air%
set snow=[38;2;236;242;255m▓[0m
set mid46=%snow%

:: Grid Slots:::::
title loading...
echo Loading Autosave... (This may take a few seconds.)
for /f "tokens=3 delims= " %%a in ('reg query HKCU\Software\BatchBoxBeta\!version! /v b00') do (set b00=%%a) && echo loading b00 && for /f "tokens=3 delims= " %%a in ('reg query HKCU\Software\BatchBoxBeta\!version! /v b01') do (set b01=%%a) && echo loading b01 && for /f "tokens=3 delims= " %%a in ('reg query HKCU\Software\BatchBoxBeta\!version! /v b02') do (set b02=%%a) && echo loading b02 && for /f "tokens=3 delims= " %%a in ('reg query HKCU\Software\BatchBoxBeta\!version! /v b03') do (set b03=%%a) && echo loading b03 && for /f "tokens=3 delims= " %%a in ('reg query HKCU\Software\BatchBoxBeta\!version! /v b04') do (set b04=%%a) && echo loading b04 && for /f "tokens=3 delims= " %%a in ('reg query HKCU\Software\BatchBoxBeta\!version! /v b05') do (set b05=%%a) && echo loading b05 && for /f "tokens=3 delims= " %%a in ('reg query HKCU\Software\BatchBoxBeta\!version! /v b06') do (set b06=%%a) && echo loading b06 && for /f "tokens=3 delims= " %%a in ('reg query HKCU\Software\BatchBoxBeta\!version! /v b07') do (set b07=%%a) && echo loading b07 && for /f "tokens=3 delims= " %%a in ('reg query HKCU\Software\BatchBoxBeta\!version! /v b08') do (set b08=%%a) && echo loading b08 && for /f "tokens=3 delims= " %%a in ('reg query HKCU\Software\BatchBoxBeta\!version! /v b09') do (set b09=%%a) && echo loading b09 && for /l %%e in (10, 1, 100) do (for /f "tokens=3 delims= " %%a in ( 'reg query HKCU\Software\BatchBoxBeta\!version! /v b%%e') do (set b%%e=%%a) && echo loading b%%e )

:rendering
cls
echo [ %b09% %b19% %b29% %b39% %b49% %b59% %b69% %b79% %b89% %b99% ]
echo [ %b08% %b18% %b28% %b38% %b48% %b58% %b68% %b78% %b88% %b98% ]
echo [ %b07% %b17% %b27% %b37% %b47% %b57% %b67% %b77% %b87% %b97% ]
echo [ %b06% %b16% %b26% %b36% %b46% %b56% %b66% %b76% %b86% %b96% ]
echo [ %b05% %b15% %b25% %b35% %b45% %b55% %b65% %b75% %b85% %b95% ]
echo [ %b04% %b14% %b24% %b34% %b44% %b54% %b64% %b74% %b84% %b94% ]
echo [ %b03% %b13% %b23% %b33% %b43% %b53% %b63% %b73% %b83% %b93% ]
echo [ %b02% %b12% %b22% %b32% %b42% %b52% %b62% %b72% %b82% %b92% ]
echo [ %b01% %b11% %b21% %b31% %b41% %b51% %b61% %b71% %b81% %b91% ]
echo [ %b00% %b10% %b20% %b30% %b40% %b50% %b60% %b70% %b80% %b90% ]

:input
echo Version:%version%
echo Move (WASD) or Material
echo  ╔══════════════╗
echo  ║Block Selector║
echo  ║              ║
echo  ║ 1- Natural   ║    
echo  ║              ║
echo  ║ 2- Minerals  ║   
echo  ║              ║
echo  ║ 3- Const     ║
echo  ║              ║
echo  ║ 4- Misc      ║ 
echo  ║              ║  
echo  ╚══════════════╝
set currentposid=%sx%%sy%
choice /C WASDEO1234 /N

:: Materials:::::
if %errorlevel% equ 1 goto movement
if %errorlevel% equ 2 goto movement
if %errorlevel% equ 3 goto movement
if %errorlevel% equ 4 goto movement
if %ERRORLEVEL% EQU 5 set oldposmaterial=%rainbow%
if %errorlevel% equ 6 set oldposmaterial=%selectedmaterial%
if %errorlevel% equ 6 REG ADD HKCU\Software\BatchBoxBeta\!version! /v b!currentposid! /t REG_SZ /d !selectedmaterial! /f >nul
if %ERRORLEVEL% EQU 7 goto natural
if %ERRORLEVEL% EQU 8 goto minerals
if %ERRORLEVEL% EQU 9 goto construction
if %ERRORLEVEL% EQU 10 goto miscellaneous
goto rendering

:: Selection Screens
:natural
cls
rem wood, grass, leaves
echo  ╔══════════════╗
echo  ║Block Selector║
echo  ║              ║
echo  ║ 1- Dirt      ║    
echo  ║              ║
echo  ║ 2- Wood      ║   
echo  ║              ║
echo  ║ 3- Grass     ║
echo  ║              ║
echo  ║ 4- Leaves    ║ 
echo  ║              ║
echo  ║ 5- Oak Wood  ║  
echo  ║              ║
echo  ║ 6- Sand      ║ 
echo  ║              ║
echo  ║ 7- Clay      ║  
echo  ║              ║
echo  ║ 0- Back      ║  
echo  ╚══════════════╝
choice /C 12345670
if %errorlevel% equ 1 set selectedmaterial=%dirt%
if %errorlevel% equ 2 set selectedmaterial=%wood%
if %errorlevel% equ 3 set selectedmaterial=%grass%
if %errorlevel% equ 4 set selectedmaterial=%leaves%
if %errorlevel% equ 5 set selectedmaterial=%oakwood%
if %errorlevel% equ 6 set selectedmaterial=%sand%
if %errorlevel% equ 7 set selectedmaterial=%clay%
if %errorlevel% equ 8 goto rendering
goto natural

:minerals
cls
rem rock, emerald, precious stuff
echo  ╔══════════════╗
echo  ║Block Selector║
echo  ║              ║
echo  ║ 1- Stone     ║    
echo  ║              ║
echo  ║ 2- Emerald   ║   
echo  ║              ║
echo  ║ 3- Diamond   ║
echo  ║              ║
echo  ║ 4- Ruby      ║ 
echo  ║              ║
echo  ║ 5- Ore       ║  
echo  ║              ║
echo  ║ 6- Gold      ║ 
echo  ║              ║
echo  ║ 7- Gravel    ║  
echo  ║              ║
echo  ║ 8- Coal      ║
echo  ║              ║
echo  ║ 0- Back      ║  
echo  ╚══════════════╝
choice /C 123456780
if %errorlevel% equ 1 set selectedmaterial=%stone%
if %errorlevel% equ 2 set selectedmaterial=%emerald%
if %errorlevel% equ 3 set selectedmaterial=%diamond%
if %errorlevel% equ 4 set selectedmaterial=%ruby%
if %errorlevel% equ 5 set selectedmaterial=%ore%
if %errorlevel% equ 6 set selectedmaterial=%gold%
if %errorlevel% equ 7 set selectedmaterial=%gravel%
if %errorlevel% equ 8 set selectedmaterial=%coal%
if %errorlevel% equ 9 goto rendering
goto minerals

:construction
cls
rem planks, metal
echo  ╔══════════════╗
echo  ║Block Selector║
echo  ║              ║
echo  ║ 1- Planks    ║    
echo  ║              ║
echo  ║ 2- Steel     ║   
echo  ║              ║
echo  ║ 3- Copper    ║
echo  ║              ║
echo  ║ 4- Rust      ║ 
echo  ║              ║
echo  ║ 5- Glass     ║  
echo  ║              ║
echo  ║ 6- Concrete  ║ 
echo  ║              ║
echo  ║ 0- Back      ║  
echo  ╚══════════════╝
choice /C 1234560
if %errorlevel% equ 1 set selectedmaterial=%planks%
if %errorlevel% equ 2 set selectedmaterial=%steel%
if %errorlevel% equ 3 set selectedmaterial=%copper%
if %errorlevel% equ 4 set selectedmaterial=%rust%
if %errorlevel% equ 5 set selectedmaterial=%glass%
if %errorlevel% equ 6 set selectedmaterial=%concrete%
if %errorlevel% equ 7 goto rendering
goto construction

:miscellaneous
cls
rem water, lava, ice
echo  ╔══════════════╗
echo  ║Block Selector║
echo  ║              ║
echo  ║ 1- Ice       ║    
echo  ║              ║
echo  ║ 2- Water     ║   
echo  ║              ║
echo  ║ 3- Lava      ║
echo  ║              ║
echo  ║ 4- Cloud     ║ 
echo  ║              ║
echo  ║ 5- Air       ║  
echo  ║              ║
echo  ║ 6- Snow      ║ 
echo  ║              ║
echo  ║ 0- Back      ║  
echo  ╚══════════════╝
choice /C 1234560
if %errorlevel% equ 1 set selectedmaterial=%ice%
if %errorlevel% equ 2 set selectedmaterial=%water%
if %errorlevel% equ 3 set selectedmaterial=%lava%
if %errorlevel% equ 4 set selectedmaterial=%cloud%
if %errorlevel% equ 5 set selectedmaterial=%air%
if %errorlevel% equ 6 set selectedmaterial=%snow%
if %errorlevel% equ 7 goto rendering
goto miscellaneous

:: Movements :::::
:movement
if %errorlevel% equ 1 set /a sy+=1 && goto boundaries
if %errorlevel% equ 2 set /a sx-=1 && goto boundaries
if %errorlevel% equ 3 set /a sy-=1 && goto boundaries
if %errorlevel% equ 4 set /a sx+=1 && goto boundaries

:: Remdering Checks :::::
:boundaries
if %sx% GTR 9 (set sx=9) && if %sy% GTR 9 (set sy=9)
if %sx% LSS 0 (set sx=0) && if %sy% LSS 0 (set sy=0)
set b%oldposid%=%oldposmaterial%
set currentposid=%sx%%sy%
set oldposid=%currentposid%
set oldposmaterial=!b%currentposid%!
set b%currentposid%=%cursoricon%
goto rendering
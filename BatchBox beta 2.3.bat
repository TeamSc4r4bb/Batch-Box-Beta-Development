@echo off
setlocal EnableDelayedExpansion
set version=v(b)2.3
REM DO NOT FORGET TO MODIFY THE VERSION REG VALUE WHEN CHANGING THE VERSION!!!!!!!!!!!!!!!!!!!!!!!
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f > nul
REG ADD HKCU\Software\BatchBoxBeta /f
reg add HKCU\Software\BatchBoxBeta\!version! /f
REG ADD HKCU\Software\BatchBoxBeta\!version! /v version /t REG_SZ /d "!version!" /f
REG ADD HKCU\Software\BatchBoxBeta\!version! /v made_by /t REG_SZ /d "Team Sc4r4bb" /f
chcp 65001
title !version!
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
set creatorsName=
echo what is the size? (only input the length)
set /p size=
set /a nbline=%size% - 1
:: Material Setup :::::
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
cls
echo Do you want to skip Autosave Loading?
echo Y for Yes
echo N for no
choice /C YN /n
if %errorlevel% equ 1 goto gridsetupblank
if %errorlevel% equ 2 goto gridsetup

:gridsetup
title loading...
for /l %%y in (0, 1, %nbline%) do (

  for /l %%x in (0, 1, %nbline%) do (

    if not exist HKCU\Software\BatchBoxBeta\!version!\b%%x%%y (REG ADD HKCU\Software\BatchBoxBeta\!version! /v b%%x%%y /t REG_SZ /d "░" /f >nul && echo Missing b%%x%%y && echo Creating b%%x%%y save value in: HKCU\Software\BatchBoxBeta\!version!)
    echo %%x%%y
    set b%%x%%y=!glass!
    for /f "tokens=3 delims= " %%a in ('reg query HKCU\Software\BatchBoxBeta\!version! /v b%%x%%y') do (set b%%x%%y=%%a) && cls && echo loading b%%x%%y from: HKCU\Software\BatchBoxBeta\!version!

  )

)
title done
goto rendering

:gridsetupblank
for /l %%y in (0, 1, %nbline%) do (

  for /l %%x in (0, 1, %nbline%) do (

    set b%%xs%%y=░

  )

)
goto rendering


:rendering
set /a nbline=%size%-1
cls
set /a r=%random% %%255
set /a g=%random% %%255
set /a b=%random% %%255
set rainbow=[38;2;%r%;%g%;%b%m█

for /l %%y in (0, 1, %nbline%) do (

  set line%%y=
  for /l %%x in (0, 1, %nbline%) do (

    set line%%y=!line%%y! !b%%xs%%y!

  )

  echo !line%%y!

)

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
echo  ║ 5-           ║  
echo  ║              ║
echo  ║ 6-           ║ 
echo  ║              ║
echo  ║ 7-           ║  
echo  ║              ║
echo  ║ 8-           ║  
echo  ╚══════════════╝
set currentposid=%sx%%sy%
choice /C WASDEQO1234567890R /N

:: Materials:::::
if %errorlevel% equ 1 goto movement
if %errorlevel% equ 2 goto movement
if %errorlevel% equ 3 goto movement
if %errorlevel% equ 4 goto movement
if %errorlevel% equ 5 goto save
if %ERRORLEVEL% EQU 6 set oldposmaterial=%rainbow%
if %errorlevel% equ 7 set oldposmaterial=%selectedmaterial%
if %errorlevel% equ 7 REG ADD HKCU\Software\BatchBoxBeta\!version! /v b!currentposid! /t REG_SZ /d !selectedmaterial! /f >nul
if %ERRORLEVEL% EQU 8 goto natural
if %ERRORLEVEL% EQU 9 goto minerals
if %ERRORLEVEL% EQU 10 goto construction
if %ERRORLEVEL% EQU 11 goto miscellaneous
if %ERRORLEVEL% EQU 12 goto rendering
if %ERRORLEVEL% EQU 13 goto rendering
if %ERRORLEVEL% EQU 14 goto rendering
if %ERRORLEVEL% EQU 15 goto rendering
if %errorlevel% equ 16 goto rendering
if %errorlevel% equ 17 echo What new size? && set /p size= && goto rendering
if %errorlevel% equ 18 (

  echo Quick Search/Custom Material
  set /p sMId=
  set selectedmaterial=!sMId!

)
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
echo  ║ 8-           ║
echo  ║              ║
echo  ║ 9-           ║
echo  ║              ║
echo  ║ 0- Back      ║  
echo  ╚══════════════╝
choice /C 1234567890
if %errorlevel% equ 1 set selectedmaterial=%dirt%
if %errorlevel% equ 2 set selectedmaterial=%wood%
if %errorlevel% equ 3 set selectedmaterial=%grass%
if %errorlevel% equ 4 set selectedmaterial=%leaves%
if %errorlevel% equ 5 set selectedmaterial=%oakwood%
if %errorlevel% equ 6 set selectedmaterial=%sand%
if %errorlevel% equ 7 set selectedmaterial=%clay%
if %errorlevel% equ 8 set selectedmaterial=%empty%
if %errorlevel% equ 9 set selectedmaterial=%empty%
if %errorlevel% equ 10 goto rendering
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
echo  ║ 9-           ║
echo  ║              ║
echo  ║ 0- Back      ║  
echo  ╚══════════════╝
choice /C 1234567890
if %errorlevel% equ 1 set selectedmaterial=%stone%
if %errorlevel% equ 2 set selectedmaterial=%emerald%
if %errorlevel% equ 3 set selectedmaterial=%diamond%
if %errorlevel% equ 4 set selectedmaterial=%ruby%
if %errorlevel% equ 5 set selectedmaterial=%ore%
if %errorlevel% equ 6 set selectedmaterial=%gold%
if %errorlevel% equ 7 set selectedmaterial=%gravel%
if %errorlevel% equ 8 set selectedmaterial=%coal%
if %errorlevel% equ 9 set selectedmaterial=%empty%
if %errorlevel% equ 10 goto rendering
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
echo  ║ 7-           ║  
echo  ║              ║
echo  ║ 8-           ║
echo  ║              ║
echo  ║ 9-           ║
echo  ║              ║
echo  ║ 0- Back      ║  
echo  ╚══════════════╝
choice /C 1234567890
if %errorlevel% equ 1 set selectedmaterial=%planks%
if %errorlevel% equ 2 set selectedmaterial=%steel%
if %errorlevel% equ 3 set selectedmaterial=%copper%
if %errorlevel% equ 4 set selectedmaterial=%rust%
if %errorlevel% equ 5 set selectedmaterial=%glass%
if %errorlevel% equ 6 set selectedmaterial=%concrete%
if %errorlevel% equ 7 set selectedmaterial=%empty%
if %errorlevel% equ 8 set selectedmaterial=%empty%
if %errorlevel% equ 9 set selectedmaterial=%empty%
if %errorlevel% equ 10 goto rendering
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
echo  ║ 7-           ║  
echo  ║              ║
echo  ║ 8-           ║
echo  ║              ║
echo  ║ 9-           ║
echo  ║              ║
echo  ║ 0- Back      ║  
echo  ╚══════════════╝
choice /C 1234567890
if %errorlevel% equ 1 set selectedmaterial=%ice%
if %errorlevel% equ 2 set selectedmaterial=%water%
if %errorlevel% equ 3 set selectedmaterial=%lava%
if %errorlevel% equ 4 set selectedmaterial=%cloud%
if %errorlevel% equ 5 set selectedmaterial=%air%
if %errorlevel% equ 6 set selectedmaterial=%snow%
if %errorlevel% equ 7 set selectedmaterial=%empty%
if %errorlevel% equ 8 set selectedmaterial=%empty%
if %errorlevel% equ 9 set selectedmaterial=%empty%
if %errorlevel% equ 10 goto rendering
goto miscellaneous


:: Movements :::::
:movement
if %errorlevel% equ 1 set /a sy-=1 && goto boundaries
if %errorlevel% equ 2 set /a sx-=1 && goto boundaries
if %errorlevel% equ 3 set /a sy+=1 && goto boundaries
if %errorlevel% equ 4 set /a sx+=1 && goto boundaries

:: Unbounding :::::
:boundaries
set /a nbline=%size%-1
if %sx% GTR %nbline% set sx=%nbline%
if %sx% LSS 0 set sx=0
if %sy% GTR %nbline% set sy=%nbline%
if %sy% LSS 0 set sy=0
goto cursorrender

:cursorrender
set b%oldposid%=%oldposmaterial%
set currentposid=%sx%s%sy%
set oldposid=%currentposid%
set oldposmaterial=!b%currentposid%!
set b%currentposid%=%cursoricon%
goto rendering

:save
cls
echo What is the file to save in?
set /p %savefile%=
set %savefile%=%savefile%.bat
copy nul %savefile%
set line0s=echo [ %b09% %b19% %b29% %b39% %b49% %b59% %b69% %b79% %b89% %b99% ]
set line1s=echo [ %b08% %b18% %b28% %b38% %b48% %b58% %b68% %b78% %b88% %b98% ]
set line2s=echo [ %b07% %b17% %b27% %b37% %b47% %b57% %b67% %b77% %b87% %b97% ]
set line3s=echo [ %b06% %b16% %b26% %b36% %b46% %b56% %b66% %b76% %b86% %b96% ]
set line4s=echo [ %b05% %b15% %b25% %b35% %b45% %b55% %b65% %b75% %b85% %b95% ]
set line5s=echo [ %b04% %b14% %b24% %b34% %b44% %b54% %b64% %b74% %b84% %b94% ]
set line6s=echo [ %b03% %b13% %b23% %b33% %b43% %b53% %b63% %b73% %b83% %b93% ]
set line7s=echo [ %b02% %b12% %b22% %b32% %b42% %b52% %b62% %b72% %b82% %b92% ]
set line8s=echo [ %b01% %b11% %b21% %b31% %b41% %b51% %b61% %b71% %b81% %b91% ]
set line9s=echo [ %b00% %b10% %b20% %b30% %b40% %b50% %b60% %b70% %b80% %b90% ]
set linesize=echo grid size: %size%
if %size% GTR 10 (set lineerror=echo error: yes) else (set lineerror=echo error: no)
set off=@echo off
echo %off%>>savefile.bat
echo chcp 65001>>%savefile%
echo %linesize%>>%savefile%
echo %lineerror%>>%savefile%
echo %line0s%>>%savefile%
echo %line1s%>>%savefile%
echo %line2s%>>%savefile%
echo %line3s%>>%savefile%
echo %line4s%>>%savefile%
echo %line5s%>>%savefile%
echo %line6s%>>%savefile%
echo %line7s%>>%savefile%
echo %line8s%>>%savefile%
echo %line9s%>>%savefile%
echo pause>>%savefile%
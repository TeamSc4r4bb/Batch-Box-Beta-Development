 @echo off
setlocal EnableDelayedExpansion
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f > nul
chcp 65001
title v1.2 beta
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
echo what is the size? (only input the length)
set /p size=

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
set b00=░
set b01=░
set b02=░
set b03=░
set b04=░
set b05=░
set b06=░
set b07=░
set b08=░
set b09=░
set b10=░
set b11=░
set b12=░
set b13=░
set b14=░
set b15=░
set b16=░
set b17=░
set b18=░
set b19=░
set b20=░
set b21=░
set b22=░
set b23=░
set b24=░
set b25=░
set b26=░
set b27=░
set b28=░
set b29=░
set b30=░
set b31=░
set b32=░
set b33=░
set b34=░
set b35=░
set b36=░
set b37=░
set b38=░
set b39=░
set b40=░
set b41=░
set b42=░
set b43=░
set b44=░
set b45=░
set b46=░
set b47=░
set b48=░
set b49=░
set b50=░
set b51=░
set b52=░
set b53=░
set b54=░
set b55=░
set b56=░
set b57=░
set b58=░
set b59=░
set b60=░
set b61=░
set b62=░
set b63=░
set b64=░
set b65=░
set b66=░
set b67=░
set b68=░
set b69=░
set b70=░
set b71=░
set b72=░
set b73=░
set b74=░
set b75=░
set b76=░
set b77=░
set b78=░
set b79=░
set b80=░
set b81=░
set b82=░
set b83=░
set b84=░
set b85=░
set b86=░
set b87=░
set b88=░
set b89=░
set b90=░
set b91=░
set b92=░
set b93=░
set b94=░
set b95=░
set b96=░
set b97=░
set b98=░
set b99=░

:rendering
cls
set /a r=%random% %%255
set /a g=%random% %%255
set /a b=%random% %%255
set rainbow=[38;2;%r%;%g%;%b%m█
if %size% == 1 (

  echo [ %b00% ]

)
if %size% == 2 (

  echo [ %b01% %b11% ]
  echo [ %b00% %b10% ]

)
if %size% == 3 (

  echo [ %b02% %b12% %b22% ]
  echo [ %b01% %b11% %b21% ]
  echo [ %b00% %b10% %b20% ]

)
if %size% == 4 (

  echo [ %b03% %b13% %b23% %b33% ]
  echo [ %b02% %b12% %b22% %b32% ]
  echo [ %b01% %b11% %b21% %b31% ]
  echo [ %b00% %b10% %b20% %b30% ]

)
if %size% == 5 (

  echo [ %b04% %b14% %b24% %b34% %b44% ]
  echo [ %b03% %b13% %b23% %b33% %b43% ]
  echo [ %b02% %b12% %b22% %b32% %b42% ]
  echo [ %b01% %b11% %b21% %b31% %b41% ]
  echo [ %b00% %b10% %b20% %b30% %b40% ]

)
if %size% == 6 (

  echo [ %b05% %b15% %b25% %b35% %b45% %b55% ]
  echo [ %b04% %b14% %b24% %b34% %b44% %b54% ]
  echo [ %b03% %b13% %b23% %b33% %b43% %b53% ]
  echo [ %b02% %b12% %b22% %b32% %b42% %b52% ]
  echo [ %b01% %b11% %b21% %b31% %b41% %b51% ]
  echo [ %b00% %b10% %b20% %b30% %b40% %b50% ]

)
if %size% == 7 (

  title reality
  echo [ %b06%%b16%%b26%%b36%%b46%%b56%%b66% ]
  echo [ %b05%%b15%%b25%%b35%%b45%%b55%%b65% ]
  echo [ %b04%%b14%%b24%%b34%%b44%%b54%%b64% ]
  echo [ %b03%%b13%%b23%%b33%%b43%%b53%%b63% ]
  echo [ %b02%%b12%%b22%%b32%%b42%%b52%%b62% ]
  echo [ %b01%%b11%%b21%%b31%%b41%%b51%%b61% ]
  echo [ %b00%%b10%%b20%%b30%%b40%%b50%%b60% ]

)
if %size% == 8 (

  echo [ %b07% %b17% %b27% %b37% %b47% %b57% %b67% %b77% ]
  echo [ %b06% %b16% %b26% %b36% %b46% %b56% %b66% %b76% ]
  echo [ %b05% %b15% %b25% %b35% %b45% %b55% %b65% %b75% ]
  echo [ %b04% %b14% %b24% %b34% %b44% %b54% %b64% %b74% ]
  echo [ %b03% %b13% %b23% %b33% %b43% %b53% %b63% %b73% ]
  echo [ %b02% %b12% %b22% %b32% %b42% %b52% %b62% %b72% ]
  echo [ %b01% %b11% %b21% %b31% %b41% %b51% %b61% %b71% ]
  echo [ %b00% %b10% %b20% %b30% %b40% %b50% %b60% %b70% ]

)
if %size% == 9 (

  echo [ %b08% %b18% %b28% %b38% %b48% %b58% %b68% %b78% %b88% ]
  echo [ %b07% %b17% %b27% %b37% %b47% %b57% %b67% %b77% %b87% ]
  echo [ %b06% %b16% %b26% %b36% %b46% %b56% %b66% %b76% %b86% ]
  echo [ %b05% %b15% %b25% %b35% %b45% %b55% %b65% %b75% %b85% ]
  echo [ %b04% %b14% %b24% %b34% %b44% %b54% %b64% %b74% %b84% ]
  echo [ %b03% %b13% %b23% %b33% %b43% %b53% %b63% %b73% %b83% ]
  echo [ %b02% %b12% %b22% %b32% %b42% %b52% %b62% %b72% %b82% ]
  echo [ %b01% %b11% %b21% %b31% %b41% %b51% %b61% %b71% %b81% ]
  echo [ %b00% %b10% %b20% %b30% %b40% %b50% %b60% %b70% %b80% ]

)
if %size% == big (

  rem easter egg
  set b34=h
  set b44=o
  set b54=w
  set size=10
  goto 10

)
if %size% == 10 (

  :10
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

)

:input
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
echo  ║ 5- None      ║  
echo  ║              ║
echo  ║ 6- Aiden     ║ 
echo  ║              ║
echo  ║ 7- Help      ║  
echo  ║              ║
echo  ║ 8- pls       ║  
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
if %errorlevel% equ 1 set /a sy+=1 && goto boundaries
if %errorlevel% equ 2 set /a sx-=1 && goto boundaries
if %errorlevel% equ 3 set /a sy-=1 && goto boundaries
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
set currentposid=%sx%%sy%
set oldposid=%currentposid%
set oldposmaterial=!b%currentposid%!
set b%currentposid%=%cursoricon%
goto rendering

:save
cls
copy nul savefile.bat
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
echo chcp 65001>>savefile.bat
echo %linesize%>>savefile.bat
echo %lineerror%>>savefile.bat
echo %line0s%>>savefile.bat
echo %line1s%>>savefile.bat
echo %line2s%>>savefile.bat
echo %line3s%>>savefile.bat
echo %line4s%>>savefile.bat
echo %line5s%>>savefile.bat
echo %line6s%>>savefile.bat
echo %line7s%>>savefile.bat
echo %line8s%>>savefile.bat
echo %line9s%>>savefile.bat
echo pause>>savefile.bat

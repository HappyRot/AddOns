REM Modify the WoWRep var so it match you own setup. Make sure you have it surrounded by double quotes
REM WoWRep  : World of warcraft main directory
set WoWRep="C:\Program Files (x86)\World of Warcraft"
set CWD=%cd%

REM Don't touch anything bellow this if you aren't experienced
mklink /J %WoWRep%"\_retail_\Interface\AddOns\HeroDBC" %CWD%

pause

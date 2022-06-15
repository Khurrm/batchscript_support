@echo off
::Author Khurram 

:::The Loop and the Option for the User starts here.
:loop

Title "AD and other Info Check Script"
color  0A
echo  *****************************************
echo  *****************************************
echo  *************Helpful Scripts*************
echo  *****************************************
echo  ************* Batch file ****************
echo  *****************************************
echo  *****************************************
echo  *****************************************
echo: ****************************************

echo 1  For password information
echo 2  For AD user information
echo 3  Routing table information
echo 4  WLAN_Profiles and driver info
echo 5  WLAN_Info
echo 6  Account active check in the Active Directory
echo 7  IPConfig check and export to clipboard
echo 8  System file checker  (Scan system files for Problems) - You must have Admin rights to execute that.
echo 9  Flush DNS
echo 10 Disable AD Account
echo 11 IPConfig Info
echo 12 Power efficiency diagnosis report
echo 13 SystemInfo
echo 14 Applicable group policies - will be saved to clipboard
echo 15 Performance monitor
echo 16 Display the folder structure
echo 17 Tasklist
echo 18 Ping Google
echo 19 Check driver info on the computer 
echo 20 Scan system files for problems


echo 99 exit 
:::The Options variable. All set of options will be defined here.
set /p variablename= [promptValue]
CALL :case%variablename%
IF ERRORLEVEL 0 CALL :DEFAULT_CASE
REM if %variablename% == 1 goto case1
REM if %variablename% == 2 goto case2
REM if %variablename% == 3 goto case3
REM if %variablename% == 4 goto case4

::The case or the statements starts here
:case1
echo "Give User Name for the password check"
setlocal
set /p var1= 
net user %var1% /domain | find "Password expires"
net user %var1% /domain | find "Password"
endlocal
pause
::exit
goto loop

:case2
echo "User Name for AD Check"
echo:
setlocal
set /p var2=
net user %var2% /domain 
endlocal
pause  
goto loop

:case3
echo "Routing Table Information is as follows"
netstat -rn 
goto loop

:case4
echo "Profiles for WLAN are as follows"
echo:
netsh WLAN show profiles
echo "************"
Netsh WLAN show drivers
echo "************"
Netsh WLAN show interfaces
pause
goto loop

:case5
echo "WLAN Info"
echo "Give WLAN name"
echo:
setlocal
set /p var3=
netsh wlan show profile name=%var3% key=clear
pause
goto loop

:case6
echo "Account Active Check"
echo "User Name for AD Account Active Check"
setlocal
set /p var4=
net user %var4% /domain  | find "Account active"
net user %var4% /domain  | find "Full Name"
endlocal
pause  
goto loop

:case7
echo "IP Config Export"
ipconfig | clip
echo "Config exported"
pause
goto loop

:case8
echo" Scanning system files for problems"
sfc /scannow
goto loop

:case9
echo "Flushing DNS"
ipconfig /flushdns
echo "Netstat"
netstat
pause
goto loop

:case10
echo "Disable AD account"
Disable -ADAccount -Identity %variablename%
pause 
::endlocal
goto loop

:case11
echo "IPConfig Info is as follows"
ipconfig /all
pause
goto loop

:case12 
echo "Power Efficiency Diagnosis Report on Windows"
powercfg -energy
pause
goto loop

:case13
echo "SystemInformation"
SystemInfo
pause
goto loop

:case14
echo "Applicable Group Policies - Will be saved to Clipboard"
gpresult /R | clip
goto loop

:case15
echo "Performance Monitor"
perfmon
pause
goto loop

:case16 
echo "Display the Folder Structure"
tree 
pause 
goto loop

:case17
echo "Tasklist"
Tasklist
pause 
::exit
goto loop

:case18
echo "Ping Google"
ping "www.google.com"
pause 
::exit
goto loop

:case19 
echo "Driver Information is as follows" 
driverquery
goto loop

:case20 
echo "Scaning System files for Problems"
sfc /scannow

:DEFAULT_CASE
echo "nothing is happening"

:case99 
echo "Exiting"
exit

REM :END_CASE
REM echo "I am end of file"
REM GOTO :EOF




; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
;***** Symantec ***** 
 
$WindowName = "Symantec AntiVirus - InstallShield Wizard" 
 
Run($CmdLine[1] & "programs\install\Programs\SAVCE10.0.5\Setup.exe") 
 
WinWaitActive($WindowName, "WARNING: This program is protected") 
Send("!n") 
 
WinWaitActive($WindowName, "accept the terms in the license agreement") 
Send("!a") ; accept 
Send("!n") 
#cs 
WinWaitActive($WindowName, "Client - Choose this option if") 
Send("!c") ; client (not server) 
Send("!n") 
#ce 
 
WinWaitActive($WindowName, "Choose the setup type that best suits") 
Send("!c") ; complete 
Send("!n") 
#cs 
; section to see if symantec AN should be managed or unmanaged.  if the client cannot connect to the managed server, then the installer will not continue 
 
;usage: Ping("13.3.3.0") ; sucess>0, failure = 0 
 
;hot 
If Ping("13.3.3.0") Then ; true if server is online 
    ;server is available 
    ;do a managed install 
    MsgBox(0,"Status good", "server is reachable",5) 
    WinWaitActive($WindowName, "Managed - Choose this option if") 
    Send("!m") ; managed 
    Send("!n") 
 
    WinWaitActive($WindowName, "In a managed installation, you need to select a server.") 
    Send("{TAB 3}") 
    Send("manager") 
    Send("!n") 
 
Else 
    ;server is not reachable 
    ;do an unmanaged install 
    MsgBox(0,"Status","Manager isn't reachable", 5) 
    WinWaitActive($WindowName, "Managed - Choose this option if") 
    ;Send("!m") ; managed 
    ;Send("!n") 
     
    Run("cmd /c echo. > ""%userprofile%\Desktop\SymantecIsUnmanaged.log"" ")     
EndIf 
#ce 
 
 
WinWaitActive($WindowName, "The wizard is ready to begin installation.") 
Send("!i") ; install 
 
;Warning about old virus defs 
WinWaitActive("Old Virus Definition File", "The virus definition file used is more than 30") 
Send("{TAB 3}") 
Send("{SPACE}") 
Send("{TAB}") 
Send("{SPACE}") 
 
 
 
 
WinWaitActive($WindowName, "The InstallShield Wizard has successfully installed") 
Send("!f") 
 
; DONE! 
 
; live update runs and there are more windows, but I'll leave those for the luser. 
 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 
 
 
 
 
 
#cs 
WinWaitActive($WindowName, "Choose the setup type that best suits your needs.") 
Send("!c") ; complete 
Send("!n") 
 
WinWaitActive($WindowName, "To make optimum use of Symantec AntiVirus, you") 
Send("!r") ; don't run live update (usually no nic driver) 
Send("!n")  
 
 
 
;live update 
#ce 
 
#cs 
Ping symantec 
if there is no respone 
notify the user that symantec wasn't able to be contacted 
 and that they'll have to manually update 
 exit() 
else continue 
 
Conditions are evaluated as true (non-zero) or false (zero).   
 
PING Success: Returns the roundtrip-time in milliseconds ( greater than 0 ).  
#ce 
 
#cs 
If Ping("google.com") Then ; true if the GOOGLE is UP (symantec isn't normally pingable 
    ;then continue 
else ; the host NOT UP 
    Msgbox(0,"Symantec could not be contacted", "You will need to update Symantec Anti-virus later", 10) ; message box times out in 10 seconds 
    exit(1) ; sets the DOS %errorlevel% to one.  Could be used in the cmd script 
 
    ; need to put in commands to cancel live update (finish?) 
 
    send("{ENTER}")  
 
EndIf 
#ce 
 
;**************************** ^ experimental ^ ************************* 
#cs 
WinWaitActive("LiveUpdate", "Welcome to LiveUpdate") 
Send("!n") 
 
WinWaitActive("LiveUpdate", "Thank you for using LiveUpdate. The following") 
Send("{ENTER}") 
#ce 


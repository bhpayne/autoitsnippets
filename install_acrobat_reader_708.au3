; Press ctrl-q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
 
Opt("WinTitleMatchMode", 2) 
 
$windowName = "Adobe Reader 7.0.8 - Setup" 
 
Run($CmdLine[1] & "Programs\install\programs\AdbeRdr708_en_US.exe") 
 
;two minutes to download the installer, 20Mb 
WinWaitActive($windowName) 
MsgBox(0, "going to wait", "going to wait 30 seconds",5) 
Sleep(30000) 
Send("!n") ; next 
 
WinWaitActive($windowName, "WARNING: This program is protected by copyright law") 
Send("!n") ; next 
 
WinWaitActive($windowName, "Destination Folder") 
Send("!n") ; next 
 
WinWaitActive($windowName, "Setup is ready to begin installation.") 
Send("!i") ; install 
 
WinWaitActive($windowName, "Setup has successfully installed") 
Send("!f") ; finish 
 
;WinWaitActive("Adobe Reader 7.0.7 Installer Information") 
Sleep(2000) 
Send("!n") ; don't restart now 
 
 
 
Sleep(10000) 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 

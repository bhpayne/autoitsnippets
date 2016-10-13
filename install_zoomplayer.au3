; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;***** Zoom Player ***** 
 
Run("programs\zp451std.exe") 
 
WinWaitActive("Zoom Player Standard Setup: License Agreement") 
Send("!a") 
 
WinWaitActive("Zoom Player Standard Setup: Installation Folder") 
Send("!n") 
 
WinWaitActive("Zoom Player Standard Setup: Installation Options") 
Send("{TAB}") 
Send("{DOWN 5}") 
Send("{SPACE}") 
Send("{DOWN}") 
Send("{SPACE}") 
Send("!i") 
 
WinWaitActive("Zoom Player Standard Setup: Completed") 
Send("!c") 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 

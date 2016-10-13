; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
$WindowName = "Ad-Aware SE Plus" 
 
;***** Ad Aware SE ***** 
 
;path independent 
Run("programs\aawseplus.exe") 
 
WinWaitActive($WindowName, "It is strongly recommended") 
Send("!n") 
 
WinWaitActive($WindowName, "Software License Agreement") 
 
Send("{TAB 2}") 
Send("{SPACE}") 
Send("!n") 
 
WinWaitActive($WindowName, "Setup will install") 
Send("!n") 
 
WinWaitActive($WindowName, "Lavasoft Installation Wizard") 
Send("!n") 
 
WinWaitActive($WindowName, "You are now ready to install Ad-Aware SE Plus.") 
Send("!n") 
 
WinWaitActive($WindowName, "Ad-Aware SE Plus has been successfully installed.") 
Send("{TAB}") 
Send("{SPACE}") 
Send("{TAB}") 
Send("{SPACE}") 
Send("{TAB}") 
Send("{SPACE}") 
Send("{TAB}") 
Send("{SPACE}") 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 

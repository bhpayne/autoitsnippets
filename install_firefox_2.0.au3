; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
 
$WindowName = "Mozilla Firefox Setup" 
 
;***** Firefox ***** 
 
Run("programs\Firefox2.0.exe") 
 
WinWaitActive($WindowName, "It is recommended") 
Send("!n") 
 
 
WinWaitActive($WindowName, "License Agreement") 
Send("!a") 
Send("!n") 
 
WinWaitActive($WindowName, "Setup Type") 
Send("!n") 
 
WinWaitActive($WindowName, "Click Finish") 
Send("{SPACE}") 
Send("{TAB}") 
Send("{SPACE}") 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 

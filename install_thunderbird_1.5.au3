; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
 
;***** Thunderbird ***** 
 
;Run("\\server\wharehouse\Applications\Tcpip apps\email\Thunderbird\Thunderbird Setup 1.0.7.exe") 
Run("programs\Thunderbird_Setup_1.5.exe") 
 
WinWaitActive("Mozilla Thunderbird Setup", "It is strongly recommended") 
Send("!n") 
 
WinWaitActive("Software License Agreement") 
Send("{UP}") 
Send("!n") 
 
WinWaitActive("Setup Type") 
Send("!n") 
 
WinWaitActive("Select Components") 
Send("!n") 
 
WinWaitActive("Install Complete") 
Send("{SPACE}") 
Send("{TAB}") 
Send("{SPACE}") 
 
 
;make a shortcut on all user's desktop 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 

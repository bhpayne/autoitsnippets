HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
Run("programs\SciTE4AutoIt3.exe") 
 
$WindowName = "SciTE4AutoIt3 9/12/2006 Setup" 
 
WinWaitActive($WindowName, "This wizard") 
Send("!n") ; next 
 
WinWaitActive($WindowName, "License Agreement") 
Send("!a") ; agree 
 
WinWaitActive($WindowName, "Choose Install Location") 
Send("!n") ; next 
 
WinWaitActive($WindowName, "Define here what you would like to do") ; default for AU3 scripts 
; want to select radio button controlID 1201 (edit script) 
; use: ControlCommand ( "title", "text", controlID, "command", "option" ) 
ControlCommand($WindowName, "Define here what you would like to do", 1201, "Check", "") 
Send("!i") ; install 
 
WinWaitActive($WindowName, "SciTE for AutoIt3 finished") 
; want to uncheck controlID 1203 (currently checked) 
ControlCommand($WindowName, "SciTE for AutoIt3 finished", 1203, "UnCheck", "") 
Send("!f") 
 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF

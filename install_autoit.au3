; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
$WindowName = "AutoIt v3.1.1 Setup" 
 
Run("programs\autoit-v3-setup.exe") 
 
WinWaitActive($WindowName, "Welcome to the AutoIt v3.1.1 Setup Wizard") ; welcome 
Send("!n") 
 
WinWaitActive($WindowName, "License Agreement") ; lic agreement 
Send("!a") 
 
WinWaitActive($WindowName, "Choose the folder") ; install location 
Send("!i") 
 
WinWaitActive($WindowName, "Completing the AutoIt v3.1.1 Setup Wizard") ; complete 
Send("!f") 
 
 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF


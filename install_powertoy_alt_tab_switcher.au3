; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
$WindowName = "Alt-Tab Task Switcher Powertoy for Windows XP" 
 
Run("cmd /c " & $CmdLine[1] & " ""Programs\install\programs\Alt-Tab_Task_Switcher.msi"" ") 
 
WinWaitActive($WindowName, "WARNING: This program is protected by copyright law") 
Send("!n") 
 
WinWaitActive($WindowName, "accept the terms in the license agreement") 
Send("!a") 
Send("!n") 
 
WinWaitActive($WindowName, "Please enter your information.") 
Send("!n") 
 
WinWaitActive($WindowName, "Choose the setup type that best suits your needs.") 
Send("!n") 
 
WinWaitActive($WindowName, "The wizard is ready to begin installation.") 
Send("!i") 
 
WinWaitActive($WindowName, "successfully installed") 
Send("!f") 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF

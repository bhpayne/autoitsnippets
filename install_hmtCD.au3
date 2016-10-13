; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
$WindowName = "HighMAT CD Writing Wizard" 
 
Run("programs\HMTCDWizard.exe") 
 
WinWaitActive($WindowName, "WARNING: This program is protected by copyright law") 
Send("!n") 
 
WinWaitActive($WindowName, "accept the terms in the license agreement") 
Send("!a") 
Send("!n") 
 
WinWaitActive($WindowName, "Click Next to install to this folder, or click Change") 
Send("!n") 
 
WinWaitActive($WindowName, "The wizard is ready to begin installation.") 
Send("!i") 
 
WinWaitActive($WindowName, "The Install Wizard has successfully installed") 
Send("!f") 
 
 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF


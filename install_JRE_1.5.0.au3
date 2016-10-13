; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 

 
;***** JRE ***** 
 
Run("programs\jre-1_5_0_10-windows-i586-p-s.exe") 
 
WinWaitActive("J2SE Runtime Environment 5.0 Update 10 - License") 
Send("!a") ; accept 
;Send("!n") ; next 
 
;WinWaitActive("J2SE Runtime Environment 5.0 Update 6 - Setup Type") 
;Send("!n") ; next 
; the complete window wasn't reached??? 
WinWaitActive("J2SE Runtime Environment 5.0 Update 10 - Complete") 
Send("!f") ; finish 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 


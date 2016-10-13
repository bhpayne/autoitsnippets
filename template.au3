; Press ctrl-q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
 
Opt("WinTitleMatchMode", 2) 
 
;***** PROGRAM NAME ***** 
 
;Run("cmd /c msg %username% /time:01 PROGAM NAME ") 
 
;Run("cmd /c ""\\hot\wharehouse\Applications\LOCATION"" ") 
 
;CODE HERE 
 
 
 
Sleep(10000) 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 

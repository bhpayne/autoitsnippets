; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
Run("programs\DCOMbob.exe") 
 
; I had the WWA commented out.  May not work now. 
WinWaitActive("DCOMbobulator") 
Sleep(1000) 
WinSetTrans("DCOMbobulator", "", 170) ; Make window semi-transparent. 
; will work only if the title is recognized 
Sleep(1000) 
 
Send("!M") 
Sleep(2000) 
Send("!i") 
Sleep(2000) 
Send("!x") 
 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF

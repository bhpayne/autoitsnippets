; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
;***** Acrobat Reader ***** 
 
;Run("cmd /c msg %username% /time:01 Acrobat Reader ") 
 
;Run("\\server\wharehouse\Applications\READERS_AND_VIEWERS\ADOBE products\Acrobat Reader 5.05\ar505enu.exe") 
 
Run("programs\Acrobat Reader 5.05.exe") 
 
WinWaitActive("Acrobat Reader 5.0.5 Setup", "Welcome to the Reader 5.0 Setup program.") 
Send("!n") 
 
;only need this one when there is a series of installers 
;WinWaitActive("Question", "Setup has determined") 
;Send("!y") 
 
WinWaitActive("Choose Destination Location", "Setup will install Reader 5.0") 
Send("!n") 
 
WinWaitActive("Information", "Thank you for choosing Acrobat Reader!") 
Send("{ENTER}") 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 

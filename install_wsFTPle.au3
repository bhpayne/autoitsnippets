; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
;$WindowName = ""WS_FTP LE Installation"" 
 
;***** WS FTP LE ***** 
 
Run("programs\WS_FTPLE.exe") 
 
WinWaitActive("WS_FTP", "Install WS_FTP LE") 
Send("{ENTER}") 
 
WinWaitActive("WS_FTP", "A student, faculty member, or staff member") 
 
;Control ID:    1851 
;ClassNameNN:    Button2 
 
ControlCommand ( "WS_FTP", "A student, faculty member, or staff member", 1851, "Check", "" ) 
 
Send("{TAB}") 
Send("{TAB}") 
Send("{TAB}") 
Send("{ENTER}") 
 
WinWaitActive("How will you Use WS_FTP LE?") 
 
Send("{TAB}") 
Send("{TAB}") 
Send("{TAB}") 
Send("{SPACE}") 
Send("{TAB}") 
Send("{TAB}") 
Send("{TAB}") 
Send("{SPACE}") 
Send("{TAB}") 
Send("{TAB}") 
Send("{TAB}") 
Send("{TAB}") 
Send("{TAB}") 
Send("{ENTER}") 
 
WinWaitActive("WS_FTP LE is NOT Shareware") 
Send("!a") 
 
WinWaitActive("WS_FTP LE Installation") 
Send("{ENTER}") 
 
WinWaitActive("WS_FTP", "Please enter your preferred local destination") 
Send("{ENTER}") 
 
WinWaitActive("Program Manager Group", "Please enter the name of the Program Manager group") 
Send("{ENTER}") 
 
WinWaitActive("Congratulations!") 
Send("{ENTER}") 
 
WinWaitActive("WS_FTP") 
Send("!{F4}") 
 
Run("cmd /c pskill WS_FTPLE.exe") 
 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 

; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
;***** PrintScreen ***** 
 
Run("programs\PRT9570\setup.exe") 
 
WinWaitActive("Welcome") 
Send("!n") 
 
WinWaitActive("User Information") 
Send("!n") 
 
WinWaitActive("Choose Destination Location") 
Send("!r") 
 
WinWaitActive("Choose Directory") 
;seven <- keys, add program files\ string 
Send("{LEFT 7}") 
Send("program files\") 
Send("{TAB 3}") 
Send("{SPACE}") 
 
WinWaitActive("Setup") 
Send("!y") 
 
WinWaitActive("Choose Destination Location") 
Send("!n") 
Send("!n") 
 
WinWaitActive("Select Program Folder") 
Send("!n") 
 
WinWaitActive("Start Copying Files") 
Send("!n") 
 
; possibly want to nix this next line 
;WinWaitActive("Printscreen 95 V7.0") 
;WinClose("Printscreen 95 V7.0") 
 
;pskill explorer.exe ; don't know if this might do it 
 
WinWaitActive("Setup Complete") 
Send("{TAB}") ; just added this one, since the select portion was not on the "enter" 
Send("{SPACE}") ; was an enter 
 
MsgBox(0,"Just wait a minute", "It appears printscreen was installed buy may not have exited cleanly.  I'm going to end the setup program manually.", 3) 
 
;these don't work so I'll just kill the process 
Sleep(4000) 
Run("cmd /c pskill printscrn.exe") 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 
EndFunc 
 
;EOF

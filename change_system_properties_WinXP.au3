; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;system properties 
Send("#{PAUSE}") ; system properties shortcut: win-pause/break 
WinWaitActive("System Properties", "General") 
Send("{UP}") 
WinWaitActive("System Properties", "System Restore") 
Send("{TAB}") 
Send("!t") ; turn off system restore 
Send("+{TAB}") ; back to the system restore tab 
Send("{RIGHT}") ; to "automatic updates" tab 
Send("!u") ; automatic 
Send("{TAB 7}"); back to automatic updates tab 
Send("{RIGHT}") ; to remote 
Send("!r") ; don't allow remote assisstance 
Send("!c") ; allow remote desktop in 
 
;WinWaitActive("Remote Sessions", "Some local accounts might not have") ; removed because this window didn't appear 
;Send("{SPACE}") ; ok 
 
WinWaitActive("System Properties", "Remote") 
Send("{ENTER}") ; OK 
 
WinWaitActive("System Restore") 
Send("!y") ; yes, turn off system restore 
 
; computer management 
Send("#e") 
WinWaitActive("My Computer") 
Sleep(500) 
Send("!{SPACE}x") ; maximize 
Sleep(500) 
Send("{APPSKEY}g") ; alt menu, manage 
 
WinWaitActive("Computer Management") 
Sleep(500) 
 
;throw in something to set diskkeeper to setit and forget it 
 
Send("!{SPACE}x") ; maximize 
Sleep(500) 
 
Send("d") ; down to device manager 
Sleep(500) 
 
Send("{TAB}") ; over to the drivers tree 
Sleep(500) 
 
Send("{DOWN 4}") ; to display adapter 
Sleep(500) 
 
Send("{RIGHT}") ; expand display adapter 
Sleep(500) 
 
Run("cmd /c ""%systemroot%\system32\lusrmgr.msc"" ") 
WinWaitActive("Local Users and Groups") 
Sleep(500) 
Send("{DOWN}") ; to users 
Sleep(500) 
Send("{TAB}") ; over to administrator 
Sleep(500) 
Send("{APPSKEY}") ; alt menu, short cut is shift-F10 
Sleep(500) 
Send("m") ; rename 
Sleep(500) 
Send("Bob{ENTER}") 
Sleep(500) 
Send("!{F4}") 
 
Send("#{PAUSE}") ; system properties shortcut: win-pause/break 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF


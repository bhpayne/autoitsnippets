; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
 
;$WindowName = "Oracle Calendar 9.0.4 - InstallShield Wizard" 
 
Run("Programs\scrt404_uw.exe") 
 
WinWaitActive("SecureCRT", "End-User License Agreement for SecureCRT 4.0") 
Send("!I") 
 
WinWaitActive("SecureCRT", "This program will install SecureCRT on your computer.") 
Send("{ENTER}") 
 
WinWaitActive("SecureCRT", "Please select the directory where the files for SecureCRT will be installed:") 
Send("!n") 
 
WinWaitActive("SecureCRT", "What profile do you want to use?") 
Send("!n") 
 
WinWaitActive("SecureCRT", "SecureCRT protocols") 
Send("!n") 
 
WinWaitActive("SecureCRT", "SecureCRT comes with two command-line utilities:") 
Send("!n") 
 
WinWaitActive("SecureCRT", "You are now ready to install SecureCRT.") 
Send("!f") 
 
; uncheck "View Readme now?" (button3) and "View History now?" (button4) 
 
WinWaitActive("SecureCRT", "SecureCRT has been successfully installed") 
Send("{TAB}") 
Send("{SPACE}") 
Send("{TAB}") 
Send("{SPACE}") 
Send("{TAB}") 
Send("{ENTER}") 
 
;just to make sure 
Run("cmd /c pskill notpad.exe") 
 
; in place of 
;WinWaitActive("HISTORY.TXT - Notepad") 
;WinClose("HISTORY.TXT - Notepad") 
 
;WinWaitActive("README.TXT - Notepad") 
;WinClose("README.TXT - Notepad") 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF

; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;If Ping("google.com") Then ; true if GOOGLE is UP.  Can't normally ping microsoft.com 
    ;then continue 
;else ; the host NOT UP 
;    Msgbox(0,"Microsoft could not be contacted", "You will need to update Windows later", 10) ; message box times out in 10 seconds 
;    exit(1) ; sets the DOS %errorlevel% to one.  Could be used in the cmd script 
;EndIf 
 
Run("cmd /c %SystemRoot%\system32\wupdmgr.exe") 
 
;Maximize the window 
 
WinWaitActive("Microsoft Windows Update - Windows Internet Explorer") 
 
Sleep(1000) 
;WinSetTrans("Microsoft Windows Update - Windows Internet Explorer", "", 210) 
WinSetTitle("Microsoft Windows Update - Windows Internet Explorer", "", "Wind()ze sucks!") 
 
Send("!{SPACE}") ; open the window menu 
Send("x") ; maximize 
 
WinWaitActive("Microsoft Phishing Filter") 
Send("!f") ; alt-f to not turn it on 
Send("{TAB}") ; to OK 
Send("{ENTER}") ; OK 
 
WinWaitActive("Internet Explorer - Security Warning") 
Send("!i") ; install 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF

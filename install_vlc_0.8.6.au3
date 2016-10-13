; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
 
;***** VLC ***** 
 
$WindowName = "VideoLAN VLC media player 0.8.6 Setup" 
 
Run("programs\vlc-0.8.6-win32.exe") 
 
WinWaitActive("Installer Language") 
Send("{ENTER}") 
 
WinWaitActive($WindowName, "Welcome to the VideoLAN VLC media player 0.8.6 Setup") 
Send("{ENTER}") 
 
WinWaitActive($WindowName, "License Agreement") 
Send("!a") 
 
WinWaitActive($WindowName, "Choose Components") 
 
Send("{TAB}") 
Send("{DOWN}") 
Send("{SPACE}") 
Send("{DOWN}") 
Send("{SPACE}") 
Send("{DOWN}") 
Send("{SPACE}") 
Send("{DOWN}") 
Send("{SPACE}") 
Send("!n") 
 
 
WinWaitActive($WindowName, "Choose Install Location") 
Send("!i") 
 
WinWaitActive($WindowName, "Completing the VideoLAN VLC media player 0.8.6 Setup") 
Send("{SPACE}") 
Send("{TAB 3}") 
Send("{ENTER}") 
 
;Run("cmd /c msg %username% /time:01 spybot ") 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 

; Press CONTROL-Q to terminate script
HotKeySet("^q", "Terminate")

AutoItSetOption ( "TrayIconDebug", 1 )
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive

;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent.

$WindowName = "Setup - Spybot - Search & Destroy"

;***** spybot SD1.4 *****


Run("programs\spybotsd162.exe")

WinWaitActive("Select Setup Language")
Send("{ENTER}")

WinWaitActive($WindowName, "Welcome to the Spybot - Search & Destroy Setup Wizard")
Send("!n")

WinWaitActive($WindowName, "License Agreement")
Send("!a")
WinWaitActive($WindowName, "License Agreement")
Send("!n")

WinWaitActive($WindowName, "Select Destination Location")
Send("!n")

WinWaitActive($WindowName, "Select Components")
Send("{TAB}")
Send("{DOWN}")
Send("{DOWN}")
Send("{DOWN}")
Send("{SPACE}")
Send("{DOWN}")
Send("{SPACE}")
WinWaitActive($WindowName, "Select Components")
Send("!n")

WinWaitActive($WindowName, "Select Start Menu Folder")
Send("!n")

WinWaitActive($WindowName, "Select Additional Tasks")
Send("!n")

WinWaitActive($WindowName, "Ready to Install")
Send("!i")

WinWaitActive($WindowName, "Completing the Spybot - Search & Destroy Setup Wizard")
Send("{SPACE}")
Send("!f")

;done!

;Run("cmd /c msg %username% /time:01 spybot ")

;This is the "terminate" function on the "Esc" hotkey
Func Terminate()
    Exit 0
EndFunc

;EOF


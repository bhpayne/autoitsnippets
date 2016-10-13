; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;WinSetTrans("Notepad", "", 170) ; Make window semi-transparent. 
 
;$WindowName = "TextPad 4.6 - InstallShield Wizard" 
 
;***** TextPad ***** 
 
;Run("cmd /c msg %username% /time:01 TextPad ") 
 
 
Run("programs\TextPad_4.62\txpeng462.exe") 
 
WinWaitActive("TextPad", "WARNING: This program is protected") 
Send("!n") 
 
WinWaitActive("TextPad", "not accept the terms in the license agreement") 
Send("!a") 
Send("!n") 
 
WinWaitActive("TextPad", "who uses this computer") 
Send("!n") 
 
WinWaitActive("TextPad", "Next to install to this folder, or") 
Send("!n") ; next 
 
WinWaitActive("TextPad", "want to review or change") 
Send("!i") ; install 
 
WinWaitActive("TextPad", "The InstallShield Wizard has successfully installed") 
Send("!f") ; finish 
 
WinWaitActive("Tip of the Day") 
Send("{ENTER}") 
 
WinWaitActive("TextPad - [Document1]") 
Send("!h") ; help menu 
Send("l")  ; enter lic key 
 
 
#cs 
 
Run("cmd /c ""%systemdrive%\unattended_installer\install\programs\TextPad_4.62\serial.txt"" ") 
 
WinWaitActive("serial.txt - Notepad") 
WinWaitActive("serial - Notepad") ; extensions are not viewed by default 
 
;got this far 
; reason it died: if you are not viewing extenstions, then you should do 
; WinWaitActive("serial - Notepad") 
; else it dies 
; try 
;  WWA("A") || WWA("B") 
 
Send("^a") 
Sleep(1000) 
Send("^c") 
Sleep(1000) 
Send("!{F4}") 
 
; above is crap (for copying serial) 
#ce 
 
WinWaitActive("Register TextPad") 
 
Send("BEGIN LICENSE" & @LF & "Your license here" & @LF & "Site License" & @LF & "425342" & @LF & "END LICENSE") 
 
;Send("^v") ; for pasting the copied serial in 
 
Sleep(1000) 
 
Send("{TAB}") 
Send("{SPACE}") 
 
WinWaitActive("TextPad") 
Send("{SPACE}") 
 
WinWaitActive("Save As", "My Documents") 
Send("{ESCAPE}") 
 
;WinWaitActive("TextPad - [A:\TEXTPAD.TXT *]") 
;Run("cmd /c pskill notepad") 
;WinClose ( "TextPad - [A:\TEXTPAD.TXT *]") 
WinClose("TextPad -") 
 
WinWaitActive("TextPad") 
Send("!n") 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 

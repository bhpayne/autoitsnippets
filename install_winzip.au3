; Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
 
;***** WinZip ******* 
 
;;;Run("programs\WinZip.v9.0.6028.Corporate.exe") 
 
;;;WinWaitActive("WinZip Self-Extractor - WinZip.v9.0.6028.Corporate.exe", "&Setup") 
 
; the ! in front of the s is for "alt" making 
; this command "alt+s" 
;;;Send("!s") 
 
; note: the "into the following folder" input identifies 
; text unique to that window, as each winzip setup window 
; has the same title 
; the {enter} is the control input for the "enter" key 
 
;;;WinWaitActive("WinZip Setup", "into the following folder") 
;;;Send("{ENTER}") 
 
;;; prior extraction of winzip to program files 
 
Run("C:\Program Files\WinZip\WINZIP32.EXE") 
 
WinWaitActive("WinZip Setup", "WinZip features include") 
Send("!n") 
 
WinWaitActive("License Agreement") 
Send("!y") 
 
WinWaitActive("WinZip Setup", "Quick Start Guide") 
Send("!n") 
 
WinWaitActive("WinZip Setup", "switch between the two interfaces") 
Send("!c") 
Send("!n") 
 
WinWaitActive("WinZip Setup", "&Express setup (recommended)") 
Send("!e") 
Send("!n") 
 
WinWaitActive("WinZip Setup", "WinZip needs to associate itself with your archives") 
Send("!n") 
 
; error here 
 
WinWaitActive("WinZip Setup", "Installation is complete.") 
Send("{ENTER}") 
 
WinWaitActive("WinZip Tip of the Day") 
Send("!c") 
 
WinWaitActive("WinZip") 
WinClose("WinZip") 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF

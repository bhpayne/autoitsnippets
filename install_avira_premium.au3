; Press ctrl-q to terminate script 
HotKeySet("^q", "Terminate") 

AutoItSetOption ( "TrayIconDebug", 1 ) 
 
Opt("WinTitleMatchMode", 2) 

$windowsname = "Avira Premium Security Suite"

If ProcessExists("avupgsvc.exe") Then ; avira installer is already running (probably from a reboot
;If WinExists("$windowsname") Then 
    WinWaitActive($windowsname)
    Send("{ENTER}")    
Else ; no window exists when this au3 was started
    If (FileExists("C:\Program Files\Avira\AntiVir Desktop\alldiscs.avp")) Then  ; this file is specific to the FREE home version
        MsgBox(0,"Avira already installed","Warning: Avira home appears to be installed. Will remove it",5)

        Run("avira_premium_security_suite_en.exe")

        $windowsname = "Avira Premium Security Suite"
        WinWaitActive($windowsname)
        Send("{ENTER}")
    
        WinWaitActive("Setup of Avira Premium Security Suite","An  Avira GmbH product is already installed")
        Send("!y")
    
        WinWaitActive("Setup of Avira Premium Security Suite","During the upgrade, setup may access")
        Send("!y")

        WinWaitActive("Setup of Avira Premium Security Suite","Your computer will now be rebooted.")
        ;after the reboot, then "setup.exe" automatically runs out of
        ; %userprofile%\Local Settings\Temp\AVSETUP_4a3feb60\basic\setup.exe
   
        ; OLD: ping -n 30 127.0.0.1 >> %userprofile%\Start Menu\Programs\Startup\Avira_runner.cmd
        ; OLD: taskkill /im setup.exe >> %userprofile%\Start Menu\Programs\Startup\Avira_runner.cmd

        Run(@ComSpec & " /c " & 'echo ' & @AutoItExe & ' >> "%u    serprofile%\Start Menu\Programs\Startup\Avira_runner.cmd"', "", @SW_HIDE) 
        Run(@ComSpec & " /c " & 'echo del "%userprofile%\Start Menu\Programs\Startup\Avira_runner.cmd" >> "%userprofile%\Start Menu\Programs\Startup\Avira_runner.cmd"', "", @SW_HIDE) 

        Sleep(500)
        WinWaitActive("Setup of Avira Premium Security Suite","Your computer will now be rebooted.")
        Send("{ENTER}")

        
    Else ; avira is not installed, and it is not already running
        
        MsgBox(0,"Internet required","Note: Internet required for license verification",3)

        Run("avira_premium_security_suite_en.exe")

    ; there's an optional "/s" for the executable, but it just skips this following 
        WinWaitActive($windowsname)
        Send("{ENTER}")

    EndIf
    
EndIf



;If (FileExists("C:\Program Files\Avira\AntiVir Desktop\avcenter.exe")) Then
;    MsgBox(0,"Avira already installed","Warning: Avira appears to be installed. Exiting now",20)
;    Exit 0 
;EndIf


;WinWaitActive("Avira AntiVir Professional","Welcome to the setup for")
;Send("{ENTER}")
WinWaitActive($windowsname,"Setup of")
Send("!n")
WinWaitActive($windowsname,"Avira Premium Security Suite protects you ")
Send("!n")

WinWaitActive($windowsname,"the terms of the license agreement")
Send("!a")
Send("!n")

WinWaitActive($windowsname,"Please select a setup type.")
Send("!n")

Sleep(500)
If WinExists("Setup of Avira Premium Security Suite","Premium Security Suite has detected that the Windows Firewall") Then
    Send("!y") ;yes
EndIf

WinWaitActive("Avira Premium Security Suite license wizard","This wizard helps you to license your Avira ")
Send("!l") ; licence
;Send("\\sharelocation\filename.key") ; or hbedv.key
Send("YOUR KEY HERE")
Send("!n")

; If WinExists("Error") Then
; no internet connection present for registration
; Send("{ENTER}")

WinWaitActive("Avira Premium Security Suite license wizard","Yes, I would like to subscribe")
Send("m") ; mr
Send("{TAB}")
Send("USER")
Send("{TAB}")
Send("NAME")
Send("{TAB}")
Send("EMAIL@ADDRESS")
Send("{TAB}")
Send("EMAIL@ADDRESS")
Send("!n") ;next

WinWaitActive("Avira Premium Security Suite license wizard","License information")
Send("!n")


WinWaitActive($windowsname,"The installation of Premium Security Suite was")
Send("{SPACE}") ; don't open README
Send("{TAB}")
Send("{SPACE}") ; finish

$windowsname2 = "Configuration wizard"

WinWaitActive($windowsname2,"Installation of Avira Premium Security Suite is")
Send("!n")

WinWaitActive($windowsname2,"Activate AHeAD")
Send("!n")

WinWaitActive($windowsname2,"Premium Security Suite not only detects")
Send("!n")

WinWaitActive($windowsname2,"You can define standard rules")
Send("{SPACE}") ; allow external network access
Send("!n")

WinWaitActive($windowsname2,"default setting where")
Send("!n")

WinWaitActive($windowsname2,"We recommend that you now run a short system scan")
Send("{SPACE}") ; uncheck system scan
Send("!n")

WinWaitActive($windowsname2,"You have now specified the basic configuration")
Send("{SPACE}") ; finish

WinWaitActive("Setup of Avira Premium Security Suite","Your computer will now be rebooted.")
;Send("{SPACE}") ; OK
; perhaps instead of rebooting, we can setup a scheduled scan?

#cs
; THE FOLLOWING NEEDS MORE WORK (SCHEDULE SCANS)
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


#ce

;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 


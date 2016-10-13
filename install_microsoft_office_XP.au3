; Press ctrl-q to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
Opt("WinTitleMatchMode", 2) ; Match substrings for titles.  Case sensitive 
 
;***** Office XP ***** 
 
;Run("cmd /c msg %username% /time:01 Office XP ") 
 
Run($CmdLine[1] & "Programs\install\programs\OfficeXP\Disk1of3\SetupPro.exe") 
 
WinWaitActive("Microsoft Office XP Setup", "Product &Key:") 
Send("{TAB 3}") 
Send("your key goes here") 
Send("!n") 
 
WinWaitActive("Microsoft Office XP Setup", "To continue with Office") 
Send("!a") 
Send("!n") 
 
WinWaitActive("Microsoft Office XP Setup", "Installs Microsoft Office") 
Send("!o") 
Send("!n") 
 
WinWaitActive("Microsoft Office XP Setup", "Begin installation") 
WinSetTrans("Microsoft Office", "", 170) ; Make window semi-transparent. 
WinSetTitle("Microsoft Office", "", "P /-\ \/\/ |\| 3 |>    b y    t e h    1 3 3 7      ! ! 1 !     AYBABTU") 
 
Send("!i") 
WinSetTrans("Microsoft Office", "", 170) 
Sleep(1000) 
WinSetTitle("Microsoft Office", "", "P /-\ \/\/ |\| 3 |>    b y    t e h    1 3 3 7      ! ! 1 !     AYBABTU") 
Sleep(10000) 
WinSetTitle("P /-\ \/\/ |\| 3 |>    b y    t e h    1 3 3 7       ! ! 1 !     AYBABTU", "", "There once was a lazy admin") 
Sleep(10000) 
WinSetTitle("There once was a lazy admin", "", "who had no life") 
Sleep(10000) 
WinSetTitle("who had no life", "", "was so lonely, cause he had no wife") 
Sleep(10000) 
WinSetTitle("was so lonely, cause he had no wife", "", "so to spend his time, he wrote stupid little poems") 
Sleep(10000) 
WinSetTitle("so to spend his time, he wrote stupid little poems","","and now you've wasted time that was supposed to be saved") 
Sleep(10000) 
WinSetTitle("and now you've wasted time that was supposed to be saved","","So get back to playing QuakeIII Arena!!!") 
Sleep(10000) 
WinSetTitle("So get back to playing QuakeIII Arena!!!","","P /-\ \/\/ |\| 3 |>    b y    t e h    1 3 3 7      ! ! 1 !") 
 
 
WinWaitActive("Microsoft Office XP Professional") 
Send("{TAB}") 
Send("{SPACE}") 
 
Run($CmdLine[1] & "Programs\install\programs\OfficeXP\OfficeXpSp3-kb832671-fullfile-enu.exe") 
 
WinWaitActive("Office XP Service Pack 3 (SP3) - Admin") 
Send("!y") 
 
WinWaitActive("Office XP Service Pack 3 (SP3) - Admin", "Please read the following license") 
Send("!y") 
 
WinWaitActive("Office XP Service Pack 3 (SP3)", "The update was applied") 
Send("{TAB}") 
Send("{SPACE}") 
 
;registry update 
#cs 
 
[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Outlook\LDAP] 
"NoDisplayNameSearch"=dword:00000001 
 
 how a *.reg file looks: 
 
 ************************************************/ 
 
 REGEDIT4 
 
 [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Java VM\Security] 
 "EditCustomPermissions"=hex:00,00,00,00 
 
 ************************************************ 
 
 
 
 use: 
 RegWrite ( "keyname" [,"valuename", "type", value] ) 
 
 keyname    The registry key to write to. If no other parameters are specified this key will simply be created. 
 valuename    [optional] The valuename to write to. 
 type        The registry key to write to. If no other parameters are specified this key will simply be created. 
 value        [optional] The value to write. 
 
 A registry key must start with "HKEY_LOCAL_MACHINE" ("HKLM")  
    ; or "HKEY_USERS" ("HKU") or "HKEY_CURRENT_USER" ("HKCU")  
    ; or "HKEY_CLASSES_ROOT" ("HKCR") or "HKEY_CURRENT_CONFIG" ("HKCC"). 
 
 AutoIt supports registry keys of type REG_BINARY, REG_SZ,  
    ; REG_MULTI_SZ, REG_EXPAND_SZ, and REG_DWORD. 
 
 RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE", "TestKey", "REG_SZ", "Hello this is a test") 
 
[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Outlook\LDAP] 
"NoDisplayNameSearch"=dword:00000001 
 
#ce 
 
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Outlook\LDAP", "NoDisplayNameSearch", "dword", 00000001) 
 
;patch 
Run("cmd /c """ & $CmdLine[1] & "Programs\install\programs\OfficeXP\OLKINTL.msp"" ") 
 
WinWaitActive("Office XP Setup", "Microsoft Office Setup has completed") 
Send("{ENTER}") 
 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF 

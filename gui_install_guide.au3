; Press Esc to terminate script 
HotKeySet("^q", "Terminate") 
 
AutoItSetOption ( "TrayIconDebug", 1 ) 
#include <GUIConstants.au3> 
;Opt("WinTitleMatchMode", 2) 
 
;*********************************************************************** 
;*** figure out which drive is cd rom *** 
; use: FileExists("path");success returns 1 (true is non-zero) 
Select 
    Case FileExists("d:\marker") ; a file that is on the CD 
         $cdrom="d:\" 
    Case FileExists("e:\marker") 
         $cdrom="e:\" 
EndSelect 
 
;*********************************************************************** 
;*** play a sound to alert the end-user *** 
; [would be better if it were a system beep (chr(7)), since computer probably won't have speakers 
;SoundPlay("startup_edited.wav") 
SoundPlay("C:\WINDOWS\Media\tada.wav") ; a sound to alert the user that the GUI is available 
 
;*********************************************************************** 
;*** create the gui window *** 
;gui window dimensions 
; note: these numbers are without the WindowTitle and without the shading bars 
; note: these are used later. Don't delete them 
$guiLeft=335 
$guiHeight=400 
 
GuiCreate("Which programs do you want?", $guiLeft, $guiHeight) 
;GUICtrlCreateInput ( "text", left, top [, width [, height [, style [, exStyle]]]] ) 
 
;*********************************************************************** 
;*** check box height variables *** 
$left = 10 
$top = 75 
$width = 200 
$height = 20 
 
$leftki = 220 ; ki = keep installer 
 
;*********************************************************************** 
;*** browse to file function to select installer *** 
;use: FileOpenDialog ( "title", "init dir", "filter" [, options [, "default name"]] ) 
Func openFile() 
    $message = "Hold down Ctrl or Shift to choose multiple files." 
 
    $var = FileOpenDialog($message, "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "All (*.*)", 1 + 2 ) 
    ; that weird-ass string is the CLSID value for "my computer" 
    If @error Then 
        MsgBox(4096,"Damn","No File(s) chosen") 
    Else 
        ;$var = StringReplace($var, "|", @CRLF) ; unnecessary because I didn't say 1+4 in FileOpenDialog 
        MsgBox(4096,"Nice","You chose " & $path) 
    EndIf 
    Return($path) 
EndFunc 
 
;*********************************************************************** 
;*** checkbox functions *** 
 
#cs 
the "checkbox" function creates the checkboxes 
the $ProgramName identifies the verbal name of the program being installed 
the $programNumber is the numeric identification, also used for alignment/dimensions/spacing 
the $installerlocation is where the install will be from, usually the $cdrom 
#ce 
func programCheckbox($ProgramName,$ProgramNumber,$InstallerLocation) 
 
;problem: my "$ProgramInstall" variable is generic to every button!!! 
    $ProgramInstall = GuiCtrlCreateCheckbox($ProgramName, $left, ($top+($ProgramNumber*20)), $width, $height)  
    ;creation and location of checkbox based on program name and number 
    GuiCtrlSetState(-1, $GUI_CHECKED) ; all programs listed will by default be installed 
    GUICtrlSetTip(-1,"Do you want to install " & $ProgramName & "?") ; on mouse-over 
 
    Return($ProgramInstall) 
EndFunc 
 
Func kiCheckbox($ProgramName,$ProgramNumber) 
 
    $ProgramKI = GuiCtrlCreateCheckbox("Keep Installer?", $leftki, ($top+($ProgramNumber*20)), $width, $height) 
    GuiCtrlSetState(-1, $GUI_UNCHECKED) 
    GUICtrlSetTip(-1,"Do you want to move the installer for " & @CR & $ProgramName & @CR & "to the hard drive?") 
     
    Return($ProgramKI) 
EndFunc 
 
;*** list the buttons *** 
 
programCheckbox("Adobe Acrobat Reader 7.05", 0, "adobe_acrobat7.exe") 
kiCheckbox("Adobe Acrobat Reader 7.05", 0) 
 
programCheckbox("Custom Boot Screen", 1, "bootscreen.exe") 
kiCheckbox("Custom Boot Screen", 1) 
 
programCheckbox("SpybotSD1.4", 2, "spybotSD1.4.exe") 
kiCheckbox("SpybotSD1.4", 2) 
 
programCheckbox("Sample Program Name", 3, "sample.exe") 
kiCheckbox("Sample Program Name", 3) 
 
#cs 
better idea: use a for loop to load the checkboxes 
 
need an array of size i,  
$programName[] 
$executable[] 
 
use: 
For <variable> = <start> To <stop> [Step <stepval>] 
    statements 
    ... 
Next 
;#ce 
 
For programcounter=0 To ?size of array? Step 1 
        programCheckbox($name[programcounter], programcounter,$executable[programcounter]) 
        kiCheckbox($name[programcounter], programcounter) 
Next 
#ce 
 
;here's a checkbox that's not a function call 
$ProgramNumber = 3 
$ProgramName="Sample Program Name" 
$SampleProgramInstall = GuiCtrlCreateCheckbox($ProgramName, $left, ($top+($ProgramNumber*20)), $width, $height) 
GuiCtrlSetState(-1, $GUI_CHECKED) 
GUICtrlSetTip(-1,"Do you want to install " & $ProgramName & "?") 
 
$SampleProgramKI = GuiCtrlCreateCheckbox("Keep Installer?", $leftki, ($top+($ProgramNumber*20)), $width, $height) 
GuiCtrlSetState(-1, $GUI_UNCHECKED) 
GUICtrlSetTip(-1,"Do you want to installer for " & $ProgramName & "?") 
 
 
;*********************************************************************** 
;*** progress bar *** 
$progressWidth=200 
$progressLeft=(($guiLeft/2)-($progressWidth/2)) 
 
$ButtonWidth=70 
$ButtonLeft=(($guiLeft/2)-($ButtonWidth/2)) 
 
$progressbar = GUICtrlCreateProgress ($progressLeft,10,$progressWidth,20,$PBS_SMOOTH) ; left, top, width, height 
$button = GUICtrlCreateButton ("&Pause",$ButtonLeft,40,$ButtonWidth,24) 
GUICtrlSetTip(-1,"Would you like to make changes to the default choices?" & @CR & " " & @CR & "This is a limited time offer.") 
GUISetState () 
 
$wait = 40; wait 40ms for next progressstep 
$s = 0; progressbar-saveposition 
 
;*********************************************************************** 
;*** rather complex progress-bar interupt *** 
 
For $i = $s To 100 
    $msg = GUIGetMsg () 
    If $msg = -3 Then ; -3 is the X (close)  
        MsgBox(0,"Try again!","This choice isn't an option",3) 
        ;Exit ; kills the GUI 
    EndIf 
     
    If $msg = $button Then ; if the button is clicked then do sumthin' 
        GUICtrlSetData ($button,"Pause") ; this is what happens if the button is clicked. 
        ;MsgBox(0, "Just in time", "You hit the pause button",5) 
        ExitLoop ;user interacted, exit the pause part 
    Else 
        $s=0 
        GUICtrlSetData ($progressbar,$i) ; increment the progress bar to $i 
        Sleep($wait) ;wait time until the next loop of "for-next" 
    EndIf 
Next 
     
If $i >100 then 
    MsgBox(0,"You didn't interact","The default configuration will be taken",3) 
    Exit ; user didn't interact, [formerly used 'ExitLoop' 
Endif 
;*** end  of progress bar *** 
 
;*********************************************************************** 
;*** start of continue button, checkbox options *** 
 
; Continue BOTTON.  created once the pause interaction is done 
$continue = GUICtrlCreateButton ("&Continue",$ButtonLeft,370,$ButtonWidth,24) 
GUICtrlSetTip(-1,"keep on keepin' on") 
 
;*********************************************************************** 
; GUI MESSAGE LOOP 
GUISetState () ;When windows are created they are intially hidden so you must use this function to display them  
 
$installSampleProgramInstall="yes" ; default config 
 
; Run the GUI until the dialog is closed 
While 1=1 
    $msg = GUIGetMsg() ;Polls the GUI to see if any events have ocurred. 
    If $msg = -3 Then ; the X was pressed 
        ExitLoop 
    EndIf 
     
    Select 
        Case $msg = $SampleProgramInstall 
            $installSampleProgramInstall="no" 
        Case $msg = $SampleProgramKI 
            $installSampleProgramInstall="yes" 
    EndSelect 
 
 
    If $msg = $continue Then ; continue button was clicked 
        ExitLoop 
    EndIf 
 
Wend ; that was the loop to put up the gui and poll for OK button 
 
;after we are done, get the checkboxes' status 
 
GUIDelete() ;gets rid of gui 
$msg = GUIGetMsg() 
;*** Figure out what buttons were checked, uncheck at time of "done" (timeout or continue or X) *** 
 
 
Select 
    Case $installSampleProgramInstall=="no" 
        Run("cmd /c echo dont install program >> todo.log") 
    Case $installSampleProgramInstall=="yes" 
        Run("cmd /c echo install program >> todo.log") 
 
EndSelect 
 
;*** End of program list *** 
 
;This is the "terminate" function on the "Esc" hotkey 
Func Terminate() 
    Exit 0 
EndFunc 
 
;EOF


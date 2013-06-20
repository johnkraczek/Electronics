
#include 'CommMG.au3'
#include 'MainForm.au3'
#include 'setupSerial.au3'

$spd = 1000
Global $sec, $msg
sleep(3000)
SetupSerial($spd)
SetupLog()

$timer = timerinit()
$log = FileOpen("Electronics_Log.csv",9)
If $log = -1 Then
    MsgBox(0, "Error", "Unable to open Log File Please be sure to close the Log File.")
    Exit
EndIf
While 1
	  updateBox()	
	if timerdiff($timer) > $sec then
	   LogData()
	   $timer = timerinit()
	EndIf
WEnd


func SetupLog()
   $sec = iniread("ControllerOptions","Log","speed",30001)
   if $sec = 30001 then
	  $sec = inputbox("Log Speed?","What is the Default log Speed (in seconds)?",30)
	  $sec = $sec *1000
	  iniwrite("ControllerOptions","Log","speed",$sec)
   EndIf
EndFunc

func LogData() 
   ;$logVar = GUICtrlRead($Input9)
   ;FileWriteLine($log, @WDAY&"/"&@MON&"/"&@YEAR&" "&@HOUR&":"&@MIN&":"&@SEC&","& $logVar)
endfunc

Func updateBox()
   $msg = _CommGetLine()
	if $msg <> "" Then
	   $j = stringleft($msg,1)
	   if $j = "A" OR $j="B"OR $j="C"OR $j="D"OR $j="E"OR $j="F" Then
	   Guictrlsetdata($recieveBox,$msg & @crlf & guictrlread($recieveBox))
	   Else
		 $k = stringsplit($msg," ")
		 ;MsgBox(0,0,"|"&$k[0]&"|"&$k[1]&"|"&$k[2])
		if $k[1] = "S1" Then
		   ;msgbox(0,0,"Going to set progress to" & $k[2])
		   GuiCtrlSetData($Progress1,$k[2])
			updates1()
		EndIf
	   EndIf
	EndIf
 endfunc
 
 func updateS1()
	  $tag = guictrlread($Combo1)
	  $scale = guictrlread($Input7)
	  $const = guictrlread($Input8)
	  $value = guictrlread($Progress1)
	  $Fvalue = ($value*$scale)/20+$const
	  guictrlsetdata($input9,$Fvalue & " " & $tag)
   EndFunc


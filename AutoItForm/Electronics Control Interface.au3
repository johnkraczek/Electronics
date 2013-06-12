
#include 'CommMG.au3'
#include 'MainForm.au3'
#include 'setupSerial.au3'


Global $sec, $spd = 200


SetupLog()
SetupSerial($spd)
$timer = timerinit()
$log = FileOpen("Electronics_Log.csv",9)
If $log = -1 Then
    MsgBox(0, "Error", "Unable to open Log File Please be sure to close the Log File.")
    Exit
EndIf

While 1
   sleep($spd)
		$msg = _CommGetstring()
	 ; msgbox(0,0,$msg,10)
	  
	if $msg <> "" Then
	   Guictrlsetdata($recieveBox,$msg & @crlf & guictrlread($recieveBox))
	   msgbox(0,0,$msg)
	EndIf
	
	
	
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
   FileWriteLine($log, @WDAY&"/"&@MON&"/"&@YEAR&" "&@HOUR&":"&@MIN&":"&@SEC&","&$Input9)
endfunc



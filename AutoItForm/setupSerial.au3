func SetupSerial($spd)
 ;Internal for the Serial UDF
Global $sportSetError = ''
;COM Vars

$com = iniread("ControllerOptions","ComInterface","ComPort",0)
if $com <> 0 Then
Global $CMPort = $com ; Port
Global $CmBoBaud = 9600 ; Baud
Global $CmboDataBits = 8 ; Data Bits
Global $CmBoParity = "none" ; Parity
Global $CmBoStop = 1 ; Stop
Global $setflow = 2 ; Flow
 
;Start up communication with the Arduino
_CommSetPort($CMPort, $sportSetError, $CmBoBaud, $CmboDataBits, $CmBoParity, $CmBoStop, $setflow)
;check to see if we are talking

sleep($spd+100)

if $fPortOpen <> False then

_CommSendstring("S")
sleep($spd+100)
$Return = _CommGetLine()
if $Return <> "O" Then
   Guictrlsetdata($recieveBox,"There was no response from the"& @crlf &" Arduino, try choosing the correct "& @crlf &"COM Port."& @crlf &" you might also try closing "& @crlf &"any other application that"& @crlf &" might be using that"& @crlf &" com port."&@crlf)
Else
   Guictrlsetdata($recieveBox, "We Recieved a Response From the Arduino and your good to go!"&@crlf)
EndIf

else 
   msgbox(0,"Unable to open Com", "We Were unable to open the Com Port  "& @crlf &" Please Check your Connection and try Again")
EndIf

Else
   SetComport($spd)
EndIf


EndFunc

func SetComPort($spd)
$com = InputBox("Pick Com Port","Please select the COM port for your computer",3)
iniwrite("ControllerOptions","ComInterface","ComPort",$com)
SetupSerial($spd)
EndFunc
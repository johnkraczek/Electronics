func SetupSerial()
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

sleep(50)

if $fPortOpen <> False then

_CommSendstring("S")
$Return =_CommReadChar()
if $Return = "O" Then
   msgbox(0,"No response Recieved", "There was no response from the Arduino,"& @crlf &" try choosing the correct COM Port" & @crlf & "you might also try closing any other application"& @crlf &" that might be using that com port.")
Else
   msgbox(0,"Online", "We Recieved a Response From the Arduino and your good to go!")
EndIf

else 
   msgbox(0,"Unable to open Com", "We Were unable to open the Com Port  "& @crlf &" Please Check your Connection and try Again")
EndIf

Else
   SetComport()
EndIf


EndFunc

func SetComPort()
$com = InputBox("Pick Com Port","Please select the COM port for your computer",3)
iniwrite("ControllerOptions","ComInterface","ComPort",$com)
SetupSerial()
EndFunc
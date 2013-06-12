func SetupSerial()
 ;Internal for the Serial UDF
Global $sportSetError = ''

;COM Vars

$com = iniread("SerialEmulator","ComInterface","ComPort",0)
if $com <> 0 Then
Global $CMPort = $com ; Port
Global $CmBoBaud = 9600 ; Baud
Global $CmboDataBits = 8 ; Data Bits
Global $CmBoParity = "none" ; Parity
Global $CmBoStop = 1 ; Stop
Global $setflow = 2 ; Flow
 

_CommSetPort($CMPort, $sportSetError, $CmBoBaud, $CmboDataBits, $CmBoParity, $CmBoStop, $setflow)
;check to see if we are talking

Else
   SetComPort()
   SetupSerial()
EndIf

EndFunc

func SetComPort()
$com = InputBox("Pick Com Port","Please select the COM port for your computer",4)
iniwrite("SerialEmulator","ComInterface","ComPort",$com)
SetupSerial()
EndFunc
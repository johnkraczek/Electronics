#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include 'CommMG.au3'

;Internal for the Serial UDF
Global $sportSetError = ''
$com = InputBox("Pick Com Port","Please select the COM port for your computer",3)
;COM Vars
Global $CMPort = $com ; Port
Global $CmBoBaud = 9600 ; Baud
Global $CmboDataBits = 8 ; Data Bits
Global $CmBoParity = "none" ; Parity
Global $CmBoStop = 1 ; Stop
Global $setflow = 2 ; Flow
 
;Start up communication with the Arduino
_CommSetPort($CMPort, $sportSetError, $CmBoBaud, $CmboDataBits, $CmBoParity, $CmBoStop, $setflow)



Opt("GUIOnEventMode", 1)
global $data
#Region ### START Koda GUI section ### Form=c:\users\john\documents\github\electronics\koda\electronics control interface.kxf
$Form1_1 = GUICreate("Electrolizer Control Interface", 615, 438, 305, 149)
$MenuItem3 = GUICtrlCreateMenu("&File")
GUICtrlSetOnEvent(-1, "MenuItem3Click")
$MenuItem1 = GUICtrlCreateMenuItem("Load", $MenuItem3)
GUICtrlSetOnEvent(-1, "MenuItem1Click")
$MenuItem4 = GUICtrlCreateMenuItem("Save", $MenuItem3)
GUICtrlSetOnEvent(-1, "MenuItem4Click")
$MenuItem5 = GUICtrlCreateMenuItem("Exit", $MenuItem3)
GUICtrlSetOnEvent(-1, "MenuItem5Click")
$MenuItem2 = GUICtrlCreateMenu("&Options")
GUICtrlSetOnEvent(-1, "MenuItem2Click")
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1_1Close")
GUISetOnEvent($GUI_EVENT_MINIMIZE, "Form1_1Minimize")
GUISetOnEvent($GUI_EVENT_MAXIMIZE, "Form1_1Maximize")
GUISetOnEvent($GUI_EVENT_RESTORE, "Form1_1Restore")
$Label1 = GUICtrlCreateLabel("Chamber 1", 32, 73, 55, 17)
GUICtrlSetOnEvent(-1, "Label1Click")
$Label2 = GUICtrlCreateLabel("Chamber 2", 32, 120, 55, 17)
GUICtrlSetOnEvent(-1, "Label2Click")
$Label3 = GUICtrlCreateLabel("Chamber 3", 32, 167, 55, 17)
GUICtrlSetOnEvent(-1, "Label3Click")
$Label4 = GUICtrlCreateLabel("Chamber 4", 32, 214, 55, 17)
GUICtrlSetOnEvent(-1, "Label4Click")
$Label5 = GUICtrlCreateLabel("Chamber 5", 32, 261, 55, 17)
GUICtrlSetOnEvent(-1, "Label5Click")
$Label6 = GUICtrlCreateLabel("Chamber 6", 32, 308, 55, 17)
GUICtrlSetOnEvent(-1, "Label6Click")


$Slider1 = GUICtrlCreateSlider(96, 73, 150, 45)
GUICtrlSetLimit(-1, 250, 0)
GUICtrlSetOnEvent(-1, "Slider1Change")
$Slider2 = GUICtrlCreateSlider(96, 120, 150, 45)
GUICtrlSetLimit(-1, 250, 0)
GUICtrlSetOnEvent(-1, "Slider2Change")
$Slider3 = GUICtrlCreateSlider(96, 167, 150, 45)
GUICtrlSetLimit(-1, 250, 0)
GUICtrlSetOnEvent(-1, "Slider3Change")
$Slider4 = GUICtrlCreateSlider(96, 214, 150, 45)
GUICtrlSetLimit(-1, 250, 0)
GUICtrlSetOnEvent(-1, "Slider4Change")
$Slider5 = GUICtrlCreateSlider(96, 261, 150, 45)
GUICtrlSetLimit(-1, 250, 0)
GUICtrlSetOnEvent(-1, "Slider5Change")
$Slider6 = GUICtrlCreateSlider(96, 308, 150, 45)
GUICtrlSetLimit(-1, 250, 0)
GUICtrlSetOnEvent(-1, "Slider6Change")


$Input1 = GUICtrlCreateInput("0", 256, 73, 121, 21)
GUICtrlSetOnEvent(-1, "Input1Change")
GUICtrlSetState(-1, $GUI_DISABLE)
$Input2 = GUICtrlCreateInput("0", 256, 120, 121, 21)
GUICtrlSetOnEvent(-1, "Input2Change")
GUICtrlSetState(-1, $GUI_DISABLE)
$Input3 = GUICtrlCreateInput("0", 256, 167, 121, 21)
GUICtrlSetOnEvent(-1, "Input3Change")
GUICtrlSetState(-1, $GUI_DISABLE)
$Input4 = GUICtrlCreateInput("0", 256, 214, 121, 21)
GUICtrlSetOnEvent(-1, "Input4Change")
GUICtrlSetState(-1, $GUI_DISABLE)
$Input5 = GUICtrlCreateInput("0", 256, 261, 121, 21)
GUICtrlSetOnEvent(-1, "Input5Change")
GUICtrlSetState(-1, $GUI_DISABLE)
$Input6 = GUICtrlCreateInput("0", 256, 308, 121, 21)
GUICtrlSetOnEvent(-1, "Input6Change")
GUICtrlSetState(-1, $GUI_DISABLE)


$Slider7 = GUICtrlCreateSlider(151, 14, 150, 45)
GUICtrlSetLimit(-1, 250, 0)
GUICtrlSetOnEvent(-1, "Slider7Change")
$Label7 = GUICtrlCreateLabel("MASTER", 78, 21, 49, 17)
GUICtrlSetOnEvent(-1, "Label7Click")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	Sleep(100)
WEnd

Func Form1_1Close()
exit(0)
EndFunc

Func MenuItem1Click()

EndFunc
Func MenuItem2Click()

EndFunc
Func MenuItem3Click()

EndFunc
Func MenuItem4Click()

EndFunc
Func MenuItem5Click()
exit(0)
EndFunc
Func Slider1Change($data)
   
   if $data = "" then 
	 $sldr = guictrlread($slider1)
   else 
	  guictrlsetdata($slider1,$data)
	  $sldr = $data
   EndIf
   guictrlsetdata($input1,$sldr)
;Output this to the Arduino
$SendText = 'A' & $sldr
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText)

EndFunc
Func Slider2Change($data)
      if $data = "" then 
	 $sldr = guictrlread($slider2)
   else 
	  ;guictrlsetdata($slider1,$data)
	  guictrlsetdata($slider2,$data)
	  $sldr = $data
   EndIf
   guictrlsetdata($input2,$sldr)
;Output this to the Arduino
$SendText = 'B' & $sldr
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText)

EndFunc
Func Slider3Change($data)
      if $data = "" then 
	 $sldr = guictrlread($slider3)
   else 
	  ;guictrlsetdata($slider1,$data)
	  guictrlsetdata($slider3,$data)
	  $sldr = $data
   EndIf
   guictrlsetdata($input3,$sldr)
;Output this to the Arduino
$SendText = 'C' & $sldr
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText)

EndFunc
Func Slider4Change($data)
   if $data = "" then 
	 $sldr = guictrlread($slider4)
   else 
	  ;guictrlsetdata($slider1,$data)
	  guictrlsetdata($slider4,$data)
	  $sldr = $data
   EndIf
   guictrlsetdata($input4,$sldr)
;Output this to the Arduino
$SendText = 'D' & $sldr
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText)
EndFunc
Func Slider5Change($data)
   if $data = "" then 
	 $sldr = guictrlread($slider5)
   else 
	  ;guictrlsetdata($slider1,$data)
	  guictrlsetdata($slider5,$data)
	  $sldr = $data
   EndIf
   guictrlsetdata($input5,$sldr)
;Output this to the Arduino
$SendText = 'E' & $sldr
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText)
EndFunc
Func Slider6Change($data)
   if $data = "" then 
	 $sldr = guictrlread($slider6)
   else 
	  ;guictrlsetdata($slider1,$data)
	  guictrlsetdata($slider6,$data)
	  $sldr = $data
   EndIf
   guictrlsetdata($input6,$sldr)
;Output this to the Arduino
$SendText = 'F' & $sldr
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText)
EndFunc

Func Slider7Change()
   $spd = 10
Slider1Change(guictrlread($slider7))
sleep($spd)
Slider2Change(guictrlread($slider7))
sleep($spd)
Slider3Change(guictrlread($slider7))
sleep($spd)
Slider4Change(guictrlread($slider7))
sleep($spd)
Slider5Change(guictrlread($slider7))
sleep($spd)
Slider6Change(guictrlread($slider7))
sleep($spd)

EndFunc

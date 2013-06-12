#include <ProgressConstants.au3>
#include <EditConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiScrollBars.au3>
#include <ScrollBarConstants.au3>
Opt("GUIOnEventMode", 1)
global $data
#Region ### START Koda GUI section ### Form=c:\users\john\documents\github\electronics\koda\electronics control interface.kxf
$Form1_1 = GUICreate("Electrolizer Control Interface", 615, 500, 305, 149)

$MenuItem1 = GUICtrlCreateMenu("&File")
GUICtrlSetOnEvent(-1, "MenuItem1Click")

;i removed the Connect button because i incorperated the connect
;sequence when you start the application and when you change the com port. 
;
;$MenuItem2 = GUICtrlCreateMenuItem("Connect", $MenuItem1)
;GUICtrlSetOnEvent(-1, "MenuItem2Click")
$MenuItem3 = GUICtrlCreateMenuItem("ChangeComPort", $MenuItem1)
GUICtrlSetOnEvent(-1, "MenuItem3Click")
$MenuItem6 = GUICtrlCreateMenuItem("Change Log Speed", $MenuItem1)
GUICtrlSetOnEvent(-1, "MenuItem6Click")
$MenuItem4 = GUICtrlCreateMenuItem("Exit", $MenuItem1)
GUICtrlSetOnEvent(-1, "MenuItem4Click")
$MenuItem5 = GUICtrlCreateMenu("&Options")
GUICtrlSetOnEvent(-1, "MenuItem5Click")
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1_1Close")
GUISetOnEvent($GUI_EVENT_MINIMIZE, "Form1_1Minimize")
GUISetOnEvent($GUI_EVENT_MAXIMIZE, "Form1_1Maximize")
GUISetOnEvent($GUI_EVENT_RESTORE, "Form1_1Restore")
$Label1 = GUICtrlCreateLabel("Chamber 1", 32, 73, 55, 17)
$Label2 = GUICtrlCreateLabel("Chamber 2", 32, 120, 55, 17)
$Label3 = GUICtrlCreateLabel("Chamber 3", 32, 167, 55, 17)
$Label4 = GUICtrlCreateLabel("Chamber 4", 32, 214, 55, 17)
$Label5 = GUICtrlCreateLabel("Chamber 5", 32, 261, 55, 17)
$Label6 = GUICtrlCreateLabel("Chamber 6", 32, 308, 55, 17)


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
GUICtrlSetState(-1, $GUI_DISABLE)
$Input2 = GUICtrlCreateInput("0", 256, 120, 121, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$Input3 = GUICtrlCreateInput("0", 256, 167, 121, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$Input4 = GUICtrlCreateInput("0", 256, 214, 121, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$Input5 = GUICtrlCreateInput("0", 256, 261, 121, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$Input6 = GUICtrlCreateInput("0", 256, 308, 121, 21)
GUICtrlSetState(-1, $GUI_DISABLE)

$Slider7 = GUICtrlCreateSlider(151, 14, 150, 45)
GUICtrlSetLimit(-1, 250, 0)
GUICtrlSetOnEvent(-1, "Slider7Change")
$Label7 = GUICtrlCreateLabel("MASTER", 78, 21, 49, 17)
GUICtrlSetOnEvent(-1, "Label7Click")

$recieveBox = GUICtrlCreateEdit("", 400, 75, 200, 275)
GUICtrlSetState(-1, $GUI_DISABLE)
$send = GUICtrlCreateInput("", 450, 20, 150, 20)
$btn1 = GUICtrlCreateButton("Send", 400, 20, 40, 20)
GUICtrlSetOnEvent(-1, "Button1Click")


$Progress1 = GUICtrlCreateProgress(96, 368, 200, 17)
$Label8 = GUICtrlCreateLabel("Sensor 1", 33, 371, 46, 17)
GUICtrlSetOnEvent(-1, "Label8Click")
$Combo1 = GUICtrlCreateCombo("Volts", 96, 413, 49, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Amps|Full")
GUICtrlSetOnEvent(-1, "Combo1Change")
$Label9 = GUICtrlCreateLabel("Tag", 98, 393, 23, 17)
GUICtrlSetOnEvent(-1, "Label9Click")
$Input7 = GUICtrlCreateInput("", 170, 413, 49, 21)
guictrlsetdata(-1,1)
GUICtrlSetOnEvent(-1, "Input7Change")
$Label10 = GUICtrlCreateLabel("Scale", 173, 393, 39, 17)
GUICtrlSetOnEvent(-1, "Label10Click")
$Input8 = GUICtrlCreateInput("", 244, 413, 49, 21)
GUICtrlSetOnEvent(-1, "Input8Change")
guictrlsetdata(-1,0)
$Label11 = GUICtrlCreateLabel("Constant", 249, 393, 46, 17)
GUICtrlSetOnEvent(-1, "Label11Click")
$Label12 = GUICtrlCreateLabel("Value:", 310, 353, 34, 17)
GUICtrlSetOnEvent(-1, "Label12Click")
$Input9 = GUICtrlCreateInput("", 305, 375, 100, 21)
GUICtrlSetOnEvent(-1, "Input9Change")
GUICtrlSetState(-1, $GUI_DISABLE)


GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


Func Form1_1Close()
   
FileClose($log)
_CommClosePort()
exit(0)
EndFunc

Func MenuItem1Click()

EndFunc
Func MenuItem2Click()
SetupSerial()
EndFunc
Func MenuItem3Click()
SetComPort($spd)
EndFunc
Func MenuItem4Click()
FileClose($log)
_CommClosePort()
exit(0)
EndFunc
Func MenuItem5Click()
EndFunc
func MenuItem6Click()
   $sec = inputbox("Log Speed?","What is the Default log Speed (in seconds)?",30)
   $sec = $sec *1000
   iniwrite("ControllerOptions","Log","speed",$sec)
EndFunc

func Button1Click()
   _CommSendString(GUICtrlRead($send),1)
   GUICtrlSetData($send,"")
EndFunc

func Combo1Change()
UpdateS1()
EndFunc

func Input7Change()
UpdateS1()
EndFunc

func Input8Change()
UpdateS1()
EndFunc

Func Slider1Change($data)
   
   if $data = "" then 
	 $sldr = guictrlread($slider1)
   else 
	  guictrlsetdata($slider1,$data)
	  $sldr = $data
   EndIf
   guictrlsetdata($Input1,$sldr)
;Output this to the Arduino
$SendText = 'A' & $sldr & " "
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText,1)

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
$SendText = 'B' & $sldr & " " & @crlf
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText,1)

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
$SendText = 'C' & $sldr & " "
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText,1)

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
$SendText = 'D' & $sldr & " "
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText,1)
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
$SendText = 'E' & $sldr & " "
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText,1)
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
$SendText = 'F' & $sldr & " "
;msgbox(0,"commands",$SendText)
_CommSendstring($SendText,1)
EndFunc

Func Slider7Change($spd)
   $setVal = guictrlread($slider7)
   if $setVal = 0 Then
 	  $setVal = "0"
   EndIf
   _CommClearOutputBuffer()
Slider1Change($setVal)
sleep($spd)
updateBox()
Slider2Change($setVal)
sleep($spd)
updateBox()
Slider3Change($setVal)
sleep($spd)
updateBox()
Slider4Change($setVal)
sleep($spd)
updateBox()
Slider5Change($setVal)
sleep($spd)
updateBox()
Slider6Change($setVal)
sleep($spd)
updateBox()

EndFunc

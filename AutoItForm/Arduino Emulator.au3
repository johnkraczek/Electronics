#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include 'CommMG.au3'
#include 'serialEmulator.au3'

SetupSerial()

Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=C:\Users\kraczekj\Documents\GitHub\Electronics\Koda\Arduino Emulator.kxf
$Form1 = GUICreate("Form1", 329, 492, 192, 124)
$MenuItem1 = GUICtrlCreateMenu("File")
GUICtrlSetOnEvent(-1, "MenuItem1Click")
$MenuItem2 = GUICtrlCreateMenuItem("ChangePort", $MenuItem1)
GUICtrlSetOnEvent(-1, "MenuItem2Click")
$MenuItem3 = GUICtrlCreateMenuItem("Exit", $MenuItem1)
GUICtrlSetOnEvent(-1, "MenuItem3Click")
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
GUISetOnEvent($GUI_EVENT_MINIMIZE, "Form1Minimize")
GUISetOnEvent($GUI_EVENT_MAXIMIZE, "Form1Maximize")
GUISetOnEvent($GUI_EVENT_RESTORE, "Form1Restore")
$Input1 = GUICtrlCreateInput("", 72, 16, 121, 21)
GUICtrlSetOnEvent(-1, "Input1Change")
$Label1 = GUICtrlCreateLabel("Send", 24, 16, 29, 17)
GUICtrlSetOnEvent(-1, "Label1Click")
$recieveBox = GUICtrlCreateEdit("", 72, 88, 225, 353)
GUICtrlSetData($recieveBox, "")
GUICtrlSetOnEvent(-1, "recieveBoxChange")
$Label2 = GUICtrlCreateLabel("Data", 16, 96, 27, 17)
GUICtrlSetOnEvent(-1, "Label2Click")
$Button1 = GUICtrlCreateButton("Send", 216, 16, 75, 25)
GUICtrlSetOnEvent(-1, "Button1Click")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$msg = _CommGetstring()
	if $msg <> "" Then
	  
guictrlsetdata($recieveBox,"Recieved " & $msg & @crlf & guictrlread($recieveBox))
$j = stringleft($msg,1)
$k = stringtrimleft($msg,1)

		  Select
		  case  $j = "A"
			 _CommSendString("A @ "& $k)
			 guictrlsetdata($recieveBox,"Sent A @"& $k & @crlf & guictrlread($recieveBox))
		  case  $j = "B"
			 _CommSendString("B @ "& $k)
			 guictrlsetdata($recieveBox,"Sent B @"& $k& @crlf & guictrlread($recieveBox))
		  case  $j = "C"
			 _CommSendString("C @ "& $k)
			 guictrlsetdata($recieveBox,"Sent C @"& $k& @crlf & guictrlread($recieveBox))
		  case  $j = "D"
			 _CommSendString("D @ "& $k)
			 guictrlsetdata($recieveBox,"Sent D @"& $k& @crlf & guictrlread($recieveBox))
		  case  $j = "E"
			 _CommSendString("E @ "& $k)
			 guictrlsetdata($recieveBox,"Sent E @"& $k& @crlf & guictrlread($recieveBox))
		  case  $j = "F"
			 _CommSendString("F @ "& $k)
			 guictrlsetdata($recieveBox,"Sent F @"& $k& @crlf & guictrlread($recieveBox))

	case $msg = "S"
	   _CommSendString("O")
	   guictrlsetdata($recieveBox,"Sent O"& $k& @crlf & guictrlread($recieveBox))
	   EndSelect
	  
	EndIf
WEnd

Func Button1Click()
_CommSendString(guictrlread($Input1))
guictrlsetdata($Input1,"")
EndFunc

Func Form1Close()
exit(0)
EndFunc

Func MenuItem2Click()
SetComPort()
EndFunc
Func MenuItem3Click()
exit(0)
EndFunc



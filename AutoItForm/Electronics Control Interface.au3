#include <GUIConstantsEx.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Electrolizer Control Interface", 615, 438, 305, 149)
$MenuItem3 = GUICtrlCreateMenu("File")
GUICtrlSetOnEvent(-1, "MenuItem3Click")
$MenuItem1 = GUICtrlCreateMenuItem("Load", $MenuItem3)
GUICtrlSetOnEvent(-1, "MenuItem1Click")
$MenuItem4 = GUICtrlCreateMenuItem("Save", $MenuItem3)
GUICtrlSetOnEvent(-1, "MenuItem4Click")
$MenuItem5 = GUICtrlCreateMenuItem("Exit", $MenuItem3)
GUICtrlSetOnEvent(-1, "MenuItem5Click")
$MenuItem2 = GUICtrlCreateMenu("Options")
GUICtrlSetOnEvent(-1, "MenuItem2Click")
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
GUISetOnEvent($GUI_EVENT_MINIMIZE, "Form1Minimize")
GUISetOnEvent($GUI_EVENT_MAXIMIZE, "Form1Maximize")
GUISetOnEvent($GUI_EVENT_RESTORE, "Form1Restore")
$Label1 = GUICtrlCreateLabel("Chamber 1", 32, 41, 55, 17)
GUICtrlSetOnEvent(-1, "Label1Click")
$Label2 = GUICtrlCreateLabel("Chamber 2", 32, 88, 55, 17)
GUICtrlSetOnEvent(-1, "Label2Click")
$Label3 = GUICtrlCreateLabel("Chamber 3", 32, 135, 55, 17)
GUICtrlSetOnEvent(-1, "Label3Click")
$Label4 = GUICtrlCreateLabel("Chamber 4", 32, 182, 55, 17)
GUICtrlSetOnEvent(-1, "Label4Click")
$Label5 = GUICtrlCreateLabel("Chamber 5", 32, 229, 55, 17)
GUICtrlSetOnEvent(-1, "Label5Click")
$Label6 = GUICtrlCreateLabel("Chamber 6", 32, 276, 55, 17)
GUICtrlSetOnEvent(-1, "Label6Click")
$Slider1 = GUICtrlCreateSlider(96, 33, 150, 45)
GUICtrlSetOnEvent(-1, "Slider1Change")
$Slider2 = GUICtrlCreateSlider(96, 80, 150, 45)
GUICtrlSetOnEvent(-1, "Slider2Change")
$Slider3 = GUICtrlCreateSlider(96, 174, 150, 45)
GUICtrlSetOnEvent(-1, "Slider3Change")
$Slider4 = GUICtrlCreateSlider(96, 221, 150, 45)
GUICtrlSetOnEvent(-1, "Slider4Change")
$Slider5 = GUICtrlCreateSlider(96, 127, 150, 45)
GUICtrlSetOnEvent(-1, "Slider5Change")
$Slider6 = GUICtrlCreateSlider(96, 268, 150, 45)
GUICtrlSetOnEvent(-1, "Slider6Change")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	Sleep(100)
WEnd

Func Form1Close()
exit(0)
EndFunc
Func Form1Maximize()

EndFunc
Func Form1Minimize()

EndFunc
Func Form1Restore()

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



Func Slider1Change()

EndFunc
Func Slider2Change()

EndFunc
Func Slider3Change()

EndFunc
Func Slider4Change()

EndFunc
Func Slider5Change()

EndFunc
Func Slider6Change()

EndFunc

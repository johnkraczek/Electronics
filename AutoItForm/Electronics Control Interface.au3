#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiScrollBars.au3>
#include <ScrollBarConstants.au3>
#include 'CommMG.au3'
#include 'MainForm.au3'
#include 'setupSerial.au3'

$prod = false

if $prod = false then
global $spd = 1000
else 
Global $spd = 100
EndIf

SetupSerial($spd)

While 1
		$msg = _CommGetstring()
	if $msg <> "" Then
	   guictrlsetdata($recieveBox,$msg & @crlf & guictrlread($recieveBox))
	  EndIf
WEnd


; Generated with GUI Maker http://trysohard.info/GUI-Maker/
; Copyright (C) 2016 Tryson Hardie.


#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Local $hGUI = GUICreate("gui", 300, 360)
GUISetState(@SW_SHOW, $hGUI)

Local $txt = GUICtrlCreateEdit("", 20,20, 230,70)

Local $btClear = GUICtrlCreateButton("C", 20,100, 50,36)

Local $btplsMns = GUICtrlCreateButton("±", 80,100, 50,36)

Local $btsqrt = GUICtrlCreateButton("√", 140,100, 50,36)

Local $btpercent = GUICtrlCreateButton("%", 200,100, 50,36)

Local $bt7 = GUICtrlCreateButton("7", 20,145, 50,36)

Local $bt8 = GUICtrlCreateButton("8", 80,145, 50,36)

Local $btdiv = GUICtrlCreateButton("÷", 200,145, 50,36)

Local $bt9 = GUICtrlCreateButton("9", 140,145, 50,36)

Local $bt6 = GUICtrlCreateButton("6", 140,190, 50,36)

Local $bt5 = GUICtrlCreateButton("5", 80,190, 50,36)

Local $btmult = GUICtrlCreateButton("×", 200,190, 50,36)

Local $bt4 = GUICtrlCreateButton("4", 20,190, 50,36)

Local $btmns = GUICtrlCreateButton("-", 200,235, 50,36)

Local $bt1 = GUICtrlCreateButton("1", 20,235, 50,36)

Local $bt3 = GUICtrlCreateButton("3", 140,235, 50,36)

Local $bt2 = GUICtrlCreateButton("2", 80,235, 50,36)

Local $bt0 = GUICtrlCreateButton("0", 20,280, 50,36)

Local $btdot = GUICtrlCreateButton(".", 80,280, 50,36)

Local $btpls = GUICtrlCreateButton("+", 200,280, 50,36)

Local $btenter = GUICtrlCreateButton("=", 140,280, 50,36)

While 1
Switch GUIGetMsg()
Case $GUI_EVENT_CLOSE
ExitLoop
   ;numbers
   Case($bt0)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "0")

   Case($bt1)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "1")
   Case($bt2)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "2")
   Case($bt3)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "3")

   Case($bt4)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "4")
   Case($bt5)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "5")
   Case($bt6)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "6")

   Case($bt7)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "7")
   Case($bt8)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "8")
   Case($bt9)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "9")

   ;operations

   Case($btClear)
        GuiCtrlSetData($txt, "")
   Case($btplsMns)
		$expr = GuiCtrlRead($txt)
		$exprNeg = StringLeft($expr, 1)
		If StringInStr($expr, "-", 0, 1, 1, 1) Then
		   GuiCtrlSetData($txt, StringTrimLeft ( $expr, 1 ))
		 Else
		 GuiCtrlSetData($txt, "-" & $expr)
	  EndIf

   Case($btsqrt)
		$expr = GuiCtrlRead($txt)
        GuiCtrlSetData($txt, Execute(Sqrt($expr)))
   Case($btpercent)
		$expr = GuiCtrlRead($txt)
        GuiCtrlSetData($txt, "(" & GuiCtrlRead($txt) & "/100)*")

   Case($btpls)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "+")
   Case($btmns)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "-")
   Case($btmult)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "*")
   Case($btdiv)
        GuiCtrlSetData($txt, GuiCtrlRead($txt) & "/")

   Case($btdot)
   $expr = GuiCtrlRead($txt)

   If  StringIsDigit($expr) Then
        GuiCtrlSetData($txt, $expr & ".") ; add dot to integer
   ElseIf Not StringIsFloat($expr) Then  ;2.2 + 2
		$aAllNumbers = StringSplit($expr, "+|-|*|/") ; all possible delimiters
		;_ArrayDisplay($aAllNumbers, 'numbers')
		$aLastNumber = $aAllNumbers[$aAllNumbers[0]] ; the last number of expression

	  If StringIsDigit($aLastNumber) Then
		 GuiCtrlSetData($txt, $expr & "."); add dot to integer
	  EndIf

   EndIf

   Case($btenter)
        $expr = GuiCtrlRead($txt)
        GuiCtrlSetData($txt, Execute($expr))

EndSwitch
WEnd


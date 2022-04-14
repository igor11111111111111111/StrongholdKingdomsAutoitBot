Local $centerField
Local $arrowPos
Local $scoutExit
Local $countScoutsPerPos

Func _Scouts_Scouting()
   $centerField = GetCenterField()
   $arrowPos = _IconsSearch_RightArrow()
   _FilterMap_Scout()

   _Private_CountingScouts()
   If $curScouts[$village] = 0 Then
	  Return False
   EndIf

   _CrushCheck_All()

   $coords = _Private_SearchResources()
   ;_ArrayDisplay($coords);
   $countPos = UBound($coords, $UBOUND_ROWS)
   If $countPos = 0 Then
	  Return False
   EndIf
   $countScoutsPerPos = $curScouts[$village] / $countPos
   If $countScoutsPerPos < 1 Then
	  $countScoutsPerPos = 1
   EndIf
   ;MsgBox(0, $countPos, $countScoutsPerPos)

   For $i = 0 To $countPos - 1
	  ;MsgBox(0, "", $countPos)
	  _Private_SendScouts($coords[$i][0], $coords[$i][1])
	  If $curScouts[$village] = 0 Then
		 Return False
	  EndIf
	  _Villages_SelectVillage($village)
	  MouseClick("left", $centerField[0], $centerField[1])
	  Sleep(300)
	  MouseWheel($MOUSE_WHEEL_DOWN, 1)
	  Sleep(500)
	  _CrushCheck_All()
   Next

EndFunc

Func _Private_CountingScouts()
   MouseClick("left", $arrowPos[0], $arrowPos[1] + 30); world icon
   Sleep(300)
   ;MouseClick("left", $arrowPos[0], $arrowPos[1])
   ;Sleep(300)
   MouseClick("left", $centerField[0], $centerField[1])
   Sleep(500)
   MouseClick("left", $centerField[0], $centerField[1])
   Sleep(500)
   Local $scout = _IconsSearch_Scout()
   MouseClick("left", $scout[0], $scout[1])
   Sleep(500)
   MouseClick("left", $centerField[0], $centerField[1], 3)
   Sleep(1000)
   MouseClick("left", $centerField[0], $centerField[1], 3)
   Sleep(500)
   Local $accept = _IconsSearch_Accept()
   If $accept[0] = False Then
	  MouseClick("left", $centerField[0], $centerField[1] + 3, 3)
	  Sleep(500)
	  Local $accept = _IconsSearch_Accept()
   EndIf
   MouseClick("left", $accept[0], $accept[1])
   Sleep(500)
   Local $scout2 = _IconsSearch_Scout2()
   $curScouts[$village] = _ImageScouts_FindNumber()
   Sleep(500)
   $scoutExit = _IconsSearch_Exit()
   MouseClick("left", $scoutExit[0], $scoutExit[1])
   Sleep(500)
EndFunc

Func _Private_SearchResources()
   MouseWheel($MOUSE_WHEEL_DOWN, 1)
   Sleep(1000)
   Return _ImageScoutResources_SearchResources()
EndFunc

Func _Private_SendScouts($coordX, $coordY)
   If $coordX = False Then
	  Return False
   EndIf

   ;MouseMove($coordX, $coordY)
   ;Sleep(1000)
   MouseClick("left", $coordX, $coordY, 5) ; focus
   Sleep(2000)
   MouseClick("left", $centerField[0], $centerField[1], 3)
   Sleep(1000)
   MouseClick("left", $centerField[0], $centerField[1], 3)
   Sleep(1000)
   Local $scout3 = _IconsSearch_Scout3()
   If $scout3[0] = 0 Then
	  ;MsgBox(0, "", "cant find scout3")
	  MouseClick("left", $centerField[0], $centerField[1], 3)
	  Sleep(1000)
	  Local $scout3 = _IconsSearch_Scout3()
   EndIf
   MouseClick("left", $scout3[0], $scout3[1])
   Sleep(1000)

   WinWaitActive("ScoutPopupWindow", "", 2);
   If WinActive("ScoutPopupWindow") = False Then
	  Local $arrowPos = _IconsSearch_RightArrow()
	  MouseClick("left", $arrowPos[0] + 40, $arrowPos[1] + 30); village
	  Sleep(200)
	  MouseClick("left", $arrowPos[0], $arrowPos[1] + 30); world
	  Sleep(200)
	  Return False
   EndIf;
   Local $scout2 = _IconsSearch_Scout2()
   ;ToolTip($curScouts[$village] - $countScoutsPerPos)
   ;MouseClick("left", $scout2[0] - 15, $scout2[1] + 42, $curScouts[$village] - $countScoutsPerPos)
   MouseClick("left", $scout2[0] - 15, $scout2[1] + 42, $curScouts[$village])
   MouseClick("left", $scout2[0] - 15 + 100, $scout2[1] + 42)
   $curScouts[$village] -= 2
   If $curScouts[$village] < 0 Then
	  $curScouts[$village] = 0
   EndIf

   $scoutExit = _IconsSearch_Exit()
   ;MsgBox(0, "$curScouts[$village]", $curScouts[$village])
   MouseClick("left", $scoutExit[0] - 88, $scoutExit[1] + 361) ; send
   Sleep(1000)
   If WinActive("ScoutPopupWindow") Then
	  MouseClick("left", $scoutExit[0], $scoutExit[1])
	  Sleep(200)
   EndIf
EndFunc


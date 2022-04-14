
Func _Banquet_Active()
   If _Private_BanquetCheck() = False Then
	  Return False
   EndIf
   _Private_SelectBanquet()
   Local $exit = _IconsSearch_Exit()
   MouseClick("left", $exit[0] - 189, $exit[1] + 205 + 40 * ($banquetLevel - 1))
   ;MsgBox(0, "", "")
EndFunc

Func _Private_SelectBanquet()
   Local $arrowPos = _IconsSearch_RightArrow()
   MouseClick("left", $arrowPos[0] + 40, $arrowPos[1] + 30); village
   Sleep(200)
   MouseClick("left", $arrowPos[0] + 357, $arrowPos[1] + 63)
   Sleep(500)
EndFunc

Func _Private_BanquetCheck()
   For  $i = 0 To $banquetLevel - 1
	  ;MsgBox(0, $i, $resources[$village][4 + $i])
	  If $resources[$village][4 + $i] = 0 Then
		 Return False
	  EndIf
   Next

   Return True
EndFunc

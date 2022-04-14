

Func _Villages_SelectVillage($index)
   Local $step = 17; betw 2 center panels

   Local $arrowPos = _IconsSearch_RightArrow()
   MouseClick("left", $arrowPos[0] + 60, $arrowPos[1])
   Sleep(500)
   Local $villagesIcon = _IconsSearch_Villages()
   If $villagesIcon[0] = 0 Then
	  MouseClick("left", $arrowPos[0] + 60, $arrowPos[1])
	  Sleep(500)
	  Local $villagesIcon = _IconsSearch_Villages()
   EndIf
   MouseClick("left", $villagesIcon[0], $villagesIcon[1] + 22 + $step * $index)
   Sleep(500)
   $village = $index
EndFunc
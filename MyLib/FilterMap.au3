

Func _FilterMap_Scout()
   Local $arrowPos = _IconsSearch_RightArrow()
   MouseClick("left", $arrowPos[0], $arrowPos[1] + 30); world icon
   Sleep(200)
   Local $activeFilterMap = _IconsSearch_ActiveFilterMap()
   Local $filterMap = _IconsSearch_FilterMap()
   If $activeFilterMap[0] = True Then
	  Return
   ElseIf $filterMap[0] = True Then

   Else
	  ;Debug("FilterMap. Cant find filter icon")
	  Return
   EndIf

   MouseClick("left", $filterMap[0], $filterMap[1])
   Sleep(200)
   Local $offFilterMap = _IconsSearch_OffFilterMap()
   MouseClick("left", $offFilterMap[0], $offFilterMap[1] - 137) ;scout icon
   Sleep(200)
   MouseClick("left", $filterMap[0], $filterMap[1]); exit
   Sleep(200)
EndFunc


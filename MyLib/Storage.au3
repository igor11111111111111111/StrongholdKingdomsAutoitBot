

Func _Storage_CheckResources()
   _Private_Storage_Mouse()
   _ImageStorage_FindAllValues()
EndFunc

Func _Private_Storage_Mouse()
   Local $arrowPos = _IconsSearch_RightArrow()
   MouseClick("left", $arrowPos[0] + 40, $arrowPos[1] + 30); village
   Sleep(200)
   MouseClick("left", $arrowPos[0] + 142, $arrowPos[1] + 63); storage
   Sleep(1000)
EndFunc



Func GetCenterField()
   Local $arrowPos = _IconsSearch_RightArrow()
   Local $righUpCornerMap[2]
   $righUpCornerMap[0] = $arrowPos[0] + 234
   $righUpCornerMap[1] = $arrowPos[1] + 53

   $gameFieldSize = GetGameFieldSize()
   Local $centerField[2]

   $centerField[0] = $righUpCornerMap[0] - ($gameFieldSize[0] / 2)
   $centerField[1] = $righUpCornerMap[1] + ($gameFieldSize[1] / 2)
   Return $centerField
EndFunc

Func GetGameFieldSize()
   $windowSize = WinGetClientSize($titleWorld)
   Local $gameFieldSize[2]
   $gameFieldSize[0] = $windowSize[0] - 200 ; - right panel
   $gameFieldSize[1] = $windowSize[1] - 115 ; - up panel
   Return $gameFieldSize
EndFunc
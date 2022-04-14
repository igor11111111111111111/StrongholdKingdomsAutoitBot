Local $iconsFolder = @ScriptDir & "\ImageSearch\Icons"

Local $mainIcon = $iconsFolder & "\MainIcon.png"
Local $rightArrow = $iconsFolder & "\RightArrow.png"
Local $filterMap = $iconsFolder & "\FilterMap.png"
Local $activeFilterMap = $iconsFolder & "\ActiveFilterMap.png"
Local $offFilterMap = $iconsFolder & "\OffFilterMap.png"
Local $scout = $iconsFolder & "\Scout.png"
Local $scout2 = $iconsFolder & "\Scout2.png"
Local $scout3 = $iconsFolder & "\Scout3.png"
Local $accept = $iconsFolder & "\Accept.png"
Local $exit = $iconsFolder & "\Exit.png"
Local $exit2 = $iconsFolder & "\Exit2.png"
Local $villagesIcon = $iconsFolder & "\Villages.png"
Local $tradersPlace = $iconsFolder & "\TradersPlace.png"
Local $logoutExit = $iconsFolder & "\LogoutExit.png"

Func _IconsSearch_TitleGame()
   Return _ImageSearchPosition($mainIcon)
   ;_ArrayDisplay($pos)
EndFunc

Func _IconsSearch_RightArrow()
   Return _ImageSearchPosition($rightArrow)
EndFunc

Func _IconsSearch_FilterMap()
   Return _ImageSearchPosition($filterMap)
EndFunc

Func _IconsSearch_ActiveFilterMap()
   Return _ImageSearchPosition($activeFilterMap)
EndFunc

Func _IconsSearch_OffFilterMap()
   Return _ImageSearchPosition($offFilterMap)
EndFunc

Func _IconsSearch_Scout()
   Return _ImageSearchPosition($scout)
EndFunc

Func _IconsSearch_Scout2()
   Return _ImageSearchPosition($scout2)
EndFunc

Func _IconsSearch_Scout3()
   Return _ImageSearchPosition($scout3)
EndFunc

Func _IconsSearch_Accept()
   Return _ImageSearchPosition($accept)
EndFunc

Func _IconsSearch_Exit()
   If _ImageSearchPosition($exit)[0] = 0 Then
	  Return _ImageSearchPosition($exit2)
   Else
	  Return _ImageSearchPosition($exit)
   EndIf
EndFunc

Func _IconsSearch_LogoutExit()
   Return _ImageSearchPosition($logoutExit)
EndFunc

Func _IconsSearch_Villages()
   Return _ImageSearchPosition($villagesIcon)
EndFunc

Func _IconsSearch_TradersPlace()
   Return _ImageSearchPosition($tradersPlace)
EndFunc





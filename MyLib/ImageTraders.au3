

Local $imageTraders_traders[10] ; 0 - 9
Local $imageTraders_tradersCountIcon = @ScriptDir & "\ImageSearch\Traders\Panel\CountIcon.png"
Local $imageTraders_slashIcon = @ScriptDir & "\ImageSearch\Traders\Count\Slash.png"

Local $imageTraders_slash[2]

_Private_ImageTraders_InitImages()

Func _Private_ImageTraders_InitImages()
   For $i = 0 To UBound($imageTraders_traders) - 1
	  $imageTraders_traders[$i] = @ScriptDir & "\ImageSearch\Traders\Count\" & $i & ".png"
   Next
EndFunc

Func _ImageTraders_GetCurrent()
   Local $current
   _ImageSearch($imageTraders_slashIcon, 1, $imageTraders_slash[0], $imageTraders_slash[1], 0, 40)
   $imageTraders_slash[0] -= 18
   $current &= _ImageTraders_GetNumber($imageTraders_slash)
   $imageTraders_slash[0] += 9
   $current &= _ImageTraders_GetNumber($imageTraders_slash)
   Return $current
EndFunc

Func _ImageTraders_GetMax()
   Local $max
   _ImageSearch($imageTraders_slashIcon, 1, $imageTraders_slash[0], $imageTraders_slash[1], 0, 40)
   $max &= _ImageTraders_GetNumber($imageTraders_slash)
   $imageTraders_slash[0] += 9
   $max &= _ImageTraders_GetNumber($imageTraders_slash)
   Return $max
EndFunc

Func _ImageTraders_GetNumber($pos)

   ;MouseMove($pos[0] - 2, $pos[1] - 7)
   ;MsgBox(0, "", "")
   ;MouseMove($pos[0] + 9, $pos[1] + 7)
   ;MsgBox(0, "", "")
   For $i = 0 To UBound($imageTraders_traders) - 1
	  if _ImageSearchArea($imageTraders_traders[$i], 1, $pos[0], $pos[1] - 5, $pos[0] + 9, $pos[1] + 5, 0, 0, 0, 50) Then
		 Return $i
	  EndIf
   Next
   Return ""
EndFunc
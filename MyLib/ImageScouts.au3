
Local $imageScouts_numbers[10]

_Private_ImageScouts_InitImages()

Func _Private_ImageScouts_InitImages()
   For $i = 0 To UBound($imageScouts_numbers) - 1
	  $imageScouts_numbers[$i] = @ScriptDir & "\ImageSearch\Scouts\Count\" & $i & ".png"
   Next
EndFunc

Func _ImageScouts_FindNumber()
   Local $scout2 = _IconsSearch_Scout2()
   For $i = 0 To UBound($imageScouts_numbers) - 1
	  $image = _ImageSearchArea($imageScouts_numbers[$i], 1, $scout2[0] + 20, $scout2[1] - 20, $scout2[0] + 100, $scout2[1] + 20, 0, 0, 0, 0)
	  If $image = True Then
		 Return $i
	  EndIf
   Next
   ;MsgBox(0, $posX, $posX[0] & " " & $posX[1])
EndFunc
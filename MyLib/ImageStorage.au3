

Local $imageStorage_numbers[10] ; 0 - 9
Local $imageStorage_posExit[2]
Local $imageStorage_lastFindedNumber
Local $imageStorage_finalNumber
Local $imageStorage_posX[10]

;Local $resources[2][24]

_Private_ImageStorage_InitImages()

Func _Private_ImageStorage_InitImages()
   For $i = 0 To UBound($imageStorage_numbers) - 1
	  $imageStorage_numbers[$i] = @ScriptDir & "\ImageSearch\Resources\Count\" & $i & ".png"
   Next
EndFunc

Func _ImageStorage_FindAllValues()
   $imageStorage_posExit = _IconsSearch_Exit()

   For $i = 0 To 11
	  $resources[$village][$i] = _Private_ImageStorage_FindFullValue($i, 123)
	  $k = $i + 12
	  $resources[$village][$k] = _Private_ImageStorage_FindFullValue($i, 285)
   Next
EndFunc

Func _Private_ImageStorage_FindFullValue($x, $y)
   $x = -940 + 80 * $x
   ;MouseMove($x, $y)
   _Private_ImageStorage_FindFirstNumber($x, $y)
   For $j = 0 To 3
	  _Private_ImageStorage_FindNextNumber($y)
   Next
   Return $imageStorage_finalNumber
EndFunc

Func _Private_ImageStorage_FindFirstNumber($x, $y)
   $imageStorage_posX = _Private_ImageStorage_FindNumber($imageStorage_posExit[0] + $x, $imageStorage_posExit[1] + $y, $imageStorage_posExit[0] + $x + 50, $imageStorage_posExit[1] + $y + 20)

   $imageStorage_lastFindedNumber = 99999
   For $i = 0 To UBound($imageStorage_posX) - 1
	  If $imageStorage_posX[$i] < $imageStorage_lastFindedNumber Then
		 $imageStorage_lastFindedNumber = $imageStorage_posX[$i]
		 $imageStorage_finalNumber = $i
	  EndIf
   Next
EndFunc

Func _Private_ImageStorage_FindNextNumber($y)
   	  $imageStorage_posX = _Private_ImageStorage_FindNumber($imageStorage_lastFindedNumber + 3 , $imageStorage_posExit[1] + $y, $imageStorage_lastFindedNumber + 16, $imageStorage_posExit[1] + $y + 20)
	  $imageStorage_lastFindedNumber = 99999
	  For $i = 0 To UBound($imageStorage_posX) - 1
		 If $imageStorage_posX[$i] < $imageStorage_lastFindedNumber Then
			$imageStorage_lastFindedNumber = $imageStorage_posX[$i]
			$imageStorage_finalNumber &= $i
		 EndIf
	  Next
EndFunc

Func _Private_ImageStorage_FindNumber($x1, $y1, $x2, $y2)
   Local $imageStorage_posX[10]; i(0-9 number)
   For $i = 0 To UBound($imageStorage_numbers) - 1
	  $image =_ImageSearchArea($imageStorage_numbers[$i], 1, $x1, $y1, $x2, $y2, $imageStorage_posX[$i], 0, 70, 0);50
	  ;MsgBox(0, "", $image)
	  If $image = False Then
		 $imageStorage_posX[$i] = 99999
	  EndIf
   Next
   Return $imageStorage_posX
EndFunc
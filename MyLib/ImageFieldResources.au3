

Local $imageField_numbers[10] ; 0 - 9
Local $imageField_posArrow[2]
Local $imageField_lastFindedNumber
Local $imageField_finalNumber
Local $imageField_posX[10]

_Private_FieldResources_InitImages()

Func _Private_FieldResources_InitImages()
   For $i = 0 To UBound($imageField_numbers) - 1
	  $imageField_numbers[$i] = @ScriptDir & "\ImageSearch\Scouts\FieldResources\" & $i & ".png"
   Next
EndFunc

Func FindFullValue()
   $imageField_posArrow = _IconsSearch_RightArrow()
   FindFirstNumber()
   For $j = 0 To 2
	  FindNextNumber()
   Next
   Return $imageField_finalNumber
   ;MsgBox(0, "", $imageField_finalNumber)
EndFunc

Func FindFirstNumber()
   $imageField_posX = _Private_FindNumber($imageField_posArrow[0] + 340, $imageField_posArrow[1] + 85, $imageField_posArrow[0] + 390, $imageField_posArrow[1] + 100)
   $imageField_lastFindedNumber = 99999
   For $i = 0 To UBound($imageField_posX) - 1
	  If $imageField_posX[$i] < $imageField_lastFindedNumber Then
		 $imageField_lastFindedNumber = $imageField_posX[$i]
		 $imageField_finalNumber = $i
	  EndIf
   Next
EndFunc

Func FindNextNumber()
   	  $imageField_posX = _Private_FindNumber($imageField_lastFindedNumber + 3 , $imageField_posArrow[1] + 85, $imageField_lastFindedNumber + 12, $imageField_posArrow[1] + 100)
	  $imageField_lastFindedNumber = 99999
	  For $i = 0 To UBound($imageField_posX) - 1
		 If $imageField_posX[$i] < $imageField_lastFindedNumber Then
			$imageField_lastFindedNumber = $imageField_posX[$i]
			$imageField_finalNumber &= $i
		 EndIf
	  Next
EndFunc

Func _Private_FindNumber($x1, $y1, $x2, $y2)
   Local $imageField_posX[10]; i(0-9 number)
   For $i = 0 To UBound($imageField_numbers) - 1
	  $image =_ImageSearchArea($imageField_numbers[$i], 1, $x1, $y1, $x2, $y2, $imageField_posX[$i], 0, 70, 0);50
	  If $image = False Then
		 $imageField_posX[$i] = 99999
	  EndIf
   Next
   ;MsgBox(0, $imageField_posX, $imageField_posX[0] & " " & $imageField_posX[1])
   Return $imageField_posX
EndFunc
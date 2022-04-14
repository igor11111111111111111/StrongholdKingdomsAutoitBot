
Local $ISR_iconsFolder = @ScriptDir & "\ImageSearch\Resources"
Local $ISR_pos[2]
Local $ISR_center
Local $ISR_radius = 600
Local $ISR_start[2]
Local $ISR_ArrayResultExample[0][2]
Local $ISR_ArrayResult

Func _ImageScoutResources_SearchResources()
   $ISR_pos[0] = 0
   $ISR_center = GetCenterField()
   $ISR_ArrayResult = $ISR_ArrayResultExample

   $quere = _Quere_Create(4)
   Local $quereRand[4] = [0, 1, 2, 3]

   $randIndex = Random(0, 3, 1)
   _Quere_Push($quere, $quereRand[$randIndex])
   _ArrayDelete($quereRand, $randIndex)

   $randIndex = Random(0, 2, 1)
   _Quere_Push($quere, $quereRand[$randIndex])
   _ArrayDelete($quereRand, $randIndex)

   $randIndex = Random(0, 1, 1)
   _Quere_Push($quere, $quereRand[$randIndex])
   _ArrayDelete($quereRand, $randIndex)

   _Quere_Push($quere, $quereRand[0])

   ;_ArrayDisplay($quere);

   For $i = 0 To 3
	  If _Quere_Peek($quere) = 0 Then
			; left up
		 $ISR_start[0] = $ISR_center[0] - $ISR_radius
		 $ISR_start[1] = $ISR_center[1] - $ISR_radius
		 _Private_ISR_Search()
	  ElseIf _Quere_Peek($quere) = 1 Then
			; right up
		 $ISR_start[0] = $ISR_center[0]
		 $ISR_start[1] = $ISR_center[1] - $ISR_radius
		 _Private_ISR_Search()
	  ElseIf _Quere_Peek($quere) = 2 Then
			; right down
		 $ISR_start[0] = $ISR_center[0]
		 $ISR_start[1] = $ISR_center[1]
		 _Private_ISR_Search()
	  ElseIf _Quere_Peek($quere) = 3 Then
			; left down
		 $ISR_start[0] = $ISR_center[0] - $ISR_radius
		 $ISR_start[1] = $ISR_center[1]
		 _Private_ISR_Search()
	  EndIf

	  _Quere_Pop($quere)
	  ;_ArrayDisplay($quere);
   Next

   Return $ISR_ArrayResult
   ;_ArrayDisplay($ISR_ArrayResult)
EndFunc

Func _Private_ISR_Search()
   Local $result
   Local $forAdd[1][2]

   $result = _Private_SearchAllResources(True)
   If $result[0] <> 0 Then
	  $forAdd[0][0] = $result[0]
	  $forAdd[0][1] = $result[1]
	  _ArrayAdd($ISR_ArrayResult, $forAdd)
   EndIf
EndFunc

Func _Private_SearchAllResources($bagFound)
   If $bagFound And _Private_SearchResource("\Bag.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Spice.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Silk.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Salt.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Wine.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Cloth.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Pot.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Wood.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Stone.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Ale.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Iron.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Oil.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Fish.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Veget.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Bread.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Meal.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Chair.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Deer.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Apple.png") Then
	  Return $ISR_pos
   ElseIf _Private_SearchResource("\Cheese.png") Then
	  Return $ISR_pos
   Else
	  $ISR_pos[0] = 0
	  Return $ISR_pos
   EndIf
   ;MsgBox(0, "ImageScoutResources", "Not found")
EndFunc

Func _Private_SearchResource($resource)
   If _ImageSearchArea($ISR_iconsFolder & $resource, 1, $ISR_start[0], $ISR_start[1], $ISR_start[0] + $ISR_radius, $ISR_start[1] + $ISR_radius, $ISR_pos[0], $ISR_pos[1], 40, 0) Then
	  ;MsgBox(0, "ImageScoutResources", $ISR_pos[0] & " " & $ISR_pos[1])
	  Return True
   Else
	  Return False
   EndIf
EndFunc


#include-once 
#include <Array.au3>

; #CURRENT# =====================================================================================================================
;_Stack_Create
;_Stack_Empty
;_Stack_GetSize
;_Stack_IsEmpty
;_Stack_Peek
;_Stack_Pop
;_Stack_Push
;_Quere_Create
;_Quere_Empty
;_Quere_GetSize
;_Quere_IsEmpty
;_Quere_Peek
;_Quere_Pop
;_Quere_Push
; ===============================================================================================================================


; #FUNCTION# ====================================================================================================================
; Name...........: _Stack_Create
; Description ...: Iniates a Stack
; Syntax.........: _Stack_Create(int size) 
; Parameters ....: $size - The size of the stack, the default is 20
;				   A stack size will automatically double if needed, so the user doesn't need to worry about checking size
; Return values .: Success - Returns the array
;                  Failure - Returns false, only happens if you try passing a number less than 0
; Author ........: Achilles
; ===============================================================================================================================
Func _Stack_Create($size = 20) 
	If $size < 0 then Return False 
	
	Local $avArray[$size + 1] 
	
	$avArray[0] = 1 ;1 is the index to push/pop/peek at 
	
	Return $avArray
EndFunc 

; #FUNCTION# ====================================================================================================================
; Name...........: _Stack_Empty
; Description ...: Empties a stack
; Syntax.........: _Stack_Empty(stack array)
; Parameters ....: $avArray - pass a stack array item
; Return values .: Always returns true
; Author ........: Achilles
; ===============================================================================================================================
Func _Stack_Empty(ByRef $avArray)
	For $i = 1 to $avArray[0] 
		$avArray[$i] = ''
	Next 
	
	$avArray[0] = 1
	
	Return True
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: _Stack_GetSize
; Description ...: Returns the size of the stack
; Syntax.........: _Stack_GetSize(stack array)
; Parameters ....: $avArray - pass a stack array item
; Return values .: Returns the size of the stack
; Author ........: Achilles
; ===============================================================================================================================
Func _Stack_GetSize($avArray)
	Return $avArray[0] - 1
EndFunc 

; #FUNCTION# ====================================================================================================================
; Name...........: _Stack_IsEmpty
; Description ...: Checks if a stack is empty
; Syntax.........: _Stack_IsEmpty(stack array)
; Parameters ....: $avArray - pass a stack array item
; Return values .: True if the stack is empty, otherwise false
; Author ........: Achilles
; ===============================================================================================================================
Func _Stack_IsEmpty($avArray) 
	Return ($avArray[0] = 1)
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: _Stack_Peek
; Description ...: Returns the top item of a stack without removing it
; Syntax.........: _Stack_Peek(stack array)
; Parameters ....: $avArray - pass a stack array item
; Return values .: Returns the top item of a stack without removing it
; Author ........: Achilles
; ===============================================================================================================================
Func _Stack_Peek($avArray) 
	If Not _Stack_IsEmpty($avArray) then 
		Return $avArray[$avArray[0] - 1]
	Else 
		Return -1
	EndIf
EndFunc 

; #FUNCTION# ====================================================================================================================
; Name...........: _Stack_Pop
; Description ...: Returns the item at the top of the stack, removing it from the stack
; Syntax.........: _Stack_Pop(stack array)
; Parameters ....: $avArray - pass a stack array item
; Return values .: Returns the item at the top of the stack, removing it from the stack
; Author ........: Achilles
; ===============================================================================================================================
Func _Stack_Pop(ByRef $avArray) 
	If Not _Stack_IsEmpty($avArray) then 
		$avArray[0] -= 1
		$ret = $avArray[$avArray[0]]
		$avArray[$avArray[0]] = ''
		Return $ret
	Else 
		Return -1
	EndIf
EndFunc 

; #FUNCTION# ====================================================================================================================
; Name...........: _Stack_Push
; Description ...: Adds an item to the top of a stack
; Syntax.........: _Stack_Push(stack array)
; Parameters ....: $avArray - pass a stack array item
;				   $item  - item to be added, can be anything that can be added to an array
; Return values .: Always returns true
; Author ........: Achilles
; ===============================================================================================================================
Func _Stack_Push(ByRef $avArray, $item)
	If $avArray[0] + 1 > UBound($avArray) then 
		ReDim $avArray[UBound($avArray) * 2] ; Double size if limit is reached
	EndIf

	$avArray[0] += 1
	$avArray[$avArray[0] - 1] = $item 
	
	Return True
EndFunc 

; #FUNCTION# ====================================================================================================================
; Name...........: _Quere_Create
; Description ...: Iniates a Quere
; Syntax.........: _Quere_Create(int size) 
; Parameters ....: $size - The size of the quere, the default is 20
;				   A quere size will automatically double in size if needed, so the user doesn't need to worry about checking size
; Return values .: Success - Returns the array
;                  Failure - Returns false, only happens if you try passing a number less than 0
; Author ........: Achilles
; ===============================================================================================================================
Func _Quere_Create($size = 20) 
	If $size < 0 then Return False 
	
	Local $avArray[$size + 1] 
	
	$avArray[0] = 1 ;1 is the index to push/pop/peek at 
	
	Return $avArray
EndFunc 

; #FUNCTION# ====================================================================================================================
; Name...........: _Quere_Empty
; Description ...: Empties a quere
; Syntax.........: _Quere_Empty(quere array)
; Parameters ....: $avArray - pass a quere array item
; Return values .: Always returns true
; Author ........: Achilles
; ===============================================================================================================================
Func _Quere_Empty(ByRef $avArray)
	For $i = 1 to $avArray[0] 
		$avArray[$i] = ''
	Next 
	
	$avArray[0] = 1
	
	Return True
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: _Quere_GetSize
; Description ...: Returns the size of the quere
; Syntax.........: _Quere_GetSize(quere array)
; Parameters ....: $avArray - pass a quere array item
; Return values .: Returns the size of the quere
; Author ........: Achilles
; ===============================================================================================================================
Func _Quere_GetSize($avArray)
	Return $avArray[0] - 1
EndFunc 

; #FUNCTION# ====================================================================================================================
; Name...........: _Quere_IsEmpty
; Description ...: Checks if a quere is empty
; Syntax.........: _Quere_IsEmpty(quere array)
; Parameters ....: $avArray - pass a quere array item
; Return values .: True if the quere is empty, otherwise false
; Author ........: Achilles
; ===============================================================================================================================
Func _Quere_IsEmpty($avArray) 
	Return ($avArray[0] = 1)
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: _Quere_Peek
; Description ...: Returns the item at the front of the quere, without removing it from the quere
; Syntax.........: _Quere_Peek(quere array)
; Parameters ....: $avArray - pass a quere array item
; Return values .: Returns the top item of a quere without removing it
; Author ........: Achilles
; ===============================================================================================================================
Func _Quere_Peek($avArray) 
	If Not _Quere_IsEmpty($avArray) then 
		Return $avArray[1]
	Else 
		Return -1
	EndIf
EndFunc 

; #FUNCTION# ====================================================================================================================
; Name...........: _Quere_Pop
; Description ...: Returns the item at the front of the quere, removing it from the quere
; Syntax.........: _Quere_Pop(quere array)
; Parameters ....: $avArray - pass a quere array item
; Return values .: Returns the item at the top of the quere, removing it from the quere
; Author ........: Achilles
; ===============================================================================================================================
Func _Quere_Pop(ByRef $avArray) 
	If Not _Quere_IsEmpty($avArray) then 
		$avArray[0] -= 1
		$ret = $avArray[1]
		_ArrayDelete($avArray, 1)
		ReDim $avArray[UBound($avArray) + 1]
		Return $ret
	Else 
		Return -1
	EndIf
EndFunc 

; #FUNCTION# ====================================================================================================================
; Name...........: _Quere_Push
; Description ...: Adds an item to the top of a quere
; Syntax.........: _Quere_Push(quere array)
; Parameters ....: $avArray - pass a quere array item
;				   $item  - item to be added, can be anything that can be added to an array
; Return values .: Always returns true
; Author ........: Achilles
; ===============================================================================================================================
Func _Quere_Push(ByRef $avArray, $item)
	If $avArray[0] + 1 > UBound($avArray) then 
		ReDim $avArray[UBound($avArray) * 2] ; Double size if limit is reached
	EndIf

	$avArray[0] += 1
	$avArray[$avArray[0] - 1] = $item 
	
	Return True
EndFunc 

Local $traderArea
Local $isSelectedDistrictArea
Local $isSelectedVillageArea

Func _Traders_Trading()
   $isSelectedDistrictArea = False
   $isSelectedVillageArea = False
   _Private_SelectTradePlace()
   $curTraders[$village] = _ImageTraders_GetCurrent()
   $maxTraders[$village] = _ImageTraders_GetMax()

   If $curTraders[$village] = 0 Then
	  Return False
   EndIf

   _Private_CheckPossibleTrading()
EndFunc

Func _Private_SelectTradePlace()
   Local $arrowPos = _IconsSearch_RightArrow()
   MouseClick("left", $arrowPos[0] + 40, $arrowPos[1] + 30)
   Sleep(200)
   MouseClick("left", $arrowPos[0] + 212, $arrowPos[1] + 63)
   Sleep(1000)
EndFunc

Func _Private_SelectDistrictArea()
   $isSelectedDistrictArea = True
   $traderArea =_IconsSearch_TradersPlace()
   MouseClick("left", $traderArea[0] - 104, $traderArea[1] - 31); district
   Sleep(400)
   MouseClick("left", $traderArea[0], $traderArea[1])
   Sleep(400)
   ;MsgBox(0, "", $tradePlace[$village])
   MouseClick("left", $traderArea[0] - 136, $traderArea[1] + 41 + 18 * ($tradePlace[$village] - 1))
   ;MsgBox(0, "", "")
   Sleep(500)
EndFunc

Func _Private_SelectVillageArea($index)
   $isSelectedVillageArea = True
   $traderArea =_IconsSearch_TradersPlace()
   MouseClick("left", $traderArea[0] - 193, $traderArea[1] - 31); village
   Sleep(400)
   MouseClick("left", $traderArea[0], $traderArea[1])
   Sleep(400)
   MouseClick("left", $traderArea[0] - 136, $traderArea[1] + 41 + 18 * ($index))
   Sleep(500)
EndFunc

Func _Private_CheckPossibleTrading()
   For	$i = 0 to UBound($resForSend, $UBOUND_COLUMNS) - 1
	  If _Private_CheckResSend($i) Then
		 _Private_SendSurplus($i)
	  EndIf
   Next

   For	$i = 0 to UBound($resForSales, $UBOUND_COLUMNS) - 1
	  If _Private_CheckResForSale($i) Then
		 _Private_Sell($i)
	  EndIf
   Next

   For	$i = 0 to UBound($resForSurplus, $UBOUND_COLUMNS) - 1
	  If _Private_CheckResSurplus($i) And $resForSend[$village][$i] == Null Then
		 _Private_SellSurplus($i)
	  EndIf
   Next
EndFunc

Func _Private_CheckResForSale($i)
   If $resForSales[$village][$i] = True Then
	  If ($i = 0 Or $i = 1) And $resources[$village][$i] >= 1000 Then ; wood/stone
		 Return True
	  ElseIf ($i = 2 Or $i = 3 Or $i = 18) And $resources[$village][$i] >= 200 Then ; iron/oil/ale
		 Return True
	  ElseIf $i >= 4 And $i <= 7 And $resources[$village][$i] >= 50 Then ; meal-cloth
		 Return True
	  ElseIf $i >= 8 And $i <= 11 And $resources[$village][$i] >= 20 Then ; wine-silk
		 Return True
	  ElseIf $i >= 12 And $i <= 17 And $resources[$village][$i] >= 500 Then ; food
		 Return True
	  ElseIf $i >= 19 And $i <= 22 And $resources[$village][$i] >= 5 Then ; weapon
		 Return True
	  ElseIf $i = 23 And $resources[$village][$i] >= 1 Then ; cata
		 Return True
	  EndIf
   Else
	  Return False
   EndIf

   Return False
EndFunc

Func _Private_Sell($index)
   If _ImageTraders_GetCurrent() = 0 Then
	  Return False
   EndIf
   If $isSelectedDistrictArea = False Then
	  _Private_SelectDistrictArea()
   EndIf

   _Private_Traders_SelectResIcon($index)

   MouseClick("left", $traderArea[0] + 275, $traderArea[1] + 288, 2) ;sell
   Sleep(300)
EndFunc

Func _Private_CheckResSurplus($i)
   If $resForSurplus[$village][$i] = True Then
	  $thresholdRes = $maxResources[$village][$i] / 100 * $thresholdSurplus
	  If $thresholdRes < $resources[$village][$i] Then
		 $surplus = $resources[$village][$i] - $thresholdRes
		 Return True
	  EndIf
   EndIf
   Return False
EndFunc

Func _Private_SellSurplus($index)
   $curTraders[$village] = _ImageTraders_GetCurrent()

   If $curTraders[$village] = 0 Then
	  Return False
   EndIf
   If $isSelectedDistrictArea = False Then
	  _Private_SelectDistrictArea()
   EndIf

   _Private_Traders_SelectResIcon($index)

   MouseClick("left", $traderArea[0] + 50, $traderArea[1] + 220, $curTraders[$village] + 1)
   Sleep(300)
   MouseClick("left", $traderArea[0] + 169, $traderArea[1] + 220, 1); 1 раз
   Sleep(300)
   MouseClick("left", $traderArea[0] + 275, $traderArea[1] + 288, 2) ;sell
   Sleep(300)
EndFunc

Func _Private_CheckResSend($i)
   If $resForSend[$village][$i] <> Null Then
	  $thresholdRes = $maxResources[$village][$i] / 100 * $thresholdSurplus
	  If $thresholdRes < $resources[$village][$i] Then
		 $surplus = $resources[$village][$i] - $thresholdRes
		 Return True
	  EndIf
   EndIf
   Return False
EndFunc

Func _Private_SendSurplus($indexRes)
   $curTraders[$village] = _ImageTraders_GetCurrent()

   If $curTraders[$village] = 0 Then
	  Return False
   EndIf

   If $isSelectedVillageArea = False Then
	  Local $indexVillage = $resForSend[$village][$indexRes]
	  _Private_SelectVillageArea($indexVillage)
   EndIf

   _Private_Traders_SelectResIcon($indexRes)

   MouseClickDrag($MOUSE_CLICK_LEFT, $traderArea[0] + 169, $traderArea[1] + 220, $traderArea[0] + 80, $traderArea[1] + 220)
   Sleep(300)
   MouseClick("left", $traderArea[0] + 275, $traderArea[1] + 288, 2) ;send
   Sleep(300)
EndFunc

Func _Private_Traders_SelectResIcon($index)
      If $index >= 0 And $index <= 3 Then ;wood.. etc
	  MouseClick("left", $traderArea[0] - 547 + 80 * 0, $traderArea[1])
	  Sleep(500)
	  MouseClick("left", $traderArea[0] - 471, $traderArea[1] + 103 + 40 * ($index - 0))
	  Sleep(300)
   ElseIf $index >= 4 And $index <= 11 Then ;banquet
	  MouseClick("left", $traderArea[0] - 547 + 80 * 3, $traderArea[1])
	  Sleep(500)
	  MouseClick("left", $traderArea[0] - 471, $traderArea[1] + 103 + 40 * ($index - 4))
	  Sleep(300)
   ElseIf $index >= 12 And $index <= 19 Then ;food & ale
	  MouseClick("left", $traderArea[0] - 547 + 80 * 1, $traderArea[1])
	  Sleep(500)
	  MouseClick("left", $traderArea[0] - 471, $traderArea[1] + 103 + 40 * ($index - 12))
	  Sleep(300)
   ElseIf $index >= 20 And $index <= 23 Then ;weapon
	  MouseClick("left", $traderArea[0] - 547 + 80 * 2, $traderArea[1])
	  Sleep(500)
	  MouseClick("left", $traderArea[0] - 471, $traderArea[1] + 103 + 40 * ($index - 19))
	  Sleep(300)
   EndIf
EndFunc






Global $titleGame = "Stronghold Kingdoms"
Global $world = "Мир 9"
Global $titleWorld = $titleGame & " - " & $world ; "Stronghold Kingdoms - Мир 9"
Global $gameExePath = "D:\Program Files (x86)\Firefly Studios\Stronghold Kingdoms\StrongholdKingdoms.exe"
Global $paused = False

Global $thresholdSurplus = 80 ; in percent
Global $banquetLevel = 7 ; spice
Global $villages = 3
Global $village

Global $resources[$villages][24]
Global $maxResources[$villages][24]
Global $resForSales[$villages][24]
Global $resForSurplus[$villages][24]
Global $resForSend[$villages][24]
Global $curTraders[$villages]
Global $maxTraders[$villages]
Global $curScouts[$villages]
Global $tradePlace[$villages]

$tradePlace[0] = 10
$tradePlace[1] = 10 ; leninsky
$tradePlace[2] = 2 ;plavsky

For $i = 0 to $villages - 1
   ;surplus
   For $j = 0 to UBound($resForSend, $UBOUND_COLUMNS) - 1
	  $resForSend[$i][$j] = Null
   Next
   ;send
   For	$j = 0 to UBound($resForSurplus, $UBOUND_COLUMNS) - 5
	  $resForSurplus[$i][$j] = True
   Next
   ;sale
   $resForSales[$i][4] = True ;deer
   $resForSales[$i][5] = True ;chair
   ;max storage
   For $j = 0 to 3 ; materials
	  $maxResources[$i][$j] = 18000
   Next

   For $j = 12 to 17 ; food
	  $maxResources[$i][$j] = 18000
   Next

   For $j = 4 to 11 ; banquet
	  $maxResources[$i][$j] = 300
   Next

   $maxResources[$i][18] = 3000

   For $j = 19 to 23 ; weapons
	  $maxResources[$i][$j] = 30
   Next
Next

$resForSend[0][6] = 1 ; 6 - pot, from 0 village to 1
$resForSend[1][6] = 2
$resForSend[1][7] = 2 ; 7 - cloth
$resForSend[2][7] = 0
$resForSend[1][8] = 2 ; 8 - wine
$resForSend[2][8] = 0
$resForSend[1][9] = 2 ; 9 - salt
$resForSend[2][9] = 0
$resForSend[1][10] = 0 ; 10 - spice
$resForSend[0][10] = 2

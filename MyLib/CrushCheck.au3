
Local $ruInternet = "Проблемы с подключением к серверу"


Func _CrushCheck_All()
   _CrushCheck_Logout()
   _CrushCheck_Window()
   _CrushCheck_Internet()
EndFunc

Func _CrushCheck_Logout()
   If WinActive("LogoutOptionsWindow2") Then
	  Local $logoutExit = _IconsSearch_LogoutExit()
	  MouseClick("left", $logoutExit[0], $logoutExit[1])
   EndIf
EndFunc

Func _CrushCheck_Internet()
   WinActivate($ruInternet)
   If WinActive($ruInternet) Then
	  Sleep(5000)
	  _CrushCheck_Internet()
   EndIf
EndFunc

Func _CrushCheck_Window()
   If WinActive($titleGame) = False Then
	  WinActivate($titleGame)
	  WinWaitActive($titleGame)
   EndIf
EndFunc
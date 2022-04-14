
Func _Hotkey_Pause();$paused, $titleWorld)
   ;$paused = True
   MsgBox(0, "Paused", "Press ok to continue")
   WinActive($titleWorld)
   WinWaitActive($titleWorld)
   ;$paused = False
EndFunc

Func _Hotkey_ExitApp()
   Exit
EndFunc
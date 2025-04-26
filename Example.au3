
#include <AutoItObject.au3>

#include "GUIObjects.au3"

_AutoItObject_StartUp()

Global $oError = ObjEvent("AutoIt.Error", _ErrFunc)

Global $guiObjects = GUIObjects()

$guiObjects.Form("Example1", "Example1 Title", 300, 400, 300, 500)

$guiObjects.Example1.SetDefBkColor(0x55EE99)

$guiObjects.Example1.Button("Button1", "Delete This Form", 10, 10)

$guiObjects.Example1.Button("Button2", "Delete Child Form", 50, 50)

$guiObjects.Example1.Button("Button3", "=D", 90, 90)

$guiObjects.Example1.AVI("AVI1", "V:\Coding\GUIObjects\GUIObjects\resources\sampleAVI.avi", -1, 150, 10)

$guiObjects.Example1.AVI1.Play()

$guiObjects.Example1.SetCursor(4, 1)

$guiObjects.Example1.Show()

$guiObjects.Example1.Child("Child1", "Child1 Example", 250, 350, 305, -20)

$guiObjects.Example1.Child1.Button("Button1", "=D =D", 90, 90)

$guiObjects.Example1.Child1.SetCursor(9)

$guiObjects.Example1.Child1.Show()

Do
    Switch GUIGetMsg()
        Case 0
            ContinueLoop
            
        Case $guiObjects.Example1.Button1.ControlID
            $guiObjects.Example1.Delete()
            Exit
            
        Case $guiObjects.Example1.Button2.ControlID
            $guiObjects.Example1.Child1.Delete()

        Case $guiObjects.Example1.Button3.ControlID
            ConsoleWrite("=D" & @CRLF)

        Case $guiObjects.Example1.Child1.Button1.ControlID
            Consolewrite($guiObjects.Example1.Button3.Text("=D =D Yay! =D =D") & @CRLF)

            ConsoleWrite("=D =D Yay! =D =D" & @CRLF)

        Case $GUI_EVENT_CLOSE
            Exit
    EndSwitch
Until False

Func _ErrFunc()
	 ConsoleWrite(" ==> COM Error intercepted !"                  & @CRLF & @TAB & _
	 			  "Script Path: " & @TAB & @ScriptDir             & @CRLF & @TAB & _
                  "Description: " & @TAB & $oError.windescription & @TAB  &        _
				  "Script Line: " & @TAB & $oError.scriptline     & @CRLF & @CRLF)

    Exit
EndFunc

#include <AutoItObject.au3>

#include "GUIObjects.au3"

_AutoItObject_StartUp()

Global $oError = ObjEvent("AutoIt.Error", _ErrFunc)

Global $guiObjects = GUIObjects()

$guiObjects.Form("Form1", "Form Title", 300, 400, 300, 500)

$guiObjects.Form1.SetDefBkColor(0x55EE99)

$guiObjects.Form1.Button("Button1", "Button Text", 40, 40)

$guiObjects.Form("Form2", "Form2 Title", 250, 350, 605, 500)

$guiObjects.Form2.SetDefColor(0xFF0000)

$guiObjects.Form2.Button("Button1", "Button Text", 10, 10)

$guiObjects.Form1.Show()

$guiObjects.Form2.Show()

Do
    Switch GUIGetMsg()
        Case $guiObjects.Form1.Button1.ControlID
            Consolewrite("=D" & @CRLF)

        Case $guiObjects.Form2.Button1.ControlID
            Consolewrite("=D =D" & @CRLF)

        Case $GUI_EVENT_CLOSE
            Exit
    EndSwitch
Until False

Func _ErrFunc()
	 ConsoleWrite(" ==> COM Error intercepted !"                  & @CRLF & @TAB & _
	 			  "Script Path: " & @TAB & @ScriptDir             & @CRLF & @TAB & _
                  "Description: " & @TAB & $oError.windescription & @TAB & _
				  "Script Line: " & @TAB & $oError.scriptline     & @CRLF & @CRLF)

    Exit
EndFunc
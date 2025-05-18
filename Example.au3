
#include "GUIObjects.au3"

_AutoItObject_StartUp()

Global $oError = ObjEvent("AutoIt.Error", _ErrFunc)

Global Const $guiObjects = GUIObjects()

Global Const $example1 = $guiObjects.Form("Example1", "Example1 Title", 300, 400, 300, 500)

Global Const $fileMenu = $example1.Menu("&File")

$fileMenu.AddMenuItem("New")
$fileMenu.AddMenuItem("Open")
$fileMenu.AddMenuItem("Save")
$fileMenu.AddMenuItem("")
$fileMenu.AddMenuItem("Exit")

Global Const $myMenu = $example1.Menu("&MyFile")

$myMenu.AddMenuItem("MyNew")
$myMenu.AddMenuItem("MyOpen")
$myMenu.AddMenuItem("MySave")
$myMenu.AddMenuItem("")
$myMenu.AddMenuItem("MyExit")

ConsoleWrite($myMenu.GetText() & @CRLF)
ConsoleWrite($myMenu.MyNew.GetText() & @CRLF)

Global Const $button1 = $example1.Button("Button1", "Delete This Form", 10, 10)

Global Const $button2 = $example1.Button("Button2", "Delete Child Form", 50, 50)

Global Const $button3 = $example1.Button("Button3", "=D", 90, 90)

Global Const $label1 = $example1.Label("Label1", "Label1 =D", 150, 90)

Global Const $listBox1 = $example1.ListBox("ListBox1", "ListBox1", 10, 150)

$example1.AVI("AVI1", @ScriptDir & "\resources\sampleAVI.avi", -1, 150, 10)

$example1.AVI1.Play()

Global Const $date = $example1.Date("Date1", 140, 140)

$example1.Show()

Global Const $child1 = $example1.Child("Child1", "Child1 Example", 250, 350, 305, -20)

$child1.Button("Button1", "=D =D", 90, 90)

$child1.Show()

Do
    Switch GUIGetMsg()
        Case 0
            ContinueLoop

        Case $fileMenu.New 
            $fileMenu.SetText("=D")
            $fileMenu.SetColor(0xEEBB99)

        Case $myMenu.MyOpen 
            $myMenu.SetText("=D")
            $myMenu.SetColor(0xEEBB99)
            
        Case $button1.ControlID
            $example1.Delete()
            Exit
            
        Case $button2.ControlID
            $child1.Delete()

        Case $button3.ControlID
            ConsoleWrite("=D" & @CRLF)

        Case $child1.Button1.ControlID
            $button3.SetText("=D =D Yay! =D =D")

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
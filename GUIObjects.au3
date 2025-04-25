#include-once

#include "Form.au3"
#include "Control.au3"

Func GUIObjects()
    Local Const $this = _AutoItObject_Class()

    $this.Create()

    $this.AddMethod("Form", "GUIObjects_Form")

	$this.AddMethod("DebugPrint", "GUIObjects_DebugPrint", True)
	$this.AddMethod("SetDebug"  , "GUIObjects_SetDebug"  , True)
    
	$this.AddProperty("Debug", $ELSCOPE_PRIVATE, False)

    Return $this.Object 
EndFunc

Func GUIObjects_SetDebug(ByRef $this, Const $debug = True)
    $this.Debug = $debug
EndFunc

Func GUIObjects_DebugPrint(ByRef Const $this, Const ByRef $message)
    Switch $this.Debug 
        Case True 
            ConsoleWrite($message & @CRLF)
    EndSwitch
EndFunc
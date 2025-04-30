#include-once

#include <AutoItObject.au3>

#include <AutoItConstants.au3>
#include <ColorConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

#include "Control\Control.au3"
#include "Form\Form.au3"

; --------------------------------------------------------------------------------------------------------------------------
; GUIObjects()
;   - Creates and stores form objects.
; --------------------------------------------------------------------------------------------------------------------------
Func GUIObjects()
    Local Const $this = _AutoItObject_Class()

    $this.Create()

    $this.AddMethod("Form", "GUIObjects_Form")

	$this.AddMethod("DebugPrint", "GUIObjects_DebugPrint", True)
	$this.AddMethod("SetDebug"  , "GUIObjects_SetDebug"  , True)
    
	$this.AddProperty("Debug", $ELSCOPE_PRIVATE, False)

    Return $this.Object 
EndFunc

Func GUIObjects_Form(ByRef $this, Const $name, Const $title, Const $width, Const $height, Const $left = -1, Const $top = -1, Const $style = -1, Const $exStyle = -1)    
    Switch $left <> -1 And $top = -1
        Case False
            Local Const $handle = GUICreate($title, $width, $height, $left, $top, $style, $exStyle)

            ;ConsoleWrite("Parent: " & $handle & @CRLF)

            Local Const $guiPosition = WinGetPos($handle)
            
            Local $form = _AutoItObject_Create(Form())

            $form.Handle  = $handle        
            $form.Title   = $title         
            $form.Width   = $width         
            $form.Height  = $height        
            $form.Left    = $guiPosition[0]
            $form.Top     = $guiPosition[1]
            $form.Style   = $style         
            $form.ExStyle = $exStyle       

            _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $form)

            Return $form
        Case True
            $this.DebugPrint("If a form's left property is defined then the top property must be defined as well.")

            Return SetError(-1, 0, False)
    EndSwitch
EndFunc

; --------------------------------------------------------------------------------------------------------------------------

#region - Debug
Func GUIObjects_SetDebug(ByRef $this, Const $debug = True)
    $this.Debug = $debug
EndFunc

Func GUIObjects_DebugPrint(ByRef Const $this, Const ByRef $message)
    Switch $this.Debug 
        Case True 
            ConsoleWrite($message & @CRLF)
    EndSwitch
EndFunc
#endregion

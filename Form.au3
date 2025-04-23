#include-once

#include "iForm.au3"
#include "Control.au3"

Func GUIObjects_Form(ByRef $this, Const $name, Const $title, Const $width, Const $height, Const $left = -1, Const $top = -1, Const $style = -1, Const $exStyle = -1)
    Switch $left <> -1 And $top = -1
        Case False
            Local Const $handle = GUICreate($title, $width, $height, $left, $top, $style, $exStyle)

            Local Const $guiPosition = WinGetPos($handle)

	        Local $form = _AutoItObject_Create(_iForm())

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
            $this.DebugPrint("If form's left is defined then the top must be defined as well.")

            Return SetError(-1, 0, False)
    EndSwitch
EndFunc

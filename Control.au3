#include-once

#include <Constants.au3>
#include <WinAPI.au3>

Func _iControl()
    Local Const $this = _AutoItObject_Class()

    $this.Create()

    $this.AddProperty("ControlID", $ELSCOPE_PUBLIC)
    $this.AddProperty("Text"     , $ELSCOPE_PUBLIC)
    $this.AddProperty("Left"     , $ELSCOPE_PUBLIC)
    $this.AddProperty("Top"      , $ELSCOPE_PUBLIC)
    $this.AddProperty("Width"    , $ELSCOPE_PUBLIC)
    $this.AddProperty("Height"   , $ELSCOPE_PUBLIC)
    $this.AddProperty("Style"    , $ELSCOPE_PUBLIC)
    $this.AddProperty("ExStyle"  , $ELSCOPE_PUBLIC)

    Return $this.Object
EndFunc

Func GUIObjects_Form_Button(ByRef $this, Const $name, Const $text, Const $left, Const $top, Const $width = -1, Const $height = -1, Const $style = -1, Const $exStyle = -1)
	Local Const $controlID = GUICtrlCreateButton($text, $left, $top, $width, $height, $style, $exStyle)

    Local Const $ctrlPosition = ControlGetPos(HWnd($this.Handle), '', $controlID)
	
	Local Const $styles = GUIGetStyle($controlID)

	Local $ctrl = _AutoItObject_Create(_iControl())
	
	$ctrl.ControlID = $controlID
	$ctrl.Text      = $text
	$ctrl.Left      = $left
	$ctrl.Top       = $top
	$ctrl.Width     = $ctrlPosition[2]
	$ctrl.Height    = $ctrlPosition[3]
	$ctrl.Style     = _WinAPI_GetWindowLong(GUICtrlGetHandle($controlID), $GWL_STYLE)
	$ctrl.ExStyle   = _WinAPI_GetWindowLong(GUICtrlGetHandle($controlID), $GWL_EXSTYLE)

    _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $ctrl)

    Return $ctrl
EndFunc
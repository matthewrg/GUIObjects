#include-once

Func GUIObjects_Button($this, Const $name, Const $text, Const $left, Const $top, Const $width = -1, Const $height = -1, Const $style = -1, Const $exStyle = -1)
	GUISwitch(HWnd($this.Handle))
    
    Local Const $controlID = GUICtrlCreateButton($text, $left, $top, $width, $height, $style, $exStyle)

    Local Const $ctrlPosition = ControlGetPos(HWnd($this.Handle), '', $controlID)

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
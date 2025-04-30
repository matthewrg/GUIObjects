#include-once

Func GUIObjects_Checkbox(ByRef $this, Const $name, Const $text, Const $left, Const $top, Const $width = -1, Const $height = -1, Const $style = -1, Const $exStyle = -1)
	Local Const $controlID = GUICtrlCreateCheckbox($text, $left, $top, $width, $height, $style, $exStyle)

    Local Const $ctrlPosition = ControlGetPos(HWnd($this.Handle), '', $controlID)

	Local Const $handle = GUICtrlGetHandle($controlID)

	Local $ctrl = _AutoItObject_Create(Control())

	$ctrl.SetAttributes($controlID, $handle, $text, $left, $top, $ctrlPosition)

    _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $ctrl)

    Return $ctrl
EndFunc

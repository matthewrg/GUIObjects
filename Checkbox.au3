#include-once

#include <CheckboxConstants.au3>

Func GUIObjects_Button(ByRef $this, Const $name, Const $text, Const $left, Const $top, Const $width = -1, Const $height = -1, Const $style = -1, Const $exStyle = -1)
	Local Const $controlID = GUICtrlCreateCheckbox($text, $left, $top, $width, $height, BitOR($GUI_SS_DEFAULT_BUTTON, $BS_ICON, $style), $exStyle)

    Local Const $ctrlPosition = ControlGetPos(HWnd($this.Handle), '', $controlID)

	Local Const $handle = GUICtrlGetHandle($controlID)

	Local $ctrl = _AutoItObject_Create(_iControl())
	
	_AutoItObject_AddMethod($ctrl, "Image"    , "GUIObjects_Button_Image"    )
	_AutoItObject_AddMethod($ctrl, "BkColor"  , "GUIObjects_Button_BkColor"  )
	_AutoItObject_AddMethod($ctrl, "TextColor", "GUIObjects_Button_TextColor")
	_AutoItObject_AddMethod($ctrl, "Cursor"   , "GUIObjects_Button_Cursor"   )
	_AutoItObject_AddMethod($ctrl, "Text"     , "GUIObjects_Button_Text"     )
	_AutoItObject_AddMethod($ctrl, "Font"     , "GUIObjects_Button_Font"     )
	_AutoItObject_AddMethod($ctrl, "OnEvent"  , "GUIObjects_Button_OnEvent"  )

	$ctrl.ControlID = $controlID
	$ctrl.Handle    = $handle
	$ctrl.Text      = $text
	$ctrl.Left      = $left
	$ctrl.Top       = $top
	$ctrl.Width     = $ctrlPosition[2]
	$ctrl.Height    = $ctrlPosition[3]
	$ctrl.Style     = _WinAPI_GetWindowLong($handle, $GWL_STYLE)
	$ctrl.ExStyle   = _WinAPI_GetWindowLong($handle, $GWL_EXSTYLE)

    _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $ctrl)

    Return $ctrl
EndFunc


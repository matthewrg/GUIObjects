#include-once

#include <GuiListView.au3>

Func GUIObjects_Edit(ByRef $this, Const $name, Const $headerText, Const $left, Const $top, Const $width = 150, Const $height = 150, Const $style = 0x0000000D, Const $exStyle = 0x00000000, Const $coInit = False)
	Local Const $handle = _GUICtrlListview_Create(HWnd($this.Handle), $headerText, $left, $top, $width, $height, $style, $exStyle)

	Local $ctrl = _AutoItObject_Create(Control())
	
	_AutoItObject_AddMethod($ctrl, "", "GUIObjects_Listview_")

	_AutoItObject_RemoveMember($ctrl, "ControlID")

	$ctrl.Handle  = $handle
	$ctrl.Text    = $text
	$ctrl.Left    = $left
	$ctrl.Top     = $top
	$ctrl.Width   = $width
	$ctrl.Height  = $height
	$ctrl.Style   = $style
	$ctrl.ExStyle = $exStyle

    _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $ctrl)

    Return $ctrl
EndFunc

Func GUIObjects_Listview_(Const ByRef $this)

EndFunc
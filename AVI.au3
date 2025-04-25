#include-once

#include <AVIConstants.au3>

#include "iControl.au3"

Func GUIObjects_AVI(ByRef $this, Const $name, Const $filename, Const $subFileID, Const $left, Const $top, Const $width = -1, Const $height = -1, Const $style = -1, Const $exStyle = -1)
    GUISwitch(HWnd($this.Handle))
    
    Local Const $controlID = GUICtrlCreateAvi($filename, $subFileID, $left, $top, $width, $height, $style, $exStyle)

	GUICtrlSetState($controlID, $GUI_SHOW)

	Local Const $handle = GUICtrlGetHandle($controlID)

    Local Const $ctrlPosition = ControlGetPos(HWnd($this.Handle), '', $controlID)

	Local $ctrl = _AutoItObject_Create(_iControl())

	_AutoItObject_AddMethod($ctrl, "Start", "GUIObjects_AVI_Start")
	_AutoItObject_AddMethod($ctrl, "Stop" , "GUIObjects_AVI_Stop" )

	_AutoItObject_RemoveMember($ctrl, "Text")

	_AutoItObject_AddProperty($ctrl, "FileName", $ELSCOPE_PUBLIC)
	_AutoItObject_AddProperty($ctrl, "SubFileID", $ELSCOPE_PUBLIC)

	$ctrl.ControlID = $controlID
	$ctrl.Handle    = $handle
	$ctrl.FileName  = $filename
	$ctrl.SubFileID = $subFileID
	$ctrl.Left      = $left
	$ctrl.Top       = $top
	$ctrl.Width     = $ctrlPosition[2]
	$ctrl.Height    = $ctrlPosition[3]
	$ctrl.Style     = _WinAPI_GetWindowLong($handle, $GWL_STYLE)
	$ctrl.ExStyle   = _WinAPI_GetWindowLong($handle, $GWL_EXSTYLE)

    _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $ctrl)

    Return $ctrl
EndFunc

Func GUIObjects_AVI_Start(ByRef $this)
	Return GUICtrlSetState($this.ControlID, $GUI_AVISTART)
EndFunc

Func GUIObjects_AVI_Stop(ByRef $this)
	Return GUICtrlSetState($this.ControlID, $GUI_AVISTOP)
EndFunc

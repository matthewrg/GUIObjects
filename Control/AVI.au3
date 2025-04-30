#include-once

#include "Control.au3"

#include <AVIConstants.au3>
#include <GuiAVI.au3>

Func GUIObjects_AVI(ByRef $this, Const $name, Const $filepath, Const $subfileID = -1, Const $left = 0, Const $top = 0, Const $width = 0, Const $height = 0, Const $style = 0x00000006, Const $exStyle = 0x00000000)
    Local Const $handle = _GUICtrlAVI_Create(HWnd($this.Handle), $filepath, $subfileID, $left, $top, $width, $height, $style, $exStyle)

    Local Const $ctrlPosition = ControlGetPos(HWnd($this.Handle), '', $handle)

	Local $ctrl = _AutoItObject_Create(Control())

	_AutoItObject_AddMethod($ctrl, "Close"    , "GUIObjects_AVI_Close"    )
	_AutoItObject_AddMethod($ctrl, "Play"     , "GUIObjects_AVI_Play"     )
	_AutoItObject_AddMethod($ctrl, "Stop"     , "GUIObjects_AVI_Stop"     )
	_AutoItObject_AddMethod($ctrl, "Open"     , "GUIObjects_AVI_Open"     )
	_AutoItObject_AddMethod($ctrl, "OpenEx"   , "GUIObjects_AVI_OpenEx"   )
	_AutoItObject_AddMethod($ctrl, "Seek"     , "GUIObjects_AVI_Seek"     )
	_AutoItObject_AddMethod($ctrl, "Show"     , "GUIObjects_AVI_Show"     )
	_AutoItObject_AddMethod($ctrl, "Text"     , "GUIObjects_AVI_Text"     )
	_AutoItObject_AddMethod($ctrl, "Font"     , "GUIObjects_AVI_Font"     )
	_AutoItObject_AddMethod($ctrl, "Hide"     , "GUIObjects_AVI_Hide"     )
	_AutoItObject_AddMethod($ctrl, "Destroy"  , "GUIObjects_AVI_Destroy"  )
	_AutoItObject_AddMethod($ctrl, "IsPlaying", "GUIObjects_AVI_IsPlaying")

	_AutoItObject_RemoveMember($ctrl, "Text"     )
	_AutoItObject_RemoveMember($ctrl, "ControlID")

	_AutoItObject_AddProperty($ctrl, "FilePath" , $ELSCOPE_PUBLIC)
	_AutoItObject_AddProperty($ctrl, "SubFileID", $ELSCOPE_PUBLIC)

	$ctrl.Handle    = $handle
	$ctrl.FilePath  = $filepath
	$ctrl.SubFileID = $subfileID
	$ctrl.Left      = $left
	$ctrl.Top       = $top
	$ctrl.Width     = $ctrlPosition[2]
	$ctrl.Height    = $ctrlPosition[3]
	$ctrl.Style     = _WinAPI_GetWindowLong($handle, $GWL_STYLE)
	$ctrl.ExStyle   = _WinAPI_GetWindowLong($handle, $GWL_EXSTYLE)

    _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $ctrl)

    Return $ctrl
EndFunc

Func GUIObjects_AVI_Play(Const ByRef $this, Const $from = 0, Const $to = -1, Const $repeat = -1)
	Return _GUICtrlAVI_Play($this.Handle, $from, $to, $repeat)
EndFunc

Func GUIObjects_AVI_Stop(Const ByRef $this)
	Return _GUICtrlAVI_Stop($this.Handle)
EndFunc

Func GUIObjects_AVI_Seek(Const ByRef $this, Const $frame)
	Return _GUICtrlAVI_Seek($this.Handle, $frame)
EndFunc

Func GUIObjects_AVI_Close(Const ByRef $this)
	Return _GUICtrlAVI_Close($this.Handle)
EndFunc

Func GUIObjects_AVI_IsPlaying(Const ByRef $this)
	Return _GUICtrlAVI_IsPlaying($this.Handle)
EndFunc

Func GUIObjects_AVI_Show(Const ByRef $this)
	Return _GUICtrlAVI_Show($this.Handle, $SW_SHOW)
EndFunc

Func GUIObjects_AVI_Hide(Const ByRef $this)
	Return _GUICtrlAVI_Show($this.Handle, $SW_HIDE)
EndFunc

Func GUIObjects_AVI_Open(Const ByRef $this, Const $filename)
	Return _GUICtrlAVI_Open($this.Handle, $filename)
EndFunc

Func GUIObjects_AVI_OpenEx(Const ByRef $this, Const $filename, Const $resourceID)
	Return _GUICtrlAVI_Open($this.Handle, $filename, $resourceID)
EndFunc

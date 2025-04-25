#include-once

#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <Constants.au3>
#include <WinAPI.au3>

Func _iControl()
    Local Const $this = _AutoItObject_Class()

    $this.Create()

    $this.AddMethod("Read"      , "GUIOBjects_Control_Read"      )
    $this.AddMethod("GetStyle"  , "GUIOBjects_Control_GetStyle"  )
    $this.AddMethod("GetExStyle", "GUIOBjects_Control_GetExStyle")
    $this.AddMethod("ReceiveMsg", "GUIOBjects_Control_ReceiveMsg")

    $this.AddProperty("ControlID", $ELSCOPE_PUBLIC)
    $this.AddProperty("Handle"   , $ELSCOPE_PUBLIC)
    $this.AddProperty("Text"     , $ELSCOPE_PUBLIC)
    $this.AddProperty("Left"     , $ELSCOPE_PUBLIC)
    $this.AddProperty("Top"      , $ELSCOPE_PUBLIC)
    $this.AddProperty("Width"    , $ELSCOPE_PUBLIC)
    $this.AddProperty("Height"   , $ELSCOPE_PUBLIC)
    $this.AddProperty("Style"    , $ELSCOPE_PUBLIC)
    $this.AddProperty("ExStyle"  , $ELSCOPE_PUBLIC)

    Return $this.Object
EndFunc

Func GUIOBjects_Control_Read(ByRef $this, Const $advanced = 0)
    Return GUICtrlRead($this.ControlID, $advanced)
EndFunc

Func GUIOBjects_Control_GetStyle(ByRef $this)
    Return _WinAPI_GetWindowLong(HWnd($this.Handle), $GWL_STYLE)
EndFunc

Func GUIOBjects_Control_GetExStyle(ByRef $this)
    Return _WinAPI_GetWindowLong(HWnd($this.Handle), $GWL_EXSTYLE)
EndFunc

Func GUIOBjects_Control_ReceiveMsg(ByRef $this, Const $msg, Const $wParam = 1, Const $lParamType = 0)
    Return GUICtrlReceiveMsg($msg, $wParam, $lParamType)
EndFunc

Func GUIOBjects_Control_SetCursor(ByRef $this)
    Return GUICtrlSetCursor()
EndFunc

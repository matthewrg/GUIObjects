#include-once

#include <GUIConstantsEx.au3>
#include <AutoItConstants.au3>
#include "AVI.au3"
#include "Button.au3"
#include "Checkbox.au3"
#include "Combo.au3"
#include "Date.au3"
#include "Edit.au3"
#include "Label.au3"
#include "ListBox.au3"
#include "Menu.au3"

Func Control()
    Local Const $this = _AutoItObject_Class()

    $this.Create()

    $this.AddMethod("SetAttributes", "GUIOBjects_Control_SetAttributes")
    $this.AddMethod("Read"         , "GUIOBjects_Control_Read"         )
    $this.AddMethod("GetStyle"     , "GUIOBjects_Control_GetStyle"     )
    $this.AddMethod("GetExStyle"   , "GUIOBjects_Control_GetExStyle"   )
    $this.AddMethod("ReceiveMsg"   , "GUIOBjects_Control_ReceiveMsg"   )
    $this.AddMethod("SetCursor"    , "GUIOBjects_Control_SetCursor"    )
    $this.AddMethod("OnEvent"      , "GUIOBjects_Control_OnEvent"      )
	$this.AddMethod("BkColor"      , "GUIObjects_Control_BkColor"      )
	$this.AddMethod("TextColor"    , "GUIObjects_Control_TextColor"    )
	$this.AddMethod("SetText"      , "GUIObjects_Control_SetText"      )
	$this.AddMethod("SetTip"       , "GUIObjects_Control_SetTip"       )

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

Func GUIOBjects_Control_SetAttributes(ByRef $this, Const $controlID, Const $handle, Const $text, Const $left, Const $top, Const $ctrlPosition)
	$this.ControlID = $controlID
	$this.Handle    = $handle
	$this.Text      = $text
	$this.Left      = $left
	$this.Top       = $top
	$this.Width     = $ctrlPosition[2]
	$this.Height    = $ctrlPosition[3]
	$this.Style     = _WinAPI_GetWindowLong($handle, $GWL_STYLE)
	$this.ExStyle   = _WinAPI_GetWindowLong($handle, $GWL_EXSTYLE)
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

Func GUIObjects_Control_BkColor(Const ByRef $this, Const $bkColor)
	Return GUICtrlSetBkColor($this.ControlID, $bkColor)
EndFunc

Func GUIObjects_Control_TextColor(Const ByRef $this, Const $textcolor)
	Return GUICtrlSetColor($this.ControlID, $textcolor)
EndFunc

Func GUIOBjects_Control_ReceiveMsg(ByRef $this, Const $msg, Const $wParam = 1, Const $lParamType = 0)
    Return GUICtrlReceiveMsg($msg, $wParam, $lParamType)
EndFunc

Func GUIOBjects_Control_SetCursor(ByRef $this, Const $cursorID)
    Return GUICtrlSetCursor($this.ControlID, $cursorID)
EndFunc

Func GUIOBjects_Control_OnEvent(ByRef $this, Const $function)
    Return GUICtrlSetOnEvent($this.ControlID, $function)
EndFunc

Func GUIObjects_Control_SetText(ByRef $this, Const $text)
	Return GUICtrlSetData($this.ControlID, $text)
EndFunc

Func GUIObjects_Control_Font(Const ByRef $this, Const $size = 8.5, Const $weight = 0, Const $attribute = 0, Const $fontname = '', Const $quality = 0)
	Return GUICtrlSetFont($this.ControlID, $size, $weight, $attribute, $fontname, $quality)
EndFunc

Func GUIObjects_Control_SetTip(Const ByRef $this, Const $tipText, Const $title = Default, Const $icon = Default, Const $options = Default)
    Return GUICtrlSetTip($this.ControlID, $tipText, $title, $icon, $options)
EndFunc

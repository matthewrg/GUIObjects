#include-once

#include <AutoItConstants.au3>
#include <GUIConstantsEx.au3>

Func _iForm()
    Local Const $this = _AutoItObject_Class()

	$this.Create()

	$this.AddMethod("Child"          , "GUIObjects_Form_Child"          )
	$this.AddMethod("Show"           , "GUIObjects_Form_Show"           )
	$this.AddMethod("Hide"           , "GUIObjects_Form_Hide"           )
	$this.AddMethod("Minimize"       , "GUIObjects_Form_Minimize"       )
	$this.AddMethod("Maximize"       , "GUIObjects_Form_Maximize"       )
	$this.AddMethod("Restore"        , "GUIObjects_Form_Restore"        )
	$this.AddMethod("Disable"        , "GUIObjects_Form_Disable"        )
	$this.AddMethod("Enable"         , "GUIObjects_Form_Enable"         )
	$this.AddMethod("Lock"           , "GUIObjects_Form_Lock"           )
	$this.AddMethod("Unlock"         , "GUIObjects_Form_Unlock"         )
	$this.AddMethod("ShowDefault"    , "GUIObjects_Form_ShowDefault"    )
	$this.AddMethod("ShowMaximized"  , "GUIObjects_Form_ShowMaximized"  )
	$this.AddMethod("ShowMinimized"  , "GUIObjects_Form_ShowMinimized"  )
	$this.AddMethod("ShowMinNoActive", "GUIObjects_Form_ShowMinNoActive")
	$this.AddMethod("ShowNA"         , "GUIObjects_Form_ShowNA"         )
	$this.AddMethod("ShowNormal"     , "GUIObjects_Form_ShowNormal"     )
	$this.AddMethod("SetDefBkColor"  , "GUIObjects_Form_SetDefBkColor"  )
	$this.AddMethod("SetDefColor"    , "GUIObjects_Form_SetDefColor"    )
	$this.AddMethod("", "GUIObjects_Form_")

	$this.AddMethod("AVI"            , "GUIObjects_Form_AVI"            )
	$this.AddMethod("Button"         , "GUIObjects_Form_Button"         )
	$this.AddMethod("Checkbox"       , "GUIObjects_Form_Checkbox"       )
	$this.AddMethod("Combo"          , "GUIObjects_Form_Combo"          )
	$this.AddMethod("Date"           , "GUIObjects_Form_Date"           )
	$this.AddMethod("Edit"           , "GUIObjects_Form_Edit"           )
	$this.AddMethod("Label"          , "GUIObjects_Form_Label"          )
	$this.AddMethod("Listbox"        , "GUIObjects_Form_Listbox"        )
	$this.AddMethod("Listview"       , "GUIObjects_Form_Listview"       )
	$this.AddMethod("MonthCal"       , "GUIObjects_Form_MonthCal"       )
	$this.AddMethod("Progress"       , "GUIObjects_Form_Progress"       )
	$this.AddMethod("Slider"         , "GUIObjects_Form_Slider"         )
	$this.AddMethod("Tab"            , "GUIObjects_Form_Tab"            )
	$this.AddMethod("TreeView"       , "GUIObjects_Form_TreeView"       )
	$this.AddMethod("UpDown"         , "GUIObjects_Form_UpDown"         )

	$this.AddProperty("Handle" , $ELSCOPE_PUBLIC)
	$this.AddProperty("Title"  , $ELSCOPE_PUBLIC)
	$this.AddProperty("Width"  , $ELSCOPE_PUBLIC)
	$this.AddProperty("Height" , $ELSCOPE_PUBLIC)
	$this.AddProperty("Left"   , $ELSCOPE_PUBLIC)
	$this.AddProperty("Top"    , $ELSCOPE_PUBLIC)
	$this.AddProperty("Style"  , $ELSCOPE_PUBLIC)
	$this.AddProperty("ExStyle", $ELSCOPE_PUBLIC)
	$this.AddProperty("Locked" , $ELSCOPE_PUBLIC, False)
	$this.AddProperty("", $ELSCOPE_PUBLIC)

    Return $this.Object
EndFunc

Func GUIObjects_Form_Child(ByRef $this, Const $name, Const $title, Const $width, Const $height, Const $left = -1, Const $top = -1, Const $style = -1, Const $exStyle = -1)

EndFunc

#region - SetState
Func GUIObjects_Form_Show(ByRef $this)
    Return GUISetState(@SW_SHOW, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_Hide(ByRef $this)
    Return GUISetState(@SW_HIDE, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_Minimize(ByRef $this)
    Return GUISetState(@SW_MINIMIZE, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_Maximize(ByRef $this)
    Return GUISetState(@SW_MAXIMIZE, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_Restore(ByRef $this)
    Return GUISetState(@SW_RESTORE, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_Disable(ByRef $this)
    Return GUISetState(@SW_DISABLE, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_Enable(ByRef $this)
    Return GUISetState(@SW_ENABLE, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_Lock(ByRef $this)
    Switch $this.Locked
        Case False
            $this.Locked = True

            Return GUISetState(@SW_LOCK, HWnd($this.Handle))
        
        Case True
            Return SetError(1, 0, False)
    EndSwitch
EndFunc

Func GUIObjects_Form_Unlock(ByRef $this)
    Switch $this.Locked
        Case True
            $this.Locked = False

            Return GUISetState(@SW_UNLOCK, HWnd($this.Handle))
        
        Case False
            Return SetError(1, 0, False)
    EndSwitch
EndFunc

Func GUIObjects_Form_ShowDefault(ByRef $this)
    Return GUISetState(@SW_SHOWDEFAULT, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_ShowMaximized(ByRef $this)
    Return GUISetState(@SW_SHOWMAXIMIZED, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_ShowMinimized(ByRef $this)
    Return GUISetState(@SW_SHOWMINIMIZED, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_ShowMinNoActive(ByRef $this)
    Return GUISetState(@SW_SHOWMINNOACTIVE, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_ShowNA(ByRef $this)
    Return GUISetState(@SW_SHOWNA, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_ShowNoActivate(ByRef $this)
    Return GUISetState(@SW_SHOWNOACTIVATE, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_ShowNormal(ByRef $this)
    Return GUISetState(@SW_SHOWNORMAL, HWnd($this.Handle))
EndFunc
#EndRegion

Func GUIObjects_Form_SetDefBkColor(ByRef $this, Const $bkColor)
	Return GUICtrlSetDefBkColor($bkColor, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_SetDefColor(ByRef $this, Const $bkColor)
	Return GUICtrlSetDefColor($bkColor, HWnd($this.Handle))
EndFunc

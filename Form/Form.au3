#include-once

#include "..\Control\Control.au3"

Func Form()
    Local Const $this = _AutoItObject_Class()

	$this.Create()

	$this.AddMethod("Child"          , "GUIObjects_Form_Child"          )
	$this.AddMethod("Delete"         , "GUIObjects_Form_Delete"         )
	$this.AddMethod("Disable"        , "GUIObjects_Form_Disable"        )
	$this.AddMethod("Enable"         , "GUIObjects_Form_Enable"         )
	$this.AddMethod("GetCursorInfo"  , "GUIObjects_Form_GetCursorInfo"  )
	$this.AddMethod("GetExStyle"     , "GUIObjects_Form_GetExStyle"     )
	$this.AddMethod("GetStyle"       , "GUIObjects_Form_GetStyle"       )
	$this.AddMethod("Hide"           , "GUIObjects_Form_Hide"           )
	$this.AddMethod("Show"           , "GUIObjects_Form_Show"           )
	$this.AddMethod("Minimize"       , "GUIObjects_Form_Minimize"       )
	$this.AddMethod("Maximize"       , "GUIObjects_Form_Maximize"       )
	$this.AddMethod("Restore"        , "GUIObjects_Form_Restore"        )
	$this.AddMethod("Lock"           , "GUIObjects_Form_Lock"           )
	$this.AddMethod("Unlock"         , "GUIObjects_Form_Unlock"         )
	$this.AddMethod("RegisterMsg"    , "GUIObjects_Form_RegisterMsg"    )
	$this.AddMethod("SetBkColor"     , "GUIObjects_Form_SetBkColor"     )
	$this.AddMethod("SetCursor"      , "GUIObjects_Form_SetCursor"      )
	$this.AddMethod("ShowDefault"    , "GUIObjects_Form_ShowDefault"    )
	$this.AddMethod("SetDefBkColor"  , "GUIObjects_Form_SetDefBkColor"  )
	$this.AddMethod("SetDefColor"    , "GUIObjects_Form_SetDefColor"    )
	$this.AddMethod("ShowMaximized"  , "GUIObjects_Form_ShowMaximized"  )
	$this.AddMethod("ShowMinimized"  , "GUIObjects_Form_ShowMinimized"  )
	$this.AddMethod("ShowMinNoActive", "GUIObjects_Form_ShowMinNoActive")
	$this.AddMethod("ShowNA"         , "GUIObjects_Form_ShowNA"         )
	$this.AddMethod("ShowNormal"     , "GUIObjects_Form_ShowNormal"     )
	$this.AddMethod("SetFont"        , "GUIObjects_Form_SetFont"        )
	$this.AddMethod("SetStyle"       , "GUIObjects_Form_SetStyle"       )
	$this.AddMethod("SetExStyle"     , "GUIObjects_Form_SetExStyle"     )
	$this.AddMethod("SetHelp"        , "GUIObjects_Form_SetHelp"        )
	$this.AddMethod("SetOnEvent"     , "GUIObjects_Form_SetOnEvent"     )
	$this.AddMethod("SetAccelerators", "GUIObjects_Form_SetAccelerators")
	$this.AddMethod("", "GUIObjects_Form_")

	$this.AddMethod("AVI"     , "GUIObjects_AVI"     )
	$this.AddMethod("Button"  , "GUIObjects_Button"  )
	$this.AddMethod("Checkbox", "GUIObjects_Checkbox")
	$this.AddMethod("Combo"   , "GUIObjects_Combo"   )
	$this.AddMethod("Date"    , "GUIObjects_Date"    )
	$this.AddMethod("Edit"    , "GUIObjects_Edit"    )
	$this.AddMethod("Label"   , "GUIObjects_Label"   )
	$this.AddMethod("ListBox" , "GUIObjects_ListBox" )
	$this.AddMethod("Listview", "GUIObjects_Listview")
	$this.AddMethod("Menu"    , "GUIObjects_Menu"    )
	$this.AddMethod("MonthCal", "GUIObjects_MonthCal")
	$this.AddMethod("Progress", "GUIObjects_Progress")
	$this.AddMethod("Slider"  , "GUIObjects_Slider"  )
	$this.AddMethod("Tab"     , "GUIObjects_Tab"     )
	$this.AddMethod("TreeView", "GUIObjects_TreeView")
	$this.AddMethod("UpDown"  , "GUIObjects_UpDown"  )

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
    ;ConsoleWrite("Child: " & HWnd($this.Handle) & @CRLF)
    
    Switch $left <> -1 And $top = -1
        Case False
            Local Const $handle = GUICreate($title, $width, $height, $left, $top, $style, $WS_EX_MDICHILD, HWnd($this.Handle))

            Local Const $guiPosition = WinGetPos($handle)
            
            Local $form = _AutoItObject_Create(Form())

            $form.Handle  = $handle        
            $form.Title   = $title         
            $form.Width   = $width         
            $form.Height  = $height        
            $form.Left    = $guiPosition[0]
            $form.Top     = $guiPosition[1]
            $form.Style   = $style         
            $form.ExStyle = $exStyle       

            _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $form)

            Return $form
        Case True
            $this.DebugPrint("If a form's left property is defined then the top property must be defined as well.")

            Return SetError(-1, 0, False)
    EndSwitch
EndFunc

Func GUIObjects_Form_Delete(Const ByRef $this)
	Return GUIDelete(HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_SetHelp(ByRef $this, Const $helpfile)
	Return GUISetHelp($helpfile, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_SetAccelerators(ByRef $this, Const $accelerators)
	Return GUISetAccelerators($accelerators, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_GetCursorInfo()
	Return GUIGetCursorInfo(HWnd($this.Handle))
EndFunc

#region - OnEvent
Func GUIObjects_Form_SetOnEvent(ByRef $this, Const $specialID, Const $function)
	Return GUISetOnEvent($specialID, $function, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_RegisterMsg(ByRef $this, Const $msgId, Const $function)
	Return GUIRegisterMsg($msgID, $function)
EndFunc
#endregion

#region - State
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

#region - Appearance
Func GUIObjects_Form_SetDefBkColor(Const ByRef $this, Const $bkColor)
	Return GUICtrlSetDefBkColor($bkColor, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_SetDefColor(Const ByRef $this, Const $bkColor)
	Return GUICtrlSetDefColor($bkColor, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_SetBkColor(ByRef $this, Const $bkColor)
	Return GUISetBkColor($bkColor)
EndFunc

Func GUIObjects_Form_SetCursor(ByRef $this, Const $cursorID, Const $override = 0)
	GUISetCursor($cursorId, $override, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_SetFont(ByRef $this, Const $size, Const $weight = 0, Const $attribute = 0, Const $fontname = '', Const $quality = 0)
	Return GUISetFont($size, $weight, $attribute, $fontname, HWnd($this.Handle), $quality)
EndFunc

Func GUIObjects_Form_SetIcon(ByRef $this, Const $iconfile, Const $iconID = -1)
	Return GUISetIcon($iconfile, $iconID, HWnd($this.Handle))
EndFunc
#endregion

#region - Style
Func GUIObjects_Form_GetStyle(ByRef $this)
	Return GUIGetStyle(HWnd($this.Handle))[0]
EndFunc

Func GUIObjects_Form_GetExStyle(ByRef $this)
	Return GUIGetStyle(HWnd($this.Handle))[1]
EndFunc

Func GUIObjects_Form_SetStyle(ByRef $this, Const $style)
	Return GUISetStyle($style, -1, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_SetExStyle(ByRef $this, Const $exStyle)
	Return GUISetStyle(-1, $exStyle, HWnd($this.Handle))
EndFunc
#endregion

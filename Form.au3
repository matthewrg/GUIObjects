#include-once

Func GUIObjects_Form(ByRef $this, Const $name, Const $title, Const $width, Const $height, Const $left = -1, Const $top = -1, Const $style = -1, Const $exStyle = -1)
    Switch $left <> -1 And $top = -1
        Case False
            Local Const $handle = GUICreate($title, $width, $height, $left, $top, $style, $exStyle)

            Local Const $guiPosition = WinGetPos(HWnd($handle))

            Local Const $form = _AutoItObject_Class()

            $form.Create()

            $form.AddMethod("Child"          , "GUIObjects_Form_Child"          )
            $form.AddMethod("Show"           , "GUIObjects_Form_Show"           )
            $form.AddMethod("Hide"           , "GUIObjects_Form_Hide"           )
            $form.AddMethod("Minimize"       , "GUIObjects_Form_Minimize"       )
            $form.AddMethod("Maximize"       , "GUIObjects_Form_Maximize"       )
            $form.AddMethod("Restore"        , "GUIObjects_Form_Restore"        )
            $form.AddMethod("Disable"        , "GUIObjects_Form_Disable"        )
            $form.AddMethod("Enable"         , "GUIObjects_Form_Enable"         )
            $form.AddMethod("Lock"           , "GUIObjects_Form_Lock"           )
            $form.AddMethod("Unlock"         , "GUIObjects_Form_Unlock"         )
            $form.AddMethod("ShowDefault"    , "GUIObjects_Form_ShowDefault"    )
            $form.AddMethod("ShowMaximized"  , "GUIObjects_Form_ShowMaximized"  )
            $form.AddMethod("ShowMinimized"  , "GUIObjects_Form_ShowMinimized"  )
            $form.AddMethod("ShowMinNoActive", "GUIObjects_Form_ShowMinNoActive")
            $form.AddMethod("ShowNA"         , "GUIObjects_Form_ShowNA"         )
            $form.AddMethod("ShowNormal"     , "GUIObjects_Form_ShowNormal"     )
            $form.AddMethod("AVI"            , "GUIObjects_Form_AVI"            )
            $form.AddMethod("Button"         , "GUIObjects_Form_Button"         )
            $form.AddMethod("Checkbox"       , "GUIObjects_Form_Checkbox"       )
            $form.AddMethod("Combo"          , "GUIObjects_Form_Combo"          )
            $form.AddMethod("Date"           , "GUIObjects_Form_Date"           )
            $form.AddMethod("Edit"           , "GUIObjects_Form_Edit"           )
            $form.AddMethod("Label"          , "GUIObjects_Form_Label"          )
            $form.AddMethod("Listbox"        , "GUIObjects_Form_Listbox"        )
            $form.AddMethod("Listview"       , "GUIObjects_Form_Listview"       )
            $form.AddMethod("MonthCal"       , "GUIObjects_Form_MonthCal"       )
            $form.AddMethod("Progress"       , "GUIObjects_Form_Progress"       )
            $form.AddMethod("Slider"         , "GUIObjects_Form_Slider"         )
            $form.AddMethod("Tab"            , "GUIObjects_Form_Tab"            )
            $form.AddMethod("TreeView"       , "GUIObjects_Form_TreeView"       )
            $form.AddMethod("UpDown"         , "GUIObjects_Form_UpDown"         )
            $form.AddMethod("", "GUIObjects_Form_")

            $form.AddProperty("Handle" , $ELSCOPE_READONLY, $handle        )
            $form.AddProperty("Title"  , $ELSCOPE_READONLY, $title         )
            $form.AddProperty("Width"  , $ELSCOPE_READONLY, $width         )
            $form.AddProperty("Height" , $ELSCOPE_READONLY, $height        )
            $form.AddProperty("Left"   , $ELSCOPE_READONLY, $guiPosition[0])
            $form.AddProperty("Top"    , $ELSCOPE_READONLY, $guiPosition[1])
            $form.AddProperty("Style"  , $ELSCOPE_READONLY, $style         )
            $form.AddProperty("ExStyle", $ELSCOPE_READONLY, $exStyle       )
            $form.AddProperty("", $ELSCOPE_READONLY)

            $form.AddMethod("DebugPrint", "GUIObjects_Form_DebugPrint", True)
            $form.AddMethod("SetDebug"  , "GUIObjects_Form_SetDebug"  , True)
            $form.AddMethod("", "GUIObjects_Form_", True)

            $form.AddProperty("Locked" , $ELSCOPE_PRIVATE, False)
            $form.AddProperty("Debug"  , $ELSCOPE_PRIVATE, False)
            $form.AddProperty("", $ELSCOPE_PRIVATE)

            Local Const $object = $form.Object

            _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $object)

            Return $object
        Case True
            If $this.Debug Then $this.DebugPrint("If width is defined then top must be defined as well.")
            
            Return SetError(-1, 0, False)
    EndSwitch
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

Func GUIObjects_Form_SetDebug(ByRef $this, Const $debug = True)
    $this.Debug = $debug
EndFunc

Func GUIObjects_Form_DebugPrint(ByRef Const $this, Const ByRef $message)
    Switch $this.Debug 
        Case True 
            ConsoleWrite($message & @CRLF)
    EndSwitch
EndFunc
#EndRegion

#include-once

#include <AutoItConstants.au3>
#include <GUIConstantsEx.au3>
#include <ColorConstants.au3>
#include <WindowsConstants.au3>

#include "iForm.au3"

Func GUIObjects_Form(ByRef $this, Const $name, Const $title, Const $width, Const $height, Const $left = -1, Const $top = -1, Const $style = -1, Const $exStyle = -1)    
    Switch $left <> -1 And $top = -1
        Case False
            Local Const $handle = GUICreate($title, $width, $height, $left, $top, $style, $exStyle)

            ;ConsoleWrite("Parent: " & $handle & @CRLF)

            Local Const $guiPosition = WinGetPos($handle)
            
            Local $form = _AutoItObject_Create(_iForm())

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

Func GUIObjects_Form_Child(ByRef $this, Const $name, Const $title, Const $width, Const $height, Const $left = -1, Const $top = -1, Const $style = -1, Const $exStyle = -1)
    ;ConsoleWrite("Child: " & HWnd($this.Handle) & @CRLF)
    
    Switch $left <> -1 And $top = -1
        Case False
            Local Const $handle = GUICreate($title, $width, $height, $left, $top, $style, $WS_EX_MDICHILD, HWnd($this.Handle))

            Local Const $guiPosition = WinGetPos($handle)
            
            Local $form = _AutoItObject_Create(_iForm())

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

Func GUIObjects_Form_SetOnEvent(ByRef $this, Const $specialID, Const $function)
	Return GUISetOnEvent($specialID, $function, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_RegisterMsg(ByRef $this, Const $msgId, Const $function)
	Return GUIRegisterMsg($msgID, $function)
EndFunc

Func GUIObjects_Form_SetAccelerators(ByRef $this, Const $accelerators)
	Return GUISetAccelerators($accelerators, HWnd($this.Handle))
EndFunc

Func GUIObjects_Form_GetCursorInfo()
	Return GUIGetCursorInfo(HWnd($this.Handle))
EndFunc

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

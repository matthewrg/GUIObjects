#include-once

#include <EditConstants.au3>

Func GUIObjects_Edit(ByRef $this, Const $name, Const $text, Const $left, Const $top, Const $width = 150, Const $height = 150, Const $style = 0x003010C4, Const $exStyle = 0x00000200)
	Local Const $handle = _GUICtrlEdit_Create($text, $left, $top, $width, $height, $style, $exStyle)

	Local $ctrl = _AutoItObject_Create(Control())
	
	_AutoItObject_AddMethod($ctrl, "AppendText"         , "GUIObjects_Edit_AppendText"         )
	_AutoItObject_AddMethod($ctrl, "BeginUpdate"        , "GUIObjects_Edit_BeginUpdate"        )
	_AutoItObject_AddMethod($ctrl, "CanUndo"            , "GUIObjects_Edit_CanUndo"            )
	_AutoItObject_AddMethod($ctrl, "CharFromPos"        , "GUIObjects_Edit_CharFromPos"        )
	_AutoItObject_AddMethod($ctrl, "Destroy"            , "GUIObjects_Edit_Destroy"            )
	_AutoItObject_AddMethod($ctrl, "EmptyUndoBuffer"    , "GUIObjects_Edit_EmptyUndoBuffer"    )
	_AutoItObject_AddMethod($ctrl, "EndUpdate"          , "GUIObjects_Edit_EndUpdate"          )
	_AutoItObject_AddMethod($ctrl, "Find"               , "GUIObjects_Edit_Find"               )
	_AutoItObject_AddMethod($ctrl, "FmtLines"           , "GUIObjects_Edit_FmtLines"           )
	_AutoItObject_AddMethod($ctrl, "GetCueBanner"       , "GUIObjects_Edit_GetCueBanner"       )
	_AutoItObject_AddMethod($ctrl, "GetFirstVisibleLine", "GUIObjects_Edit_GetFirstVisibleLine")
	_AutoItObject_AddMethod($ctrl, "GetLimitText"       , "GUIObjects_Edit_GetLimitText"       )
	_AutoItObject_AddMethod($ctrl, "GetLine"            , "GUIObjects_Edit_GetLine"            )
	_AutoItObject_AddMethod($ctrl, "GetLineCount"       , "GUIObjects_Edit_GetLineCount"       )
	_AutoItObject_AddMethod($ctrl, "GetMargins"         , "GUIObjects_Edit_GetMargins"         )
	_AutoItObject_AddMethod($ctrl, "GetModify"          , "GUIObjects_Edit_GetModify"          )
	_AutoItObject_AddMethod($ctrl, "GetPasswordChar"    , "GUIObjects_Edit_GetPasswordChar"    )
	_AutoItObject_AddMethod($ctrl, "GetRect"            , "GUIObjects_Edit_GetRect"            )
	_AutoItObject_AddMethod($ctrl, "GetRectEx"          , "GUIObjects_Edit_GetRectEx"          )
	_AutoItObject_AddMethod($ctrl, "GetSel"             , "GUIObjects_Edit_GetSel"             )
	_AutoItObject_AddMethod($ctrl, "GetText"            , "GUIObjects_Edit_GetText"            )
	_AutoItObject_AddMethod($ctrl, "GetTextLen"         , "GUIObjects_Edit_GetTextLen"         )
	_AutoItObject_AddMethod($ctrl, "HideBalloonTip"     , "GUIObjects_Edit_HideBalloonTip"     )
	_AutoItObject_AddMethod($ctrl, "InsertText"         , "GUIObjects_Edit_InsertText"         )
	_AutoItObject_AddMethod($ctrl, "LineFromChar"       , "GUIObjects_Edit_LineFromChar"       )
	_AutoItObject_AddMethod($ctrl, "LineIndex"          , "GUIObjects_Edit_LineIndex"          )
	_AutoItObject_AddMethod($ctrl, "LineLength"         , "GUIObjects_Edit_LineLength"         )
	_AutoItObject_AddMethod($ctrl, "LineScroll"         , "GUIObjects_Edit_LineScroll"         )
	_AutoItObject_AddMethod($ctrl, "PosFromChar"        , "GUIObjects_Edit_PosFromChar"        )
	_AutoItObject_AddMethod($ctrl, "ReplaceSel"         , "GUIObjects_Edit_ReplaceSel"         )
	_AutoItObject_AddMethod($ctrl, "Scroll"             , "GUIObjects_Edit_Scroll"             )
	_AutoItObject_AddMethod($ctrl, "SetCueBanner"       , "GUIObjects_Edit_SetCueBanner"       )
	_AutoItObject_AddMethod($ctrl, "SetLimitText"       , "GUIObjects_Edit_SetLimitText"       )
	_AutoItObject_AddMethod($ctrl, "SetMargins"         , "GUIObjects_Edit_SetMargins"         )
	_AutoItObject_AddMethod($ctrl, "SetModify"          , "GUIObjects_Edit_SetModify"          )
	_AutoItObject_AddMethod($ctrl, "SetPadding"         , "GUIObjects_Edit_SetPadding"         )
	_AutoItObject_AddMethod($ctrl, "SetPasswordChar"    , "GUIObjects_Edit_SetPasswordChar"    )
	_AutoItObject_AddMethod($ctrl, "SetReadOnly"        , "GUIObjects_Edit_SetReadOnly"        )
	_AutoItObject_AddMethod($ctrl, "SetRect"            , "GUIObjects_Edit_SetRect"            )
	_AutoItObject_AddMethod($ctrl, "SetRectEx"          , "GUIObjects_Edit_SetRectEx"          )
	_AutoItObject_AddMethod($ctrl, "SetRectNp"          , "GUIObjects_Edit_SetRectNp"          )
	_AutoItObject_AddMethod($ctrl, "SetRectNpEx"        , "GUIObjects_Edit_SetRectNpEx"        )
	_AutoItObject_AddMethod($ctrl, "SetSel"             , "GUIObjects_Edit_SetSel"             )
	_AutoItObject_AddMethod($ctrl, "SetTabStops"        , "GUIObjects_Edit_SetTabStops"        )
	_AutoItObject_AddMethod($ctrl, "SetText"            , "GUIObjects_Edit_SetText"            )
	_AutoItObject_AddMethod($ctrl, "ShowBalloonTip"     , "GUIObjects_Edit_ShowBalloonTip"     )
	_AutoItObject_AddMethod($ctrl, "Undo"               , "GUIObjects_Edit_Undo"               )

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

#cs
	Description:
		Appends text.

	Return:
		None
#ce
Func GUIObjects_Edit_AppendText(ByRef $this, Const $text)
	Return _GUICtrlEdit_AppendText(HWnd($this.Handle), $text)
EndFunc	

#cs
	Description:
		Prevents updating of the control until the _GUICtrlEdit_EndUpdate function is called.

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_Beginupdate(ByRef $this)
	Return _GUICtrlEdit_BeginUpdate(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Determines whether there are any actions in an edit control's undo queue.

	Return:
		True: If there are actions in the control's undo queue.

		False: If the undo queue is empty.
#ce
Func GUIObjects_Edit_CanUndo(ByRef $this)
	Return _GUICtrlEdit_CanUndo(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Retrieves information about the character closest to a specified point in the client area.
	
	Parameters:
		$x: horizontal position 
		$y: vertical position 

	Return:
		Returns an array in the following format:
			[0] - 0-based index of the character nearest the specified point
			[1] - 0-based index of the line that contains the character
#ce
Func GUIObjects_Edit_CharFromPos(ByRef $this, Const $x, Const $y)
	Return _GUICtrlEdit_CharFromPos(HWnd($this.Handle), $x, $y)
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_Destroy(ByRef $this)
	Return _GUICtrlEdit_Destroy(HWnd($this.Handle))	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_EmptyUndoBuffer(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_EndUpdate(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_Find(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_FmtLines(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetCueBanner(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetFirstVisibleLine(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetLimitText(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetLine(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetLineCount(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetMargins(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetModify(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetPasswordChar(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetRect(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetRectEx(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetSel(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetText(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_GetTextLen(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_HideBalloonTip(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_InsertText(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_LineFromChar(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_LineIndex(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_LineLength(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_LineScroll(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_PosFromChar(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_ReplaceSel(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_Scroll(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetCueBanner(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetLimitText(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetMargins(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetModify(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetPadding(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetPasswordChar(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetReadOnly(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetRect(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetRectEx(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetRectNp(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetRectNpEx(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetSel(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetTabStops(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_SetText(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_ShowBalloonTip(ByRef $this)
	
EndFunc

#cs
	Description:

	Return:
		Success: True. 

		Failure: False. 
#ce
Func GUIObjects_Edit_Undo(ByRef $this)
	
EndFunc

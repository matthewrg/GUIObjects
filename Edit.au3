#include-once

#include <EditConstants.au3>
#include <ScrollBarsConstants.au3>

Func GUIObjects_Edit(Const ByRef $this, Const $name, Const $text, Const $left, Const $top, Const $width = 150, Const $height = 150, Const $style = 0x003010C4, Const $exStyle = 0x00000200)
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

	Returns:
		None
#ce
Func GUIObjects_Edit_AppendText(Const ByRef $this, Const $text)
	_GUICtrlEdit_AppendText(HWnd($this.Handle), $text)
EndFunc	

#cs
	Description:
		Prevents updating of the control until the _GUICtrlEdit_EndUpdate function is called.

	Returns:
		Success: True. 
		Failure: False. 
#ce
Func GUIObjects_Edit_Beginupdate(Const ByRef $this)
	Return _GUICtrlEdit_BeginUpdate(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Determines whether there are any actions in an edit control's undo queue.

	Returns:
		True: If there are actions in the control's undo queue.
		False: If the undo queue is empty.

	Remarks:
		If the undo queue is not empty, you can call the _GUICtrlEdit_Undo() to undo the most recent operation.
#ce
Func GUIObjects_Edit_CanUndo(Const ByRef $this)
	Return _GUICtrlEdit_CanUndo(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Retrieves information about the character closest to a specified point in the client area.
	
	Parameters:
		$x: horizontal position 
		$y: vertical position 

	Returns:
		Returns an array in the following format:
			[0] - 0-based index of the character nearest the specified point
			[1] - 0-based index of the line that contains the character
#ce
Func GUIObjects_Edit_CharFromPos(Const ByRef $this, Const $x, Const $y)
	Return _GUICtrlEdit_CharFromPos(HWnd($this.Handle), $x, $y)
EndFunc

#cs
	Description:
		Delete the Edit control

	Returns:
		Success: True, $hWnd is set to 0.
		Failure: False. 
#ce
Func GUIObjects_Edit_Destroy(Const ByRef $this)
	Return _GUICtrlEdit_Destroy(HWnd($this.Handle))	
EndFunc

#cs
	Description:
		Resets the undo flag of an edit control.

	Returns:
		None.

	Remarks:
		The undo flag is automatically reset whenever the edit control receives a _GUICtrlEdit_SetText().
#ce
Func GUIObjects_Edit_EmptyUndoBuffer(Const ByRef $this)
	_GUICtrlEdit_EmptyUndoBuffer(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Enables screen repainting that was turned off with the _GUICtrlEdit_BeginUpdate function.

	Returns:
		Success: True. 
		Failure: False. 
#ce
Func GUIObjects_Edit_EndUpdate(Const ByRef $this)
	Return _GUICtrlEdit_EndUpdate(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Initiates a find dialog.		

	Parameters:
		$replace:
			True: show option
			False: hide option

	Returns:
		None. 

	Remarks:
		If you use text from the edit control and that text gets replaced the function will no longer function correctly.
#ce
Func GUIObjects_Edit_Find(Const ByRef $this, Const $replace = False)
	_GUICtrlEdit_Find(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Determines whether an edit control includes soft line-break characters.

	Parameters:
		$softBreak:
			True: inserts the characters
			False: removes the characters

	Returns:
		Return is identical to the $softBreak parameter. 

	Remarks:
		A soft line break consists of two carriage returns and a line feed and is inserted 
		at the end of a line that is broken because of wordwrapping.

		This function affects only the text returned by the _GUICtrlEdit_GetText() function.

		It has no effect on the display of the text within the edit control.

		This function does not affect a line that ends with a hard line break.
		A hard line break consists of one carriage return and a line feed.
#ce
Func GUIObjects_Edit_FmtLines(Const ByRef $this, Const $softBreak = False)
	Return _GUICtrlEdit_FmtLines(HWnd($this.Handle), $softBreak)
EndFunc

#cs
	Description:
		Gets the cue banner text displayed in the edit control.

	Returns:
		Success: the cue banner text. 
		Failure: an empty string ''. 

	Remarks:
		The cue banner is text that is displayed in the edit control when there is no selection.
		Windows Vista or later.
#ce
Func GUIObjects_Edit_GetCueBanner(Const ByRef $this)
	Return _GUICtrlEdit_GetCueBanner(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Retrieves the 0-based index of the uppermost visible line in a multiline edit control

	Returns:
		Returns a 0-based index of the uppermost visible line in a multiline edit control. 

	Remarks:
		The number of lines and the length of the lines in an edit control depend on the
		width of the control and the current Wordwrap setting.
#ce
Func GUIObjects_Edit_GetFirstVisibleLine(Const ByRef $this)
	Return _GUICtrlEdit_GetFirstVisibleLine(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Gets the current text limit for an edit control.

	Returns:
		Returns the text limit. 

	Remarks
		The text limit is the maximum amount of text, in TCHARs, that the control can contain.
		For ANSI text, this is the number of bytes; for Unicode text, this is the number of characters.
		Two documents with the same character limit will yield the same text limit, even 
		if one is ANSI and the other is Unicode.
#ce
Func GUIObjects_Edit_GetLimitText(Const ByRef $this)
	Return _GUICtrlEdit_GetLimitText(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Retrieves a line of text from an edit control

	Parameters:
		$line: 0-based line index to get 

	Returns:
		Success: the line of text. 
		Failure: an empty string. 
#ce
Func GUIObjects_Edit_GetLine(Const ByRef $this, Const $line)
	Return _GUICtrlEdit_GetLine(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Retrieves the number of lines.

	Returns:
		Success: the total number of text lines.
		Failure: 1 

	Remarks
		If the control has no text, the return value is 1. The return value will 
		never be less than 1.

		The _GUICtrlEdit_GetLineCount() retrieves the total number of text lines, 
		not just the number of lines that are currently visible.

		If the Wordwrap feature is enabled, the number of lines can change when 
		the dimensions of the editing window change.
#ce
Func GUIObjects_Edit_GetLineCount(Const ByRef $this)
	Return _GUICtrlEdit_GetLineCount(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Retrieves the widths of the left and right margins.

	Returns:
		Returns an array in the following format:
			[0] - The width of the left margin
			[1] - The width of the right margin
#ce
Func GUIObjects_Edit_GetMargins(Const ByRef $this)
	Return _GUICtrlEdit_GetMargins(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Retrieves the state of an edit control's modification flag.

	Returns:
		True: Edit control contents have been modified.
		False: Edit control contents have not been modified.

	Remarks:
		The system automatically clears the modification flag to zero when the control is created.
		If the user changes the control's text, the system sets the flag to True.
		You can call _GUICtrlEdit_SetModify() to set or clear the flag.
#ce
Func GUIObjects_Edit_GetModify(Const ByRef $this)
	Return _GUICtrlEdit_GetModify(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Gets the password character that an edit control displays when the user enters text.

	Returns:
		Returns the character to be displayed in place of any characters typed by the user.
		If the return value is 0, there is no password character, and the control displays the characters typed by the user.
#ce
Func GUIObjects_Edit_GetPasswordChar(Const ByRef $this)
	Return _GUICtrlEdit_GetPasswordChar(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Retrieves the formatting rectangle of an edit control.

	Returns:
		Returns an array containing the RECT in the following format:
			[0] - X coordinate of the upper left corner of the rectangle
			[1] - Y coordinate of the upper left corner of the rectangle
			[2] - X coordinate of the lower right corner of the rectangle
			[3] - Y coordinate of the lower right corner of the rectangle

	Remarks:
		Under certain conditions, _GUICtrlEdit_GetRECT() might not return the exact values that
		that were set by _GUICtrlEdit_SetRECT() -— it will be approximately correct, but it 
		can be off by a few pixels.
#ce
Func GUIObjects_Edit_GetRect(Const ByRef $this)
	Return _GUICtrlEdit_GetRect(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Retrieves the formatting rectangle of an edit control.

	Returns:
		Returns a $tagRECT structure that receives the formatting rectangle of an edit control. 

	Remarks:
		Under certain conditions, _GUICtrlEdit_GetRECTEx() might not return the exact values that
		that were set by _GUICtrlEdit_SetRECT() -— it will be approximately correct, but it 
		can be off by a few pixels.
#ce
Func GUIObjects_Edit_GetRectEx(Const ByRef $this)
	Return _GUICtrlEdit_GetRectEx(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Retrieves the starting and ending character positions of the current selection.

	Returns:
		Returns an array in the following format:
			[0] - Starting position
			[1] - Ending position
#ce
Func GUIObjects_Edit_GetSel(Const ByRef $this)
	Return _GUICtrlEdit_GetSel(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Gets the text from the edit control.

	Returns:
		Success: a string from the edit control. 
		Failure: an empty string. 
#ce
Func GUIObjects_Edit_GetText(Const ByRef $this)
	Return _GUICtrlEdit_GetText(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Gets the length of all the text from the edit control.

	Returns:
		Returns the length of text in the edit control. 
#ce
Func GUIObjects_Edit_GetTextLen(Const ByRef $this)
	Return _GUICtrlEdit_GetTextLen(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Hides any balloon tip associated with an edit control.

	Returns:
		Success: True. 
		Failure: False. 
#ce
Func GUIObjects_Edit_HideBalloonTip(Const ByRef $this)
	Return _GUICtrlEdit_HideBalloonTip(HWnd($this.Handle))
EndFunc

#cs
	Description:
		Inserts text into the edit control.

	Parameters:
		$text: The string of text to insert
		$index: The character position at which to insert the text

	Returns:
		None. 
#ce
Func GUIObjects_Edit_InsertText(Const ByRef $this, Const $text, Const $index = -1)
	_GUICtrlEdit_InsertText(HWnd($this.Handle), $text, $index)
EndFunc

#cs
	Description:
		Retrieves the index of the line that contains the specified character index

	Parameters:
		$index: The character index of the character contained in the line whose number is to be retrieved

	Returns:
		Returns the 0-based line number of the line containing the character index specified by $index. 

	Remarks:
		If $index is –1, _GUICtrlEdit_LineFromChar() retrieves either the line number of the current line 
		(the line containing the caret) or, if there is a selection, the line number of the line containing 
		the beginning of the selection.
#ce
Func GUIObjects_Edit_LineFromChar(Const ByRef $this, Const $index = -1)
	Return _GUICtrlEdit_LineFromChar(HWnd($this.Handle), $index)
EndFunc

#cs
	Description:
		Retrieves the character index of the first character of a specified line.

	Parameters:
		Specifies the 0-based line number

	Returns:
		Success: the character index of the line specified in the $index parameter. 
		Failure: –1 if the specified line number is greater than the number of lines in the edit control. 
#ce
Func GUIObjects_Edit_LineIndex(Const ByRef $this, Const $index = -1)
	Return _GUICtrlEdit_LineIndex(HWnd($this.Handle), $index)
EndFunc

#cs
	Description:
		Retrieves the length, in characters, of a line.

	Parameters:
		Specifies the 0-based line index of the line whose length is to be retrieved.
		–1 specifies the current line number (the line that contains the caret).

	Returns:
		Success: the length, in TCHARs, of the line specified by the $index parameter. 
		Failure: 0, if $index is greater than the number of characters in the control. 
#ce
Func GUIObjects_Edit_LineLength(Const ByRef $this, Const $index = -1)
	Return _GUICtrlEdit_LineLength(HWnd($this.Handle), $index)
EndFunc

#cs
	Description:
		Scrolls the text vertically or horizontally and can be used to scroll horizontally 
		past the last character of any line.

	Parameters: 
		$horizontal: Specifies the number of characters to scroll horizontally. 
		$vertical: Specifies the number of lines to scroll vertically. 

	Returns:
		Success: True. 
		Failure: False. 

	Remarks:
		The control does not scroll vertically past the last line of text in the edit control.

		If the current line plus the number of lines specified by the $vertical parameter exceeds the 
		total number of lines in the edit control, the value is adjusted so that the last line of 
		the edit control is scrolled to the top of the edit-control window.
#ce
Func GUIObjects_Edit_LineScroll(Const ByRef $this, Const $horizontal, Const $vertical)
	Return _GUICtrlEdit_LineScroll(HWnd($this.Handle), $horizontal, $vertical)
EndFunc

#cs
	Description:
		Retrieves the client area coordinates of a specified character in an edit control.

	Parameters:
		$index: The 0-based index of the character.

	Returns:
		Returns an array in the following format:
			[0] - The horizontal coordinate
			[1] - The vertical coordinate
#ce
Func GUIObjects_Edit_PosFromChar(Const ByRef $this, Const $index)
	Return _GUICtrlEdit_PosFromChar(HWnd($this.Handle), $index)	
EndFunc

#cs
	Description:
		Replaces the current selection.

	Parameters:
		$text: String containing the replacement text.
		$undo: Specifies whether the replacement operation can be undone:
				True: The operation can be undone. [Default]
				False: The operation cannot be undone.

	Returns:
		None. 
	
	Parameters:
		Use this function to replace only a portion of the text in an 
		edit control. If there is no current selection, the replacement text is inserted 
		at the current location of the caret.
#ce
Func GUIObjects_Edit_ReplaceSel(Const ByRef $this, Const $text, Const $undo = True)
	_GUICtrlEdit_ReplaceSel(HWnd($this.Handle), $text, $undo)
EndFunc

#cs
	Description:
		Scrolls the text vertically.

	Parameters:
		This parameter can be one of the following values:
			$SB_LINEDOWN: Scrolls down one line
			$SB_LINEUP: Scrolls up one line
			$SB_PAGEDOWN: Scrolls down one page
			$SB_PAGEUP: Scrolls up one page
			$SB_SCROLLCARET: Scrolls the caret into view

	Returns:
		Success: The high-order word of the return value is 1. 
				 The low-order word is the number of lines that the command scrolls.
		Failure: 0. 
#ce
Func GUIObjects_Edit_Scroll(Const ByRef $this, Const $direction)
	Return _GUICtrlEdit_Scroll(HWnd($this.Handle), $direction)	
EndFunc

#cs
	Description:
		Sets the cue banner text that is displayed for the edit control.

	Parameters:
		$text: String that contains the text.
		$onFocus: 
			True: if the cue banner should show even when the edit control has focus.
			False: the cue banner disappears when the user clicks in the control.

	Returns:
		Success: True. 
		Failure: False. 

	Remarks:
		The cue banner is the text that is displayed in the edit control when there is no selection.
		A cue banner will only display in Input and single-line Edit controls - not multi-line Edit or RichText controls.
		Windows Vista or later.
#ce
Func GUIObjects_Edit_SetCueBanner(Const ByRef $this, Const $text, Const $onFocus = False) 
	Return _GUICtrlEdit_SetCueBanner(HWnd($this.Handle), $text, $onFocus)
EndFunc

#cs
	Description:
		Sets the text limit.

	Parameters:
		$limit: The maximum number of TCHARs the user can enter

	Returns:
		None. 
	
	Remarks:
		This function limits only the text the user can enter.
		It does not affect any text already in the edit control when the message is sent, 
		nor does it affect the length of the text copied to the edit control by the 
		_GUICtrlEdit_SetText() function.

		If an application uses the _GUICtrlEdit_SetText() function to place more text into 
		an edit control than is specified in the _GUICtrlEdit_SetLimitText() function, the 
		user can edit the entire contents of the edit control.
#ce
Func GUIObjects_Edit_SetLimitText(Const ByRef $this, Const $limit)
	_GUICtrlEdit_SetLimitText(HWnd($this.Handle), $limit)
EndFunc

#cs
	Description:
		Sets the widths of the left and right margins.

	Parameters:
		$margin:
			Can be one or more of the following:
				$EC_LEFTMARGIN: Sets the left margin (default)
				$EC_RIGHTMARGIN: Sets the right margin
		$left:	
			The new width of the left margin with the default being $EC_USEFONTINFO
		$right:
			The new width of the right margin with the default being $EC_USEFONTINFO

	Returns:
		Returns an array in the following format:
			[0]: The width of the left margin
			[1]: The width of the right margin
#ce
Func GUIObjects_Edit_SetMargins(Const ByRef $this, Const $margin = 0x1, Const $left = 0xFFFF, Const $right = 0xFFFF)
	Return _GUICtrlEdit_SetMargins(HWnd($this.Handle), $margin, $left, $right)
EndFunc

#cs
	Description:
		Sets or clears the modification flag

	Parameters:
		$modified: Specifies the new value for the modification flag:
				       True: the text has been modified.
					   False: the text has not been modified.

	Returns:
		None. 

	Remarks:
		The system automatically clears the modification flag to zero when the control is created.
		If the user changes the control's text, the system sets the flag to nonzero.
		You can use the _GUICtrlEdit_GetModify() function to retrieve the current state of the flag.
#ce
Func GUIObjects_Edit_SetModify(Const ByRef $this, Const $modified)
	_GUICtrlEdit_SetModify(HWnd($this.Handle), $modified)
EndFunc

#cs
	Description:
		Sets the padding control.

	Parameters:
		$cx: The horizontal padding, in pixels 
		$cy: The vertical padding, in pixels 

	Returns:
		None. 

	Remarks:
		The padding values are used to create a blank area around the edge of the edit area.
		The horizontal padding value is applied to both the right and left of the button and 
		the vertical padding value is applied to both the top and bottom of the edit area.
#ce
Func GUIObjects_Edit_SetPadding(Const ByRef $this, Const $cx, COnst $cy)
	_GUICtrlEdit_SetPadding(HWnd($this.Handle), $cx, $cy)
EndFunc

#cs
	Description:
		Sets or removes the password character for an edit control.

	Parameters:
		$displayChar: 
			The character to be displayed in place of the characters typed by the user
			If this parameter is zero, the control removes the current password character 
			and displays the characters typed by the user.

	Returns:
		None. 
#ce
Func GUIObjects_Edit_SetPasswordChar(Const ByRef $this, Const $displayChar = '0')
	_GUICtrlEdit_SetPasswordChar(HWnd($this.Handle), $displayChar)
EndFunc

#cs
	Description:
		Sets or removes the read-only style ($ES_READONLY).

	Parameters:
		$readOnly: 
			True: Sets the $ES_READONLY style
    		False: Removes the $ES_READONLY style

	Returns:
		Success: True. 
		Failure: False. 
#ce
Func GUIObjects_Edit_SetReadOnly(Const ByRef $this, Const $readOnly)
	Return _GUICtrlEdit_SetReadOnly(HWnd($this.Handle), $readOnly)
EndFunc

#cs
	Description:
		Sets the formatting rectangle of a multiline edit control.

	Parameters:
		$rect: 
			Array in the following format:
				[0] - Specifies the x-coordinate of the upper-left corner of the rectangle.
				[1] - Specifies the y-coordinate of the upper-left corner of the rectangle.
				[2] - Specifies the x-coordinate of the lower-right corner of the rectangle.
				[3] - Specifies the y-coordinate of the lower-right corner of the rectangle.

	Returns:
		None. 
#ce
Func GUIObjects_Edit_SetRect(Const ByRef $this, Const $rect)
	_GUICtrlEdit_SetRect(HWnd($this.Handle), $rect)
EndFunc

#cs
	Description:
		Sets the formatting rectangle of a multiline edit control

	Parameters:
		$rect: 
			$tagRECT structure that contains formatting rectangle of an edit control

	Returns:
		None. 
#ce
Func GUIObjects_Edit_SetRectEx(Const ByRef $this, Const $tRect)
	Return _GUICtrlEdit_SetRectEx(HWnd($this.Handle), $tRect)
EndFunc

#cs
	Description:
		Sets the formatting rectangle of a multiline edit control.

	Parameters:
		$rect: Array in the following format:
				   [0] - Specifies the x-coordinate of the upper-left corner of the rectangle.
				   [1] - Specifies the y-coordinate of the upper-left corner of the rectangle.
				   [2] - Specifies the x-coordinate of the lower-right corner of the rectangle.
				   [3] - Specifies the y-coordinate of the lower-right corner of the rectangle.

	Returns:
		None. 

	Remarks:
		The _GUICtrlEdit_SetRECTNP() function is identical to the _GUICtrlEdit_SetRECT() 
		function, except that _GUICtrlEdit_SetRECTNP() does not redraw the edit control window
#ce
Func GUIObjects_Edit_SetRectNp(Const ByRef $this, Const $rect)
	_GUICtrlEdit_SetRectNp(HWnd($this.Handle), $rect)
EndFunc

#cs
	Description:
		Sets the formatting rectangle of a multiline edit control.

	Parameters:
		$rect: $tagRECT structure that contains formatting rectangle of an edit control.

	Returns:
		None. 
#ce
Func GUIObjects_Edit_SetRectNpEx(Const ByRef $this, Const $rect)
	_GUICtrlEdit_SetRectNpEx(HWnd($this.Handle), $rect)
EndFunc

#cs
	Description:
		Selects a range of characters.

	Parameters:
		$start: Specifies the starting character position of the selection.
		$end: Specifies the ending character position of the selection.

	Returns:
		None. 

	Remarks:
		The start value can be greater than the end value.
		The lower of the two values specifies the character position of the first character in the selection.
		The higher value specifies the position of the first character beyond the selection.

		The start value is the anchor point of the selection, and the end value is the active end.
		If the user uses the SHIFT key to adjust the size of the selection, the active end can move but the 
		anchor point remains the same.

		If the $start is 0 and the $end is –1, all the text in the edit control is selected.
		If the $start is –1, any current selection is deselected.

		The control displays a flashing caret at the $end position regardless of the relative values of 
		$start and $end.
#ce
Func GUIObjects_Edit_SetSel(Const ByRef $this, Const $start, Const $end)
	_GUICtrlEdit_SetSel(HWnd($this.Handle), $start, $end)
EndFunc

#cs
	Description:
		Sets the tab stops.

	Parameters:
		$tabStops: Array of tab stops in the following format:
					[0] - Tab stop 1
					[1] - Tab stop 2
					[n] - Tab stop n

	Returns:
		True: All the tabs are set. 
		False: All the tabs are not set. 
#ce
Func GUIObjects_Edit_SetTabStops(Const ByRef $this, Const $tabStops)
	Return _GUICtrlEdit_SetTabStops(HWnd($this.Handle), $tabStops)
EndFunc

#cs
	Description:
		Set the text.

	Parameters:
		$text: String to place in the edit control.

	Returns:
		None. 
#ce
Func GUIObjects_Edit_SetText(Const ByRef $this, Const $text)
	_GUICtrlEdit_SetText(HWnd($this.Handle), $text)
EndFunc

#cs
	Description:
		Displays a balloon tip associated with an edit control.

	Parameters:
		$title: String for title of ToolTip (Unicode)
		$text: String for text of ToolTip (Unicode)
		$icon: Icon can be one of the following:
				$TTI_ERROR - Use the error icon
				$TTI_INFO - Use the information icon
				$TTI_NONE - Use no icon
				$TTI_WARNING - Use the warning icon

			The following for Windows Vista or later
				$TTI_ERROR_LARGE - Use the error icon
				$TTI_INFO_LARGE - Use the information icon
				$TTI_WARNING_LARGE - Use the warning icon

	Returns:
		Success: True. 
		Failure: False. 
#ce
Func GUIObjects_Edit_ShowBalloonTip(Const ByRef $this, Const $title, Const $text, Const $icon)
	Return _GUICtrlEdit_ShowBalloonTip(HWnd($this.Handle), $title, $text, $icon)
EndFunc

#cs
	Description:
		Undoes the last edit control operation in the control's undo queue.

	Returns:
		Success: True. 
		Failure: False. 

	Remarks:
		An undo operation can also be undone.
		For example, you can restore deleted text with the first _GUICtrlEdit_Undo(), and remove 
		the text again with a second _GUICtrlEdit_Undo() as long as there is no intervening 
		edit operation.
#ce
Func GUIObjects_Edit_Undo(Const ByRef $this)
	Return _GUICtrlEdit_Undo(HWnd($this.Handle))
EndFunc

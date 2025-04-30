#include-once

#include <GuiDateTimePicker.au3>

Func GUIObjects_Date(ByRef $this, Const $name, Const $left, Const $top, Const $width = 120, Const $height = 21, Const $style = 0, Const $exStyle = 0)
	Local Const $handle = _GUICtrlDTP_Create(HWnd($this.Handle), $left, $top, $width, $height, $style, $exStyle)

	Local $ctrl = _AutoItObject_Create(Control())

	_AutoItObject_AddMethod($ctrl, "Destroy"        , "GUIObjects_Date_Destroy"        )
	_AutoItObject_AddMethod($ctrl, "GetRange"       , "GUIObjects_Date_GetRange"       )
	_AutoItObject_AddMethod($ctrl, "GetRange"       , "GUIObjects_Date_GetRangeEx"     )
	_AutoItObject_AddMethod($ctrl, "GetSystemTime"  , "GUIObjects_Date_GetSystemTime"  )
	_AutoItObject_AddMethod($ctrl, "GetSystemTimeEx", "GUIObjects_Date_GetSystemTimeEx")
	_AutoItObject_AddMethod($ctrl, "SetRange"       , "GUIObjects_Date_SetRange"       )
	_AutoItObject_AddMethod($ctrl, "SetSystemTime"  , "GUIObjects_Date_SetSystemTime"  )
	_AutoItObject_AddMethod($ctrl, "SetSystemTimeEx", "GUIObjects_Date_SetSystemTimeEx")

	_AutoItObject_RemoveMember($ctrl, "ControlID")
	_AutoItObject_RemoveMember($ctrl, "Text"     )

	$ctrl.Handle  = $handle
	$ctrl.Left    = $left
	$ctrl.Top     = $top
	$ctrl.Width   = $width
	$ctrl.Height  = $height
	$ctrl.Style   = _WinAPI_GetWindowLong($handle, $GWL_STYLE)
	$ctrl.ExStyle = _WinAPI_GetWindowLong($handle, $GWL_EXSTYLE)

    _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $ctrl)

    Return $ctrl
EndFunc

#cs Retrieves the current minimum and maximum allowable system times
	
	Returns an array with the following format:
	     [ 0] - True if Min data is valid, otherwise False
	     [ 1] - Min Year
	     [ 2] - Min Month
	     [ 3] - Min Day
	     [ 4] - Min Hour
	     [ 5] - Min Minute
	     [ 6] - Min Second
	     [ 7] - True if Max data is valid, otherwise False
	     [ 8] - Max Year
	     [ 9] - Max Month
	     [10] - Max Day
	     [11] - Max Hour
	     [12] - Max Minute
	     [13] - Max Second
#ce
Func GUIObjects_Date_Destroy(ByRef $this)
	Return _GUICtrlDTP_Destroy(HWnd($this.Handle))
EndFunc

#cs Delete the control
	Success: True, $hWnd is set to 0. 
	Failure: False.  
#ce
Func GUIObjects_Date_GetRange(ByRef $this)
	Return _GUICtrlDTP_GetRange(HWnd($this.Handle))
EndFunc

#cs Retrieves the current minimum and maximum allowable system times
	Success: a $tagDTPRANGE structure. 
	Failure: 0. 
#ce
Func GUIObjects_Date_GetRangeEx(ByRef $this)
	Return _GUICtrlDTP_GetRangeEx(HWnd($this.Handle))
EndFunc

#cs Retrieves the currently selected date and time
	Returns an array with the following format:
		[0] - Year
		[1] - Month
		[2] - Day
		[3] - Hour
		[4] - Minute
		[5] - Second
#ce
Func GUIObjects_Date_GetSystemTime(ByRef $this)
	Return GUICtrlDTP_GetSystemTime(HWnd($this.Handle))
EndFunc

#cs Retrieves the currently selected date and time
	Success: a $tagSYSTEMTIME structure. 

	Failure: sets the @error flag to non-zero. 

	@error: $GDT_NONE - if the control was set to the $DTS_SHOWNONE style and 
						the control check box was not selected 

			$GDT_ERROR - if an error occured. 
#ce
Func GUIObjects_Date_GetSystemTimeEx(ByRef $this)
	Return GUICtrlDTP_GetSystemTimeEx(HWnd($this.Handle))
EndFunc

#cs 
	Description:
		Sets the current minimum and maximum allowable system times.

	Parameter:
		$range - Array formatted as follows:
					[ 0] - True if Min data is to be set, otherwise False
					[ 1] - Min Year
					[ 2] - Min Month
					[ 3] - Min Day
					[ 4] - Min Hour
					[ 5] - Min Minute
					[ 6] - Min Second
					[ 7] - True if Max data is to be set, otherwise False
					[ 8] - Max Year
					[ 9] - Max Month
					[10] - Max Day
					[11] - Max Hour
					[12] - Max Minute
					[13] - Max Second 
	Return Value:
		Success: True. 
		
		Failure: False. 
#ce
Func GUIObjects_Date_SetRange(ByRef $this, ByRef $range)
	Return GUICtrlDTP_SetRange(HWnd($this.Handle), $range)
EndFunc

#cs
	Description:
		Sets the current minimum and maximum allowable system times

	Parameter:
		$DPTrangeStruct: $tagDTPRANGE structure 

	Return:
		Success: True. 
		Failure: False. 
#ce
Func GUIObjects_Date_SetRangeEx(ByRef $this, ByRef $DPTrangeStruct)
	Return GUICtrlDTP_SetRangeEx(HWnd($this.Handle), $DPTrangeStruct)
EndFunc

#cs
	Description: 

	Parameter:
		$date: Array formatted as follows:
				[0] - If True, the control will is set to "no date"
				[1] - Year
				[2] - Month
				[3] - Day
				[4] - Hour
				[5] - Minute
				[6] - Second 

	Return:
		Success: True. 
		Failure: False. 
#ce
Func GUIObjects_Date_SetSystemTime(ByRef $this, ByRef $date)
	Return _GUICtrlDTP_SetSystemTime(HWnd($this.Handle), $date)
EndFunc

#cs
	Description: 
		Sets the currently selected date and time


	Parameters:
		$date: $tagSYSTEMTIME structure 

		$flag: [optional] No date setting:
			True - Control will be set to "no date"
			False - Control is set to date and time value 

	Return Value:
		Success: True. 
		Failure: False. 
#ce
Func GUIObjects_Date_SetSystemTimeEx(ByRef $this, ByRef $date, Const $flag = False)
	Return _GUICtrlDTP_SetSystemTimeEx(HWnd($this.Handle), $date, $flag)
EndFunc

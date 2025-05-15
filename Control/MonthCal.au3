#include-once

#include <GuiMonthCal.au3>

Func GUIObjects_MonthCal(ByRef $this, Const $x, Const $y, Const $style = 0x00000000, Const $exStyle = 0x00000000)
	Local Const $handle = _GUICtrlMonthCal_CreateMenu($x, $y, $style, $exStyle)

	Local $ctrl = _AutoItObject_Create(Control())

	_AutoItObject_RemoveMember($ctrl, "ControlID")
	_AutoItObject_RemoveMember($ctrl, "Text"     )
	_AutoItObject_RemoveMember($ctrl, "Width"    )
	_AutoItObject_RemoveMember($ctrl, "Height"   )

    _AutoItObject_AddProperty($ctrl, "Window", $ELSCOPE_READONLY, $this.Handle)

	$ctrl.Handle  = $handle
	$ctrl.Left    = $x
	$ctrl.Top     = $y
	$ctrl.Style   = $style
	$ctrl.ExStyle = $exStyle

    _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $ctrl)

	_AutoItObject_AddDestructor($this, "GUIObjects_MonthCal_Destroy")
	
	_AutoItObject_AddMethod($ctrl, "Destroy"            , "GUIObjects_MonthCal_Destroy"            )
	_AutoItObject_AddMethod($ctrl, "GetCalenderBorder"  , "GUIObjects_MonthCal_GetCalenderBorder"  )
	_AutoItObject_AddMethod($ctrl, "GetCalenderCount"   , "GUIObjects_MonthCal_GetCalenderCount"   )
	_AutoItObject_AddMethod($ctrl, "GetColor"           , "GUIObjects_MonthCal_GetColor"           )
	_AutoItObject_AddMethod($ctrl, "GetColorArray"      , "GUIObjects_MonthCal_GetColorArray"      )
	_AutoItObject_AddMethod($ctrl, "GetCurSel"          , "GUIObjects_MonthCal_GetCurSel"          )
	_AutoItObject_AddMethod($ctrl, "GetCurSelStr"       , "GUIObjects_MonthCal_GetCurSelStr"       )
	_AutoItObject_AddMethod($ctrl, "GetFirstDOW"        , "GUIObjects_MonthCal_GetFirstDOW"        )
	_AutoItObject_AddMethod($ctrl, "GetFirstDOWStr"     , "GUIObjects_MonthCal_GetFirstDOWStr"     )
	_AutoItObject_AddMethod($ctrl, "GetMaxSelCount"     , "GUIObjects_MonthCal_GetMaxSelCount"     )
	_AutoItObject_AddMethod($ctrl, "GetMaxTodayWidth"   , "GUIObjects_MonthCal_GetMaxTodayWidth"   )
	_AutoItObject_AddMethod($ctrl, "GetMinReqHeight"    , "GUIObjects_MonthCal_GetMinReqHeight"    )
	_AutoItObject_AddMethod($ctrl, "GetMinReqRect"      , "GUIObjects_MonthCal_GetMinReqRect"      )
	_AutoItObject_AddMethod($ctrl, "GetMinReqRectArray" , "GUIObjects_MonthCal_GetMinReqRectArray" )
	_AutoItObject_AddMethod($ctrl, "GetMinReqWidth"     , "GUIObjects_MonthCal_GetMinReqWidth"     )
	_AutoItObject_AddMethod($ctrl, "GetMonthDelta"      , "GUIObjects_MonthCal_GetMonthDelta"      )
	_AutoItObject_AddMethod($ctrl, "GetMonthRange"      , "GUIObjects_MonthCal_GetMonthRange"      )
	_AutoItObject_AddMethod($ctrl, "GetMonthRangeMax"   , "GUIObjects_MonthCal_GetMonthRangeMax"   )
	_AutoItObject_AddMethod($ctrl, "GetMonthRangeMaxStr", "GUIObjects_MonthCal_GetMonthRangeMaxStr")
	_AutoItObject_AddMethod($ctrl, "GetMonthRangeMin"   , "GUIObjects_MonthCal_GetMonthRangeMin"   )
	_AutoItObject_AddMethod($ctrl, "GetMonthRangeMinStr", "GUIObjects_MonthCal_GetMonthRangeMinStr")
	_AutoItObject_AddMethod($ctrl, "GetMonthRangeSpan"  , "GUIObjects_MonthCal_GetMonthRangeSpan"  )
	_AutoItObject_AddMethod($ctrl, "GetRange"           , "GUIObjects_MonthCal_GetRange"           )
	_AutoItObject_AddMethod($ctrl, "GetRangeMax"        , "GUIObjects_MonthCal_GetRangeMax"        )
	_AutoItObject_AddMethod($ctrl, "GetRangeMaxStr"     , "GUIObjects_MonthCal_GetRangeMaxStr"     )
	_AutoItObject_AddMethod($ctrl, "GetRangeMin"        , "GUIObjects_MonthCal_GetRangeMin"        )
	_AutoItObject_AddMethod($ctrl, "GetRangeMinStr"     , "GUIObjects_MonthCal_GetRangeMinStr"     )
	_AutoItObject_AddMethod($ctrl, "GetToday"           , "GUIObjects_MonthCal_GetToday"           )
	_AutoItObject_AddMethod($ctrl, "GetTodayStr"        , "GUIObjects_MonthCal_GetTodayStr"        )
	_AutoItObject_AddMethod($ctrl, "GetUnicodeFormat"   , "GUIObjects_MonthCal_GetUnicodeFormat"   )
	_AutoItObject_AddMethod($ctrl, "HitTest"            , "GUIObjects_MonthCal_HitTest"            )
	_AutoItObject_AddMethod($ctrl, "SetCalenderBorder"  , "GUIObjects_MonthCal_SetCalenderBorder"  )
	_AutoItObject_AddMethod($ctrl, "SetColor"           , "GUIObjects_MonthCal_SetColor"           )
	_AutoItObject_AddMethod($ctrl, "SetCurSel"          , "GUIObjects_MonthCal_SetCurSel"          )
	_AutoItObject_AddMethod($ctrl, "SetDayState"        , "GUIObjects_MonthCal_SetDayState"        )
	_AutoItObject_AddMethod($ctrl, "SetFirstDOW"        , "GUIObjects_MonthCal_SetFirstDOW"        )
	_AutoItObject_AddMethod($ctrl, "SetMaxSelCount"     , "GUIObjects_MonthCal_SetMaxSelCount"     )
	_AutoItObject_AddMethod($ctrl, "SetMonthDelta"      , "GUIObjects_MonthCal_SetMonthDelta"      )
	_AutoItObject_AddMethod($ctrl, "SetRange"           , "GUIObjects_MonthCal_SetRange"           )
	_AutoItObject_AddMethod($ctrl, "SetSelRange"        , "GUIObjects_MonthCal_SetSelRange"        )
	_AutoItObject_AddMethod($ctrl, "SetToday"           , "GUIObjects_MonthCal_SetToday"           )
	_AutoItObject_AddMethod($ctrl, "SetUnicodeFormat"   , "GUIObjects_MonthCal_SetUnicodeFormat"   )

    Return $ctrl
EndFunc

Func GUIObjects_MonthCal_Destroy(Const ByRef $this)       
	Return _GUICtrlMonthCal_Destroy($this.Handle)
EndFunc

Func GUIObjects_MonthCal_GetCalenderBorder(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetCalenderBorder($this.Handle)
EndFunc
  
Func GUIObjects_MonthCal_GetCalenderCount(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetCalenderCount($this.Handle)
EndFunc
   
Func GUIObjects_MonthCal_GetColor(Const ByRef $this, Const $index)       
	Return _GUICtrlMonthCal_GetColor($this.Handle, $index)
EndFunc
           
Func GUIObjects_MonthCal_GetColorArray(Const ByRef $this, Const $color)       
	Return _GUICtrlMonthCal_GetColorArray($this.Handle, $color)
EndFunc
      
Func GUIObjects_MonthCal_GetCurSel(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetCurSel($this.Handle)
EndFunc
          
Func GUIObjects_MonthCal_GetCurSelStr(Const ByRef $this, Const $format = "%02d/%02d/%04d")       
	Return _GUICtrlMonthCal_GetCurSelStr($this.Handle, $format)
EndFunc
       
Func GUIObjects_MonthCal_GetFirstDOW(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetFirstDOW($this.Handle)
EndFunc
        
Func GUIObjects_MonthCal_GetFirstDOWStr(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetFirstDOWStr($this.Handle)
EndFunc
     
Func GUIObjects_MonthCal_GetMaxSelCount(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetMaxSelCount($this.Handle)
EndFunc
     
Func GUIObjects_MonthCal_GetMaxTodayWidth(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetMaxTodayWidth($this.Handle)
EndFunc
   
Func GUIObjects_MonthCal_GetMinReqHeight(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetMinReqHeight($this.Handle)
EndFunc
    
Func GUIObjects_MonthCal_GetMinReqRect(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetMinReqRect($this.Handle)
EndFunc
      
Func GUIObjects_MonthCal_GetMinReqRectArray(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetMinReqRectArray($this.Handle)
EndFunc
 
Func GUIObjects_MonthCal_GetMinReqWidth(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetMinReqWidth($this.Handle)
EndFunc
     
Func GUIObjects_MonthCal_GetMonthDelta(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetMonthDelta($this.Handle)
EndFunc
      
Func GUIObjects_MonthCal_GetMonthRange(Const ByRef $this, Const $partial = False)       
	Return _GUICtrlMonthCal_GetMonthRange($this.Handle, $partial)
EndFunc
      
Func GUIObjects_MonthCal_GetMonthRangeMax(Const ByRef $this, Const $partial = False)       
	Return _GUICtrlMonthCal_GetMonthRangeMax($this.Handle, $partial)
EndFunc
   
Func GUIObjects_MonthCal_GetMonthRangeMaxStr(Const ByRef $this, Const $format = "%02d/%02d/%04d")       
	Return _GUICtrlMonthCal_GetMonthRangeMaxStr($this.Handle, $format)
EndFunc

Func GUIObjects_MonthCal_GetMonthRangeMin(Const ByRef $this, Const $partial = False)       
	Return _GUICtrlMonthCal_GetMonthRangeMin($this.Handle, $partial)
EndFunc
   
Func GUIObjects_MonthCal_GetMonthRangeMinStr(Const ByRef $this, Const $format = "%02d/%02d/%04d")       
	Return _GUICtrlMonthCal_GetMonthRangeMinStr($this.Handle, $format)
EndFunc

Func GUIObjects_MonthCal_GetMonthRangeSpan(Const ByRef $this, Const $partial = False)       
	Return _GUICtrlMonthCal_GetMonthRangeSpan($this.Handle, $PATH_ORIGINAL)
EndFunc
  
Func GUIObjects_MonthCal_GetRange(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetRange($this.Handle)
EndFunc
           
Func GUIObjects_MonthCal_GetRangeMax(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetRangeMax($this.Handle)
EndFunc
        
Func GUIObjects_MonthCal_GetRangeMaxStr(Const ByRef $this, Const $format = "%02d/%02d/%04d")       
	Return _GUICtrlMonthCal_GetRangeMaxStr($this.Handle, $format)
EndFunc
     
Func GUIObjects_MonthCal_GetRangeMin(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetRangeMin($this.Handle)
EndFunc
        
Func GUIObjects_MonthCal_GetRangeMinStr(Const ByRef $this, Const $format = "%02d/%02d/%04d")       
	Return _GUICtrlMonthCal_GetRangeMinStr($this.Handle, $format)
EndFunc
     
Func GUIObjects_MonthCal_GetToday(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetToday($this.Handle)
EndFunc
           
Func GUIObjects_MonthCal_GetTodayStr(Const ByRef $this, Const $format = "%02d/%02d/%04d")       
	Return _GUICtrlMonthCal_GetTodayStr($this.Handle, $format)
EndFunc
        
Func GUIObjects_MonthCal_GetUnicodeFormat(Const ByRef $this)       
	Return _GUICtrlMonthCal_GetUnicodeFormat($this.Handle)
EndFunc
   
Func GUIObjects_MonthCal_HitTest(Const ByRef $this, Const $x, Const $y)       
	Return _GUICtrlMonthCal_HitTest($this.Handle, $x, $y)
EndFunc
            
Func GUIObjects_MonthCal_SetCalenderBorder(Const ByRef $this, Const $borderSize = 4, Const $setBorder = True)       
	Return _GUICtrlMonthCal_SetCalenderBorder($this.Handle, $borderSize, $setBorder)
EndFunc
  
Func GUIObjects_MonthCal_SetColor(Const ByRef $this, Const $index, Const $color)       
	Return _GUICtrlMonthCal_SetColor($this.Handle, $index, $color)
EndFunc
           
Func GUIObjects_MonthCal_SetCurSel(Const ByRef $this, Const $year, Const $month, Const $day)       
	Return _GUICtrlMonthCal_SetCurSel($this.Handle, $year, $month, $day)
EndFunc
          
Func GUIObjects_MonthCal_SetDayState(Const ByRef $this, Const $masks)       
	Return _GUICtrlMonthCal_SetDayState($this.Handle, $masks)
EndFunc
        
Func GUIObjects_MonthCal_SetFirstDOW(Const ByRef $this, Const $day)       
	Return _GUICtrlMonthCal_SetFirstDOW($this.Handle, $day)
EndFunc
        
Func GUIObjects_MonthCal_SetMaxSelCount(Const ByRef $this, Const $maxSel)       
	Return _GUICtrlMonthCal_SetMaxSelCount($this.Handle, $maxSel)
EndFunc
     
Func GUIObjects_MonthCal_SetMonthDelta(Const ByRef $this, Const $delta)       
	Return _GUICtrlMonthCal_SetMonthDelta($this.Handle, $delta)
EndFunc
      
Func GUIObjects_MonthCal_SetRange(Const ByRef $this, Const $minYear, Const $minMonth, Const $minDay, Const $maxYear, Const $maxMonth, Const $maxDay)       
	Return _GUICtrlMonthCal_SetRange($this.Handle, $minYear, $minMonth, $minDay, $maxYear, $maxMonth, $maxDay)
EndFunc
           
Func GUIObjects_MonthCal_SetSelRange(Const ByRef $this, Const $minYear, Const $minMonth, Const $minDay, Const $maxYear, Const $maxMonth, Const $maxDay)       
	Return _GUICtrlMonthCal_SetSelRange($this.Handle, $minYear, $minMonth, $minDay, $maxYear, $maxMonth, $maxDay)
EndFunc
        
Func GUIObjects_MonthCal_SetToday(Const ByRef $this, Const $year, Const $month, Const $day)       
	Return _GUICtrlMonthCal_SetToday($this.Handle, $year, $month, $day)
EndFunc
           
Func GUIObjects_MonthCal_SetUnicodeFormat(Const ByRef $this, Const $unicode)       
	Return _GUICtrlMonthCal_SetUnicodeFormat($this.Handle, $unicode)
EndFunc

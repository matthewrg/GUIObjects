#include-once

#include <GUIMenu.au3>

Func GUIObjects_Menu(ByRef $this, Const $x, Const $y, Const $style = 0x00000000, Const $exStyle = 0x00000000)
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
	
	_AutoItObject_AddMethod($ctrl, "Destroy"          , "GUIObjects_MonthCal_Destroy"          )
	_AutoItObject_AddMethod($ctrl, "GetCalenderBorder", "GUIObjects_MonthCal_GetCalenderBorder")
	_AutoItObject_AddMethod($ctrl, "GetCalenderCount" , "GUIObjects_MonthCal_GetCalenderCount" )
	_AutoItObject_AddMethod($ctrl, "GetColor"         , "GUIObjects_MonthCal_GetColor"         )
	_AutoItObject_AddMethod($ctrl, "", "GUIObjects_MonthCal_")
	_AutoItObject_AddMethod($ctrl, "", "GUIObjects_MonthCal_")
	_AutoItObject_AddMethod($ctrl, "", "GUIObjects_MonthCal_")
	_AutoItObject_AddMethod($ctrl, "", "GUIObjects_MonthCal_")
	_AutoItObject_AddMethod($ctrl, "", "GUIObjects_MonthCal_")
	_AutoItObject_AddMethod($ctrl, "", "GUIObjects_MonthCal_")
	_AutoItObject_AddMethod($ctrl, "", "GUIObjects_MonthCal_")
	_AutoItObject_AddMethod($ctrl, "", "GUIObjects_MonthCal_")
	_AutoItObject_AddMethod($ctrl, "", "GUIObjects_MonthCal_")

    Return $ctrl
EndFunc
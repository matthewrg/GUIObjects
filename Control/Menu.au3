#include-once

#include <GUIMenu.au3>

Func GUIObjects_Menu(ByRef $this, Const $subMenuText, Const $menuID = -1, Const $menuEntry = -1)
	Local Const $controlID = GUICtrlCreateMenu($subMenuText, $menuID, $menuEntry)

	Local $ctrl = _AutoItObject_Create(Control())

	$ctrl.ControlID = $controlID
	$ctrl.Text      = $subMenuText

	_AutoItObject_RemoveMember($ctrl, "Handle" )
	_AutoItObject_RemoveMember($ctrl, "Left"   )
	_AutoItObject_RemoveMember($ctrl, "Top"    )
	_AutoItObject_RemoveMember($ctrl, "Width"  )
	_AutoItObject_RemoveMember($ctrl, "Height" )
	_AutoItObject_RemoveMember($ctrl, "Style"  )
	_AutoItObject_RemoveMember($ctrl, "ExStyle")
	
	_AutoItObject_AddMethod($ctrl, "AddMenuItem", "GUIObjects_Menu_AddMenuItem")
	_AutoItObject_AddMethod($ctrl, "SetText"    , "GUIObjects_Menu_SetText"    )
	_AutoItObject_AddMethod($ctrl, "SetColor"   , "GUIObjects_Menu_SetColor"   )
	_AutoItObject_AddMethod($ctrl, "GetText"    , "GUIObjects_Menu_GetText"    )
	_AutoItObject_AddMethod($ctrl, "SetState"   , "GUIObjects_Menu_SetState"   )

    Return $ctrl
EndFunc

Func GUIObjects_Menu_AddMenuItem(ByRef $this, Const $text)
	Local Const $controlID = GUICtrlCreateMenuItem($text, $this.ControlID)

	_AutoItObject_AddProperty($this, $text, $ELSCOPE_READONLY, $controlID)

	Return $controlID
EndFunc

Func GUIObjects_Menu_SetText(Const ByRef $this, Const $text)
	GUICtrlSetData($this.ControlID, $text)
EndFunc

; Lifted from the helpfile
Func GUIObjects_Menu_SetColor(Const ByRef $this, Const $color)       
	Local Const $MIM_APPLYTOSUBMENUS = 0x80000000
	Local Const $MIM_BACKGROUND = 0x00000002

	Local Const $hBrush = DllCall("GDI32.dll", "hwnd", "CreateSolidBrush", "int", $color)[0]

	Local Const $tMenuInfo = DllStructCreate("dword;dword;dword;uint;dword;dword;ptr")

	DllStructSetData($tMenuInfo, 1, DllStructGetSize($tMenuInfo))
	DllStructSetData($tMenuInfo, 2, BitOR($MIM_APPLYTOSUBMENUS, $MIM_BACKGROUND))
	DllStructSetData($tMenuInfo, 5, $hBrush)

	Local Const $hMenu = GUICtrlGetHandle($this.ControlID)

	DllCall("User32.dll", "int", "SetMenuInfo", "hwnd", $hMenu, "struct*", $tMenuInfo)
EndFunc

Func GUIObjects_Menu_GetText(Const ByRef $this)
	Return GUICtrlRead($this.ControlID, $GUI_READ_EXTENDED)
EndFunc

Func GUIObjects_Menu_SetState(Const ByRef $this, Const $state)
	Return GUICtrlSetState($this.ControlID, $state)
EndFunc
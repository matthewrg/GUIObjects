#include-once

#include <GUIMenu.au3>

Func GUIObjects_Menu(ByRef $this, Const $name, Const $style = $MNS_CHECKORBMP)
	Local Const $handle = _GUICtrlMenu_CreateMenu($style)

	Local $ctrl = _AutoItObject_Create(Control())

	_AutoItObject_RemoveMember($ctrl, "ControlID")
	_AutoItObject_RemoveMember($ctrl, "Handle")
	_AutoItObject_RemoveMember($ctrl, "Text")
	_AutoItObject_RemoveMember($ctrl, "Left")
	_AutoItObject_RemoveMember($ctrl, "Top")
	_AutoItObject_RemoveMember($ctrl, "Width")
	_AutoItObject_RemoveMember($ctrl, "Height")
	_AutoItObject_RemoveMember($ctrl, "Style")
	_AutoItObject_RemoveMember($ctrl, "ExStyle")

    _AutoItObject_AddProperty($ctrl, "Menu"  , $ELSCOPE_READONLY, $handle     )
    _AutoItObject_AddProperty($ctrl, "Window", $ELSCOPE_READONLY, $this.Handle)

    _AutoItObject_AddProperty($this, $name, $ELSCOPE_READONLY, $ctrl)

	_AutoItObject_AddDestructor($this, "GUIObjects_Menu_DestroyMenu")
	
	_AutoItObject_AddMethod($ctrl, "AddMenuItem"         , "GUIObjects_Menu_AddMenuItem"         )
	_AutoItObject_AddMethod($ctrl, "AppendMenu"          , "GUIObjects_Menu_AppendMenu"          )
	_AutoItObject_AddMethod($ctrl, "CheckMenuItem"       , "GUIObjects_Menu_CheckMenuItem"       )
	_AutoItObject_AddMethod($ctrl, "CheckRadioItem"      , "GUIObjects_Menu_CheckRadioItem"      )
	_AutoItObject_AddMethod($ctrl, "CreatePopup"         , "GUIObjects_Menu_CreatePopup"         )
	_AutoItObject_AddMethod($ctrl, "DeleteMenu"          , "GUIObjects_Menu_DeleteMenu"          )
	_AutoItObject_AddMethod($ctrl, "DestroyMenu"         , "GUIObjects_Menu_DestroyMenu"         )
	_AutoItObject_AddMethod($ctrl, "DrawMenuBar"         , "GUIObjects_Menu_DrawMenuBar"         )
	_AutoItObject_AddMethod($ctrl, "EnableMenuItem"      , "GUIObjects_Menu_EnableMenuItem"      )
	_AutoItObject_AddMethod($ctrl, "FindItem"            , "GUIObjects_Menu_FindItem"            )
	_AutoItObject_AddMethod($ctrl, "FindParent"          , "GUIObjects_Menu_FindParent"          )
	_AutoItObject_AddMethod($ctrl, "GetItemBmp"          , "GUIObjects_Menu_GetItemBmp"          )
	_AutoItObject_AddMethod($ctrl, "GetItemBmpChecked"   , "GUIObjects_Menu_GetItemBmpChecked"   )
	_AutoItObject_AddMethod($ctrl, "GetItemBmpUnChecked" , "GUIObjects_Menu_GetItemBmpUnChecked" )
	_AutoItObject_AddMethod($ctrl, "GetItemChecked"      , "GUIObjects_Menu_GetItemChecked"      )
	_AutoItObject_AddMethod($ctrl, "GetItemCount"        , "GUIObjects_Menu_GetItemCount"        )
	_AutoItObject_AddMethod($ctrl, "GetItemData"         , "GUIObjects_Menu_GetItemData"         )
	_AutoItObject_AddMethod($ctrl, "GetItemDefault"      , "GUIObjects_Menu_GetItemDefault"      )
	_AutoItObject_AddMethod($ctrl, "GetItemDisabled"     , "GUIObjects_Menu_GetItemDisabled"     )
	_AutoItObject_AddMethod($ctrl, "GetItemEnabled"      , "GUIObjects_Menu_GetItemEnabled"      )
	_AutoItObject_AddMethod($ctrl, "GetItemGreyed"       , "GUIObjects_Menu_GetItemGreyed"       )
	_AutoItObject_AddMethod($ctrl, "GetItemHighlighted"  , "GUIObjects_Menu_GetItemHighlighted"  )
	_AutoItObject_AddMethod($ctrl, "GetItemId"           , "GUIObjects_Menu_GetItemId"           )
	_AutoItObject_AddMethod($ctrl, "GetItemInfo"         , "GUIObjects_Menu_GetItemInfo"         )
	_AutoItObject_AddMethod($ctrl, "GetItemRect"         , "GUIObjects_Menu_GetItemRect"         )
	_AutoItObject_AddMethod($ctrl, "GetItemRectEx"       , "GUIObjects_Menu_GetItemRectEx"       )
	_AutoItObject_AddMethod($ctrl, "GetItemState"        , "GUIObjects_Menu_GetItemState"        )
	_AutoItObject_AddMethod($ctrl, "GetItemStateEx"      , "GUIObjects_Menu_GetItemStateEx"      )
	_AutoItObject_AddMethod($ctrl, "GetItemSubMenu"      , "GUIObjects_Menu_GetItemSubMenu"      )
	_AutoItObject_AddMethod($ctrl, "GetItemText"         , "GUIObjects_Menu_GetItemText"         )
	_AutoItObject_AddMethod($ctrl, "GetItemType"         , "GUIObjects_Menu_GetItemType"         )
	_AutoItObject_AddMethod($ctrl, "GetMenu"             , "GUIObjects_Menu_GetMenu"             )
	_AutoItObject_AddMethod($ctrl, "GetMenuBackground"   , "GUIObjects_Menu_GetMenuBackground"   )
	_AutoItObject_AddMethod($ctrl, "GetMenubarInfo"      , "GUIObjects_Menu_GetMenubarInfo"      )
	_AutoItObject_AddMethod($ctrl, "GetMenuContextHelpID", "GUIObjects_Menu_GetMenuContextHelpID")
	_AutoItObject_AddMethod($ctrl, "GetMenuData"         , "GUIObjects_Menu_GetMenuData"         )
	_AutoItObject_AddMethod($ctrl, "GetMenuDefaultItem"  , "GUIObjects_Menu_GetMenuDefaultItem"  )
	_AutoItObject_AddMethod($ctrl, "GetMenuHeight"       , "GUIObjects_Menu_GetMenuHeight"       )
	_AutoItObject_AddMethod($ctrl, "GetMenuInfo"         , "GUIObjects_Menu_GetMenuInfo"         )
	_AutoItObject_AddMethod($ctrl, "GetMenuStyle"        , "GUIObjects_Menu_GetMenuStyle"        )
	_AutoItObject_AddMethod($ctrl, "GetSystemMenu"       , "GUIObjects_Menu_GetSystemMenu"       )
	_AutoItObject_AddMethod($ctrl, "InsertMenuItem"      , "GUIObjects_Menu_InsertMenuItem"      )
	_AutoItObject_AddMethod($ctrl, "InsertMenuItemEx"    , "GUIObjects_Menu_InsertMenuItemEx"    )
	_AutoItObject_AddMethod($ctrl, "IsMenu"              , "GUIObjects_Menu_IsMenu"              )
	_AutoItObject_AddMethod($ctrl, "LoadMenu"            , "GUIObjects_Menu_LoadMenu"            )
	_AutoItObject_AddMethod($ctrl, "MapAccelerator"      , "GUIObjects_Menu_MapAccelerator"      )
	_AutoItObject_AddMethod($ctrl, "MenuItemFromPoint"   , "GUIObjects_Menu_MenuItemFromPoint"   )
	_AutoItObject_AddMethod($ctrl, "RemoveMenu"          , "GUIObjects_Menu_RemoveMenu"          )
	_AutoItObject_AddMethod($ctrl, "SetItemBitmaps"      , "GUIObjects_Menu_SetItemBitmaps"      )
	_AutoItObject_AddMethod($ctrl, "SetItemBmp"          , "GUIObjects_Menu_SetItemBmp"          )
	_AutoItObject_AddMethod($ctrl, "SetItemBmpChecked"   , "GUIObjects_Menu_SetItemBmpChecked"   )
	_AutoItObject_AddMethod($ctrl, "SetItemBmpUnchecked" , "GUIObjects_Menu_SetItemBmpUnchecked" )
	_AutoItObject_AddMethod($ctrl, "SetItemChecked"      , "GUIObjects_Menu_SetItemChecked"      )
	_AutoItObject_AddMethod($ctrl, "SetItemData"         , "GUIObjects_Menu_SetItemData"         )
	_AutoItObject_AddMethod($ctrl, "SetItemDefault"      , "GUIObjects_Menu_SetItemDefault"      )
	_AutoItObject_AddMethod($ctrl, "SetItemDisabled"     , "GUIObjects_Menu_SetItemDisabled"     )
	_AutoItObject_AddMethod($ctrl, "SetItemEnabled"      , "GUIObjects_Menu_SetItemEnabled"      )
	_AutoItObject_AddMethod($ctrl, "SetItemGreyed"       , "GUIObjects_Menu_SetItemGreyed"       )
	_AutoItObject_AddMethod($ctrl, "SetItemHighlighted"  , "GUIObjects_Menu_SetItemHighlighted"  )
	_AutoItObject_AddMethod($ctrl, "SetItemID"           , "GUIObjects_Menu_SetItemID"           )
	_AutoItObject_AddMethod($ctrl, "SetItemInfo"         , "GUIObjects_Menu_SetItemInfo"         )
	_AutoItObject_AddMethod($ctrl, "SetItemState"        , "GUIObjects_Menu_SetItemState"        )
	_AutoItObject_AddMethod($ctrl, "SetItemSubMenu"      , "GUIObjects_Menu_SetItemSubMenu"      )
	_AutoItObject_AddMethod($ctrl, "SetItemText"         , "GUIObjects_Menu_SetItemText"         )
	_AutoItObject_AddMethod($ctrl, "SetItemType"         , "GUIObjects_Menu_SetItemType"         )
	_AutoItObject_AddMethod($ctrl, "SetMenu"             , "GUIObjects_Menu_SetMenu"             )
	_AutoItObject_AddMethod($ctrl, "SetMenuBackground"   , "GUIObjects_Menu_SetMenuBackground"   )
	_AutoItObject_AddMethod($ctrl, "SetMenuContextHelpID", "GUIObjects_Menu_SetMenuContextHelpID")
	_AutoItObject_AddMethod($ctrl, "SetMenuData"         , "GUIObjects_Menu_SetMenuData"         )
	_AutoItObject_AddMethod($ctrl, "SetMenuDefaultItem"  , "GUIObjects_Menu_SetMenuDefaultItem"  )
	_AutoItObject_AddMethod($ctrl, "SetMenuHeight"       , "GUIObjects_Menu_SetMenuHeight"       )
	_AutoItObject_AddMethod($ctrl, "SetMenuInfo"         , "GUIObjects_Menu_SetMenuInfo"         )
	_AutoItObject_AddMethod($ctrl, "SetMenuStyle"        , "GUIObjects_Menu_SetMenuStyle"        )
	_AutoItObject_AddMethod($ctrl, "TrackPopupMenu"      , "GUIObjects_Menu_TrackPopupMenu"      )

    Return $ctrl
EndFunc

Func GUIObjects_Menu_AddMenuItem(Const ByRef $this, Const $text, Const $cmdId = 0, Const $subMenu = 0)
	_GUICtrlMenu_AddMenuItem($this.Menu, $text, $cmdId, $subMenu)
EndFunc

Func GUIObjects_Menu_AppendMenu(Const ByRef $this, Const $flags, Const $newItemID, Const $newItem)
	Return _GUICtrlMenu_AppendMenu($this.Menu, $flags, $newItemID, $newItem)
EndFunc

Func GUIObjects_Menu_CheckMenuItem(Const ByRef $this, Const $item, Const $check = True, Const $byPos = True)
	Return _GUICtrlMenu_CheckMenuItem($this.Menu, $item, $check, $byPos)
EndFunc
  
Func GUIObjects_Menu_CheckRadioItem(Const ByRef $this, Const $first, Const $last, Const $check, Const $byPos = True)    
	Return _GUICtrlMenu_CheckRadioItem($this.Menu, $first, $last, $check, $byPos)
EndFunc
  
Func GUIObjects_Menu_CreatePopup(Const ByRef $this, Const $style = $MNS_CHECKORBMP)    
	Return _GUICtrlMenu_CreatePopup($this.Menu, $style)
EndFunc
     
Func GUIObjects_Menu_DeleteMenu(Const ByRef $this, Const $item, Const $byPos = True)        
	Return _GUICtrlMenu_DeleteMenu($this.Menu, $item, $byPos)
EndFunc
  
Func GUIObjects_Menu_DestroyMenu(Const ByRef $this)      
	Return _GUICtrlMenu_DestroyMenu($this.Menu)
EndFunc
   
Func GUIObjects_Menu_DrawMenuBar(Const ByRef $this)   
	Return _GUICtrlMenu_DrawMenuBar(HWnd($this.Window))
EndFunc
   
Func GUIObjects_Menu_EnableMenuItem(Const ByRef $this, Const $item, Const $state = 0, Const $byPos = True)   
	Return _GUICtrlMenu_EnableMenuItem($this.Menu, $item, $state, $byPos)
EndFunc
   
Func GUIObjects_Menu_FindItem(Const ByRef $this, Const $text, Const $inStr = False, Const $start = 0)      
	Return _GUICtrlMenu_FindItem($this.Menu, $text, $inStr, $start)
EndFunc
      
Func GUIObjects_Menu_FindParent(Const ByRef $this)     
	Return _GUICtrlMenu_FindParent($this.Menu)
EndFunc
     
Func GUIObjects_Menu_GetItemBmp(Const ByRef $this, Const $item, Const $byPos = True)      
	Return _GUICtrlMenu_GetItemBmp($this.Menu, $item, $byPos)
EndFunc
    
Func GUIObjects_Menu_GetItemBmpChecked(Const ByRef $this, Const $item, Const $byPos = True)   
	Return _GUICtrlMenu_GetItemBmpChecked($this.Menu, $item, $byPos)
EndFunc

Func GUIObjects_Menu_GetItemBmpUnChecked(Const ByRef $this, Const $item, Const $byPos = True) 
	Return _GUICtrlMenu_GetItemBmpUnChecked($this.Menu, $item, $byPos)
EndFunc

Func GUIObjects_Menu_GetItemChecked(Const ByRef $this, Const $item, Const $byPos = True)  
	Return _GUICtrlMenu_GetItemChecked($this.Menu, $item, $byPos)
EndFunc
    
Func GUIObjects_Menu_GetItemCount(Const ByRef $this)    
	Return _GUICtrlMenu_GetItemCount($this.Menu)
EndFunc
    
Func GUIObjects_Menu_GetItemData(Const ByRef $this, Const $item, Const $byPos = True)    
	Return _GUICtrlMenu_GetItemData($this.Menu, $item, $byPos)
EndFunc
     
Func GUIObjects_Menu_GetItemDefault(Const ByRef $this, Const $item, Const $byPos = True)   
	Return _GUICtrlMenu_GetItemDefault($this.Menu, $item, $byPos)
EndFunc
   
Func GUIObjects_Menu_GetItemDisabled(Const ByRef $this, Const $item, Const $byPos = True)   
	Return _GUICtrlMenu_GetItemDisabled($this.Menu, $item, $byPos)
EndFunc
  
Func GUIObjects_Menu_GetItemEnabled(Const ByRef $this, Const $item, Const $byPos = True)     
	Return _GUICtrlMenu_GetItemEnabled($this.Menu, $item, $byPos)
EndFunc
 
Func GUIObjects_Menu_GetItemGreyed(Const ByRef $this, Const $item, Const $byPos = True)       
	Return _GUICtrlMenu_GetItemGreyed($this.Menu, $item, $byPos)
EndFunc

Func GUIObjects_Menu_GetItemHighlighted(Const ByRef $this, Const $item, Const $byPos = True)  
	Return _GUICtrlMenu_GetItemHighlighted($this.Menu, $item, $byPos)
EndFunc

Func GUIObjects_Menu_GetItemId(Const ByRef $this, Const $item, Const $byPos = True)      
	Return _GUICtrlMenu_GetItemId($this.Menu, $item, $byPos)
EndFunc
     
Func GUIObjects_Menu_GetItemInfo(Const ByRef $this, Const $item, Const $byPos = True)     
	Return _GUICtrlMenu_GetItemInfo($this.Menu, $item, $byPos)
EndFunc
    
Func GUIObjects_Menu_GetItemRect(Const ByRef $this, Const $item)    
	Return _GUICtrlMenu_GetItemRect(HWnd($this.Window), $this.Menu, $item)
EndFunc
     
Func GUIObjects_Menu_GetItemRectEx(Const ByRef $this, Const $item)   
	Return _GUICtrlMenu_GetItemRectEx(HWnd($this.Window), $this.Menu, $item)
EndFunc
    
Func GUIObjects_Menu_GetItemState(Const ByRef $this, Const $item, Const $byPos = True)    
	Return _GUICtrlMenu_GetItemState($this.Menu, $item, $byPos)
EndFunc
    
Func GUIObjects_Menu_GetItemStateEx(Const ByRef $this, Const $item, Const $byPos = True)  
	Return _GUICtrlMenu_GetItemStateEx($this.Menu, $item, $byPos)
EndFunc
    
Func GUIObjects_Menu_GetItemSubMenu(Const ByRef $this, Const $item) 
	Return _GUICtrlMenu_GetItemSubMenu($this.Menu, $item)
EndFunc
     
Func GUIObjects_Menu_GetItemText(Const ByRef $this, Const $item, Const $byPos = True)  
	Return _GUICtrlMenu_GetItemText($this.Menu, $item, $byPos)
EndFunc
       
Func GUIObjects_Menu_GetItemType(Const ByRef $this, Const $item, Const $byPos = True)    
	Return _GUICtrlMenu_GetItemType($this.Menu, $item, $byPos)
EndFunc
     
Func GUIObjects_Menu_GetMenu(Const ByRef $this)          
	Return _GUICtrlMenu_GetMenu(HWnd($this.Window))
EndFunc
   
Func GUIObjects_Menu_GetMenuBackground(Const ByRef $this)   
	Return _GUICtrlMenu_GetMenuBackground($this.Menu)
EndFunc

Func GUIObjects_Menu_GetMenubarInfo(Const ByRef $this, Const $item, Const $object)      
	Return _GUICtrlMenu_GetMenubarInfo(HWnd($this.Window), $item, $object)
EndFunc

Func GUIObjects_Menu_GetMenuContextHelpID(Const ByRef $this)
	Return _GUICtrlMenu_GetMenuContextHelpID($this.Menu)
EndFunc

Func GUIObjects_Menu_GetMenuData(Const ByRef $this)       
	Return _GUICtrlMenu_GetMenuData($this.Menu)
EndFunc
  
Func GUIObjects_Menu_GetMenuDefaultItem(Const ByRef $this, Const $byPos = True, Const $flags = 0)  
	Return _GUICtrlMenu_GetMenuDefaultItem($this.Menu, $byPos, $flags)
EndFunc

Func GUIObjects_Menu_GetMenuHeight(Const ByRef $this)  
	Return _GUICtrlMenu_GetMenuHeight($this.Menu)
EndFunc
     
Func GUIObjects_Menu_GetMenuInfo(Const ByRef $this)
	Return _GUICtrlMenu_GetMenuInfo($this.Menu)
EndFunc
         
Func GUIObjects_Menu_GetMenuStyle(Const ByRef $this) 
	Return _GUICtrlMenu_GetMenuStyle($this.Menu)
EndFunc
       
Func GUIObjects_Menu_GetSystemMenu(Const ByRef $this, Const $revert = False) 
	Return _GUICtrlMenu_GetSystemMenu($this.Menu, $revert)
EndFunc
      
Func GUIObjects_Menu_InsertMenuItem(Const ByRef $this, Const $index, Const $text, Const $cmdID = 0, Const $subMenu = 0)  
	Return _GUICtrlMenu_InsertMenuItem($this.Menu, $index, $text, $cmdID, $subMenu)
EndFunc
    
Func GUIObjects_Menu_InsertMenuItemEx(Const ByRef $this, Const $index, ByRef $menu, Const $byRef = True)    
	Return _GUICtrlMenu_InsertMenuItemEx($this.Menu, $index, $menu, $byRef)
EndFunc

Func GUIObjects_Menu_IsMenu(Const ByRef $this, Const $inst, Const $menuName)     
	Return _GUICtrlMenu_IsMenu($this.Menu)
EndFunc
         
Func GUIObjects_Menu_LoadMenu(Const ByRef $this, Const $inst, Const $menuName)        
	Return _GUICtrlMenu_LoadMenu($this.Menu, $inst, $menuName)
EndFunc
    
Func GUIObjects_Menu_MapAccelerator(Const ByRef $this, Const $accelKey)   
	Return _GUICtrlMenu_MapAccelerator($this.Menu, $accelKey)
EndFunc
   
Func GUIObjects_Menu_MenuItemFromPoint(Const ByRef $this, Const $menu, Const $x = -1, Const $y = -1) 
	Return _GUICtrlMenu_MenuItemFromPoint($this.Menu, $menu, $x, $y)
EndFunc
  
Func GUIObjects_Menu_RemoveMenu(Const ByRef $this, Const $item, Const $byPos = True)      
	Return _GUICtrlMenu_RemoveMenu($this.Menu, $item, $byPos)
EndFunc
    
Func GUIObjects_Menu_SetItemBitmaps(Const ByRef $this, Const $item, Const $checked, Const $unchecked, Const $byPos = True)  
	Return _GUICtrlMenu_SetItemBitmaps($this.Menu, $item, $checked, $unchecked, $byPos)
EndFunc
    
Func GUIObjects_Menu_SetItemBmp(Const ByRef $this, Const $item, Const $bitmap, Const $byPos = True)    
	Return _GUICtrlMenu_SetItemBmp($this.Menu, $item, $bitmap, $byPos)
EndFunc
      
Func GUIObjects_Menu_SetItemBmpChecked(Const ByRef $this, Const $item, Const $bitmap, Const $byPos = True)  
	Return _GUICtrlMenu_SetItemBmpChecked($this.Menu, $item, $bitmap, $byPos)
EndFunc
 
Func GUIObjects_Menu_SetItemBmpUnchecked(Const ByRef $this, Const $item, Const $bitmap, Const $byPos = True) 
	Return _GUICtrlMenu_SetItemBmpUnchecked($this.Menu, $item, $bitmap, $byPos)
EndFunc

Func GUIObjects_Menu_SetItemChecked(Const ByRef $this, Const $item, Const $state = True, Const $byPos = True)  
	Return _GUICtrlMenu_SetItemChecked($this.Menu, $item, $state, $byPos)
EndFunc
    
Func GUIObjects_Menu_SetItemData(Const ByRef $this, Const $item, Const $data, Const $byPos = True)   
	Return _GUICtrlMenu_SetItemData($this.Menu, $item, $data, $byPos)
EndFunc
      
Func GUIObjects_Menu_SetItemDefault(Const ByRef $this, Const $item, Const $state = True, Const $byPos = True) 
	Return _GUICtrlMenu_SetItemDefault($this.Menu, $item, $state, $byPos)
EndFunc
     
Func GUIObjects_Menu_SetItemDisabled(Const ByRef $this, Const $item, Const $state = True, Const $byPos = True)  
	Return _GUICtrlMenu_SetItemDisabled($this.Menu, $item, $state, $byPos)
EndFunc
   
Func GUIObjects_Menu_SetItemEnabled(Const ByRef $this, Const $item, Const $state = True, Const $byPos = True)   
	Return _GUICtrlMenu_SetItemEnabled($this.Menu, $item, $state, $byPos)
EndFunc
   
Func GUIObjects_Menu_SetItemGreyed(Const ByRef $this, Const $item, Const $state = True, Const $byPos = True)    
	Return _GUICtrlMenu_SetItemGreyed($this.Menu, $item, $state, $byPos)
EndFunc
   
Func GUIObjects_Menu_SetItemHighlighted(Const ByRef $this, Const $item, Const $state = True, Const $byPos = True)  
	Return _GUICtrlMenu_SetItemHighlighted($this.Menu, $item, $state, $byPos)
EndFunc

Func GUIObjects_Menu_SetItemID(Const ByRef $this, Const $item, Const $id, Const $byPos = True)   
	Return _GUICtrlMenu_SetItemID($this.Menu, $item, $id, $byPos)
EndFunc
        
Func GUIObjects_Menu_SetItemInfo(Const ByRef $this, Const $item, ByRef $info, Const $byPos = True)  
	Return _GUICtrlMenu_SetItemInfo($this.Menu, $item, $info, $byPos)
EndFunc
       
Func GUIObjects_Menu_SetItemState(Const ByRef $this, Const $item, Const $state, Const $enabled = True, Const $byPos = True)   
	Return _GUICtrlMenu_SetItemState($this.Menu, $item, $state, $enabled, $byPos)
EndFunc
     
Func GUIObjects_Menu_SetItemSubMenu(Const ByRef $this, Const $item, Const $subMenu, Const $byPos = True)  
	Return _GUICtrlMenu_SetItemSubMenu($this.Menu, $item, $subMenu, $byPos)
EndFunc
    
Func GUIObjects_Menu_SetItemText(Const ByRef $this, Const $item, Const $text, Const $byPos = True)   
	Return _GUICtrlMenu_SetItemText($this.Menu, $item, $text, $byPos)
EndFunc
      
Func GUIObjects_Menu_SetItemType(Const ByRef $this, Const $item, Const $type, Const $byPos = True)    
	Return _GUICtrlMenu_SetItemType($this.Menu, $item, $type, $byPos)
EndFunc
     
Func GUIObjects_Menu_SetMenu(Const ByRef $this)         
	Return _GUICtrlMenu_SetMenu(HWnd($this.Window), $this.Menu)
EndFunc
    
Func GUIObjects_Menu_SetMenuBackground(Const ByRef $this, Const $brush)   
	Return _GUICtrlMenu_SetMenuBackground($this.Menu, $brush)
EndFunc

Func GUIObjects_Menu_SetMenuContextHelpID(Const ByRef $this, Const $helpID)
	Return _GUICtrlMenu_SetMenuContextHelpID($this.Menu, $helpID)
EndFunc

Func GUIObjects_Menu_SetMenuData(Const ByRef $this, Const $data)        
	Return _GUICtrlMenu_SetMenuData($this.Menu, $data)
EndFunc
 
Func GUIObjects_Menu_SetMenuDefaultItem(Const ByRef $this, Const $item, Const $byPos = True) 
	Return _GUICtrlMenu_SetMenuDefaultItem($this.Menu, $item, $byPos)
EndFunc
 
Func GUIObjects_Menu_SetMenuHeight(Const ByRef $this, Const $height)  
	Return _GUICtrlMenu_SetMenuHeight($this.Menu, $height)
EndFunc
     
Func GUIObjects_Menu_SetMenuInfo(Const ByRef $this, ByRef $info)     
	Return _GUICtrlMenu_SetMenuInfo($this.Menu, $info)
EndFunc
    
Func GUIObjects_Menu_SetMenuStyle(Const ByRef $this, Const $style)     
	Return _GUICtrlMenu_SetMenuStyle($this.Menu, $style)
EndFunc
   
Func GUIObjects_Menu_TrackPopupMenu(Const ByRef $this, Const $x = -1, Const $y = -1, Const $align = 1, Const $alignY = 1, Const $notify = 0, Const $buttons = 0)      
	Return _GUICtrlMenu_TrackPopupMenu($this.Menu, HWnd($this.Window), $x, $y, $align, $alignY, $notify, $buttons)
EndFunc


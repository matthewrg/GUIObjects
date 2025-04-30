#include-once

#include <GuiListBox.au3>

Func GUIObjects_ListBox(ByRef $this, Const $name, Const $text, Const $left, Const $top, Const $width = 100, Const $height = 200, Const $style = 0x00B00002, Const $exStyle = 0x00000200)
	Local Const $handle = _GUICtrlListBox_Create(HWnd($this.Handle), $text, $left, $top, $width, $height, $style, $exStyle)

	Local $ctrl = _AutoItObject_Create(Control())

	_AutoItObject_AddMethod($ctrl, "AddFile"            , "GUIObjects_ListBox_AddFile"            )
	_AutoItObject_AddMethod($ctrl, "AddString"          , "GUIObjects_ListBox_AddString"          )
	_AutoItObject_AddMethod($ctrl, "BeginUpdate"        , "GUIObjects_ListBox_BeginUpdate"        )
	_AutoItObject_AddMethod($ctrl, "ClickItem"          , "GUIObjects_ListBox_ClickItem"          )
	_AutoItObject_AddMethod($ctrl, "DeleteString"       , "GUIObjects_ListBox_DeleteString"       )
	_AutoItObject_AddMethod($ctrl, "Destroy"            , "GUIObjects_ListBox_Destroy"            )
	_AutoItObject_AddMethod($ctrl, "Dir"                , "GUIObjects_ListBox_Dir"                )
	_AutoItObject_AddMethod($ctrl, "EndUpdate"          , "GUIObjects_ListBox_EndUpdate"          )
	_AutoItObject_AddMethod($ctrl, "FindInText"         , "GUIObjects_ListBox_FindInText"         )
	_AutoItObject_AddMethod($ctrl, "FindString"         , "GUIObjects_ListBox_FindString"         )
	_AutoItObject_AddMethod($ctrl, "GetAnchorIndex"     , "GUIObjects_ListBox_GetAnchorIndex"     )
	_AutoItObject_AddMethod($ctrl, "GetCaretIndex"      , "GUIObjects_ListBox_GetCaretIndex"      )
	_AutoItObject_AddMethod($ctrl, "GetCount"           , "GUIObjects_ListBox_GetCount"           )
	_AutoItObject_AddMethod($ctrl, "GetCurSel"          , "GUIObjects_ListBox_GetCurSel"          )
	_AutoItObject_AddMethod($ctrl, "GetHorizontalExtent", "GUIObjects_ListBox_GetHorizontalExtent")
	_AutoItObject_AddMethod($ctrl, "GetItemData"        , "GUIObjects_ListBox_GetItemData"        )
	_AutoItObject_AddMethod($ctrl, "GetItemHeight"      , "GUIObjects_ListBox_GetItemHeight"      )
	_AutoItObject_AddMethod($ctrl, "GetItemRect"        , "GUIObjects_ListBox_GetItemRect"        )
	_AutoItObject_AddMethod($ctrl, "GetItemRectEx"      , "GUIObjects_ListBox_GetItemRectEx"      )
	_AutoItObject_AddMethod($ctrl, "GetListBoxInfo"     , "GUIObjects_ListBox_GetListBoxInfo"     )
	_AutoItObject_AddMethod($ctrl, "GetLocale"          , "GUIObjects_ListBox_GetLocale"          )
	_AutoItObject_AddMethod($ctrl, "GetLocaleCountry"   , "GUIObjects_ListBox_GetLocaleCountry"   )
	_AutoItObject_AddMethod($ctrl, "GetLocaleLang"      , "GUIObjects_ListBox_GetLocaleLang"      )
	_AutoItObject_AddMethod($ctrl, "GetLocalPrimLang"   , "GUIObjects_ListBox_GetLocalPrimLang"   )
	_AutoItObject_AddMethod($ctrl, "GetLocaleSubLang"   , "GUIObjects_ListBox_GetLocaleSubLang"   )
	_AutoItObject_AddMethod($ctrl, "GetSel"             , "GUIObjects_ListBox_GetSel"             )
	_AutoItObject_AddMethod($ctrl, "GetSelCount"        , "GUIObjects_ListBox_GetSelCount"        )
	_AutoItObject_AddMethod($ctrl, "GetSelItemsText"    , "GUIObjects_ListBox_GetSelItemsText"    )
	_AutoItObject_AddMethod($ctrl, "GetText"            , "GUIObjects_ListBox_GetText"            )
	_AutoItObject_AddMethod($ctrl, "GetTextLen"         , "GUIObjects_ListBox_GetTextLen"         )
	_AutoItObject_AddMethod($ctrl, "GetTopIndex"        , "GUIObjects_ListBox_GetTopIndex"        )
	_AutoItObject_AddMethod($ctrl, "InitStorage"        , "GUIObjects_ListBox_InitStorage"        )
	_AutoItObject_AddMethod($ctrl, "InsertString"       , "GUIObjects_ListBox_InsertString"       )
	_AutoItObject_AddMethod($ctrl, "ItemFromPoint"      , "GUIObjects_ListBox_ItemFromPoint"      )
	_AutoItObject_AddMethod($ctrl, "ReplaceString"      , "GUIObjects_ListBox_ReplaceString"      )
	_AutoItObject_AddMethod($ctrl, "ResetContent"       , "GUIObjects_ListBox_ResetContent"       )
	_AutoItObject_AddMethod($ctrl, "SelectString"       , "GUIObjects_ListBox_SelectString"       )
	_AutoItObject_AddMethod($ctrl, "SelItemRange"       , "GUIObjects_ListBox_SelItemRange"       )
	_AutoItObject_AddMethod($ctrl, "SelItemRangeEx"     , "GUIObjects_ListBox_SelItemRangeEx"     )
	_AutoItObject_AddMethod($ctrl, "SetAnchorIndex"     , "GUIObjects_ListBox_SetAnchorIndex"     )
	_AutoItObject_AddMethod($ctrl, "SetCaretIndex"      , "GUIObjects_ListBox_SetCaretIndex"      )
	_AutoItObject_AddMethod($ctrl, "SetColumnWidth"     , "GUIObjects_ListBox_SetColumnWidth"     )
	_AutoItObject_AddMethod($ctrl, "SetCurSel"          , "GUIObjects_ListBox_SetCurSel"          )
	_AutoItObject_AddMethod($ctrl, "SetHorizontalExtent", "GUIObjects_ListBox_SetHorizontalExtent")
	_AutoItObject_AddMethod($ctrl, "SetItemData"        , "GUIObjects_ListBox_SetItemData"        )
	_AutoItObject_AddMethod($ctrl, "SetItemHeight"      , "GUIObjects_ListBox_SetItemHeight"      )
	_AutoItObject_AddMethod($ctrl, "SetLocale"          , "GUIObjects_ListBox_SetLocale"          )
	_AutoItObject_AddMethod($ctrl, "SetSel"             , "GUIObjects_ListBox_SetSel"             )
	_AutoItObject_AddMethod($ctrl, "SetTabStops"        , "GUIObjects_ListBox_SetTabStops"        )
	_AutoItObject_AddMethod($ctrl, "SetTopIndex"        , "GUIObjects_ListBox_SetTopIndex"        )
	_AutoItObject_AddMethod($ctrl, "Sort"               , "GUIObjects_ListBox_Sort"               )
	_AutoItObject_AddMethod($ctrl, "SwapString"         , "GUIObjects_ListBox_SwapString"         )
	_AutoItObject_AddMethod($ctrl, "UpdateHScroll"      , "GUIObjects_ListBox_UpdateHScroll"      )
	
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

Func GUIObjects_ListBox_AddFile(Const ByRef $this, Const $filePath)
	Return _GUICtrlListBox_AddFile(HWnd($this.Handle), $filePath)
EndFunc      
            
Func GUIObjects_ListBox_AddString(Const ByRef $this, Const $text)
	Return _GUICtrlListBox_AddString(HWnd($this.Handle), $text)	
EndFunc      
          
Func GUIObjects_ListBox_BeginUpdate(Const ByRef $this)
	Return _GUICtrlListBox_BeginUpdate(HWnd($this.Handle))
EndFunc      
        
Func GUIObjects_ListBox_ClickItem(Const ByRef $this, Const $iIndex, Const $sButton = "left", Const $bMove = False, Const $iClicks = 1, Const $iSpeed = 0)
	_GUICtrlListBox_ClickItem(HWnd($this.Handle), $iIndex, $sButton, $bMove, $iClicks, $iSpeed)
EndFunc          
       
Func GUIObjects_ListBox_DeleteString(Const ByRef $this, Const $index)
	Return _GUICtrlListBox_Destroy(HWnd($this.Handle), $index)
EndFunc

Func GUIObjects_ListBox_Destroy(Const ByRef $this)
	Return _GUICtrlListBox_Destroy(HWnd($this.Handle))
EndFunc      
            
Func GUIObjects_ListBox_Dir(Const ByRef $this, Const $filepath, Const $attributes = 0, Const $brackets = True)
	Return _GUICtrlListBox_Dir(HWnd($this.Handle), $filepath, $attributes, $brackets)
EndFunc      
                
Func GUIObjects_ListBox_EndUpdate(Const ByRef $this)
	Return _GUICtrlListBox_EndUpdate(HWnd($this.Handle))
EndFunc      
          
Func GUIObjects_ListBox_FindInText(Const ByRef $this, Const $sText, Const $iStart = -1, Const $bWrapOK = True)
	Return _GUICtrlListBox_FindInText(HWnd($this.Handle), $sText, $iStart, $bWrapOK)
EndFunc      
         
Func GUIObjects_ListBox_FindString(Const ByRef $this, Const $sText, Const $bExact = False)
	Return _GUICtrlListBox_FindString(HWnd($this.Handle), $sText, $bExact)
EndFunc      
         
Func GUIObjects_ListBox_GetAnchorIndex(Const ByRef $this)
	Return _GUICtrlListBox_GetAnchorIndex(HWnd($this.Handle))
EndFunc      
     
Func GUIObjects_ListBox_GetCaretIndex(Const ByRef $this)
	Return _GUICtrlListBox_GetCaretIndex(HWnd($this.Handle))
EndFunc      
      
Func GUIObjects_ListBox_GetCount(Const ByRef $this)
	Return _GUICtrlListBox_GetCount(HWnd($this.Handle))
EndFunc      
           
Func GUIObjects_ListBox_GetCurSel(Const ByRef $this)
	Return _GUICtrlListBox_GetCurSel(HWnd($this.Handle))
EndFunc      
          
Func GUIObjects_ListBox_GetHorizontalExtent(Const ByRef $this)
	Return _GUICtrlListBox_GetHorizontalExtent(HWnd($this.Handle))
EndFunc      

Func GUIObjects_ListBox_GetItemData(Const ByRef $this, Const $index)
	Return _GUICtrlListBox_GetItemData(HWnd($this.Handle), $index)
EndFunc      
        
Func GUIObjects_ListBox_GetItemHeight(Const ByRef $this)
	Return _GUICtrlListBox_GetItemHeight(HWnd($this.Handle))
EndFunc      
      
Func GUIObjects_ListBox_GetItemRect(Const ByRef $this, Const $index)
	Return _GUICtrlListBox_GetItemRect(HWnd($this.Handle), $index)
EndFunc      
        
Func GUIObjects_ListBox_GetItemRectEx(Const ByRef $this, Const $index)
	Return _GUICtrlListBox_GetItemRectEx(HWnd($this.Handle), $index)
EndFunc      
      
Func GUIObjects_ListBox_GetListBoxInfo(Const ByRef $this)
	Return _GUICtrlListBox_GetListBoxInfo(HWnd($this.Handle))
EndFunc      
     
Func GUIObjects_ListBox_GetLocale(Const ByRef $this)
	Return _GUICtrlListBox_GetLocale(HWnd($this.Handle))
EndFunc      
          
Func GUIObjects_ListBox_GetLocaleCountry(Const ByRef $this)
	Return _GUICtrlListBox_GetLocaleCountry(HWnd($this.Handle))
EndFunc      
   
Func GUIObjects_ListBox_GetLocaleLang(Const ByRef $this)
	Return _GUICtrlListBox_GetLocaleLang(HWnd($this.Handle))
EndFunc      
      
Func GUIObjects_ListBox_GetLocalPrimLang(Const ByRef $this)
	Return _GUICtrlListBox_GetLocalPrimLang(HWnd($this.Handle))
EndFunc      
   
Func GUIObjects_ListBox_GetLocaleSubLang(Const ByRef $this)
	Return _GUICtrlListBox_GetLocaleSubLang(HWnd($this.Handle))
EndFunc      
   
Func GUIObjects_ListBox_GetSel(Const ByRef $this, Const $index)
	Return _GUICtrlListBox_GetSel(HWnd($this.Handle), $index)
EndFunc      
             
Func GUIObjects_ListBox_GetSelCount(Const ByRef $this)
	Return _GUICtrlListBox_GetSelCount(HWnd($this.Handle))
EndFunc      
        
Func GUIObjects_ListBox_GetSelItemsText(Const ByRef $this)
	Return _GUICtrlListBox_GetSelItemsText(HWnd($this.Handle))
EndFunc      
    
Func GUIObjects_ListBox_GetText(Const ByRef $this, Const $index)
	Return _GUICtrlListBox_GetText(HWnd($this.Handle), $index)
EndFunc      
            
Func GUIObjects_ListBox_GetTextLen(Const ByRef $this, Const $index)
	Return _GUICtrlListBox_GetTextLen(HWnd($this.Handle), $index)
EndFunc      
         
Func GUIObjects_ListBox_GetTopIndex(Const ByRef $this)
	Return _GUICtrlListBox_GetTopIndex(HWnd($this.Handle))
EndFunc      
        
Func GUIObjects_ListBox_InitStorage(Const ByRef $this, Const $items, Const $bytes)
	Return _GUICtrlListBox_InitStorage(HWnd($this.Handle), $items, $bytes)
EndFunc      
        
Func GUIObjects_ListBox_InsertString(Const ByRef $this, Const $text, Const $index)
	Return _GUICtrlListBox_InsertString(HWnd($this.Handle), $text, $index)
EndFunc      
       
Func GUIObjects_ListBox_ItemFromPoint(Const ByRef $this, Const $x, Const $y)
	Return _GUICtrlListBox_ItemFromPoint(HWnd($this.Handle), $x, $y)
EndFunc      
      
Func GUIObjects_ListBox_ReplaceString(Const ByRef $this, Const $index, Const $text)
	Return _GUICtrlListBox_ReplaceString(HWnd($this.Handle), $index, $text)
EndFunc      
      
Func GUIObjects_ListBox_ResetContent(Const ByRef $this)
	Return _GUICtrlListBox_ResetContent(HWnd($this.Handle))
EndFunc      
       
Func GUIObjects_ListBox_SelectString(Const ByRef $this, Const $index, Const $text)
	Return _GUICtrlListBox_SelectString(HWnd($this.Handle), $index, $text)
EndFunc      
       
Func GUIObjects_ListBox_SelItemRange(Const ByRef $this, Const $first, Const $last, Const $select = True)
	Return _GUICtrlListBox_SelItemRange(HWnd($this.Handle), $first, $last, $select)
EndFunc      
       
Func GUIObjects_ListBox_SelItemRangeEx(Const ByRef $this, Const $first, Const $last)
	Return _GUICtrlListBox_SelItemRangeEx(HWnd($this.Handle), $first, $last)
EndFunc      
     
Func GUIObjects_ListBox_SetAnchorIndex(Const ByRef $this, Const $index)
	Return _GUICtrlListBox_SetAnchorIndex(HWnd($this.Handle), $index)
EndFunc      
     
Func GUIObjects_ListBox_SetCaretIndex(Const ByRef $this, Const $index, Const $partial = False)
	Return _GUICtrlListBox_SetCaretIndex(HWnd($this.Handle), $index, $partial)
EndFunc      
      
Func GUIObjects_ListBox_SetColumnWidth(Const ByRef $this, Const $width)
	_GUICtrlListBox_SetColumnWidth(HWnd($this.Handle), $width)
EndFunc      
     
Func GUIObjects_ListBox_SetCurSel(Const ByRef $this, Const $index)
	Return _GUICtrlListBox_SetCurSel(HWnd($this.Handle), $index)
EndFunc      
          
Func GUIObjects_ListBox_SetHorizontalExtent(Const ByRef $this, Const $width)
	_GUICtrlListBox_SetHorizontalExtent(HWnd($this.Handle), $width)
EndFunc      

Func GUIObjects_ListBox_SetItemData(Const ByRef $this, Const $index, Const $value)
	Return _GUICtrlListBox_SetItemData(HWnd($this.Handle), $index, $value)
EndFunc      
        
Func GUIObjects_ListBox_SetItemHeight(Const ByRef $this, Const $height, Const $index)
	Return _GUICtrlListBox_SetItemHeight(HWnd($this.Handle), $height, $index)
EndFunc      
      
Func GUIObjects_ListBox_SetLocale(Const ByRef $this, Const $local)
	Return _GUICtrlListBox_SetLocale(HWnd($this.Handle), $local)
EndFunc      
          
Func GUIObjects_ListBox_SetSel(Const ByRef $this, Const $index = -1, Const $select = -1)
	Return _GUICtrlListBox_SetSel(HWnd($this.Handle), $index, $select)
EndFunc      
             
Func GUIObjects_ListBox_SetTabStops(Const ByRef $this, Const $tabStops)
	Return _GUICtrlListBox_SetTabStops(HWnd($this.Handle), $tabStops)
EndFunc      
        
Func GUIObjects_ListBox_SetTopIndex(Const ByRef $this, Const $index)
	Return _GUICtrlListBox_SetTopIndex(HWnd($this.Handle), $index)
EndFunc      
        
Func GUIObjects_ListBox_Sort(Const ByRef $this)
	Return _GUICtrlListBox_Sort(HWnd($this.Handle))
EndFunc      

Func GUIObjects_ListBox_SwapString(Const ByRef $this, Const $indexA, Const $indexB)
	Return _GUICtrlListBox_SwapString(HWnd($this.Handle), $indexA, $indexB)
EndFunc      

Func GUIObjects_ListBox_UpdateHScroll(Const ByRef $this)
	_GUICtrlListBox_UpdateHScroll(HWnd($this.Handle))
EndFunc      

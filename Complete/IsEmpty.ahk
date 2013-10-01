; Made by: HWolfW (Grayhwolf@gmail.com)
; Version: 0.1
; Purpose: Simple file to check whether a folder is empty or not
;          Returns 1 when NOT empty
;                  0 when ok to delete!
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------

IsEmpty(Dir){
   Loop %Dir%\*.*, 1, 1
      return 1 ; means not empty
   return 0 ; means empty
}

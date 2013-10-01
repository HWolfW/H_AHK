; Made by: HWolfW (Grayhwolf@gmail.com)
; Version: 0.1
; Purpose: Calculate Size of '_Input' to a more readable size in proper units. B,KB,MB,GB,TB
;          Made to be used as a Function to be called from another AHK script.
;
; Modes: No mode (0 or Blank) will do a simple Traytip for 2 secs
;           mode 1 will return as a function will with the format of " ## Unit "
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
ZiseCalc(_Input, mode=0) {
    StringReplace, Var1, _Input,`,,, A ;Remove any commas from _Input. 1,1234,556 -> 11234556
    If Var1 < 1024 ; Start checking for B
        Unit = B ; Initialize 'Unit'
    If Var1 > 1024 ; Check if in need to change to KB
        {
            Var1 := Var1 / 1024
            Unit = KB ;Set Unit
        }
    If Var1 > 1024 ; Check if in need to change to MB
        {
            Var1 := Var1 / 1024
            Unit = MB ;Set Unit
        }
    If Var1 > 1024 ; Check if in need to change to GB
        {
            Var1 := Var1 / 1024
            Unit = GB ;Set Unit
        }
    If Var1 > 1024 ; Check if in need to change to TB
        {
            Var1 := Var1 / 1024
            Unit = TB ;Set Unit (Nice Space there Buddy)
        }
    If Var1 > 1024 ; Check if in need to change to ZB
        {
            Var1 := Var1 / 1024
            Unit = ZB ;Set Unit (ARE YOU YOUTUBE?!)
        }
    If mode = 1 ;Called to Return as a Func
        Return Var1 . " " . Unit
    Else {
        TrayTip, "Zise", Size is %Var1% %Unit%, 2, 1 ;TrayTip it.
        Sleep, 2200 ;Allow TrayTip to display and exit.
    }
}

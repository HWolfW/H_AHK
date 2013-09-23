; Made by: HWolfW (Grayhwolf@gmail.com)
; Version: 0.1
; Purpose: Just like linux, opens command prompt at currently open folder directory
; Does Not Support UNC Paths as of yet!
; Works BEST when used with a #IfWinActive ahk_class CabinetWClass (Windows Explorer AHK_CLASS)
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
CMDHERE() ;Called as a function
{
    WinGetText, full_path, A       ; This is required to get the full path of the file from the address bar
    StringSplit, word_array, full_path, `n   ; Split on newline (`n)
    Loop, %word_array0%   ; Find and take the element from the array that contains address
    {
        IfInString, word_array%A_Index%, Address
        {
            full_path := word_array%A_Index%
            break ; FOUND IT!
        }
    }  
    ; Strip to bare address
    full_path := RegExReplace(full_path, "^Address: ", "")
    StringReplace, full_path, full_path, `r, , all   ; Just in case - remove all carriage returns (`r)
    StringSplit, word_array, full_path, \ ; Split on backslash (\)
    Loop, %word_array0%    ; Find and take the proper info
    {
        If A_Index = 1
            cdrive := word_array%A_Index% ; This is the DRIVE it obtained. I.E "C:","D:","F:",etc.
        Else
            dir := dir . "\" . word_array%A_Index% ; Gather the rest of the path
    }  
    If cdrive != %systemdrive% ; Not under the local Drive i.e. removeable or multiple drives.
        {
            Run,  %COMSPEC% /k %cdrive% && cd "%dir%" ; First switch to it then cd to said subpath
        }
    Else
        Run,  %COMSPEC% /k cd "%full_path%" ;Its local so just cd to subpath
}

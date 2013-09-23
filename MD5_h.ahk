; Made by: HWolfW (Grayhwolf@gmail.com)
; Version: 0.1
; Purpose: Compute MD5 hash of 'x' and return the HASH. 'v' is where it'll place it's temp files (folder).
; REQUIRES "md5.exe" TO BE LISTED IN PATH. OR BE PLACED IN AN EXISTING PATH (Windows | System | System32)
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------

MD5_h(x,v="")
{
    If v != "" ; You specified something
        If !FileExist(v) ;Check to see if it DOESNT Exist
            FileCreateDir, %v% ; Create if if it didn't
    ofg := random(50000,100000) ;Grab a random number for temp use
    RunWait, %COMSPEC% /c md5.exe -n "%x%" > "%v%%ofg%.md5",,hide ; Run cmd to run md5.exe and export ONLY the HASH to the temp file with a .md5 File extension
    FileRead, line, %v%%ofg%.md5 ; Read the Hash from the file...
    While FileExist(v . ofg . ".md5") ; Delete the no longer needed temp file
        FileDelete, %v%%ofg%.md5 ; Deleting....
    StringReplace, line, line, `r`n, ,All ; Remove any unwanted line-feeds
    Return %line% ;Return it to caller.
}

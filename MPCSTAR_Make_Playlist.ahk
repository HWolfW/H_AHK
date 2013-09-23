; Made by: HWolfW (Grayhwolf@gmail.com)
; Version: 0.1
; Purpose: If "Save the playlist when exit" is enabled == Over-Writes the current 'playlist.xml' under '%appdata%\Roaming\TigerPlayer\'
;                 With all '.MP4' files located within the same directory as this script.
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------

SetWorkingDir %A_ScriptDir%

List := Object() ;Create Empty Array

; Fetch All Files of Type and add them to the Array
Loop, *.mp4 {
    List.Insert(A_LoopFileLongPath)
}

Write("","O") ;open playlist.xml for writing *See Write() Function

; Start Writing Header for Playlist

Write("<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?>")
Write("<playlist>")
Write("  <trackList title=""::DefaultList::"">/")

;  Start Adding Videos To the Playlist

for count, video in List
{
    Write("    <track>")
    StringReplace, video, video, &, &amp;, A ;Replace Any and all '&' with proper pattern for MPCSTAR
    Write("      <location>file:///" . video . "</location>")
    Write("    </track>")
}
;  Write Ending for videos and continue with ending

Write("  </trackList>")
Write("  <play_pos>")
Write("    <track>")
Write("      <location>" . List[1] . "</location>") ; Select the First video for MPCSTAR (Requires this or wont work)
Write("      <last_pos>FILE||position@0</last_pos>") ; Set start at beggining of video
Write("    </track>")
Write("  </play_pos>")
Write("</playlist>")
Write("","C") ; End and CLOSE playlist.xml

; Start MPCSTAR *If registered in your path.
Run, mpcstar,,UseErrorLevel

;-------------------------------------------------------------
;-------------------------------------------------------------
; ______ _    _ _   _  _____ _______ _____ ____  _   _  _____
;|  ____| |  | | \ | |/ ____|__   __|_   _/ __ \| \ | |/ ____|
;| |__  | |  | |  \| | |       | |    | || |  | |  \| | (___
;|  __| | |  | | . ` | |       | |    | || |  | | . ` |\___ \
;| |    | |__| | |\  | |____   | |   _| || |__| | |\  |____) |
;|_|     \____/|_| \_|\_____|  |_|  |_____\____/|_| \_|_____/
;-------------------------------------------------------------
;-------------------------------------------------------------


Write(text = "", mode = "") {
    Global File
    If mode = O
        File := FileOpen(A_AppData . "\TigerPlayer\playlist.xml","w")
    Else If mode = C
        File.Close()
    Else
        File.Write(text . "`n")
}

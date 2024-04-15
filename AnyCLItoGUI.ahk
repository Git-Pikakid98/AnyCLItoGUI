#Requires AutoHotkey v2.0
#NoTrayIcon

;@Ahk2Exe-Set FileVersion, 1.0
;@Ahk2Exe-Set ProductVersion, 1.0.0.0
;@Ahk2Exe-Set CompanyName, Pikakid98

if A_Args.Length < 2
{
    MsgBox  "
    (
        Error! Please create a shortcut with the following commands
        
        "[SCRIPTDIR]\AnyCLItoGUI.exe" "[CLITOOL].exe" "[FILETYPE]"
    )"

    ExitApp
}

if A_Args.Length = 2 {
    SelectedFile := FileSelect(3, , "Open a file", "File (*." A_Args[2] ")")
}

if A_Args.Length = 3 {
    SelectedFile := FileSelect(3, , "Open a file", "File (*." A_Args[2] "; *." A_Args[3] ")")
}

if A_Args.Length = 4 {
    SelectedFile := FileSelect(3, , "Open a file", "File (*." A_Args[2] "; *." A_Args[3] "; *." A_Args[4] ")")
}

if A_Args.Length = 5 {
    SelectedFile := FileSelect(3, , "Open a file", "File (*." A_Args[2] "; *." A_Args[3] "; *." A_Args[4] "; *." A_Args[5] ")")
}

if SelectedFile = "" {
    ExitApp
} else {
    Loop Files, SelectedFile, "F"
    SetWorkingDir A_LoopFileDir
    RunWait A_Args[1] " " '"' SelectedFile '"'
    RunWait "explorer.exe" " " A_WorkingDir
}
#Requires AutoHotkey v2.0+
#SingleInstance Force

#`:: { ; Win+`
    hwnd := WinExist("ahk_class Progman") ? ControlGetHwnd("SysListView321", "ahk_class Progman") : ControlGetHwnd("SysListView321", "ahk_class WorkerW")
    if DllCall("IsWindowVisible", "UInt", hwnd) {
        ; Fade out
        Loop 20 {
            WinSetTransparent(255 - (A_Index * 12), "ahk_id " hwnd)
            Sleep(20)
        }
        WinHide("ahk_id " hwnd)
    } else {
        WinShow("ahk_id " hwnd)
        ; Fade in
        Loop 20 {
            WinSetTransparent(A_Index * 12, "ahk_id " hwnd)
            Sleep(20)
        }
        WinSetTransparent("OFF", "ahk_id " hwnd)
    }
    ; Refresh desktop (no error)
    PostMessage(0x111, 0x7103,, 0xFFFF)
}


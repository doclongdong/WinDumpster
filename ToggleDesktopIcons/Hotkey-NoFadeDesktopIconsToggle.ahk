#Requires AutoHotkey v2.0+
#SingleInstance Force

#`:: { ; Win+`
    hwnd := WinExist("ahk_class Progman") ? ControlGetHwnd("SysListView321", "ahk_class Progman") : ControlGetHwnd("SysListView321", "ahk_class WorkerW")
    if DllCall("IsWindowVisible", "UInt", hwnd)
        WinHide("ahk_id " hwnd)
    else
        WinShow("ahk_id " hwnd)
    ; Refresh desktop (no error)
    PostMessage(0x111, 0x7103,, 0xFFFF) ; WM_COMMAND, SHCNE_UPDATEIMAGE, HWND_BROADCAST
}

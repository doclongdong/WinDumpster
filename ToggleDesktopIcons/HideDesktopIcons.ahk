#Requires AutoHotkey v2.0+

Sleep(5000)

hwnd := WinExist("ahk_class Progman") ? ControlGetHwnd("SysListView321", "ahk_class Progman") : ControlGetHwnd("SysListView321", "ahk_class WorkerW")

WinHide("ahk_id " hwnd)

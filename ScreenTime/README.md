A Screen time tool for Windows
---



The screentime tool:
- Makes the screen grayscale (requires AHKv2)
- Locks, logouts, or shutdowns the computer after an interval

It opens a window in powershell which can be exited by the user.

This can be run in Task Scheduler for automation, eg Action=`powershell -windowstyle=hidden /path/to/ScreenTime`


NOTE: the color filters for windows should be enabled in the Windows settings in order for the AHK ctrl+win+C shortcut to work for Grayscale.

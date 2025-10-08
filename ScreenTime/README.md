A Screen time tool for Windows
---



The screentime tool:
- Makes the screen grayscale (requires AHKv2)
- Locks, logouts, or shutdowns the computer after an interval


It is configured right now to disallow usage from all hours except 7-9pm. Its current behavior is to first quickly lock the screen, then shutdown after 5 minutes. 

It opens a window in powershell which can be exited by the user.

This can be run in Task Scheduler for automation, eg Action=`powershell -windowstyle=hidden /path/to/ScreenTime`. Its best used with the "on workstation unlock" plus repeat for every "x" minutes. 


NOTE: the color filters for windows should be enabled in the Windows settings in order for the AHK ctrl+win+C shortcut to work for Grayscale.

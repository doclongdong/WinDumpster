## A Screen time tool for Windows
---

##### Lock or disable computer outside of a certain usage window (e.g., 6pm-10pm). Useful for self-control or controlling children's usage. 


### The screentime tool:
- Makes the screen grayscale (requires AHKv2) and/or creates notification, waits a few seconds (or however long), then
- Locks, logouts, and/or shutdowns the computer after an interval
- Does not track usage; only allows within (or disallows outside of) a pre-specified time interval.


It is configured right now to disallow usage from all hours except 7-9pm. Its current behavior is to first quickly lock the screen, then shutdown after 5 minutes. 

It opens a window in powershell which can be exited by the user.


### Requirements
- Powershell with execution policy set for the user
- Notifications: BurntToast `Install-Module -Name BurntToast`
- Grayscale: AutoHotkey V2


### Ways to automatically run it:

For all the following, the Action command in Task scheduler will be the first word of the command and the arguments will be the rest of the command. 

#### with grayscale

0. Run with open window: `powershell /path/to/Screentime.ps1`
1. Run with short popup:`powershell -windowstyle=hidden /path/to/Screentime.ps1`. This makes the window pop up briefly and then minimized to taskbar.

#### with grayscale sometimes not working
###### unfortunately using wscript sometimes these do not work all the time.

2. Run with brief popup, no minimized window: `powershell "wscript.exe /path/to/RunInvisible.vbs /path/to/Screentime.ps1"` This makes the window pop up briefly  but with no minimization to the taskbar. The powershell process must be stopped via Task Manager.
3. Run with no popup, no minimized window: `wscript.exe /path/to/RunInvisible.vbs /path/to/Screentime.ps1` . The process must be stopped via Task manager.



## Triggers with TaskScheduler

The most foolproof way to configure:
- "on workstation unlock" plus repeat for every x minutes
- "on logon" plus repeat for every x minutes


Then to test it, you can just lock your desktop Win+L and re-log in to test it. Note: testing directly via Task Scheduler "Run may or may not work so use this lock way to test it. 

An example task scheduler configuration is included with `ScreenTime-TaskScheduler.xml`. 



### Grayscale note
the color filters for windows should be enabled in the Windows settings in order for the AHK ctrl+win+C shortcut to work for Grayscale.

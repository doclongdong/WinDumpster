# WinDumpster

A bunch of random scripts and tools and such to improve the windows experience and make the computer work as you want it. Mostly original, some copy paste, some AI, works. 


### Index



#### Windows system fuckery fixes

| Script name(s) | Purpose | 
|----------------|---------|
| `DualBootClockSync` | A guide for resolving the dual boot clock issue on windows 10 |  
| `ChangeReadOnlyRecursive` | powershell scripts for remooving the `ReadOnly` attribute from troublesome Windows directories (when mismatch in names between FileExplorer and programs happens). |
| `MakeDiskWritable.md` | instructions for cmd prompt for making a functional disk that windows has borked as readonly usable as an actual disk | 
| `SyncDrives` | Sync one drive to another in windows using powershell,  because  using rsync on WSL is VERY slow if drives are mounted at /mnt/* | 
| `HeadlessChromeInstall.ps1` | Install chrome on a windows installation with no browser, using powershell; useful for de-bloated Win installs with no Edge browser |

#### Aesthetics

| Script name(s) | Purpose | 
|----------------|---------|
| `SystemFontChangerWin10-Registry` | Change the system font on Windows 10 with a registry value change, taken from WinAero docs| 
| `ToggleDesktopIcons` | Use autohotkey to turn on/off the desktop icons visibility. Requires autohotkey V2 |


#### Tools/Scripts for Frequent Reuse


| Script name(s) | Purpose | 
|----------------|---------|
| `Top.ps1` | A Windows 10 equivalent (ish) of the `top` command for unix systems | 
| `ScreenTime` | Enforce a "screen time"-like limit when run, including greyscale, and locks the screen after `i` seconds. For greyscale you need AutoHotkeyV2. Combine with TaskScheduler for automation. | 
| `ProgramLocker` | Alias an executable or command in a password-protecting fake locker,  as an exe | 


#### Random Stuff

| Script name(s) | Purpose | 
|----------------|---------|
| `MediaBlaster` | powershell script to launch a bunch of .url shortcuts in the default browser; configured for an example set of media, but works with any set of URLs | 
| `ICOFromPNG.ps1` | Single line command to convert a PNG to an ICO for Windows in high qualitiy with ImageMagick `7.x`  |

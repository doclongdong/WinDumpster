

This script creates an exe with a password protect wrapping any exe of your choosing.

The source exe remains unchanged. The protected exe is protected by a password. To prevent actors circumventing the protected exe, the source exe should be hidden or obscured.

It will provide a basic level of security from opening the source exe IF:
- the password protected exe is the most readily clickable/available  executable (e.g.  the one on your desktop or launcher)
- other methods of finding the source exe are difficult (e.g.,  it is removed from the start menu shortcuts)


# Requirements

- A relatively new powershell installation (>v5)
- PS2EXE callable via `ps2exe`  on command line


# Usage

- Use powershell to run `./CreateLock.ps1`
- Enter  the **non-quoted** path of your source exe
- Enter  the password to use to lock it
- Enter the  label for the output exe

That's it!


# Notes

- Yes this is obviously not a foolproof way to lock an app. It is more of a basic deterrent if you keep the icon or launcher in an easily accessed place.


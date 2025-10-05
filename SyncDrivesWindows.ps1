robocopy A:\ B:\ /MIR /XD "`$RECYCLE.BIN"

# Use this version if there are errors (eg some symlinks,  python venvs, random files that get locked as system)

robocopy A:\ B:\ /MIR /XD "`$RECYCLE.BIN" /R:0 /W:0
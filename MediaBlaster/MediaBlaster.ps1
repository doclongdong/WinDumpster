Set-Location -Path "C:\DocLongSystem\Runners\MediaBlast"
Get-ChildItem -Path "./Sources" -Filter *.url | ForEach-Object {
	    Start-Process $_.FullName
}

Set oShell = CreateObject ("Wscript.Shell") 

strPath = Wscript.ScriptFullName
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile(strPath)
strFolder = objFSO.GetParentFolderName(objFile) 

Dim NRun, Sh
Set Sh = CreateObject("Wscript.shell")
NRun = True
For Each ps In Getobject("winmgmts:\\.\root\cimv2:win32_process").instances_
If UCase(ps.name) = UCase("lantern202.exe") Then ps.terminate : NRun = False
Next

Dim strArgs
quo = """"
strArgs = quo & strFolder & "\Firefox.exe" & quo
oShell.Run strArgs, 0, false
strArgs = quo & strFolder & "\lantern202.exe" & quo
oShell.Run strArgs, 0, false




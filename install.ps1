$systemScriptFile = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
$scriptFile = "$PWD\find.ps1"

If (Test-Path($systemScriptFile)) {
    if ($null -ne (Select-String -Path $systemScriptFile -Pattern "function find {" -ErrorAction SilentlyContinue)){
        Write-Host "Die Erweiterung ist bereits installiert!"
    } else {
        Add-Content $systemScriptFile "`n"
        foreach ($line in Get-Content $scriptFile) {
            Add-Content $systemScriptFile $line
        } 
    }
} else {
    New-Item -Force $systemScriptFile
    Copy-Item $scriptFile $systemScriptFile -Recurse
}
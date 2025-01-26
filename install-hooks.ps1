$hookPath = ".git/hooks"

Copy-Item ".githooks/pre-commit.ps1" -Destination "$hookPath/pre-commit.ps1"

@"
#!/bin/sh
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".git/hooks/pre-commit.ps1"
exit
"@ | Out-File -FilePath "$hookPath/pre-commit" -Encoding ASCII -NoNewline
Write-Host "Git hooks har installerats!" -ForegroundColor Green
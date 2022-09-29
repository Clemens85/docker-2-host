$currentDir = Get-Location # Save for setting back later
Set-Location $PSScriptRoot

Set-Location ../service-a
.\mvnw.cmd clean package
docker build -t service-a .
Set-Location $currentDir

Set-Location ../service-b
.\mvnw.cmd clean package
docker build -t service-b .

Set-Location $currentDir

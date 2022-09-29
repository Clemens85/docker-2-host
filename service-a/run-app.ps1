$currentDir = Get-Location # Save for setting back later
Set-Location $PSScriptRoot

java -jar target/service-a-0.0.1.jar

Set-Location $currentDir
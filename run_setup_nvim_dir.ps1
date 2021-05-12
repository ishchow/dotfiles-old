$linkPath = "C:\Users\$($env:UserName)\AppData\Local\nvim"

if (-not $(Test-Path $linkPath))
{
    New-Item -ItemType Junction -Path $linkPath -Target "C:\Users\$($env:Username)\.config"
}

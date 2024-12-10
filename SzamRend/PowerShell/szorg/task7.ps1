param (
    [string]$Action,
    [string]$AppName
)

if ($Action -eq "start") {
    Start-Process -FilePath $AppName
    Write-Output "Started $AppName"
} elseif ($Action -eq "stop") {
    $process = Get-Process -Name $AppName -ErrorAction SilentlyContinue
    if ($process) {
        Stop-Process -Name $AppName -Force
        Write-Output "Stopped $AppName"
    } else {
        Write-Output "No process named $AppName is running."
    }
} else {
    Write-Output "Invalid action. Use 'start' or 'stop'."
}
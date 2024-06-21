#LOGS FUNCTIONS

function Save-Log {
    param (
        [string]$LogFilePath,
        [string]$Message,
        [string]$Severity = "INFO"
    )
    # Ensure the log file directory exists
    $logDir = Split-Path $LogFilePath
    if (-not (Test-Path $logDir)) {
        New-Item -Path $logDir -ItemType Directory -Force
    }
    # Get the current timestamp
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    # Format the log entry
    $logEntry = "{0} [{1}] - {2}" -f $timestamp, $Severity, $Message
    # Append the log entry to the log file
    Add-Content -Path $LogFilePath -Value $logEntry
}
$logFile = "C:\Logs\myScript.log"

Save-Log -LogFilePath $logFile -Message "Ready to download file"

#DOWNLOAD FILE
$fileUrl = "https://cdn.suwalls.com/wallpapers/funny/it-aint-easy-being-cheesy-27807-1920x1200.jpg"
$destinationPath = "C:\picture.jpg"
Invoke-WebRequest -Uri $fileUrl -OutFile $destinationPath
Write-Host "Download completed. File saved to $destinationPath"


Save-Log -LogFilePath $logFile -Message "File Downloaded"


#SET AS WALLPAPER
Function Set-WallPaper($Value)
 {
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
 }

Save-Log -LogFilePath $logFile -Message "Function declared"

Set-WallPaper -value "C:\picture.jpg"

Save-Log -LogFilePath $logFile -Message "All good"

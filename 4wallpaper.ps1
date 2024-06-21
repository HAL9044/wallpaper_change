# Define the path to your wallpaper image
$imagePath = "C:\item_extract\wallpaper_change-main\background.jpg"

function Set-Wallpaper {
    param (
        [string]$imagePath
    )

    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@
    $SPI_SETDESKWALLPAPER = 0x0014
    $SPIF_UPDATEINIFILE = 0x01
    $SPIF_SENDWININICHANGE = 0x02
    [Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $imagePath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDWININICHANGE)
}

# Check if the file exists
if (-Not (Test-Path $imagePath)) {
    Write-Host "Error: The file '$imagePath' does not exist."
    exit
}

# Set the wallpaper
Set-Wallpaper -imagePath $imagePath
Write-Host "Wallpaper set to '$imagePath'"

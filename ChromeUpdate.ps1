# Define the download URL, ZIP file path, and extraction path
$downloadUrl = "https://download-chromium.appspot.com/dl/Win_x64?type=snapshots"
$zipFile = "D:\chrome-win.zip"
$extractPath = "D:\chrome-win"

# Step 1: Download the ZIP file
Invoke-RestMethod -Uri $downloadUrl -OutFile $zipFile
Write-Host "Download completed: $zipFile"
# Define the paths for the ZIP file and extraction directory
$zipFile = "D:\chrome-win.zip"
$extractPath = "D:\chrome-win"

# Check if the extraction directory exists, and if it does, delete it
if (Test-Path $extractPath) {
    Write-Host "Directory exists. Removing existing chrome-win directory..."
    Remove-Item -Recurse -Force $extractPath
    Write-Host "Directory removed."
}

# Recreate the directory and extract the ZIP file
Write-Host "Extracting ZIP file to $extractPath..."
New-Item -ItemType Directory -Force -Path $extractPath
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipFile, $extractPath)
Write-Host "Extraction completed."

# Create a shortcut on the desktop
$desktop = [Environment]::GetFolderPath("Desktop")
$targetPath = "D:\chrome-win\chrome-win\chrome.exe"  # Adjust based on the extracted folder structure
$shortcutPath = Join-Path $desktop "Chrome Win.lnk"

# Create the shortcut
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($shortcutPath)

# Set properties for the shortcut
$shortcut.TargetPath = $targetPath
$shortcut.WorkingDirectory = "D:\chrome-win\chrome-win"
$shortcut.WindowStyle = 1
$shortcut.IconLocation = "$targetPath, 0"

# Save the shortcut
$shortcut.Save()
Write-Host "Shortcut created on Desktop: $shortcutPath"

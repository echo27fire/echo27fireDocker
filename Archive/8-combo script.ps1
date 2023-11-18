# Define the path where the scripts are located
$scriptPath = "C:\Github\windows-stuff-echo27fire\PowerShell Scripts\Wallpaper\Sorting"

# Define the scripts you want to run in sequence
$scripts = @(
    "1-Move-PortWalls.ps1",
    "2-Folder-Sync.ps1",
    "3-name by date.ps1",
    "4-name by cat.ps1",
    "5-sort by dimensions.ps1",
    "6-sort-port-height.ps1"
)

# Change the execution policy if needed (be careful with this line, especially in production environments)
# Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

# Iterate through the scripts and execute them in order
foreach ($script in $scripts) {
    $fullPath = Join-Path -Path $scriptPath -ChildPath $script
    if (Test-Path -Path $fullPath) {
        Write-Host "Running script $script..."
        . $fullPath
        Write-Host "$script executed successfully."
    }
    else {
        Write-Host "Script $script not found at $fullPath. Skipping..."
    }
}

# If needed, reset the execution policy to its original state
# Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope Process

Write-Host "All scripts executed."

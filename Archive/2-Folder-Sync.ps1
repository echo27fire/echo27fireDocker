# Define the source and destination directories
$sourceDirectory = "C:\Users\echo2\OneDrive\Pictures\Wallpapers"
$destinationDirectory = "C:\Users\echo2\OneDrive\Pictures\Wallpapers_Portrait"

# Check if the source directory exists
if (Test-Path -Path $sourceDirectory) {
    # Create the destination directory if it does not exist
    if (-Not (Test-Path -Path $destinationDirectory)) {
        New-Item -Path $destinationDirectory -ItemType Directory
    }

    # Iterate through the topmost subfolders in the source directory
    Get-ChildItem -Path $sourceDirectory -Directory | ForEach-Object {
        # Construct the destination path
        $destinationPath = Join-Path -Path $destinationDirectory -ChildPath $_.Name

        # Create the folder in the destination directory if it does not exist
        if (-Not (Test-Path -Path $destinationPath)) {
            New-Item -Path $destinationPath -ItemType Directory
        }
    }
} else {
    Write-Host "The source directory $sourceDirectory does not exist."
}

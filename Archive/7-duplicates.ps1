# Import the required module
Import-Module ImportExcel

function Process-Path {
    param (
        [string]$folderPath
    )

    # Path to the duplicates folder
    $duplicatesPath = Join-Path $folderPath 'duplicates'

    # Path to the Excel file
    $excelPath = 'C:\Users\echo2\OneDrive\Pictures\file_details.xlsx'

    # Create the duplicates directory if it does not exist
    if (!(Test-Path -Path $duplicatesPath)) {
        New-Item -Path $duplicatesPath -ItemType Directory
    }

    # Load existing Excel data or create an empty array
    $existingData = if (Test-Path -Path $excelPath) { Import-Excel $excelPath } else { @() }

    # Process new files and build updated Excel data
    $updatedData = @()
    Get-ChildItem -Path $folderPath -Recurse -File | ForEach-Object {
        $filePath = $_.FullName

        # Check if file already exists in Excel data
        $existingEntry = $existingData | Where-Object { $_.'File Path' -eq $filePath }

        if ($existingEntry) {
            # Keep existing entry if file still exists
            if (Test-Path -Path $filePath) {
                $updatedData += $existingEntry
            }
        } else {
            # Calculate MD5 and add new entry
            $hash = (Get-FileHash -Path $filePath -Algorithm MD5).Hash
            $updatedData += [PSCustomObject]@{
                'MD5 Checksum' = $hash
                'File Path'    = $filePath
            }
        }
    }

    # Save the updated Excel data
    $updatedData | Export-Excel -Path $excelPath

    # Code for finding and moving duplicates (as above)
    # ...
}

# Paths to process
$paths = @(
    'C:\Users\echo2\OneDrive\Pictures\Wallpapers',
    'C:\Users\echo2\OneDrive\Pictures\Wallpapers_Portrait'
)

# Process each path
foreach ($path in $paths) {
    Process-Path -folderPath $path
}

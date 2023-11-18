# Paths to the directories
$directoryPaths = "C:\Users\echo2\OneDrive\Pictures\Wallpapers", "C:\Users\echo2\OneDrive\Pictures\Wallpapers_Portrait"

# Initialize a counter
$counter = 0

foreach ($directoryPath in $directoryPaths) {
    # Get all files in the directory, sorted by creation time
    $files = Get-ChildItem -Path $directoryPath -Recurse -File | Sort-Object CreationTime

    # Loop through each file
    foreach ($file in $files) {
        # Check if the file starts with a 5-digit prefix
        if ($file.Name -notmatch '^\d{5}') {
            # Generate a new filename with the counter, padded to 5 digits
            $newFileName = "{0:D5}{1}" -f $counter, [System.IO.Path]::GetExtension($file.Name)

            # Combine the new filename with the original directory to get the full new path
            $newFilePath = Join-Path -Path $file.DirectoryName -ChildPath $newFileName

            # Check if the file with the new name already exists
            while (Test-Path -Path $newFilePath) {
                # Increment the counter and regenerate the new filename if the file already exists
                $counter++
                $newFileName = "{0:D5}{1}" -f $counter, [System.IO.Path]::GetExtension($file.Name)
                $newFilePath = Join-Path -Path $file.DirectoryName -ChildPath $newFileName
            }

            # Rename the file
            Rename-Item -Path $file.FullName -NewName $newFilePath -Force

            # Increment the counter
            $counter++
        }
    }
}

Write-Host "Renaming completed."

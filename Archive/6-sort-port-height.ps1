# Specify the root directory
$rootPath = "C:\Users\echo2\OneDrive\Pictures\Wallpapers_Portrait"
$excludePath = "C:\Users\echo2\OneDrive\Pictures\Wallpapers\Random Anime, Games, Moves, and Other"

# Iterate through immediate subdirectories of the root path
Get-ChildItem -Path $rootPath -Directory | Where-Object { $_.FullName -ne $excludePath } | ForEach-Object {
    $subFolder = $_.FullName

    # Get all image files within the subfolder
    $images = Get-ChildItem -Path $subFolder -File | Where-Object { $_.Extension -match '\.(jpg|jpeg|png|gif|bmp)' }

    # Process images and move to corresponding height folder if necessary
    $images | ForEach-Object {
        $imagePath = $_.FullName
        $image = [System.Drawing.Image]::FromFile($imagePath)
        $height = $image.Height
        $image.Dispose()

        # Determine if the image is already in the correct folder (by folder name)
        $currentFolderName = [System.IO.Path]::GetFileName([System.IO.Path]::GetDirectoryName($imagePath))
        if ($currentFolderName -ne $height.ToString()) {
            # Create the target folder under the current subfolder if it doesn't exist
            $targetFolder = Join-Path -Path $subFolder -ChildPath $height
            if (-Not (Test-Path -Path $targetFolder)) {
                New-Item -Path $targetFolder -ItemType Directory | Out-Null
            }

            # Move the image to the correct folder
            Move-Item -Path $imagePath -Destination $targetFolder
            Write-Host ("Moved {0} to {1}" -f $imagePath, $targetFolder)
        }
    }
}

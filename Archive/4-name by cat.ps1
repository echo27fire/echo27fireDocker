$mainFolderPaths = "C:\Users\echo2\OneDrive\Pictures\Wallpapers", "C:\Users\echo2\OneDrive\Pictures\Wallpapers_Portrait"
$specialFolderPath = "C:\Users\echo2\OneDrive\Pictures\Wallpapers\Random Anime, Games, Movies, and Other"

function Rename-FilesWithParentSubfolderName {
    param (
        [string]$path,
        [string]$additionalSuffix
    )

    $subfolders = Get-ChildItem -Path $path -Directory

    foreach ($subfolder in $subfolders) {
        $files = Get-ChildItem -Path $subfolder.FullName -File

        foreach ($file in $files) {
            # Determine the suffix based on the specific paths and conditions
            if ($subfolder.FullName -eq $specialFolderPath) {
                $suffix = $subfolder.Name
            } elseif ($subfolder.Parent -ne $null) {
                $suffix = $subfolder.Parent.Name
            } else {
                $suffix = $subfolder.Name
            }

            # If the filename already contains the category name, skip renaming
            if ($file.Name -like "*$suffix*") {
                continue
            }

            # Extract the first five-digit prefix
            $prefix = $file.BaseName -replace '^(\d{5}).*','$1'

            # Construct the new filename using the prefix, category suffix, and any additional suffix
            $newFileName = $prefix + "_" + $suffix + $additionalSuffix + $file.Extension

            Rename-Item -Path $file.FullName -NewName $newFileName
        }

        # Recursive call for subfolders
        Rename-FilesWithParentSubfolderName -path $subfolder.FullName -additionalSuffix $additionalSuffix
    }
}

foreach ($mainFolderPath in $mainFolderPaths) {
    # Apply additional "_portrait" suffix for the specific path
    $additionalSuffix = if ($mainFolderPath -like "*Wallpapers_Portrait") { "_portrait" } else { "" }

    Rename-FilesWithParentSubfolderName -path $mainFolderPath -additionalSuffix $additionalSuffix
}

# Additional call for the special folder
Rename-FilesWithParentSubfolderName -path $specialFolderPath -additionalSuffix ""

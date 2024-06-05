$folders = Get-ChildItem -Directory

foreach ($folder in $folders) {
    $size = Get-ChildItem $folder.FullName -Recurse | Measure-Object -Property Length -Sum
    $sizeInBytes = $size.Sum
    $sizeReadable = if ($sizeInBytes -ge 1TB) {
        "{0:N2} TB" -f ($sizeInBytes / 1TB)
    } elseif ($sizeInBytes -ge 1GB) {
        "{0:N2} GB" -f ($sizeInBytes / 1GB)
    } elseif ($sizeInBytes -ge 1MB) {
        "{0:N2} MB" -f ($sizeInBytes / 1MB)
    } elseif ($sizeInBytes -ge 1KB) {
        "{0:N2} KB" -f ($sizeInBytes / 1KB)
    } else {
        "{0:N2} bytes" -f $sizeInBytes
    }
    Write-Output "$($folder.Name): $($sizeReadable)"
}

pause
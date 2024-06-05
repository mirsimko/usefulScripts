$folders = Get-ChildItem -Directory

foreach ($folder in $folders) {
    $size = Get-ChildItem $folder.FullName -Recurse | Measure-Object -Property Length -Sum
    $sizeInKB = $size.Sum / 1KB
    Write-Output "$($folder.Name): $($sizeInKB.ToString("N2")) KB"
}

pause
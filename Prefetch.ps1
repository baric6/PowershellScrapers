$sourceFolder = "C:\Windows\Prefetch"
$destinationFolder = "<where you want to put the files>"

$prefetchFiles = Get-ChildItem -Path $sourceFolder -Filter "*.pf" -Recurse

foreach ($file in $prefetchFiles) {
    $prefetchInfo = Get-ItemProperty -Path $file.FullName -ErrorAction SilentlyContinue
    if ($prefetchInfo) {
        Write-Host "Copying Prefetch File: $($file.Name)"
        Write-Host "Size: $($prefetchInfo.Length) bytes"
        Write-Host "Creation Time: $($prefetchInfo.CreationTime)"
        Write-Host "Last Access Time: $($prefetchInfo.LastAccessTime)"
        Write-Host "Last Write Time: $($prefetchInfo.LastWriteTime)"
        Write-Host "----------------------------------------"

        $destinationPath = Join-Path $destinationFolder $file.Name
        Copy-Item -Path $file.FullName -Destination $destinationPath -Force
    }
}


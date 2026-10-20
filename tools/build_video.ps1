$ErrorActionPreference = "Stop"

$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$videoRoot = Join-Path $root "work"
$partDir = Join-Path $videoRoot "parts"
$output = Join-Path $root "media\Rajaraman_Wong_Algorithm_Teaching_Video.mp4"
$meta = Get-Content -Raw -Encoding UTF8 (Join-Path $PSScriptRoot "meta.json") | ConvertFrom-Json
$ffmpegCommand = Get-Command ffmpeg -ErrorAction Stop
$ffmpeg = $ffmpegCommand.Source

New-Item -ItemType Directory -Force -Path $partDir | Out-Null
New-Item -ItemType Directory -Force -Path (Split-Path $output) | Out-Null

$parts = @()
foreach ($scene in $meta) {
    $slide = Join-Path $root ("slides\" + $scene.id + ".png")
    $audio = Join-Path $root ("audio\" + $scene.id + ".mp3")
    $part = Join-Path $partDir ($scene.id + ".mp4")

    & $ffmpeg -hide_banner -loglevel error -y `
        -loop 1 -framerate 30 -i $slide `
        -i $audio `
        -vf "format=yuv420p" `
        -c:v libx264 -preset veryfast -crf 21 -r 30 -g 60 `
        -c:a aac -b:a 160k -ar 24000 -ac 2 `
        -af "apad=pad_dur=0.7" `
        -shortest -movflags +faststart $part

    if ($LASTEXITCODE -ne 0) {
        throw "Failed to encode $($scene.id)"
    }
    $parts += $part
}

$concatFile = Join-Path $videoRoot "concat.txt"
$concatLines = foreach ($part in $parts) {
    "file '" + ($part -replace "\\", "/") + "'"
}
[System.IO.File]::WriteAllLines(
    $concatFile,
    $concatLines,
    [System.Text.UTF8Encoding]::new($false)
)

& $ffmpeg -hide_banner -loglevel error -y `
    -f concat -safe 0 -i $concatFile `
    -c copy -movflags +faststart $output

if ($LASTEXITCODE -ne 0) {
    throw "Failed to concatenate video parts"
}

Get-Item $output | Select-Object FullName, Length, LastWriteTime

<# ##############
## Goals : Convert everything to A format usable by my devices:
## Apple TV 4 (H.264 video up to 1080p, 60 frames per second, High or Main Profile level 4.2 or lower)
## Roku 3
## iPad 2nd Gen
## iPhone 5
## iPhone 6plus
## xBox One
## Samsung Galaxy Tablet
## Amazon Fire Tablet
##
## Extention: .mp4
## Codec : h.264
## Profile: High Profile 4.0
## Encoder: X264
## Framerate:
## Preset: Slow (take extra time to encode, medium is default)
## Quality: Constant Quality 20 (2 more than handbrake)
## Picture Size: Anamorphic: Strict
## Web Optimized: Yes (Also known as "Fast Start")
##################>


﻿Set-ExecutionPolicy Unrestricted
clear

$filelist = Get-ChildItem "V:\Videos\Television\Family and Cartoon\Looney Tunes\" -filter *.avi -recurse

$to_delete_foler = "V:\ToDelete\"

$i = 0
$n = 0
$x = 0
ForEach ($file in $filelist)
{
    $i++
    $oldfile = $file.DirectoryName + "\" + $file.BaseName + $file.Extension
    $newfile = $file.DirectoryName + "\" + $file.BaseName + ".m4v"
    $newfile2 = $file.DirectoryName + "\" + $file.BaseName + ".mp4"
    write-host $oldfile

    Remove-Item $oldfile -Force

    if (Test-Path $newfile2) {
        $x++
        write-host $newfile2
    }

    if (Test-Path $newfile) {
        $n++
    }
    else {

        #write-host $newfile
        #Start-Process .\HandBrakeCLI -ArgumentList "-i `"$oldfile`" -o `"$newfile`" --preset=`"LooneyTunesDecomb`"" -Wait -NoNewWindow
    }
}

write-host "Number of old files: " $i
write-host "Number of m4v files: " $n
write-host "Number of mp4 files: " $x


<#
$oldfile = "V:\Videos\Television\Family and Cartoon\Looney Tunes\Season 1955\Looney Tunes - S1955E01 - Pizzicato Pussycat.avi"
$newfile = "V:\Videos\Television\Family and Cartoon\Looney Tunes\Season 1955\Looney Tunes - S1955E01 - Pizzicato Pussycat.m4v"

cd "C:\Program Files\HandBrake\"
.\HandBrakeCLI.exe -h
Start-Process .\HandBrakeCLI -ArgumentList "-i `"$oldfile`" -o `"$newfile`" --preset=`"Looney Tunes`"" -Wait -NoNewWindow

#>

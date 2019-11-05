Param($after_letter)

# Get current drive letter of CD-ROM drive
$before_letter = (Get-Volume | ?{$_.DriveType -match 'CD-ROM'}).driveletter

# Get current drive number of CD-ROM drive
Write-Output "list volume" | DiskPart | ?{$_ -match ("Volume[ ]{1}(?<volume>\d)[ ]*"+ $before_letter)} | Out-Null
$volume = $Matches["volume"]

# Set new drive letter provided by argument
Write-Output ("select volume {0}`nassign letter={1}" -f $volume, $after_letter) | DiskPart | Out-Null

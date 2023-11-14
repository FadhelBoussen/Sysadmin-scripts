$installed1 = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Select-Object DisplayName, Publisher, Version, InstallDate |
    Sort-Object -Property InstallDate -Descending

$installed2 = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Select-Object DisplayName, Publisher, Version, InstallDate |
    Sort-Object -Property InstallDate -Descending


$allInstalledPrograms = $installed1 + $installed2


$allInstalledPrograms | Format-Table -AutoSize


$allInstalledPrograms | Export-Csv -Path "C:\users\fadhel.boussen\documents\AllInstalledPrograms.csv" -NoTypeInformation

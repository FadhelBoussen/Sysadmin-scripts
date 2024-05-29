$programName = "Trend Micro Apex One Security Agent"

$program = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq $programName}

if ($program) {
    
    $uninstallResult = $program.Uninstall()

    
    if ($uninstallResult.ReturnValue -eq 0) {
        Write-Host "Le programme $($program.Name) a été désinstallé avec succès."
    } else {
        Write-Host "Une erreur s'est produite lors de la désinstallation du programme $($program.Name). Code d'erreur : $($uninstallResult.ReturnValue)"
    }
} else {
    Write-Host "Le programme $($programName) n'a pas été trouvé sur cet ordinateur."
}

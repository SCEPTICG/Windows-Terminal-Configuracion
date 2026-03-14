
# fastfetch
fastfetch

# oh-my-posh spaceship.omp.json
oh-my-posh init pwsh --config "$PSScriptRoot\spaceship.omp.json" | Invoke-Expression

# zoxide
Invoke-Expression (& {zoxide init powershell | Out-String})

# alias y Visualización
Import-Module Terminal-Icons
function ls { eza --icons --group-directories-first $args }
Set-Alias -Name cat -Value bat

# autocompletado del historial
Set-PSReadLineOption -PredictionSource History
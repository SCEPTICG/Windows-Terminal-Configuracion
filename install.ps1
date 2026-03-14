Write-Host "--- Iniciando Instalación Todoterreno ---" -ForegroundColor Cyan

# Instalar programas
Write-Host "> Instalando aplicaciones..."
winget install JanDeDobbeleer.OhMyPosh -s winget --accept-package-agreements
winget install ajeetdsouza.zoxide eza sharkdp.bat fastfetch GitHub.NerdFonts.CascadiaCode --accept-package-agreements

# Crear carpeta de perfil
$ProfileDir = Split-Path $PROFILE
if (!(Test-Path $ProfileDir)) { New-Item -ItemType Directory -Path $ProfileDir -Force }

# Descargar archivos desde TU repositorio de GitHub
Write-Host "> Descargando archivos de configuración..."
$BaseUrl = "https://raw.githubusercontent.com/SCEPTICG/Windows-Terminal-Configuracion/main"
Invoke-WebRequest -Uri "$BaseUrl/Microsoft.PowerShell_profile.ps1" -OutFile $PROFILE
Invoke-WebRequest -Uri "$BaseUrl/spaceship.omp.json" -OutFile "$ProfileDir\spaceship.omp.json"

Write-Host "--- Instalación Completa. Reinicia la Terminal ---" -ForegroundColor Green

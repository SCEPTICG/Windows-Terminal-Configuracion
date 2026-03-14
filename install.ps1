Write-Host "--- Iniciando Instalacion Todoterreno ---" -ForegroundColor Cyan

# 1. Instalar aplicaciones
Write-Host "> Instalando aplicaciones..." -ForegroundColor Yellow
winget install JanDeDobbeleer.OhMyPosh -s winget --accept-package-agreements
winget install ajeetdsouza.zoxide eza sharkdp.bat fastfetch --accept-package-agreements

# 2. Instalar la fuente (ID actualizado y mas fiable)
Write-Host "> Instalando Nerd Font..." -ForegroundColor Yellow
winget install --id Microsoft.CascadiaCode --accept-package-agreements

# 3. Crear carpeta de perfil si no existe
$ProfileDir = Split-Path $PROFILE
if (!(Test-Path $ProfileDir)) { New-Item -ItemType Directory -Path $ProfileDir -Force }

# 4. Descargar archivos desde TU repositorio de GitHub
Write-Host "> Descargando configuraciones desde GitHub..." -ForegroundColor Yellow
$BaseUrl = "https://raw.githubusercontent.com/SCEPTICG/Windows-Terminal-Configuracion/main"

Invoke-WebRequest -Uri "$BaseUrl/Microsoft.PowerShell_profile.ps1" -OutFile $PROFILE
Invoke-WebRequest -Uri "$BaseUrl/spaceship.omp.json" -OutFile "$ProfileDir\spaceship.omp.json"

Write-Host "--- Instalacion Completa. Reinicia la Terminal ---" -ForegroundColor Green
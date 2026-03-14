Write-Host "--- Iniciando Instalacion Todoterreno ---" -ForegroundColor Cyan

# 1. Instalar aplicaciones de sistema
Write-Host "> Instalando aplicaciones de sistema..." -ForegroundColor Yellow
winget install JanDeDobbeleer.OhMyPosh -s winget --accept-package-agreements
winget install ajeetdsouza.zoxide eza sharkdp.bat fastfetch --accept-package-agreements

# 2. Instalar la fuente (ID oficial corregido)
Write-Host "> Instalando Nerd Font..." -ForegroundColor Yellow
winget install --id Microsoft.CascadiaCode --accept-package-agreements

# 3. Instalar módulos de PowerShell
Write-Host "> Instalando modulos de iconos..." -ForegroundColor Yellow
Install-Module -Name Terminal-Icons -Repository PSGallery -Force -Scope CurrentUser

# 4. Configurar carpetas y descargar archivos de GitHub
$ProfileDir = Split-Path $PROFILE
if (!(Test-Path $ProfileDir)) { New-Item -ItemType Directory -Path $ProfileDir -Force }

$BaseUrl = "https://raw.githubusercontent.com/SCEPTICG/Windows-Terminal-Configuracion/main"
Invoke-WebRequest -Uri "$BaseUrl/Microsoft.PowerShell_profile.ps1" -OutFile $PROFILE
Invoke-WebRequest -Uri "$BaseUrl/spaceship.omp.json" -OutFile "$ProfileDir\spaceship.omp.json"

Write-Host "--- Instalacion Completa. Reinicia la Terminal ---" -ForegroundColor Green
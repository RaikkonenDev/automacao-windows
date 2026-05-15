# ==========================================
# SCRIPT PÓS-FORMATAÇÃO
# Instala Winget + Chrome + AnyDesk + Office
# ==========================================

# EXECUTAR COMO ADMINISTRADOR

Set-ExecutionPolicy Bypass -Scope Process -Force

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Write-Host ""
Write-Host "====================================="
Write-Host " INICIANDO CONFIGURACAO DO WINDOWS"
Write-Host "====================================="
Write-Host ""

# ==========================================
# VERIFICA SE WINGET EXISTE
# ==========================================

$winget = Get-Command winget -ErrorAction SilentlyContinue

if (-not $winget) {

    Write-Host "Winget nao encontrado."
    Write-Host "Baixando App Installer..."

    $temp = "$env:TEMP\AppInstaller.msixbundle"

    Invoke-WebRequest `
    -Uri "https://aka.ms/getwinget" `
    -OutFile $temp

    Write-Host "Instalando Winget..."

    Add-AppxPackage -Path $temp

    Write-Host "Winget instalado."

    Start-Sleep -Seconds 5
}
else {
    Write-Host "Winget ja instalado."
}

# ==========================================
# ATUALIZA SOURCES
# ==========================================

winget source update

# ==========================================
# INSTALACOES
# ==========================================

Write-Host ""
Write-Host "Instalando Google Chrome..."
winget install --id Google.Chrome -e --silent --accept-package-agreements --accept-source-agreements

Write-Host ""
Write-Host "Instalando AnyDesk..."
winget install --id AnyDeskSoftwareGmbH.AnyDesk -e --silent --accept-package-agreements --accept-source-agreements

Write-Host ""
Write-Host "Instalando Microsoft Office..."
winget install --id Microsoft.Office -e --accept-package-agreements --accept-source-agreements

# ==========================================
# FINALIZACAO
# ==========================================

Write-Host ""
Write-Host "====================================="
Write-Host " TUDO INSTALADO COM SUCESSO "
Write-Host "====================================="
Write-Host ""

Pause

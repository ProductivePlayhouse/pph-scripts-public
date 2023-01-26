Write-Host "Making sure Chocolatey is installed..."
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/InstallChocolatey/InstallChocolatey.ps1'))

Write-Host "Installing OpenVPN..."
choco install -y openvpn

Write-Host "Installing Java 11..."
choco install -y temurin11jre

Write-Host "Installing OWASP ZAP..."
choco install -y zap
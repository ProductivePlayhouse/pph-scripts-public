Write-Host "Making sure Chocolatey is installed..."
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/InstallChocolatey/InstallChocolatey.ps1'))

Write-Host "Installing OpenVPN..."
choco install -y openvpn
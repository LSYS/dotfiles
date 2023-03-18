# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`


# Init lists of applications to install
$appsToInstall = (
    'miktex',
    'texstudio',
    'tree',
    'postgresql',
    'pgadmin4',
    'du',
    'invalidpackagename'
)

$failedInstalls = @()


# Install apps
foreach ($app in $appsToInstall) {
    Write-Host "~~~> Installing $app..."
    choco install $app -y
    Write-Host "Return code: $LASTEXITCODE"
    Write-Host "-----------------------------------------------------------------------"
    # If the installation failed, add it to the list of failed installations
    if ($LASTEXITCODE -eq 1) {
        $failedInstalls += $app
    }
}


# Display a summary of the installation process and any failed installations
Write-Host ""
Write-Host "Installation complete!"
if ($failedInstalls.Count -gt 0) {
    Write-Host "The following apps failed to install:"
    foreach ($failedInstall in $failedInstalls) {
        Write-Host $failedInstall
    }
} else {
    Write-Host "All apps installed successfully!"
}
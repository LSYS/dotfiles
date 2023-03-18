# To install winget manually, search windows app store for "winget" or "app installer"
Write-Output "===> Setting up winget package manager"
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Output "Winget is not installed, installing now..."
    Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.1.12653/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle -OutFile winget.appxbundle
    Add-AppxPackage .\winget.appxbundle
}
Write-Output "===> Installed winget package manager"


# Initialize list for logging
$installedApps = @()
$failedApps = @()
$existingApps = @()

#############################################################################
# Install utilities
#############################################################################
$_app = "MS PowerToys"
Write-Output "===> Installing $_app"
winget install Microsoft.PowerToys --source winget --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "notepads"
Write-Output "===> Installing $_app"
winget install "Notepads App" --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "QuickLook"
Write-Output "===> Installing $_app"
winget install --id=QL-Win.QuickLook -e --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "Adobe.Acrobat.Reader"
Write-Output "===> Installing $_app"
winget install --id=Adobe.Acrobat.Reader.64-bit -e --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "Slack"
Write-Output "===> Installing $_app"
winget install --id=SlackTechnologies.Slack -e --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "KeePass"
Write-Output "===> Installing $_app"
winget install --id=DominikReichl.KeePass -e --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "7zip"
Write-Output "===> Installing $_app"
winget install 7zip.7zip -source winget --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "Google.Chrome"
Write-Output "===> Installing $_app"
winget install Google.Chrome --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

#############################################################################
# Dev
#############################################################################
$_app = "invalidpackagename"
Write-Output "===> Installing $_app"
winget install nullexample --source winget --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "Git"
Write-Output "===> Installing $_app"
winget install Git.Git --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "GNUMake"
Write-Output "===> Installing $_app"
winget install GnuWin32.Make --source winget --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "VS Code"
Write-Output "===> Installing $_app"
winget install Microsoft.VisualStudioCode -e --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "SublimeText"
Write-Output "===> Installing $_app"
winget install --id=SublimeHQ.SublimeText.4 -e --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "WindowsTerminal"
Write-Output "===> Installing $_app"
winget install Microsoft.WindowsTerminal --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "OhMyPosh"
Write-Output "===> Installing $_app"
winget install JanDeDobbeleer.OhMyPosh -s winget --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
winget upgrade JanDeDobbeleer.OhMyPosh -s winget --accept-source-agreements
Write-Host "-----------------------------------------------------------------------"

#############################################################################
# Desktop
#############################################################################
$_app = "WinDynamicDesktop"
Write-Output "===> Installing $_app"
winget install --id=t1m0thyj.WinDynamicDesktop  -e --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"

$_app = "WinDynamicDesktop"
Write-Output "===> Installing $_app"
winget install --id=ModernFlyouts.ModernFlyouts -e --accept-source-agreements
Write-Output "Return code: $LASTEXITCODE"
if ($LASTEXITCODE -eq -1978335212) {
    $failedApps += $_app
    Write-Output "===> Failed: $_app"
} elseif ($LASTEXITCODE -eq -1978335189) {
    $existingApps += $_app
} elseif ($LASTEXITCODE -eq 0) {
    $installedApps += $_app
}
Write-Host "-----------------------------------------------------------------------"


#############################################################################
# Print list of logs
#############################################################################
if ($installedApps.Count -gt 0) {
    Write-Output "The following apps were installed:"
    foreach ($installedApps in $installedApps) {
        Write-Output "--> $installedApps"
    }
} 
Write-Host "-----------------------------------------------------------------------"

if ($existingApps.Count -gt 0) {
    Write-Output "The following apps were already installed:"
    foreach ($existingApps in $existingApps) {
        Write-Output "--> $existingApps"
    }
} 
Write-Host "-----------------------------------------------------------------------"

if ($failedApps.Count -gt 0) {
    Write-Output "The following apps failed to install:"
    foreach ($failedApp in $failedApps) {
        Write-Output "--> $failedApp"
    }
} else {
    Write-Output "All runs were successfully."
}

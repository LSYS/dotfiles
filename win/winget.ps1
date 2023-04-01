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
$utilities = @(
    @{
        name = "MS PowerToys"
        id = "Microsoft.PowerToys"
    },
    @{
        name = "notepads"
        id = "9NHL4NSC67WM"
    },
    @{
        name = "QuickLook"
        id = "QL-Win.QuickLook"
    },
    @{
        name = "Adobe.Acrobat.Reader"
        id = "Adobe.Acrobat.Reader.64-bit"
    },
    @{
        name = "Slack"
        id = "SlackTechnologies.Slack"
    },
    @{
        name = "KeePass"
        id = "DominikReichl.KeePass"
    },
    @{
        name = "7zip"
        id = "7zip.7zip"
    },
    @{
        name = "Google.Chrome"
        id = "Google.Chrome"
    }    
)

foreach ($app in $utilities) {
    Write-Output "===> Installing $($app.name)"
    winget install --id="$($app.id)" -e --accept-source-agreements
    Write-Output "Return code: $LASTEXITCODE"

    if ($LASTEXITCODE -eq -1978335212) {
        $failedApps += $app.name
        Write-Output "===> Failed: $($app.name)"
    } elseif ($LASTEXITCODE -eq -1978335189) {
        $existingApps += $app.name
    } elseif ($LASTEXITCODE -eq 0) {
        $installedApps += $app.name
    }
    Write-Host "-----------------------------------------------------------------------"
}


#############################################################################
# Dev
#############################################################################
$dev = @(
    @{
        name = "invalidpackagename"
        id = "invalidpackagename"
    },
    @{
        name = "Git"
        id = "Git.Git"
    },
    @{
        name = "GNUMake"
        id = "GnuWin32.Make"
    },
    @{
        name = "VS Code"
        id = "Microsoft.VisualStudioCode"
    },
    @{
        name = "SublimeText"
        id = "SublimeHQ.SublimeText.4"
    },
    @{
        name = "WindowsTerminal"
        id = "Microsoft.WindowsTerminal"
    },
    @{
        name = "OhMyPosh"
        id = "JanDeDobbeleer.OhMyPosh"
    }                                          
)

foreach ($app in $dev) {
    Write-Output "===> Installing $($app.name)"
    winget install --id="$($app.id)" -e --accept-source-agreements
    Write-Output "Return code: $LASTEXITCODE"

    if ($LASTEXITCODE -eq -1978335212) {
        $failedApps += $app.name
        Write-Output "===> Failed: $($app.name)"
    } elseif ($LASTEXITCODE -eq -1978335189) {
        $existingApps += $app.name
    } elseif ($LASTEXITCODE -eq 0) {
        $installedApps += $app.name
    }
    Write-Host "-----------------------------------------------------------------------"
}

#############################################################################
# Desktop
#############################################################################
$desktop = @(
    @{
        name = "WinDynamicDesktop"
        id = "t1m0thyj.WinDynamicDesktop"
    },
    @{
        name = "ModernFlyouts"
        id = "ModernFlyouts.ModernFlyouts"
    }
)

foreach ($app in $desktop) {
    Write-Output "===> Installing $($app.name)"
    winget install --id="$($app.id)" -e --accept-source-agreements
    Write-Output "Return code: $LASTEXITCODE"

    if ($LASTEXITCODE -eq -1978335212) {
        $failedApps += $app.name
        Write-Output "===> Failed: $($app.name)"
    } elseif ($LASTEXITCODE -eq -1978335189) {
        $existingApps += $app.name
    } elseif ($LASTEXITCODE -eq 0) {
        $installedApps += $app.name
    }
    Write-Host "-----------------------------------------------------------------------"
}

#############################################################################
# Print list of logs
#############################################################################
if ($installedApps.Count -gt 0) {
    Write-Output "The following apps were installed/upgraded:"
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

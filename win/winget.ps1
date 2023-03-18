# To install winget manually, search windows app store for "winget" or "app installer"
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Output "Winget is not installed, installing now..."
    Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.1.12653/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle -OutFile winget.appxbundle
    Add-AppxPackage .\winget.appxbundle
}

# Initialize list of failed apps
$failedApps = @()

# Install utilities
$utility_app = @("GNU.Make", "7zip.7zip", "notapackage", "anotherpackage")


try {

    } catch {
        
    }

$_app = "MS PowerToys"
Write-Output "===> Installing $_app"
try {
    winget install Microsoft.PowerToys --source winget
    } catch {
        $failedApps += "$_app"
        Write-Output "===> Failed: $_app"
    }

$_app = "Null example"
Write-Output "===> $_app"    
try {
    winget install shouldfail --source winget
    
    } catch {
        $failedApps += "$_app"
        Write-Output "===> Failed: $_app"
    }

# Write-Output "===> Installing 7zip"
# try {
#     winget install 7zip.7zip
#     } catch {
#         $failedApps += "7zip"
#         Write-Output "===> Failed: 7zip"
#     }    
  
# Write-Output "===> Installing notepads"
# try {
#     winget install "Notepads App"
#     } catch {
#         $failedApps += "notepads"
#         Write-Output "===> Failed: notepads"
#     }    
  
# Write-Output "===> Installing QuickLook"
# try {
#     winget install --id=QL-Win.QuickLook -e
#     } catch {
#         $failedApps += "QuickLook"
#         Write-Output "===> Failed: QuickLook"
#     }    
  
# Write-Output "===> Installing Adobe.Acrobat.Reader"
# try {
#     winget install --id=Adobe.Acrobat.Reader.64-bit -e
#     } catch {
#         $failedApps += "Adobe.Acrobat.Reader"
#         Write-Output "===> Failed: Adobe.Acrobat.Reader"
#     }    


# Write-Output "===> Installing Slack"
# try {
#     winget install --id=Adobe.Acrobat.Reader.64-bit -e
#     } catch {
#         $failedApps += "Slack"
#         Write-Output "===> Failed: Slack"
#     }    





# winget install --id=SlackTechnologies.Slack -e
# Write-Output "===> Installed Adobe Acrobat Reader"

# winget install --id=DominikReichl.KeePass -e
# Write-Output "===> Installed Adobe Acrobat Reader"







# # Dev
# winget install GnuWin32.Make

# winget install Git.Git
# Write-Output "===> Installed Adobe Acrobat Reader"

# winget install Microsoft.VisualStudioCode -e
# Write-Output "===> Installed Adobe Acrobat Reader"

# winget install --id=SublimeHQ.SublimeText.4 -e
# Write-Output "===> Installed Adobe Acrobat Reader"

# winget install Microsoft.WindowsTerminal
# Write-Output "===> Installed Adobe Acrobat Reader"



# winget install JanDeDobbeleer.OhMyPosh -s winget
# winget upgrade JanDeDobbeleer.OhMyPosh -s winget
# Write-Output "===> Installed Adobe Acrobat Reader"




# # Desktop
# winget install --id=t1m0thyj.WinDynamicDesktop  -e
# winget install --id=ModernFlyouts.ModernFlyouts -e
# Write-Output "===> Installed Adobe Acrobat Reader"


# # Print list of failed apps
# if ($failedApps.Count -gt 0) {
#     Write-Output "The following apps failed to install:"
#     foreach ($failedApp in $failedApps) {
#         Write-Output $failedApp
#     }
# } else {
#     Write-Output "All apps were installed successfully."
# }
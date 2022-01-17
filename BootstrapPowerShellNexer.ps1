
# Set-ExecutionPolicy Bypass -Scope Process -Force; ./BoostrapPowerShellNexer.ps1

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
# Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));

choco feature enable -n allowGlobalConfirmation
choco install vscode docker-desktop wireshark fiddler gsudo microsoft-windows-terminal autohotkey

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

$modulePath = [Environment]::GetEnvironmentVariable('PSModulePath', 'User')
$modulePath += ';\\wsl$\fedoraremix\home\johqva\home-env\gaming\powershell'
[Environment]::SetEnvironmentVariable('PSModulePath', $modulePath, 'User')

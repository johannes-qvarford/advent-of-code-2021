$exePath="~/Downloads/wsl_update_x64.msi"
Invoke-WebRequest https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile $exePath 
Invoke-Expression ($exePath)

wsl --set-default-version 2

Get-ItemProperty Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\*\ DistributionName | Where-Object -Property DistributionName -eq Fedora-33  | Set-ItemProperty -Name DefaultUid -Value 1000

# Not needed because this is done by default?
# wsl --install -d Ubuntu
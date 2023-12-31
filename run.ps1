# hi
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
& {$P = $env:TEMP + '\chromeremotedesktophost.msi'; Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $P; Start-Process $P -Wait; Remove-Item $P}
& {$P = $env:TEMP + '\chrome_installer.exe'; Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $P; Start-Process -FilePath $P -Args '/install' -Verb RunAs -Wait; Remove-Item $P}

$password = ConvertTo-SecureString 'P@ssw0rd.' -AsPlainText -Force
New-LocalUser "Admin" -Password $password
Add-LocalGroupMember -Group "Administrators" -Member "Admin"

& "${Env:PROGRAMFILES(X86)}\Google\Chrome Remote Desktop\CurrentVersion\remoting_start_host.exe" --code="4/0AfJohXkgFlTJ9jBCz1bGDZkN0u2qCAgWDT3VWYIXj5-exukdimMBqg7kh1MUVoiqPcU-CQ" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$Env:COMPUTERNAME -pin=123456

while ($true) {
    Write-Host "If That Is Working, Send Heart Or Star In Discord"
    
    Start-Sleep -Seconds 60 
}

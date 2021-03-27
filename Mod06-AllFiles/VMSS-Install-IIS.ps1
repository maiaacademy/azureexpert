# Install Web-Server
Add-WindowsFeature Web-Server

# Set Default HTM
Set-Content -Path "C:\inetpub\wwwroot\Default.htm" -Value "Azure Expert v1 is running $($env:computername)"

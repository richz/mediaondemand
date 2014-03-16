"C:\Windows\System32\inetsrv\appcmd.exe" delete app /app.name:"Default Web Site/MediaOnDemand"

"C:\Windows\System32\inetsrv\appcmd.exe" add app /site.name:"Default Web Site" /path:/MediaOnDemand /physicalPath:"C:\HostedWebsites\MediaOnDemandResponsive"
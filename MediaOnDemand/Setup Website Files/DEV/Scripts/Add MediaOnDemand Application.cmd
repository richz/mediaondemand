"C:\Windows\System32\inetsrv\appcmd.exe" delete app /app.name:"Default Web Site/MediaOnDemandDEV"

"C:\Windows\System32\inetsrv\appcmd.exe" add app /site.name:"Default Web Site" /path:/MediaOnDemandDEV /physicalPath:"C:\Projects\MediaOnDemand\MediaOnDemandResponsive"
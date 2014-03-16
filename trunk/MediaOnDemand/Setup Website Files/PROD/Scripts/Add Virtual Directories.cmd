SET NETWORKDRIVE="\\NETWORKDRIVE\USB_Storage"

SET virtualdir=mediafiles
"C:\Windows\System32\inetsrv\appcmd.exe" delete vdir /vdir.name:"Default Web Site/MediaOnDemand/%virtualdir%
echo "Add %virtualdir% virtual directory"
"C:\Windows\System32\inetsrv\appcmd.exe" add vdir /app.name:"Default Web Site/MediaOnDemand" /path:/%virtualdir% /physicalPath:%NETWORKDRIVE%\%virtualdir%

SET virtualdir=images/posters
"C:\Windows\System32\inetsrv\appcmd.exe" delete vdir /vdir.name:"Default Web Site/MediaOnDemand/%virtualdir%
echo "Add %virtualdir% virtual directory"
"C:\Windows\System32\inetsrv\appcmd.exe" add vdir /app.name:"Default Web Site/MediaOnDemand" /path:/%virtualdir% /physicalPath:%NETWORKDRIVE%\mediafiles\pictures\%virtualdir%

SET virtualdir=images/albumcovers
"C:\Windows\System32\inetsrv\appcmd.exe" delete vdir /vdir.name:"Default Web Site/MediaOnDemand/%virtualdir%
echo "Add %virtualdir% virtual directory"
"C:\Windows\System32\inetsrv\appcmd.exe" add vdir /app.name:"Default Web Site/MediaOnDemand" /path:/%virtualdir% /physicalPath:%NETWORKDRIVE%\mediafiles\pictures\%virtualdir%
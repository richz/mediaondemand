SET LOCAL="C:\Users\cpagu002\My Projects\Software Projects\Development\Personal\MediaOnDemand .NET 3.5\MediaOnDemand\bin\*.*"
SET TARGET="\\192.168.0.130\public\Media on Demand Update Files\bin"

XCOPY /E /Y %LOCAL% %TARGET%

CALL "C:\Users\cpagu002\My Projects\Software Projects\Development\Personal\MediaOnDemand .NET 3.5\Update MediaOnDemand Files\DeleteSVNFiles.bat"
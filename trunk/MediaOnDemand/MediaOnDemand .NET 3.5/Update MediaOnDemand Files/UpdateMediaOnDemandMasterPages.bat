SET LOCAL1="C:\Users\cpagu002\My Projects\Software Projects\Development\Personal\MediaOnDemand .NET 3.5\MediaOnDemand\*.Master"
SET LOCAL2="C:\Users\cpagu002\My Projects\Software Projects\Development\Personal\MediaOnDemand .NET 3.5\MediaOnDemand\*.Master.cs"

SET TARGET="\\192.168.0.130\public\Media on Demand Update Files"

XCOPY /E /Y %LOCAL1% %TARGET%
XCOPY /E /Y %LOCAL2% %TARGET%

CALL "C:\Users\cpagu002\My Projects\Software Projects\Development\Personal\MediaOnDemand .NET 3.5\Update MediaOnDemand Files\DeleteSVNFiles.bat"
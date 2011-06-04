SET LOCAL="C:\Users\cpagu002\My Projects\Software Projects\Development\Personal\MediaOnDemand .NET 3.5\MediaOnDemand\App_Data\*\"
SET TARGET="\\192.168.0.130\public\Media on Demand Update Files\App_Data"

XCOPY /E /Y %LOCAL% %TARGET%
@echo off
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
IF "%PROCESSOR_ARCHITECTURE%"=="x86" (set bit=x86) ELSE (set bit=x64)
IF "%bit%"=="x64" (goto: 64BIT) ELSE (goto: 32BIT)

:64BIT
cd /d %ProgramFiles%\Microsoft Office\Office16
GOTO: DIR

:32BIT
cd /d %ProgramFiles(x86)\Microsoft Office\Office16%
GOTO: DIR

:DIR
for /f %x in ('dir /b ..\root\Licenses16\ProPlus2021VL_KMS*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%x"
cscript ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH
cscript ospp.vbs /unpkey:BTDRB >nul
cscript ospp.vbs /unpkey:KHGM9 >nul
cscript ospp.vbs /unpkey:GPQVG >nul
cscript ospp.vbs /sethst:kms8.msguide.com
cscript ospp.vbs /setprt:1688
cscript ospp.vbs /act
exit

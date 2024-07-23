::@echo off
:: enable delayed expansion - used to resolve variable in loop
:: variable has to be used with '!' instead of '%'
setlocal ENABLEDELAYEDEXPANSION

::::::::::::::::::::::::::::::::::::::::::::
:: User Configuration
::::::::::::::::::::::::::::::::::::::::::::

:: adapt this path to your needs
set gptPath="N:\Programme\SNAP\esa_snap\bin\gpt.exe"

::::::::::::::::::::::::::::::::::::::::::::
:: Command line handling
::::::::::::::::::::::::::::::::::::::::::::

:: first parameter is a path to the graph xml
set graphXmlPath=D:\CommandLine_SNAP\LAI_S2B_10m_S210.xml

:: second parameter is a path to a parameter file
set parameterFilePath=D:\CommandLine_SNAP\resample_10m.properties

:: use third parameter for path to source products
set sourceDirectory=D:\CommandLine_SNAP\S2\BII\
:: if sourceDirectory ends with '\' remove it
if %sourceDirectory:~-1%==\ set sourceDirectory=%sourceDirectory:~0,-1%

:: use fourth parameter for path to target products
set targetDirectory=D:\CommandLine_SNAP\S2B_10m_S210_II\
:: if targetDirectory ends with '\' remove it
if %targetDirectory:~-1%==\ set targetDirectory=%targetDirectory:~0,-1%

:: the fifth parameter is a file prefix for the target product name, 
:: typically indicating the type of processing
set targetFilePrefix=!LAI

:: Create the target directory
md %targetDirectory%

::::::::::::::::::::::::::::::::::::::::::::
:: Main processing
::::::::::::::::::::::::::::::::::::::::::::

:: double '%' in batch file and only a single '%' on command line
:: '/D' is for directories like Sentinel data. Remove '/D' when you open files.
:: '/R' <directory> specifies the directory which the loop will walk recursively.
:: Iterating over *.nc files within the source directory can be done simpler:
::    for %%F in (%sourceDirectory%\*.nc) do (
for /D /R %sourceDirectory% %%F in (S2*.SAFE) do (
  echo.
  :: '~fF' means absolute path of 'F'
  set sourceFile=%%~fF
  echo Processing !sourceFile!
  :: '~nF' means filename without extension of 'F'
  set targetFile=%targetDirectory%\%%~nF.dim
  set procCmd=%gptPath% %graphXmlPath% -e -p %parameterFilePath% -t "!targetFile!" "!sourceFile!"
  call !procCmd! 
)

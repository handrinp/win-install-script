@echo off

:checkPermissions
  echo Administrative permissions required. Detecting permissions...
  net session >nul 2>&1
  if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    goto start
  ) else (
    echo Failure: Current permissions inadequate.
    goto end
  )

:start
  echo.
  set /p installPrograms=Do you want to install these programs (Y/N)?
  if '%installPrograms%' == 'y' set willInstallPrograms=true
  if '%installPrograms%' == 'Y' set willInstallPrograms=true
  @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
  if not '%willInstallPrograms%' == 'true' (
    pause
    exit
  )

:install

:drivers
  choco install geforce-experience -y
  choco install logitechgaming -y
  choco install realtek-hd-audio-driver -y

:essentials
  choco install firefox -y
  choco install vlc -y
  choco install 7zip -y
  choco install silverlight -y
  choco install sumatrapdf -y
  choco install libreoffice -y

:tools
  choco install gpu-z -y
  choco install cpu-z -y
  choco install mumble -y
  choco install notepadplusplus -y
  choco install gimp -y
  choco install f.lux -y
  choco install audacity -y

:programming-languages
  choco install jdk8 -y
  choco install python -y
  choco install mongodb -y
  choco install ruby -y
  choco install golang -y

:programming-tools
  choco install eclipse -y
  choco install git -y
  choco install tortoisegit -y
  choco install unity -y
  choco install npm -y
  choco install nodejs -y
  choco install filezilla -y
  choco install miktex -y

:media
  choco install deluge -y
  choco install fraps -y
  choco install blender -y
  choco install steam -y

:cancel
  echo Cancelled
  goto end

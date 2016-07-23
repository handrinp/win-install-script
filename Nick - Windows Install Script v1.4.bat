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
  if not '%willInstallPrograms%' == 'true' goto cancel
  set /p installGeforce=Do you want to install GeForce Experience (Y/N)?
  if '%installGeforce%' == 'y' set willInstallGeforce=true
  if '%installGeforce%' == 'Y' set willInstallGeforce=true
  if '%willInstallGeforce%' == 'true' goto geforce
  goto install

:cancel
  echo Cancelled
  goto end

:geforce
  cinst geforce-experience -y
  goto install

:install
  cinst fraps -y
  cinst logitechgaming -y
  cinst unity -y
  cinst realtek-hd-audio-driver -y
  cinst notepadplusplus -y
  cinst firefox -y
  cinst gpu-z -y
  cinst cpu-z -y
  cinst deluge -y
  cinst blender -y
  cinst silverlight -y
  cinst vlc -y
  cinst golang -y
  cinst sumatrapdf -y
  cinst jdk8 -y
  cinst eclipse -y
  cinst ruby -y
  cinst python -y
  cinst steam -y
  cinst libreoffice -y
  cinst gimp -y
  cinst audacity -y
  cinst mumble -y
  cinst spotify -y
  cinst winrar -y
  cinst cygwin -y
  cinst git -y
  cinst npm -y
  cinst tortoisegit -y
  cinst miktex -y
  goto end

:end
  pause
  exit
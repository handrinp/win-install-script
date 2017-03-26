@echo off

:checkPermissions
  echo Administrative permissions required. Detecting permissions...
  net session >nul 2>&1
  
  if %errorLevel% == 0
  (
    echo Success: Administrative permissions confirmed.
    goto start
  )
  
  else
  (
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
  cinst firefox -y
  cinst vlc -y
  cinst steam -y
  cinst realtek-hd-audio-driver -y
  cinst qbittorrent -y
  cinst jdk8 -y
  cinst gimp -y
  cinst mumble -y
  cinst winrar -y
  goto end

:end
  pause
  exit

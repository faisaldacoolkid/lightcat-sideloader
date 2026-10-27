; Build the app first: flutter build windows
; Then: ISCC installer\lightcat.iss
; Override paths with /DToolsDir=... or /DMyAppVersion=...

#define MyAppName "Lightcat Sideloader"
#ifndef MyAppVersion
  #define MyAppVersion "1.0.0"
#endif
#define MyAppPublisher "faisaldacoolkid"
#define MyAppURL "https://github.com/faisaldacoolkid/lightcat-sideloader"
#define MyAppExe "lightcat_sideloader.exe"
#define BuildDir "..\build\windows\x64\runner\Release"
#ifndef ToolsDir
  #define ToolsDir "C:\src"
#endif

#if !FileExists(BuildDir + "\" + MyAppExe)
  #error "Release build not found. Run flutter build windows first."
#endif
#if !FileExists(ToolsDir + "\platform-tools\adb.exe")
  #error "platform-tools\adb.exe not found in ToolsDir"
#endif
#if !FileExists(ToolsDir + "\scrcpy\scrcpy.exe")
  #error "scrcpy\scrcpy.exe not found in ToolsDir"
#endif

[Setup]
AppId={{8BFD4C9E-9B29-4079-9761-5692290F998B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}/issues
AppUpdatesURL={#MyAppURL}/releases
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
MinVersion=10.0
LicenseFile=..\LICENSE
SetupIconFile=..\windows\runner\resources\app_icon.ico
UninstallDisplayIcon={app}\{#MyAppExe}
UninstallDisplayName={#MyAppName}
OutputDir=..\build\installer
OutputBaseFilename=LightcatSetup-{#MyAppVersion}
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
CloseApplications=force
RestartApplications=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "{#BuildDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ToolsDir}\platform-tools\adb.exe"; DestDir: "{app}\platform-tools"; Flags: ignoreversion
Source: "{#ToolsDir}\platform-tools\AdbWinApi.dll"; DestDir: "{app}\platform-tools"; Flags: ignoreversion
Source: "{#ToolsDir}\platform-tools\AdbWinUsbApi.dll"; DestDir: "{app}\platform-tools"; Flags: ignoreversion
Source: "{#ToolsDir}\platform-tools\NOTICE.txt"; DestDir: "{app}\platform-tools"; Flags: ignoreversion
Source: "{#ToolsDir}\scrcpy\*"; DestDir: "{app}\scrcpy"; Excludes: "adb.exe,AdbWinApi.dll,AdbWinUsbApi.dll,*.bat,*.vbs"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExe}"; AppUserModelID: "{#MyAppName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExe}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExe}"; Description: "{cm:LaunchProgram,{#MyAppName}}"; Flags: nowait postinstall skipifsilent
Filename: "{app}\{#MyAppExe}"; Flags: nowait; Check: WizardSilent

[UninstallRun]
Filename: "{app}\platform-tools\adb.exe"; Parameters: "kill-server"; Flags: runhidden; RunOnceId: "KillAdb"

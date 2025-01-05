; =============================================================================
; Inno Setup script for legacy games installation
;
;   * Unreal Gold
;   * Unreal Tournament
;
; Version:    1.0
; Author:     Jan Urbansky
; Date:       12/15/2024
; Copyright:  (c) 2024, EGO-CREATIONS

#define AppGroupName "OldUnreal"
#define AppName AppGroupName + " Community Installer"
#define AppPrefix "Unreal"
#define AppEdName "UnrealEd"
#define AppVersion "1.0"
#define AppPublisher "OldUnreal.com"
#define AppURL "http://www.oldunreal.com/"
#define AppExeName "UnrealTournament.exe"
#define AppEdExeName "UnrealEd.exe"
#define AppId "{{94206198-BAB5-407E-868F-F1A4532951C2}"

#define DownloadUTPatchURL  "https://api.github.com/repos/OldUnreal/UnrealTournamentPatches/releases/latest"
#define DownloadUTGameURL   "https://archive.org/download/ut-goty"
#define UTGameISO           "UT_GOTY_CD1.iso"
#define UTGameISOtwo        "UT_GOTY_CD2.iso"

#define DownloadUPatchURL   "https://api.github.com/repos/OldUnreal/Unreal-testing/releases/tags/v227k_12"
#define DownloadUnrealURL   "https://archive.org/download/gt-unreal-1998"
#define DownloadUGoldURL    "https://archive.org/download/totallyunreal"
#define UnrealISO           "Unreal.iso"
#define UGoldISO            "UNREAL_GOLD.ISO"

#define UTMiscURL           "https://files.ego-creations.de/ut"
#define UTBP4               "UTBonusPack4.zip"

[Setup]
AppId={#AppId}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName=C:\UnrealGames
DefaultGroupName={#AppGroupName}
OutputBaseFilename={#AppPrefix}_Installer
Compression=lzma
SolidCompression=yes
DisableStartupPrompt=True
DisableWelcomePage=False
RestartIfNeededByRun=False
DisableDirPage=No
WizardStyle=modern
ShowLanguageDialog=no
OutputDir=Bin
ShowTasksTreeLines=True
ShowComponentSizes=False
UnInstallDisplayName={#AppName}
UninstallDisplayIcon={uninstallexe}
VersionInfoVersion=1.0.0.7
VersionInfoCompany=EGO-CREATIONS
VersionInfoDescription=Unreal games installer with OldUnreal community patches
VersionInfoCopyright=Copyright (c) 2024, EGO-CREATIONS
VersionInfoProductName=OldUnrealInstaller
VersionInfoProductVersion=1.0
VersionInfoOriginalFileName=Unreal_Installer.exe

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; -= Unreal Tournament =-
Source: "{tmp}\{code:GetPatch}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: UnrealTournament; Check: DwinsHs_Check(ExpandConstant('{tmp}\{code:GetPatch}'), ExpandConstant('{code:GetPatchURL}'), '{#AppId}', 'get', 0, 0)
Source: "{tmp}\{code:GetSDK}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: UnrealTournament; Tasks: sdkFile; Check: DwinsHs_Check(ExpandConstant('{tmp}\{code:GetSDK}'), ExpandConstant('{code:GetSdkURL}'), '{#AppId}', 'get', 0, 0)
Source: "{tmp}\{#UTBP4}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: UnrealTournament; Check: DwinsHs_Check(ExpandConstant('{tmp}\{#UTBP4}'), '{#UTMiscURL}/{#UTBP4}', '{#AppId}', 'get', 0, 0)
Source: "{tmp}\{#UTGameISO}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: UnrealTournament; Check: DwinsHs_Check(ExpandConstant('{tmp}\{#UTGameISO}'), '{#DownloadUTGameURL}/{#UTGameISO}', '{#AppId}', 'get', 0, 0)
Source: "{tmp}\{#UTGameISOtwo}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: UnrealTournament; Check: DwinsHs_Check(ExpandConstant('{tmp}\{#UTGameISOtwo}'), '{#DownloadUTGameURL}/{#UTGameISOtwo}', '{#AppId}', 'get', 0, 0)

; -= Unreal =-
;Source: "{tmp}\{code:GetFileName|{#DownloadUPatchURL}}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: Unreal; Check: DwinsHs_Check(ExpandConstant('{tmp}\{code:GetFileName|{#DownloadUPatchURL}}'), ExpandConstant('{code:GetReleaseFile|{#DownloadUPatchURL}}'), '{#AppId}', 'get', 0, 0)
;Source: "{tmp}\{#UnrealISO}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: Unreal; Check: DwinsHs_Check(ExpandConstant('{tmp}\{#UnrealISO}'), '{#DownloadUnrealURL}/{#UnrealISO}', '{#AppId}', 'get', 0, 0)

; -= Unreal Gold =-
Source: "{tmp}\{code:GetPatch|Unreal}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: Unreal; Check: DwinsHs_Check(ExpandConstant('{tmp}\{code:GetPatch|Unreal}'), ExpandConstant('{code:GetPatchURL|Unreal}'), '{#AppId}', 'get', 0, 0)
Source: "{tmp}\{code:GetSDK|Unreal}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: Unreal; Tasks: sdkFile; Check: DwinsHs_Check(ExpandConstant('{tmp}\{code:GetSDK|Unreal}'), ExpandConstant('{code:GetSdkURL|Unreal}'), '{#AppId}', 'get', 0, 0)
Source: "{tmp}\{#UGoldISO}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: Unreal; Check: DwinsHs_Check(ExpandConstant('{tmp}\{#UGoldISO}'), '{#DownloadUGoldURL}/{#UGoldISO}', '{#AppId}', 'get', 0, 0)

; additional temporary used files
Source: ".\Files\7z.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: ".\Files\7z.dll"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: ".\Files\skip.txt"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: ".\Files\UT\User.ini"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: ".\Files\UT\UnrealTournament.ini"; DestDir: "{tmp}"; Flags: deleteafterinstall

; keep downloaded UGold files
Source: "{tmp}\{code:GetPatch|Unreal}"; DestDir: "{app}\Downloaded Files"; Flags: external; Components: Unreal; Tasks: keepFiles
Source: "{tmp}\{code:GetSDK|Unreal}"; DestDir: "{app}\Downloaded Files"; Flags: external skipifsourcedoesntexist; Components: Unreal; Tasks: keepFiles
Source: "{tmp}\{#UGoldISO}"; DestDir: "{app}\Downloaded Files"; Flags: external; Components: Unreal; Tasks: keepFiles

; keep downloaded UT files
Source: "{tmp}\{code:GetPatch}"; DestDir: "{app}\Downloaded Files"; Flags: external; Components: UnrealTournament; Tasks: keepFiles
Source: "{tmp}\{code:GetSDK}"; DestDir: "{app}\Downloaded Files"; Flags: external skipifsourcedoesntexist; Components: UnrealTournament; Tasks: keepFiles
Source: "{tmp}\{#UTBP4}"; DestDir: "{app}\Downloaded Files"; Flags: external; Components: UnrealTournament; Tasks: keepFiles
Source: "{tmp}\{#UTGameISO}"; DestDir: "{app}\Downloaded Files"; Flags: external; Components: UnrealTournament; Tasks: keepFiles
Source: "{tmp}\{#UTGameISOtwo}"; DestDir: "{app}\Downloaded Files"; Flags: external; Components: UnrealTournament; Tasks: keepFiles

[Icons]
Name: "{group}\{cm:ProgramOnTheWeb,{#AppName}}"; Filename: "{#AppURL}"
Name: "{group}\{cm:UninstallProgram,{#AppName}}"; Filename: "{uninstallexe}"

; -= Unreal Tournament =-
Name: "{group}\Unreal Tournament"; Filename: "{app}\UnrealTournament\System\UnrealTournament.exe"; Components: UnrealTournament
Name: "{group}\Unreal Tournament Editor"; Filename: "{app}\UnrealTournament\System\UnrealEd.exe"; Components: UnrealTournament
Name: "{commondesktop}\Unreal Tournament"; Filename: "{app}\UnrealTournament\System\UnrealTournament.exe"; Components: UnrealTournament; Tasks: desktopicon
Name: "{commondesktop}\Unreal Tournament Editor"; Filename: "{app}\UnrealTournament\System\UnrealEd.exe"; Components: UnrealTournament; Tasks: desktopicon

; -= Unreal Gold =-
Name: "{group}\Unreal Gold"; Filename: "{app}\UnrealGold\System\Unreal.exe"; Components: Unreal
Name: "{group}\Unreal Gold Editor"; Filename: "{app}\UnrealGold\System\UnrealEd.exe"; Components: Unreal
Name: "{commondesktop}\Unreal Gold"; Filename: "{app}\UnrealGold\System\Unreal.exe"; Components: Unreal; Tasks: desktopicon
Name: "{commondesktop}\Unreal Gold Editor"; Filename: "{app}\UnrealGold\System\UnrealEd.exe"; Components: Unreal; Tasks: desktopicon

; -= Unreal =-
;Name: "{group}\Unreal"; Filename: "{app}\Unreal\System\Unreal.exe"; Components: Unreal
;Name: "{group}\Unreal Editor"; Filename: "{app}\Unreal\System\UnrealEd.exe"; Components: Unreal
;Name: "{commondesktop}\Unreal"; Filename: "{app}\Unreal\System\Unreal.exe"; Components: Unreal; Tasks: desktopicon
;Name: "{commondesktop}\Unreal Editor"; Filename: "{app}\Unreal\System\UnrealEd.exe"; Components: Unreal; Tasks: desktopicon

[Run]
;Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -tiso -o{app}\Unreal -x@skip.txt {#UnrealISO}"; Flags: runhidden; Components: Unreal
Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -tiso -o{app}\UnrealGold -x@skip.txt {#UGoldISO}"; Flags: runhidden; Components: Unreal
Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -tiso -o{app}\UnrealTournament -x@skip.txt {#UTGameISO}"; Flags: runhidden; Components: UnrealTournament; AfterInstall: DecompressMaps
;Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -tiso -o{app}\UnrealTournament -x@skip.txt {#UTGameISOtwo}"; Flags: runhidden; Components: UnrealTournament

; extract patch
Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -o{app}\UnrealGold {code:GetPatch|Unreal}"; Flags: runhidden; Components: Unreal
Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -o{app}\UnrealTournament {code:GetPatch}"; Flags: runhidden; Components: UnrealTournament

; extract UTBP4
Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -o{app}\UnrealTournament {#UTBP4}"; Flags: runhidden; Components: UnrealTournament

; copy UT config files
Filename: "{sys}\cmd.exe"; Parameters: "/C ""copy /Y {tmp}\User.ini {app}\UnrealTournament\System"""; Flags: runhidden; Components: UnrealTournament
Filename: "{sys}\cmd.exe"; Parameters: "/C ""copy /Y {tmp}\UnrealTournament.ini {app}\UnrealTournament\System"""; Flags: runhidden; Components: UnrealTournament

; extract SDK
Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -o{app}\UnrealGold\Src {code:GetSDK|Unreal}"; Flags: runhidden; Components: Unreal; Tasks: sdkFile; AfterInstall: AddINIUnrealSDK
Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -o{app}\UnrealTournament\Src {code:GetSDK}"; Flags: runhidden; Components: UnrealTournament; Tasks: sdkFile

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalTasks}"
Name: "sdkFile"; Description: "{cm:LoadSDK}"; GroupDescription: "{cm:AdditionalTasks}"; Flags: unchecked
Name: "keepFiles"; Description: "{cm:KeepISOs}"; GroupDescription: "{cm:AdditionalTasks}"; Flags: unchecked
Name: "MAPS"; Description: "{cm:OpenMaps}"; Flags: unchecked dontinheritcheck
Name: "MAPS\MapsU"; Description: "{cm:GameUnreal}"; Flags: exclusive; Components: Unreal
Name: "MAPS\MapsUT"; Description: "{cm:GameUT}"; Flags: exclusive; Components: UnrealTournament
Name: "UMOD"; Description: "{cm:UModTasks}"; GroupDescription: " "; Flags: unchecked dontinheritcheck
Name: "UMOD\UModU"; Description: "{cm:GameUnreal}"; Flags: exclusive; Components: Unreal
Name: "UMOD\UModUT"; Description: "{cm:GameUT}"; Flags: exclusive; Components: UnrealTournament

[Messages]
WelcomeLabel1=Welcome to the [name] Wizard
WelcomeLabel2=This will install [name] on your computer.%n%nIt is recommended that you close all other applications before continuing.
SetupAppTitle = Setup - {#AppName}
SetupWindowTitle = Setup - {#AppName}

[CustomMessages]
LineBreak=%n
GameUnreal=Unreal
GameUT=Unreal Tournament
CreateDesktopIcon=Create desktop icons
KeepISOs=Keep downloaded files
LoadSDK=Install SDK (will be installed in [Game]\Src)
AdditionalTasks=Additional tasks:
UModTasks=Register UMod functionality with:
OpenMaps=Register maps open with:

[Components]
Name: "Unreal"; Description: "Unreal Gold"; Types: Custom Full
Name: "UnrealTournament"; Description: "Unreal Tournament"; Types: Custom Full

[Types]
Name: "Full"; Description: "Full installation"
Name: "Custom"; Description: "Custom installation"; Flags: iscustom

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

; Registry includes
#include ".\Src\reg_functions.iss"

[Code]
#define DwinsHs_Use_Predefined_Downloading_WizardPage
#define DwinsHs_Auto_Continue

#include ".\Src\dwinshs_form.iss"
#include ".\Src\file_functions.iss"

function InitializeSetup(): Boolean;
begin
  UPatchURL:= GetReleaseFile(ExpandConstant('{#DownloadUPatchURL}'));
  UVersion:= PatchVersion;
  USdkURL:= SdkURL;

  UTPatchURL:= GetReleaseFile(ExpandConstant('{#DownloadUTPatchURL}'));
  UTVersion:= PatchVersion;
  UTSdkURL:= SdkURL;
  
  UTPatchFile:= ExtractFilename(UTPatchURL);
  UPatchFile:= ExtractFilename(UPatchURL);

  USdkFile:= ExtractFilename(USdkURL);
  UTSdkFile:= ExtractFilename(UTSdkURL);
  
  Result:= True;
end;

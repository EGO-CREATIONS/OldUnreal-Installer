;
; Inno Setup script for legacy games installation
;
;   * Unreal
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

; https://archive.org/download/ut-goty/UT_GOTY_CD1.iso
; https://archive.org/download/ut-goty/UT_GOTY_CD2.iso
; https://archive.org/download/totallyunreal/UNREAL_GOLD.ISO
; https://archive.org/download/gt-unreal-1998/Unreal.iso
; 
; https://api.github.com/repos/OldUnreal/Unreal-testing/releases/latest
; https://api.github.com/repos/OldUnreal/Unreal-testing/releases/tags/v227k
; https://api.github.com/repos/OldUnreal/UnrealTournamentPatches/releases/latest

#define DownloadUTPatchURL  "https://api.github.com/repos/OldUnreal/UnrealTournamentPatches/releases/latest"
#define DownloadUTGameURL   "https://archive.org/download/ut-goty"
#define UTGameISO           "UT_GOTY_CD1.iso"
#define UTGameISOtwo        "UT_GOTY_CD2.iso"

#define DownloadUPatchURL   "https://api.github.com/repos/OldUnreal/Unreal-testing/releases/tags/v227k"
#define DownloadUnrealURL   "https://archive.org/download/gt-unreal-1998"
#define DownloadUGoldURL    "https://archive.org/download/totallyunreal"
#define UnrealISO           "Unreal.iso"
#define UGoldISO            "UNREAL_GOLD.ISO"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={#AppId}
AppName={#AppName}
AppVersion={#AppVersion}
;AppVerName={#AppName} {#AppVersion}
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

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; -= Unreal Tournament =-
Source: "{tmp}\{code:GetUTPatchFile}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: UnrealTournament; Check: DwinsHs_Check(ExpandConstant('{tmp}\{code:GetUTPatchFile}'), ExpandConstant('{code:GetUTPatchURL}'), '{#AppId}', 'get', 0, 0)
Source: "{tmp}\{#UTGameISO}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: UnrealTournament; Check: DwinsHs_Check(ExpandConstant('{tmp}\{#UTGameISO}'), '{#DownloadUTGameURL}/{#UTGameISO}', '{#AppId}', 'get', 0, 0)
Source: "{tmp}\{#UTGameISOtwo}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: UnrealTournament; Check: DwinsHs_Check(ExpandConstant('{tmp}\{#UTGameISOtwo}'), '{#DownloadUTGameURL}/{#UTGameISOtwo}', '{#AppId}', 'get', 0, 0)

; -= Unreal =-
;Source: "{tmp}\{code:GetFileName|{#DownloadUPatchURL}}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: Unreal; Check: DwinsHs_Check(ExpandConstant('{tmp}\{code:GetFileName|{#DownloadUPatchURL}}'), ExpandConstant('{code:GetReleaseFile|{#DownloadUPatchURL}}'), '{#AppId}', 'get', 0, 0)
;Source: "{tmp}\{#UnrealISO}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: Unreal; Check: DwinsHs_Check(ExpandConstant('{tmp}\{#UnrealISO}'), '{#DownloadUnrealURL}/{#UnrealISO}', '{#AppId}', 'get', 0, 0)

; -= Unreal Gold =-
Source: "{tmp}\{code:GetUPatchFile}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: Unreal; Check: DwinsHs_Check(ExpandConstant('{tmp}\{code:GetUPatchFile}'), ExpandConstant('{code:GetUPatchURL}'), '{#AppId}', 'get', 0, 0)
Source: "{tmp}\{#UGoldISO}"; DestDir: "{tmp}"; Flags: external deleteafterinstall; Components: Unreal; Check: DwinsHs_Check(ExpandConstant('{tmp}\{#UGoldISO}'), '{#DownloadUGoldURL}/{#UGoldISO}', '{#AppId}', 'get', 0, 0)

; additional temporary used files
Source: ".\Files\7z.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: ".\Files\7z.dll"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: ".\Files\skip.txt"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: ".\Files\UT\User.ini"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: ".\Files\UT\UnrealTournament.ini"; DestDir: "{tmp}"; Flags: deleteafterinstall

; keep downloaded UGold files
Source: "{tmp}\{code:GetUPatchFile}"; DestDir: "{app}\Downloaded Files"; Flags: external; Tasks: keepFiles; Components: Unreal
Source: "{tmp}\{#UGoldISO}"; DestDir: "{app}\Downloaded Files"; Flags: external; Tasks: keepFiles; Components: Unreal
; keep downloaded UT files
Source: "{tmp}\{code:GetUTPatchFile}"; DestDir: "{app}\Downloaded Files"; Flags: external; Tasks: keepFiles; Components: UnrealTournament
Source: "{tmp}\{#UTGameISO}"; DestDir: "{app}\Downloaded Files"; Flags: external; Tasks: keepFiles; Components: UnrealTournament
Source: "{tmp}\{#UTGameISOtwo}"; DestDir: "{app}\Downloaded Files"; Flags: external; Tasks: keepFiles; Components: UnrealTournament

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
Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -tiso -o{app}\UnrealTournament -x@skip.txt {#UTGameISO}"; Flags: runhidden; Components: UnrealTournament
;Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -tiso -o{app}\UnrealTournament -x@skip.txt {#UTGameISOtwo}"; Flags: runhidden; Components: UnrealTournament

; extract patch
Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -o{app}\UnrealGold -x@skip.txt {code:GetUPatchFile}"; Flags: runhidden; Components: Unreal
Filename: "{tmp}\7z.exe"; Parameters: "x -aoa -y -o{app}\UnrealTournament -x@skip.txt {code:GetUTPatchFile}"; Flags: runhidden; Components: UnrealTournament

Filename: "{sys}\cmd.exe"; Parameters: "/C ""copy /Y {tmp}\User.ini {app}\UnrealTournament\System"""; Flags: runhidden; Components: UnrealTournament
Filename: "{sys}\cmd.exe"; Parameters: "/C ""copy /Y {tmp}\UnrealTournament.ini {app}\UnrealTournament\System"""; Flags: runhidden; Components: UnrealTournament

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalTasks}"
Name: "keepFiles"; Description: "{cm:KeepISOs}"; GroupDescription: "{cm:AdditionalTasks}"; Flags: unchecked

[Messages]
SetupAppTitle = Setup - {#AppName}
SetupWindowTitle = Setup - {#AppName}

[CustomMessages]
CreateDesktopIcon=Create desktop icons
KeepISOs=Keep downloaded files
AdditionalTasks=Additional tasks

[Components]
Name: "Unreal"; Description: "Unreal Gold"; Types: Custom Full
Name: "UnrealTournament"; Description: "Unreal Tournament"; Types: Custom Full

[Types]
Name: "Full"; Description: "Full installation"
Name: "Custom"; Description: "Custom installation"; Flags: iscustom

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[Code]
#define DwinsHs_Use_Predefined_Downloading_WizardPage
#define DwinsHs_Auto_Continue

#include ".\Src\dwinshs.iss"
#include ".\Src\file_functions.iss"

function InitializeSetup(): Boolean;
begin
  UTPatchURL:= GetReleaseFile(ExpandConstant('{#DownloadUTPatchURL}'));
  UPatchURL:= GetReleaseFile(ExpandConstant('{#DownloadUPatchURL}'));
  
  UTPatchFile:= ExtractFilename(UTPatchURL);
  UPatchFile:= ExtractFilename(UPatchURL);;
  
  Result:= True;
end;

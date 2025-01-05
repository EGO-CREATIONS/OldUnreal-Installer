; ============================================================================
;    reg_functions.iss
;
;    Author: Jan Urbansky
;    E-Mail: mail@ego-creations.de
;    WebURL: https://www.ego-creations.de
;    Copyright (c) 2024 EGO-CREATIONS. All rights reserved.

[Registry]
;========================================
; Unreal Gold
;========================================
Root: "HKLM"; Subkey: "Software\Unreal Technology\Installed Apps\UnrealGold"; ValueType: string; ValueName: "Version"; ValueData: "{code:GetVersion|Unreal}"; Flags: uninsdeletekey; Components: Unreal
Root: "HKLM"; Subkey: "Software\Unreal Technology\Installed Apps\UnrealGold"; ValueType: string; ValueName: "Folder"; ValueData: "{app}\UnrealGold"; Flags: uninsdeletekey; Components: Unreal

Root: "HKCR"; Subkey: ".unr"; ValueType: string; ValueData: "Unreal.Map"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: ".unreal"; ValueType: string; ValueData: "Unreal.Link"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: ".umod"; ValueType: string; ValueData: "Unreal.Module"; Flags: uninsdeletekey; Components: Unreal; Tasks: UMOD\UModU

Root: "HKCR"; Subkey: "unreal"; ValueType: string; ValueName: "URL Protocol"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "unreal"; ValueType: string; ValueData: "URL:Unreal Protocol"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "unreal\DefaultIcon"; ValueType: string; ValueData: "{app}\UnrealGold\Help\Unreal.ico"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "unreal\Shell"; ValueType: string; ValueData: "open"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "unreal\Shell\open"; ValueType: string; ValueData: "&Play this Unreal level"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "unreal\Shell\open\command"; ValueType: string; ValueData: "{app}\UnrealGold\System\Unreal.exe ""%1"""; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU

Root: "HKCR"; Subkey: "Unreal.Link"; ValueType: string; ValueData: "Unreal Link"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "Unreal.Link\DefaultIcon"; ValueType: string; ValueData: "{app}\UnrealGold\Help\Unreal.ico"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "Unreal.Link\Shell"; ValueType: string; ValueData: "open"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "Unreal.Link\Shell\open"; ValueType: string; ValueData: "&Play this Unreal level"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "Unreal.Link\Shell\open\command"; ValueType: string; ValueData: "{app}\UnrealGold\System\Unreal.exe ""%1"""; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU

Root: "HKCR"; Subkey: "Unreal.Map"; ValueType: string; ValueData: "Unreal Map"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "Unreal.Map\DefaultIcon"; ValueType: string; ValueData: "{app}\UnrealGold\Help\Unreal.ico"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "Unreal.Map\Shell"; ValueType: string; ValueData: "open"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "Unreal.Map\Shell\open"; ValueType: string; ValueData: "&Play this Unreal level"; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU
Root: "HKCR"; Subkey: "Unreal.Map\Shell\open\command"; ValueType: string; ValueData: "{app}\UnrealGold\System\Unreal.exe ""%1"""; Flags: uninsdeletekey; Components: Unreal; Tasks: MAPS\MapsU

Root: "HKCR"; Subkey: "Unreal.Module"; ValueType: string; ValueData: "Unreal Module"; Flags: uninsdeletekey; Components: Unreal; Tasks: UMOD\UModU
Root: "HKCR"; Subkey: "Unreal.Module\DefaultIcon"; ValueType: string; ValueData: "{app}\UnrealGold\Help\Unreal.ico"; Flags: uninsdeletekey; Components: Unreal; Tasks: UMOD\UModU
Root: "HKCR"; Subkey: "Unreal.Module\Shell"; ValueType: string; ValueData: "open"; Flags: uninsdeletekey; Components: Unreal; Tasks: UMOD\UModU
Root: "HKCR"; Subkey: "Unreal.Module\Shell\open"; ValueType: string; ValueData: "&Install this Unreal Module"; Flags: uninsdeletekey; Components: Unreal; Tasks: UMOD\UModU
Root: "HKCR"; Subkey: "Unreal.Module\Shell\open\command"; ValueType: string; ValueData: "{app}\UnrealGold\System\Setup.exe install ""%1"""; Flags: uninsdeletekey; Components: Unreal; Tasks: UMOD\UModU

;========================================
; Unreal Tournament
;========================================
Root: "HKLM"; Subkey: "Software\Unreal Technology\Installed Apps\UnrealTournament"; ValueType: string; ValueName: "Version"; ValueData: "{code:GetVersion}"; Flags: uninsdeletekey; Components: UnrealTournament
Root: "HKLM"; Subkey: "Software\Unreal Technology\Installed Apps\UnrealTournament"; ValueType: string; ValueName: "Folder"; ValueData: "{app}\UnrealTournament"; Flags: uninsdeletekey; Components: UnrealTournament

Root: "HKCR"; Subkey: ".unr"; ValueType: string; ValueData: "Unreal.Map"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: ".unreal"; ValueType: string; ValueData: "Unreal.Link"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: ".umod"; ValueType: string; ValueData: "Unreal.Module"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: UMOD\UModUT

Root: "HKCR"; Subkey: "unreal"; ValueType: string; ValueName: "URL Protocol"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "unreal"; ValueType: string; ValueData: "URL:Unreal Protocol"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "unreal\DefaultIcon"; ValueType: string; ValueData: "{app}\UnrealTournament\Help\Unreal.ico"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "unreal\Shell"; ValueType: string; ValueData: "open"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "unreal\Shell\open"; ValueType: string; ValueData: "&Play this Unreal level"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "unreal\Shell\open\command"; ValueType: string; ValueData: "{app}\UnrealTournament\System\UnrealTournament.exe ""%1"""; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT

Root: "HKCR"; Subkey: "Unreal.Link"; ValueType: string; ValueData: "Unreal Link"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "Unreal.Link\DefaultIcon"; ValueType: string; ValueData: "{app}\UnrealTournament\Help\Unreal.ico"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "Unreal.Link\Shell"; ValueType: string; ValueData: "open"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "Unreal.Link\Shell\open"; ValueType: string; ValueData: "&Play this Unreal level"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "Unreal.Link\Shell\open\command"; ValueType: string; ValueData: "{app}\UnrealTournament\System\UnrealTournament.exe ""%1"""; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT

Root: "HKCR"; Subkey: "Unreal.Map"; ValueType: string; ValueData: "Unreal Map"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "Unreal.Map\DefaultIcon"; ValueType: string; ValueData: "{app}\UnrealTournament\Help\Unreal.ico"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "Unreal.Map\Shell"; ValueType: string; ValueData: "open"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "Unreal.Map\Shell\open"; ValueType: string; ValueData: "&Play this Unreal level"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT
Root: "HKCR"; Subkey: "Unreal.Map\Shell\open\command"; ValueType: string; ValueData: "{app}\UnrealTournament\System\UnrealTournament.exe ""%1"""; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: MAPS\MapsUT

Root: "HKCR"; Subkey: "Unreal.Module"; ValueType: string; ValueData: "Unreal Module"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: UMOD\UModUT
Root: "HKCR"; Subkey: "Unreal.Module\DefaultIcon"; ValueType: string; ValueData: "{app}\UnrealTournament\Help\Unreal.ico"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: UMOD\UModUT
Root: "HKCR"; Subkey: "Unreal.Module\Shell"; ValueType: string; ValueData: "open"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: UMOD\UModUT
Root: "HKCR"; Subkey: "Unreal.Module\Shell\open"; ValueType: string; ValueData: "&Install this Unreal Module"; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: UMOD\UModUT
Root: "HKCR"; Subkey: "Unreal.Module\Shell\open\command"; ValueType: string; ValueData: "{app}\UnrealTournament\System\Setup.exe install ""%1"""; Flags: uninsdeletekey; Components: UnrealTournament; Tasks: UMOD\UModUT

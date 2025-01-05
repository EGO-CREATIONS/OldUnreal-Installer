// ============================================================================
//    file_functions.iss
//
//    Author: Jan Urbansky
//    E-Mail: mail@ego-creations.de
//    WebURL: https://www.ego-creations.de
//    Copyright (c) 2024 EGO-CREATIONS. All rights reserved.

#include "..\Inc\JsonParser.iss"

[Code]
var
  UTPatchFile, UPatchFile, UTPatchURL, UPatchURL: String;
  UVersion, UTVersion, PatchVersion: String;
  USDKFile, UTSDKFile, USDKURL, UTSDKURL, SDKURL: String;

// returns a Json value
function GetJsonValue(Output: TJsonParserOutput; Parent: TJsonObject; Key: TJsonString; var Value: TJsonValue): Boolean;
var
  x: Integer;
begin
  for x := 0 to Length(Parent) - 1 do
  begin
    if Parent[x].Key = Key then
    begin
      Value := Parent[x].Value;
      Result := True;
      Exit;
    end;
  end;

  Result := False;
end;

// returns a Json array
function GetJsonArray(Output: TJsonParserOutput; Parent: TJsonObject; Key: TJsonString; var Arr: TJsonArray): Boolean;
var
  JsonValue: TJsonValue;
begin
  Result := GetJsonValue(Output, Parent, Key, JsonValue) and (JsonValue.Kind = JVKArray);
  if Result then
  begin
    Arr := Output.Arrays[JsonValue.Index];
  end;
end;

// string tools
function StrEndsWith(Str, SubStr: string): Boolean;
var
  EndStr: string;
begin
  EndStr := Copy(Str, Length(Str) - Length(SubStr) + 1, Length(SubStr));
  Result := SameText(SubStr, EndStr); // SameStr() for case-sensitive comparison
end;

function GetReleaseFile(URL: String): String;
var
  HttpReq: Variant;
  JsonValue: TJsonValue;
  JsonArray: TJsonArray;
  JsonParser: TJsonParser;
  x: Integer;
begin
  // create a http request object
  HttpReq := CreateOleObject('WinHttp.WinHttpRequest.5.1');
  HttpReq.Open('GET', URL, False);
  HttpReq.SetRequestHeader('Accept','application/json');
  HttpReq.Send('');

  if HttpReq.Status = 200 then
  begin
    ParseJson(JsonParser, HttpReq.ResponseText);

    // get git's json array 'assets'
    if GetJsonArray(JsonParser.Output, JsonParser.Output.Objects[0], 'assets', jsonArray) then
    begin
      // get tag name
      GetJsonValue(JsonParser.Output, JsonParser.Output.Objects[0], 'tag_name', JsonValue);
      PatchVersion := JsonParser.Output.Strings[JsonValue.Index];

      // find in assets the Windows patch
      for x:= 0 to GetArrayLength(jsonArray)-1 do
      begin
        if GetJsonValue(JsonParser.Output, JsonParser.Output.Objects[jsonArray[x].Index], 'browser_download_url', JsonValue) and
        (JsonValue.Kind = JVKString) and (StrEndsWith(JsonParser.Output.Strings[JsonValue.Index], 'SDK.zip')) then
          SDKURL:= JsonParser.Output.Strings[JsonValue.Index];

        if GetJsonValue(JsonParser.Output, JsonParser.Output.Objects[jsonArray[x].Index], 'browser_download_url', JsonValue) and
        (JsonValue.Kind = JVKString) and (StrEndsWith(JsonParser.Output.Strings[JsonValue.Index], 'Windows.zip')) then
        begin
          //Log(Format('[browser_download_url]: %s', [JsonParser.Output.Strings[JsonValue.Index]]));
          Result:= JsonParser.Output.Strings[JsonValue.Index];
          break;
        end;
      end;
    end;

    ClearJsonParser(JsonParser);
  end;
end;

// returns the patch filename
function GetPatch(Param: String) : String;
begin
  if Param = 'Unreal' then
    Result:= UPatchFile
  else
    Result:= UTPatchFile;
end;

// returns the patch URL
function GetPatchURL(Param: String) : String;
begin
  if Param = 'Unreal' then
    Result:= UPatchURL
  else
    Result:= UTPatchURL;
end;

function GetSDK(Param: String) : String;
begin
  if Param = 'Unreal' then
    Result:= USdkFile
  else
    Result:= UTSdkFile;
end;

function GetSdkURL(Param: String) : String;
begin
  if Param = 'Unreal' then
    Result:= USdkURL
  else
    Result:= UTSdkURL;
end;

// returns the version
function GetVersion(Param: String) : String;
begin
  if Param = 'Unreal' then
    Result:= UVersion
  else
    Result:= UTVersion;
end;

// decompress UT's UZ files
procedure DecompressMaps();
var
  errCode: Integer;
  FindRec: TFindRec;
  Path: String;
begin
  Path:= ExpandConstant('{app}') + '\UnrealTournament';

  if FindFirst(Path + '\Maps\*.uz', FindRec) then begin
    try
      repeat
        if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0 then
        begin
          ShellExec('', Path + '\System\ucc.exe', 'decompress ' + Path + '\Maps\' + FindRec.Name, '', SW_HIDE, ewWaitUntilTerminated, errCode);
        end;
      until not FindNext(FindRec);
      ShellExec('', ExpandConstant('{sys}') + '\cmd.exe', '/C "move /Y ' + Path + '\System\*.unr ' + Path + '\Maps', '', SW_HIDE, ewWaitUntilTerminated, errCode);
      ShellExec('', ExpandConstant('{sys}') + '\cmd.exe', '/C "del /F /Q ' + Path + '\Maps\*.uz', '', SW_HIDE, ewWaitUntilTerminated, errCode);
    finally
      FindClose(FindRec);
    end;
  end;
end;

// add SDK sources folder to Unreal's INI
procedure AddINIUnrealSDK;
begin
  SetIniString('Editor.EditorEngine', 'CodePath', '..\Src\', ExpandConstant('{app}' + '\UnrealGold\System\Unreal.ini'));
end;

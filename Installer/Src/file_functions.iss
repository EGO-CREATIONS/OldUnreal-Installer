// =====================================================================================================================
//    file_functions.iscode
//
//    Author: Jan Urbansky
//    E-Mail: mail@ego-creations.de
//    WebURL: https://www.ego-creations.de
//    Copyright (c) 2024 EGO-CREATIONS. All rights reserved.

#include "..\Inc\JsonParser.iss"

[Code]
var
  PatchFileName : String;

// returns Json value from key
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

// returns Json array from key
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

function GetReleaseFile(GitReleasesURL: String): String;
var
  HttpReq: Variant;
  JsonValue: TJsonValue;
  JsonArray: TJsonArray;
  JsonParser: TJsonParser;
  x: Integer;
begin
  HttpReq := CreateOleObject('WinHttp.WinHttpRequest.5.1');
  HttpReq.Open('GET', GitReleasesURL, False);
  HttpReq.SetRequestHeader('Accept','application/json');
  HttpReq.Send('');

  if HttpReq.Status = 200 then
  begin
    ParseJson(JsonParser, HttpReq.ResponseText);

    if GetJsonArray(JsonParser.Output, JsonParser.Output.Objects[0], 'assets', jsonArray) then
    begin
      for x:= 0 to GetArrayLength(jsonArray)-1 do
      begin
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

function GetFileName(Param: String):String;
begin
  //PatchFileName := ExtractFileName(GetReleaseFile(Param));
  Result:= ExtractFileName(GetReleaseFile(Param));
end;

// function GetPatchFilename(Param: String):String;
// begin
//   Result:= PatchFileName;
// end;
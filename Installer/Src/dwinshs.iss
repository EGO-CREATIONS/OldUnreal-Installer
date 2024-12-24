// =====================================================================================================================
//    dwinshs.isform
//
//    Author: Jan Urbansky
//    E-Mail: mail@ego-creations.de
//    WebURL: https://www.ego-creations.de
//    Copyright (C) 2024 EGO-CREATIONS. All rights reserved.

#include "..\Inc\dwinshs.iss"

[Code]

procedure InitializeWizard();
begin
  WizardForm.DiskSpaceLabel.Visible := False;
  DwinsHs_InitializeWizard(wpPreparing);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  DwinsHs_CurPageChanged(CurPageID, nil, nil);
end;

function ShouldSkipPage(CurPageId: Integer): Boolean;
begin
  Result := False;
  DwinsHs_ShouldSkipPage(CurPageId, Result);
end;

function BackButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  DwinsHs_BackButtonClick(CurPageID);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  DwinsHs_NextButtonClick(CurPageID, Result);
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  DwinsHs_CancelButtonClick(CurPageID, Cancel, Confirm);
end;
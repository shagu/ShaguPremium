local backdrop = {
  bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 32,
  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16,
  insets = {left = 5, right = 5, top = 5, bottom = 5},
}

ClassicWow.changePassword = CreateFrame("Frame",nil,UIParent)
ClassicWow.changePassword:SetFrameStrata("TOOLTIP")
ClassicWow.changePassword:SetWidth(210)
ClassicWow.changePassword:SetHeight(250)
ClassicWow.changePassword:SetBackdrop(backdrop)
ClassicWow.changePassword:SetBackdropColor(.1,0,0,1);
ClassicWow.changePassword:SetPoint("CENTER",0,0)
ClassicWow.changePassword:SetMovable(true)
ClassicWow.changePassword:EnableMouse(true)
ClassicWow.changePassword:SetScript("OnMouseDown",function()
    ClassicWow.changePassword:StartMoving()
  end)
ClassicWow.changePassword:SetScript("OnMouseUp",function()
    ClassicWow.changePassword:StopMovingOrSizing()
  end)

ClassicWow.changePassword.title = CreateFrame("Frame", nil, ClassicWow.changePassword)
ClassicWow.changePassword.title:SetPoint("TOP", 0, -5);
ClassicWow.changePassword.title:SetWidth(200);
ClassicWow.changePassword.title:SetHeight(35);
ClassicWow.changePassword.title.tex = ClassicWow.changePassword.title:CreateTexture("LOW");
ClassicWow.changePassword.title.tex:SetAllPoints();
ClassicWow.changePassword.title.tex:SetTexture(0.5,0,0,1);

ClassicWow.changePassword.title.text = ClassicWow.changePassword.title:CreateFontString("Status", "LOW", "GameFontNormal")
ClassicWow.changePassword.title.text:SetFontObject(GameFontWhite)
ClassicWow.changePassword.title.text:SetFont("Fonts\\MORPHEUS.TTF", 14, "OUTLINE")
ClassicWow.changePassword.title.text:SetPoint("TOP", 0, -10)
ClassicWow.changePassword.title.text:SetText("Passwort ändern")

ClassicWow.changePassword.oldPWtext = ClassicWow.changePassword:CreateFontString("Status", "LOW", "GameFontNormal")
ClassicWow.changePassword.oldPWtext:SetFontObject(GameFontWhite)
ClassicWow.changePassword.oldPWtext:SetPoint("TOP", 0, -50)
ClassicWow.changePassword.oldPWtext:SetText("Altes Passwort")

ClassicWow.changePassword.oldPW = CreateFrame("EditBox", "oldPassword", ClassicWow.changePassword, "InputBoxTemplate")
ClassicWow.changePassword.oldPW:SetWidth(175)
ClassicWow.changePassword.oldPW:SetHeight(20)
ClassicWow.changePassword.oldPW:SetPoint("TOP", 0, -70)
ClassicWow.changePassword.oldPW:SetFontObject(GameFontNormal)
ClassicWow.changePassword.oldPW:SetAutoFocus(false)
ClassicWow.changePassword.oldPW:SetPassword(true)

ClassicWow.changePassword.newPWtext = ClassicWow.changePassword:CreateFontString("Status", "LOW", "GameFontNormal")
ClassicWow.changePassword.newPWtext:SetFontObject(GameFontWhite)
ClassicWow.changePassword.newPWtext:SetPoint("TOP", 0, -100)
ClassicWow.changePassword.newPWtext:SetText("Neues Passwort")

ClassicWow.changePassword.newPW = CreateFrame("EditBox", "newPassword", ClassicWow.changePassword, "InputBoxTemplate")
ClassicWow.changePassword.newPW:SetWidth(175)
ClassicWow.changePassword.newPW:SetHeight(20)
ClassicWow.changePassword.newPW:SetPoint("TOP", 0, -120)
ClassicWow.changePassword.newPW:SetFontObject(GameFontNormal)
ClassicWow.changePassword.newPW:SetAutoFocus(false)
ClassicWow.changePassword.newPW:SetPassword(true)

ClassicWow.changePassword.oldPWreptext = ClassicWow.changePassword:CreateFontString("Status", "LOW", "GameFontNormal")
ClassicWow.changePassword.oldPWreptext:SetFontObject(GameFontWhite)
ClassicWow.changePassword.oldPWreptext:SetPoint("TOP", 0, -150)
ClassicWow.changePassword.oldPWreptext:SetText("Neues Passwort (wiederholen)")

ClassicWow.changePassword.newPWrep = CreateFrame("EditBox", "repeatNewPassword", ClassicWow.changePassword, "InputBoxTemplate")
ClassicWow.changePassword.newPWrep:SetWidth(175)
ClassicWow.changePassword.newPWrep:SetHeight(20)
ClassicWow.changePassword.newPWrep:SetPoint("TOP", 0, -170)
ClassicWow.changePassword.newPWrep:SetFontObject(GameFontNormal)
ClassicWow.changePassword.newPWrep:SetAutoFocus(false)
ClassicWow.changePassword.newPWrep:SetPassword(true)

ClassicWow.changePassword.okay = CreateFrame("Button", nil, ClassicWow.changePassword, "UIPanelButtonTemplate")
ClassicWow.changePassword.okay:SetWidth(75)
ClassicWow.changePassword.okay:SetHeight(30) -- width, height
ClassicWow.changePassword.okay:SetPoint("BOTTOM", 50, 15)
ClassicWow.changePassword.okay:SetText("Ändern")
ClassicWow.changePassword.okay:SetScript("OnClick", function()
    SendChatMessage(".account password" .. " "
      .. ClassicWow.changePassword.oldPW:GetText() .. " "
      .. ClassicWow.changePassword.newPW:GetText() .. " " 
      .. ClassicWow.changePassword.newPWrep:GetText())
    ClassicWow.changePassword:Hide()
  end)

ClassicWow.changePassword.abbr = CreateFrame("Button", nil, ClassicWow.changePassword, "UIPanelButtonTemplate")
ClassicWow.changePassword.abbr:SetWidth(75)
ClassicWow.changePassword.abbr:SetHeight(30) -- width, height
ClassicWow.changePassword.abbr:SetPoint("BOTTOM", -50, 15)
ClassicWow.changePassword.abbr:SetText("Abbruch")
ClassicWow.changePassword.abbr:SetScript("OnClick", function()
    ClassicWow.changePassword:Hide()
  end)

ClassicWow.changePassword:Hide()
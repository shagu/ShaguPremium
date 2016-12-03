local backdrop = {
  bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 32,
  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16,
  insets = {left = 5, right = 5, top = 5, bottom = 5},
}

Hook_ChatFrame_OnEvent = ChatFrame_OnEvent
function ChatFrame_OnEvent(event)
  if event == "CHAT_MSG_SYSTEM" and arg2 and arg1 then
    if arg1 == "Account Stufe: [Premium]" then
      ClassicWowSettings["premium"] = true
    end

    if arg1 == "Account Stufe: [Normal]" then
      ClassicWowSettings["premium"] = false
    end
  end
	Hook_ChatFrame_OnEvent(event);
end

ClassicWow = CreateFrame("Frame",nil,UIParent)
ClassicWow:RegisterEvent("PLAYER_ENTERING_WORLD");

function ClassicWow.applyRate()
  SendChatMessage(".rate " .. ClassicWowSettings["rate"])
end

function ClassicWow:applyTele()
  SendChatMessage(".schnellreise " .. ClassicWowSettings["tele"])
end

ClassicWow:SetScript("OnEvent", function(self, event, ...)
  if ClassicWowSettings == nil then
    ClassicWowSettings = { ["rate"] = 8, ["tele"] = 1, ["auto"] = true, ["premium"] = false }
  else
    ClassicWow:Hide()
  end

  if ClassicWowSettings["auto"] == true then
    ClassicWow.settingsOnLogin:SetChecked()
    ClassicWow.applyTele()
    ClassicWow.applyRate()

    -- update GUI elements
    if ClassicWowSettings["rate"] == 0 then
      ClassicWow.rateNull:SetChecked()
    elseif ClassicWowSettings["rate"] == 1 then
      ClassicWow.rateEins:SetChecked()
    elseif ClassicWowSettings["rate"] == 2 then
      ClassicWow.rateZwei:SetChecked()
    elseif ClassicWowSettings["rate"] == 8 then
      ClassicWow.rateMax:SetChecked()
    end

    if ClassicWowSettings["tele"] == 0 then
      ClassicWow.instantFlugAus:SetChecked()
    elseif ClassicWowSettings["tele"] == 1 then
      ClassicWow.instantFlugAn:SetChecked()
    end 
  end 
end)

ClassicWow:SetFrameStrata("DIALOG")
ClassicWow:SetWidth(410)
ClassicWow:SetHeight(350)
ClassicWow:SetBackdrop(backdrop)
ClassicWow:SetBackdropColor(0,0,0,1);
ClassicWow:SetPoint("CENTER",0,0)
ClassicWow:SetMovable(true)
ClassicWow:EnableMouse(true)
ClassicWow:SetScript("OnMouseDown",function()
    ClassicWow:StartMoving()
  end)
ClassicWow:SetScript("OnMouseUp",function()
    ClassicWow:StopMovingOrSizing()
  end)

ClassicWow.title = CreateFrame("Frame", nil, ClassicWow)
ClassicWow.title:SetPoint("TOP", 0, -5);
ClassicWow.title:SetWidth(400);
ClassicWow.title:SetHeight(100);
ClassicWow.title.tex = ClassicWow.title:CreateTexture("LOW");
ClassicWow.title.tex:SetAllPoints();
ClassicWow.title.tex:SetTexture("Interface\\AddOns\\Classic-Wow.org\\img\\bg");

ClassicWow.title.text = ClassicWow.title:CreateFontString("Status", "LOW", "GameFontNormal")
ClassicWow.title.text:SetFontObject(GameFontWhite)
ClassicWow.title.text:SetFont("Fonts\\MORPHEUS.TTF", 26, "OUTLINE")
ClassicWow.title.text:SetPoint("TOP", 0, -20)
ClassicWow.title.text:SetText("Classic-Wow")

ClassicWow.title.dtext = ClassicWow.title:CreateFontString("Status", "LOW", "GameFontNormal")
ClassicWow.title.dtext:SetFontObject(GameFontWhite)
ClassicWow.title.dtext:SetFont("Fonts\\MORPHEUS.TTF", 10, "OUTLINE")
ClassicWow.title.dtext:SetPoint("BOTTOM", 0, 30)
ClassicWow.title.dtext:SetTextColor(1,1,1,.75)
ClassicWow.title.dtext:SetText("KOSTENLOS - CLASSIC FEELING - NOSTALGIE - BLIZZLIKE - PATCH 1.12.1")

ClassicWow.closeButton = CreateFrame("Button", nil, ClassicWow.title, "UIPanelCloseButton")
ClassicWow.closeButton:SetWidth(30)
ClassicWow.closeButton:SetHeight(30) -- width, height
ClassicWow.closeButton:SetPoint("TOPRIGHT", 0,0)
ClassicWow.closeButton:SetScript("OnClick", function()
    if ClassicWow:IsShown() then
      ClassicWow:Hide()
    end
  end)

ClassicWow.rateText = ClassicWow:CreateFontString("Status", "LOW", "GameFontNormal")
ClassicWow.rateText:SetFontObject(GameFontWhite)
ClassicWow.rateText:SetFont("Fonts\\FRIZQT__.TTF", 12)
ClassicWow.rateText:SetPoint("TOPLEFT", 30, -110)
ClassicWow.rateText:SetTextColor(1,1,1,1)
ClassicWow.rateText:SetText("Erfahrungsrate")

ClassicWow.rateNull = CreateFrame("CheckButton", "premiumRateNull", ClassicWow, "UICheckButtonTemplate")
ClassicWow.rateNull:ClearAllPoints()
ClassicWow.rateNull:SetPoint("TOPLEFT", 150, -107)
ClassicWow.rateNull:SetHeight(24)
ClassicWow.rateNull:SetWidth(24)
premiumRateNullText:SetText("0x")
premiumRateNullText:SetFont("Fonts\\FRIZQT__.TTF", 12)
premiumRateNullText:SetTextColor(1,1,1)
premiumRateNullText:ClearAllPoints()
premiumRateNullText:SetPoint("LEFT", 25, 0, "RIGHT")
ClassicWow.rateNull:SetScript("OnClick", function ()
      if ClassicWowSettings["rate"] ~= 0 then      
        ClassicWowSettings["rate"] = 0
        ClassicWow:applyRate()
      end
      ClassicWow.rateNull:SetChecked(true)
      ClassicWow.rateEins:SetChecked(false)
      ClassicWow.rateZwei:SetChecked(false)
      ClassicWow.rateMax:SetChecked(false)
  end)

ClassicWow.rateEins = CreateFrame("CheckButton", "premiumRateEins", ClassicWow, "UICheckButtonTemplate")
ClassicWow.rateEins:ClearAllPoints()
ClassicWow.rateEins:SetPoint("TOPLEFT", 210, -107)
ClassicWow.rateEins:SetHeight(24)
ClassicWow.rateEins:SetWidth(24)
premiumRateEinsText:SetText("1x")
premiumRateEinsText:SetFont("Fonts\\FRIZQT__.TTF", 12)
premiumRateEinsText:SetTextColor(1,1,1)
premiumRateEinsText:ClearAllPoints()
premiumRateEinsText:SetPoint("LEFT", 25, 0, "RIGHT")
ClassicWow.rateEins:SetScript("OnClick", function ()
      if ClassicWowSettings["rate"] ~= 1 then      
        ClassicWowSettings["rate"] = 1
        ClassicWow:applyRate()
      end
      ClassicWow.rateNull:SetChecked(false)
      ClassicWow.rateEins:SetChecked(true)
      ClassicWow.rateZwei:SetChecked(false)
      ClassicWow.rateMax:SetChecked(false)
  end)

ClassicWow.rateZwei = CreateFrame("CheckButton", "premiumRateZwei", ClassicWow, "UICheckButtonTemplate")
ClassicWow.rateZwei:ClearAllPoints()
ClassicWow.rateZwei:SetPoint("TOPLEFT", 270, -107)
ClassicWow.rateZwei:SetHeight(24)
ClassicWow.rateZwei:SetWidth(24)
premiumRateZweiText:SetText("2x")
premiumRateZweiText:SetFont("Fonts\\FRIZQT__.TTF", 12)
premiumRateZweiText:SetTextColor(1,1,1)
premiumRateZweiText:ClearAllPoints()
premiumRateZweiText:SetPoint("LEFT", 25, 0, "RIGHT")
ClassicWow.rateZwei:SetScript("OnClick", function ()
      if ClassicWowSettings["rate"] ~= 2 then      
        ClassicWowSettings["rate"] = 2
        ClassicWow:applyRate()
      end
      ClassicWow.rateNull:SetChecked(false)
      ClassicWow.rateEins:SetChecked(false)
      ClassicWow.rateZwei:SetChecked(true)
      ClassicWow.rateMax:SetChecked(false)
  end)

ClassicWow.rateMax = CreateFrame("CheckButton", "premiumRateMax", ClassicWow, "UICheckButtonTemplate")
ClassicWow.rateMax:ClearAllPoints()
ClassicWow.rateMax:SetPoint("TOPLEFT", 330, -107)
ClassicWow.rateMax:SetHeight(24)
ClassicWow.rateMax:SetWidth(24)
premiumRateMaxText:SetText("Max")
premiumRateMaxText:SetFont("Fonts\\FRIZQT__.TTF", 12)
premiumRateMaxText:SetTextColor(1,1,1)
premiumRateMaxText:ClearAllPoints()
premiumRateMaxText:SetPoint("LEFT", 25, 0, "RIGHT")
ClassicWow.rateMax:SetScript("OnClick", function ()
      if ClassicWowSettings["rate"] ~= 8 then      
        ClassicWowSettings["rate"] = 8
        ClassicWow:applyRate()
      end
      ClassicWow.rateNull:SetChecked(false)
      ClassicWow.rateEins:SetChecked(false)
      ClassicWow.rateZwei:SetChecked(false)
      ClassicWow.rateMax:SetChecked(true)
  end)

ClassicWow.instantFlug = ClassicWow:CreateFontString("Status", "LOW", "GameFontNormal")
ClassicWow.instantFlug:SetFontObject(GameFontWhite)
ClassicWow.instantFlug:SetFont("Fonts\\FRIZQT__.TTF", 12)
ClassicWow.instantFlug:SetPoint("TOPLEFT", 30, -150)
ClassicWow.instantFlug:SetTextColor(1,1,1,1)
ClassicWow.instantFlug:SetText("Schnellreise")

ClassicWow.instantFlugAus = CreateFrame("CheckButton", "instantFlugAus", ClassicWow, "UICheckButtonTemplate")
ClassicWow.instantFlugAus:ClearAllPoints()
ClassicWow.instantFlugAus:SetPoint("TOPLEFT", 270, -145)
ClassicWow.instantFlugAus:SetHeight(24)
ClassicWow.instantFlugAus:SetWidth(24)
instantFlugAusText:SetText("Aus")
instantFlugAusText:SetFont("Fonts\\FRIZQT__.TTF", 12)
instantFlugAusText:SetTextColor(1,1,1)
instantFlugAusText:ClearAllPoints()
instantFlugAusText:SetPoint("LEFT", 25, 0, "RIGHT")
ClassicWow.instantFlugAus:SetScript("OnClick", function ()
      if ClassicWowSettings["tele"] ~= 0 then      
        ClassicWowSettings["tele"] = 0
        ClassicWow:applyTele()
      end
      ClassicWow.instantFlugAus:SetChecked(true)
      ClassicWow.instantFlugAn:SetChecked(false)
  end)

ClassicWow.instantFlugAn = CreateFrame("CheckButton", "instantFlugAn", ClassicWow, "UICheckButtonTemplate")
ClassicWow.instantFlugAn:ClearAllPoints()
ClassicWow.instantFlugAn:SetPoint("TOPLEFT", 330, -145)
ClassicWow.instantFlugAn:SetHeight(24)
ClassicWow.instantFlugAn:SetWidth(24)
instantFlugAnText:SetText("Ein")
instantFlugAnText:SetFont("Fonts\\FRIZQT__.TTF", 12)
instantFlugAnText:SetTextColor(1,1,1)
instantFlugAnText:ClearAllPoints()
instantFlugAnText:SetPoint("LEFT", 25, 0, "RIGHT")
ClassicWow.instantFlugAn:SetScript("OnClick", function ()
      if ClassicWowSettings["tele"] ~= 1 then      
        ClassicWowSettings["tele"] = 1
        ClassicWow:applyTele()
      end
      ClassicWow.instantFlugAus:SetChecked(false)
      ClassicWow.instantFlugAn:SetChecked(true)
  end)

ClassicWow.accountSettings = ClassicWow:CreateFontString("Status", "LOW", "GameFontNormal")
ClassicWow.accountSettings:SetFontObject(GameFontWhite)
ClassicWow.accountSettings:SetFont("Fonts\\FRIZQT__.TTF", 12)
ClassicWow.accountSettings:SetPoint("TOPLEFT", 30, -190)
ClassicWow.accountSettings:SetTextColor(1,1,1,1)
ClassicWow.accountSettings:SetText("Account")

ClassicWow.pvpAccount = CreateFrame("Button", nil, ClassicWow, "UIPanelButtonTemplate")
ClassicWow.pvpAccount:SetWidth(120)
ClassicWow.pvpAccount:SetHeight(30) -- width, height
ClassicWow.pvpAccount:SetPoint("TOPLEFT", 60, -220)
ClassicWow.pvpAccount:SetText("PvP Account erstellen")
ClassicWow.pvpAccount:SetScript("OnClick", function()
    SendChatMessage(".account pvp")
  end)

ClassicWow.passwordAccount = CreateFrame("Button", nil, ClassicWow, "UIPanelButtonTemplate")
ClassicWow.passwordAccount:SetWidth(125)
ClassicWow.passwordAccount:SetHeight(30) -- width, height
ClassicWow.passwordAccount:SetPoint("TOPLEFT", 210, -220)
ClassicWow.passwordAccount:SetText("Passwort ändern")
ClassicWow.passwordAccount:SetScript("OnClick", function()
    ClassicWow.changePassword:Show()
  end)

ClassicWow.settingsOnLogin = CreateFrame("CheckButton", "settingsOnLogin", ClassicWow, "UICheckButtonTemplate")
ClassicWow.settingsOnLogin:ClearAllPoints()
ClassicWow.settingsOnLogin:SetPoint("BOTTOMLEFT", 50, 50)
ClassicWow.settingsOnLogin:SetHeight(24)
ClassicWow.settingsOnLogin:SetWidth(24)
settingsOnLoginText:SetText("Einstellungen beim Login wiederherstellen")
settingsOnLoginText:SetFont("Fonts\\FRIZQT__.TTF", 12)
settingsOnLoginText:SetTextColor(1,1,1)
settingsOnLoginText:ClearAllPoints()
settingsOnLoginText:SetPoint("LEFT", 25, 0, "RIGHT")
ClassicWow.settingsOnLogin:SetScript("OnClick", function ()
      if ClassicWow.settingsOnLogin:GetChecked() then
        ClassicWowSettings["auto"] = true
      else 
        ClassicWowSettings["auto"] = false
      end
  end)

ClassicWow.bottom = CreateFrame("Frame", nil, ClassicWow)
ClassicWow.bottom:SetPoint("BOTTOM", 0, 5);
ClassicWow.bottom:SetWidth(400);
ClassicWow.bottom:SetHeight(50);
ClassicWow.bottom.tex = ClassicWow.bottom:CreateTexture("LOW");
ClassicWow.bottom.tex:SetAllPoints();
ClassicWow.bottom.tex:SetTexture("Interface\\AddOns\\Classic-Wow.org\\img\\bgb");

ClassicWow.author = ClassicWow.bottom:CreateFontString("Status", "LOW", "GameFontNormal")
ClassicWow.author:SetFontObject(GameFontWhite)
ClassicWow.author:SetPoint("BOTTOM", 0, 5)
ClassicWow.author:SetText("© 2016 Shagu")
ClassicWow.minimapButton = CreateFrame('Button', "ClassicWow_Minimap", Minimap)
ClassicWow.minimapButton:RegisterEvent("PLAYER_ENTERING_WORLD");

ClassicWow.minimapButton:SetScript("OnEvent", function(self, event, ...)
  ClassicWow.minimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52-(80*cos(ClassicWowMinimapPosition)),(80*sin(ClassicWowMinimapPosition))-52)
end)

if (ClassicWowMinimapPosition == nil) then
  ClassicWowMinimapPosition = 125
end

ClassicWow.minimapButton:SetMovable(true)
ClassicWow.minimapButton:EnableMouse(true)
ClassicWow.minimapButton:RegisterForDrag('LeftButton')
ClassicWow.minimapButton:SetScript("OnDragStop", function()
    local xpos,ypos = GetCursorPosition()
    local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()

    xpos = xmin-xpos/UIParent:GetScale()+70
    ypos = ypos/UIParent:GetScale()-ymin-70

    ClassicWowMinimapPosition = math.deg(math.atan2(ypos,xpos))
    ClassicWow.minimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52-(80*cos(ClassicWowMinimapPosition)),(80*sin(ClassicWowMinimapPosition))-52)
  end)

ClassicWow.minimapButton:SetFrameStrata('LOW')
ClassicWow.minimapButton:SetWidth(31)
ClassicWow.minimapButton:SetHeight(31)
ClassicWow.minimapButton:SetFrameLevel(9)
ClassicWow.minimapButton:SetHighlightTexture('Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight')
ClassicWow.minimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52-(80*cos(ClassicWowMinimapPosition)),(80*sin(ClassicWowMinimapPosition))-52)
ClassicWow.minimapButton:SetScript("OnClick", function()
    if ( arg1 == "LeftButton" ) then
      if (ClassicWow:IsShown()) then
        ClassicWow:Hide()
      else
        ClassicWow:Show()
      end
    end
  end)

ClassicWow.minimapButton.overlay = ClassicWow.minimapButton:CreateTexture(nil, 'OVERLAY')
ClassicWow.minimapButton.overlay:SetWidth(53)
ClassicWow.minimapButton.overlay:SetHeight(53)
ClassicWow.minimapButton.overlay:SetTexture('Interface\\Minimap\\MiniMap-TrackingBorder')
ClassicWow.minimapButton.overlay:SetPoint('TOPLEFT', 0,0)

ClassicWow.minimapButton.icon = ClassicWow.minimapButton:CreateTexture(nil, 'BACKGROUND')
ClassicWow.minimapButton.icon:SetWidth(20)
ClassicWow.minimapButton.icon:SetHeight(20)
ClassicWow.minimapButton.icon:SetTexture('Interface\\AddOns\\Classic-Wow.org\\img\\logo')
ClassicWow.minimapButton.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
ClassicWow.minimapButton.icon:SetPoint('CENTER',1,1)

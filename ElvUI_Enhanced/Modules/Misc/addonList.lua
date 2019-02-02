local E, L, V, P, G = unpack(ElvUI)
local AL = E:NewModule("AddOnList", "AceHook-3.0")

local floor = math.floor

local CreateFrame = CreateFrame
local DisableAddOn = DisableAddOn
local EnableAddOn = EnableAddOn
local GetAddOnDependencies = GetAddOnDependencies
local GetAddOnInfo = GetAddOnInfo
local GetNumAddOns = GetNumAddOns
local IsAddOnLoaded = IsAddOnLoaded
local IsShiftKeyDown = IsShiftKeyDown
local LoadAddOn = LoadAddOn

function AL:HasAnyChanged()
	for i = 1, GetNumAddOns() do
		local _, _, _, enabled, _, reason = GetAddOnInfo(i);
		if enabled ~= ElvUI_AddonList.startStatus[i] and reason ~= "DEP_DISABLED" then
			return true
		end
	end

	return false
end

function AL:SetStatus(self, lod, status, reload)
	local button = self.LoadAddonButton
	local string = self.Status
	local relstr = self.Reload

	if lod then
		button:Show()
	else
		button:Hide()
	end

	if status then
		string:Show()
	else
		string:Hide()
	end

	if reload then
		relstr:Show()
	else
		relstr:Hide()
	end
end

function AL:Update()
	local numEntrys = GetNumAddOns()
	local addonIndex
	local entry, checkbox, string

	for i = 1, 19 do
		addonIndex = ElvUI_AddonList.offset + i
		entry = _G["ElvUI_AddonListEntry"..i]
		if addonIndex > numEntrys then
			entry:Hide();
		else
			local name, title, _, enabled, loadable, reason = GetAddOnInfo(addonIndex)

			checkbox = _G["ElvUI_AddonListEntry"..i.."Enabled"]
			checkbox:SetChecked(enabled);

			string = _G["ElvUI_AddonListEntry"..i.."Title"]
			if loadable or (enabled and (reason == "DEP_DEMAND_LOADED" or reason == "DEMAND_LOADED")) then
				string:SetTextColor(1.0, 0.78, 0.0)
			elseif enabled and reason ~= "DEP_DISABLED" then
				string:SetTextColor(1.0, 0.1, 0.1)
			else
				string:SetTextColor(0.5, 0.5, 0.5)
			end

			if title then
				string:SetText(title)
			else
				string:SetText(name)
			end

			string = _G["ElvUI_AddonListEntry"..i.."Status"]
			if not loadable and reason then
				string:SetText(_G["ADDON_"..reason])
			else
				string:SetText("")
			end

			if enabled ~= ElvUI_AddonList.startStatus[addonIndex] and reason ~= "DEP_DISABLED" then
				if enabled then
					-- special case for loadable on demand addons
					if AL:IsAddOnLoadOnDemand(addonIndex) then
						AL:SetStatus(entry, true, false, false)
					else
						AL:SetStatus(entry, false, false, true)
					end
				else
					AL:SetStatus(entry, false, false, true)
				end
			else
				AL:SetStatus(entry, false, true, false)
			end

			entry:SetID(addonIndex)
			entry:Show()
		end
	end

	-- ScrollFrame stuff
	FauxScrollFrame_Update(ElvUI_AddonListScrollFrame, numEntrys, 19, 16)

	if AL:HasAnyChanged() then
		ElvUI_AddonListOkayButton:SetText(L["Reload UI"])
		ElvUI_AddonList.shouldReload = true
	else
		ElvUI_AddonListOkayButton:SetText(OKAY)
		ElvUI_AddonList.shouldReload = false
	end
end

function AL:IsAddOnLoadOnDemand(index)
	local lod = false
	if IsAddOnLoadOnDemand(index) then
		local okay = false
		if not IsAddOnLoaded(index) then
			okay = true
		end

		lod = okay
	end

	return lod
end

function AL:Enable(index, enabled)
	if enabled then
		EnableAddOn(index, value)
	else
		DisableAddOn(index, value)
	end

	AL:Update()
end

function AL:LoadAddOn(index)
	if not AL:IsAddOnLoadOnDemand(index) then return end

	LoadAddOn(index)
	if IsAddOnLoaded(index) then
		ElvUI_AddonList.startStatus[index] = true
	end

	AL:Update()
end

function AL:TooltipBuildDeps(...)
	local deps = ""
	for i = 1, select("#", ...) do
		if i == 1 then
			deps = L["Dependencies: "]..select(i, ...)
		else
			deps = deps..", "..select(i, ...)
		end
	end

	return deps
end

function AL:TooltipUpdate(owner)
	if owner:GetID() == 0 then return; end

	local name, title, notes, _, _, security = GetAddOnInfo(owner:GetID())

	GameTooltip:ClearLines()

	if security == "BANNED" then
		GameTooltip:SetText(L["This addon has been disabled. You should install an updated version."])
	else
		if title then
			GameTooltip:AddLine(title)
		else
			GameTooltip:AddLine(name)
		end

		GameTooltip:AddLine(notes, 1.0, 1.0, 1.0)
		GameTooltip:AddLine(AL:TooltipBuildDeps(GetAddOnDependencies(owner:GetID())))
	end

	GameTooltip:Show()
end

function AL:Initialize()
	if IsAddOnLoaded("ACP") then return end

	local S = E:GetModule("Skins")

	local addonList = CreateFrame("Frame", "ElvUI_AddonList", UIParent)
	addonList:SetSize(500, 438)
	addonList:SetPoint("CENTER", 0, -24)
	addonList:SetTemplate("Transparent")
	addonList:Hide()
	addonList.offset = 0
	addonList.startStatus = {}
	addonList.shouldReload = false

	tinsert(UISpecialFrames, addonList:GetName())

	addonList:SetScript("OnShow", function()
		self:Update()
		PlaySound("igMainMenuOption")
	end)

	addonList:SetScript("OnHide", function()
		PlaySound("igMainMenuOptionCheckBoxOn")
	end)

	addonList:SetClampedToScreen(true)
	addonList:SetMovable(true)
	addonList:EnableMouse(true)
	addonList:RegisterForDrag("LeftButton")

	addonList:SetScript("OnDragStart", function(self)
		if IsShiftKeyDown() then
			self:StartMoving()
		end
	end)

	addonList:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing()
	end)

	addonList:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT", 0, 4)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine(L["Hold Shift + Drag:"], L["Temporary Move"], 1, 1, 1)

		GameTooltip:Show()
	end)
	addonList:SetScript("OnLeave", function(self) GameTooltip:Hide() end)

	local addonTitle = addonList:CreateFontString("$parentTitle", "BACKGROUND", "GameFontNormal")
	addonTitle:SetSize(220, 12)
	addonTitle:SetPoint("TOP", 0, -12)
	addonTitle:SetText(ADDONS)

	for i = 1, GetNumAddOns() do
		local _, _, _, enabled = GetAddOnInfo(i)
		addonList.startStatus[i] = enabled
	end

	local SPACING = (E.PixelMode and 3 or 5)

	local cancelButton = CreateFrame("Button", "$parentCancelButton", addonList, "UIPanelButtonTemplate")
	cancelButton:SetSize(80, 22)
	cancelButton:SetPoint("BOTTOMRIGHT", -SPACING, SPACING)
	cancelButton:SetText(CANCEL)
	S:HandleButton(cancelButton)

	cancelButton:SetScript("OnClick", function()
		ElvUI_AddonList:Hide()
	end)

	local closeButton = CreateFrame("Button", "$parentCloseButton", addonList, "UIPanelCloseButton")
	closeButton:Size(32)
	closeButton:Point("TOPRIGHT", -2, 2)
	S:HandleCloseButton(closeButton)

	closeButton:SetScript("OnClick", function()
		ElvUI_AddonList:Hide()
	end)

	local okayButton = CreateFrame("Button", "$parentOkayButton", addonList, "UIPanelButtonTemplate")
	okayButton:SetSize(80, 22)
	okayButton:SetPoint("TOPRIGHT", cancelButton, "TOPLEFT", -SPACING, 0)
	okayButton:SetText(OKAY)
	S:HandleButton(okayButton)

	okayButton:SetScript("OnClick", function()
		ElvUI_AddonList:Hide()
		if ElvUI_AddonList.shouldReload then
			ReloadUI()
		end
	end)

	local enableAllButton = CreateFrame("Button", "$parentEnableAllButton", addonList, "UIPanelButtonTemplate")
	enableAllButton:SetSize(120, 22)
	enableAllButton:SetPoint("BOTTOMLEFT", SPACING, SPACING)
	enableAllButton:SetText(L["Enable All"])
	S:HandleButton(enableAllButton)

	enableAllButton:SetScript("OnClick", function()
		EnableAllAddOns()
		AL:Update()
	end)

	local disableAllButton = CreateFrame("Button", "$parentDisableAllButton", addonList, "UIPanelButtonTemplate")
	disableAllButton:SetSize(120, 22)
	disableAllButton:SetPoint("TOPLEFT", enableAllButton, "TOPRIGHT", SPACING, 0)
	disableAllButton:SetText(L["Disable All"])
	S:HandleButton(disableAllButton)

	disableAllButton:SetScript("OnClick", function()
		DisableAllAddOns()
		AL:Update()
	end)

	local addonListEntry = {}
	for i = 1, 19 do
		addonListEntry[i] = CreateFrame("Button", "ElvUI_AddonListEntry"..i, addonList)
		addonListEntry[i]:SetSize(520, 16)
		addonListEntry[i]:SetID(i)

		if i == 1 then
			addonListEntry[i]:SetPoint("TOPLEFT", 10, -30)
		else
			addonListEntry[i]:SetPoint("TOP", addonListEntry[i - 1], "BOTTOM", 0, -4)
		end

		local title = addonListEntry[i]:CreateFontString("$parentTitle", "BACKGROUND", "GameFontNormal")
		title:SetSize(220, 12)
		title:SetPoint("LEFT", 32, 0)
		title:SetJustifyH("LEFT")

		local status = addonListEntry[i]:CreateFontString("$parentStatus", "BACKGROUND", "GameFontNormalSmall")
		status:SetSize(220, 12)
		status:SetPoint("LEFT", "$parentTitle", "RIGHT", 70, 0)
		status:SetJustifyH("LEFT")
		addonListEntry[i].Status = status

		local reload = addonListEntry[i]:CreateFontString("$parentReload", "BACKGROUND", "GameFontRed")
		reload:SetSize(220, 12)
		reload:SetPoint("LEFT", "$parentTitle", "RIGHT", 70, 0)
		reload:SetText(L["Requires Reload"])
		reload:SetJustifyH("LEFT")
		addonListEntry[i].Reload = reload

		local enabled = CreateFrame("CheckButton", "$parentEnabled", addonListEntry[i])
		enabled:SetSize(24, 24)
		enabled:SetPoint("LEFT", 5, 0)
		S:HandleCheckBox(enabled)

		enabled:SetScript("OnClick", function(self)
			AL:Enable(self:GetParent():GetID(), self:GetChecked())
			PlaySound("igMainMenuOptionCheckBoxOn")
		end)

		enabled:SetScript("OnEnter", function(self)
			if self.tooltip then
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT", -270, 0)
				AL:TooltipUpdate(self)
				GameTooltip:Show()
			end
		end)

		enabled:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)

		local load = CreateFrame("Button", "$parentLoad", addonListEntry[i], "UIPanelButtonTemplate")
		load:SetSize(100, 22)
		load:SetPoint("LEFT", "$parentTitle", "RIGHT", 70, 0)
		load:SetText(L["Load AddOn"])
		S:HandleButton(load)
		addonListEntry[i].LoadAddonButton = load

		load:SetScript("OnClick", function(self)
			AL:LoadAddOn(self:GetParent():GetID())
		end)

		addonListEntry[i]:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT", -270, 0)
			AL:TooltipUpdate(self)
			GameTooltip:Show()
		end)

		addonListEntry[i]:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)
	end

	local scrollFrame = CreateFrame("ScrollFrame", "$parentScrollFrame", addonList, "FauxScrollFrameTemplate")
	scrollFrame:SetSize(450, 382)
	scrollFrame:SetPoint("TOPLEFT", 18, -26)
	S:HandleScrollBar(ElvUI_AddonListScrollFrameScrollBar, 5)

	scrollFrame:SetScript("OnVerticalScroll", function(self, offset)
		local scrollbar = _G[self:GetName().."ScrollBar"]
		scrollbar:SetValue(offset)
		addonList.offset = floor((offset / 16) + 0.5)

		AL:Update()

		if GameTooltip:IsShown() then
			AL:TooltipUpdate(GameTooltip:GetOwner())
			GameTooltip:Show()
		end
	end)

	local scrollChild = CreateFrame("Frame", "ElvUI_AddonListScrollFrameScrollChildFrame", scrollFrame)
	scrollChild:SetSize(510, 395)
	scrollChild:SetPoint("CENTER")
	scrollFrame:SetScrollChild(scrollChild)

	local buttonAddons = CreateFrame("Button", "ElvUI_ButtonAddons", GameMenuFrame, "GameMenuButtonTemplate")
	buttonAddons:SetText(ADDONS)
	S:HandleButton(buttonAddons)

	if GameMenuFrame_UpdateVisibleButtons then
		hooksecurefunc("GameMenuFrame_UpdateVisibleButtons", function()
			GameMenuFrame:SetHeight(GameMenuFrame:GetHeight() + 25)
		end)
	end

	buttonAddons:HookScript("OnShow", function(self)
		local point, relativeTo, relativePoint, x, y = GameMenuButtonMacros:GetPoint(1)
		if relativeTo and relativeTo ~= self then
			self:SetPoint(point, relativeTo, relativePoint, x, y)
		end

		GameMenuButtonMacros:ClearAllPoints()
		GameMenuButtonMacros:SetPoint("TOP", self, "BOTTOM", 0, -1)
	end)

	buttonAddons:SetScript("OnClick", function()
		HideUIPanel(GameMenuFrame)
		ShowUIPanel(ElvUI_AddonList)
	end)

	self:HookScript(GameMenuButtonRatings, "OnShow", function()
		ElvUI_ButtonAddons:Point("TOP", GameMenuButtonRatings, "BOTTOM", 0, -1)
	end)

	self:HookScript(GameMenuButtonRatings, "OnHide", function()
		ElvUI_ButtonAddons:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0, -1)
	end)

	self:RawHookScript(GameMenuButtonLogout, "OnShow", function(self)
		self:SetPoint("TOP", ElvUI_ButtonAddons, "BOTTOM", 0, -16)

		if not StaticPopup_Visible("CAMP") and not StaticPopup_Visible("QUIT") then
			self:Enable()
		else
			self:Disable()
		end
	end)

	if GetLocale() == "koKR" then
		if IsMacClient() then
			GameMenuFrame:Height(308)
		else
			GameMenuFrame:Height(282)
		end
	else
		if IsMacClient() then
			GameMenuFrame:Height(292)
		else
			GameMenuFrame:Height(266)
		end
	end
end

local function InitializeCallback()
	AL:Initialize()
end

E:RegisterModule(AL:GetName(), InitializeCallback)
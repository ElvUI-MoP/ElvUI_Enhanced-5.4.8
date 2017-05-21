local E, L, V, P, G = unpack(ElvUI);
local DT = E:GetModule("DataTexts")

local select = select;

local displayNumberString = ""
local lastPanel;
local join = string.join

local function OnEvent(self, event, ...)
	self.text:SetFormattedText(displayNumberString, STAMINA_COLON, select(2, UnitStat("player", 3)))
	lastPanel = self
end

local function ValueColorUpdate(hex)
	displayNumberString = join("", "%s ", hex, "%.f|r")
	
	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E["valueColorUpdateFuncs"][ValueColorUpdate] = true

DT:RegisterDatatext("Stamina", {"UNIT_STATS", "UNIT_AURA", "FORGE_MASTER_ITEM_CHANGED", "ACTIVE_TALENT_GROUP_CHANGED", "PLAYER_TALENT_UPDATE"}, OnEvent)
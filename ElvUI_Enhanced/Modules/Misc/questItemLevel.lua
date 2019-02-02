local E, L, V, P, G = unpack(ElvUI)
local M = E:GetModule("Enhanced_Misc")

local _G = _G

local GetItemInfo = GetItemInfo
local GetItemQualityColor = GetItemQualityColor
local GetNumQuestChoices = GetNumQuestChoices
local GetNumQuestLogChoices = GetNumQuestLogChoices
local GetNumQuestLogRewards = GetNumQuestLogRewards
local GetNumQuestRewards = GetNumQuestRewards
local GetQuestItemLink = GetQuestItemLink
local GetQuestLogItemLink = GetQuestLogItemLink
local GetQuestLogRewardSpell = GetQuestLogRewardSpell
local GetRewardSpell = GetRewardSpell
local ARMOR, ENCHSLOT_WEAPON = ARMOR, ENCHSLOT_WEAPON

function M:QuestInfo_Display()
	local numQuestRewards = QuestInfoFrame.questLog and GetNumQuestLogRewards() or GetNumQuestRewards()
	local numQuestChoices = QuestInfoFrame.questLog and GetNumQuestLogChoices() or GetNumQuestChoices()
	local numQuestSpellRewards = QuestInfoFrame.questLog and GetQuestLogRewardSpell() or GetRewardSpell()
	local rewardsCount = numQuestChoices + numQuestRewards + (numQuestSpellRewards and 1 or 0)

	if rewardsCount > 0 then
		for i = 1, rewardsCount do
			local item = _G["QuestInfoItem"..i]
			local icon = _G["QuestInfoItem"..i.."IconTexture"]

			if not item.text then
				item.text = item:CreateFontString(nil, "OVERLAY")
				item.text:FontTemplate(E.LSM:Fetch("font", E.db.bags.itemLevelFont), E.db.bags.itemLevelFontSize, E.db.bags.itemLevelFontOutline)
				item.text:Point("BOTTOMRIGHT", icon, 0, 3)

				if E.private.skins.blizzard.enable and E.private.skins.blizzard.quest then
					item.text:SetParent(item.backdrop)
				end
			end
			item.text:SetText("")

			local link = item.type and (QuestInfoFrame.questLog and GetQuestLogItemLink or GetQuestItemLink)(item.type, item:GetID())

			if link then
				local _, _, quality, itemlevel, _, itemType = GetItemInfo(link)

				if (itemlevel and itemlevel > 1) and quality and (itemType == ENCHSLOT_WEAPON or itemType == ARMOR) then
					item.text:SetText(itemlevel)
					item.text:SetTextColor(GetItemQualityColor(quality))
				end
			end
		end
	end
end

function M:QuestItemLevel()
	if E.db.enhanced.general.questItemLevel then
		if not self:IsHooked("QuestInfo_Display") then
			self:SecureHook("QuestInfo_Display")
		end
	end
end
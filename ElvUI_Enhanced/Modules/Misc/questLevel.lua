local E, L, V, P, G = unpack(ElvUI)
local M = E:GetModule("Enhanced_Misc", "AceHook-3.0")

local HybridScrollFrame_GetOffset = HybridScrollFrame_GetOffset
local GetNumQuestLogEntries = GetNumQuestLogEntries
local GetQuestLogTitle = GetQuestLogTitle

local function ShowLevel()
	local buttons = QuestLogScrollFrame.buttons
	local numButtons = #buttons
	local scrollOffset = HybridScrollFrame_GetOffset(QuestLogScrollFrame)
	local numEntries, numQuests = GetNumQuestLogEntries()

	for i = 1, numButtons do
		local questIndex = i + scrollOffset
		local questLogTitle = buttons[i]
		if questIndex <= numEntries then
			local title, level, _, _, isHeader = GetQuestLogTitle(questIndex)
			if not isHeader then
				questLogTitle:SetText("["..level.."] "..title)
				QuestLogTitleButton_Resize(questLogTitle)
			end
		end
	end
end

function M:QuestLevelToggle()
	if E.db.enhanced.general.showQuestLevel then
		self:SecureHook("QuestLog_Update", ShowLevel)
		QuestLogScrollFrameScrollBar:HookScript("OnValueChanged", ShowLevel)
	else
		self:Unhook("QuestLog_Update")
		self:Unhook(QuestLogScrollFrameScrollBar, "OnValueChanged")
	end

	QuestLog_Update()
end
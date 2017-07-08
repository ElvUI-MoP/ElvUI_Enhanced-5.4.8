local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "zhTW")
if not L then return end

-- DESC locales
L["ENH_LOGIN_MSG"] = "您正在使用 |cff1784d1ElvUI|r |cff1784d1Enhanced|r |cffff8000(MoP)|r version %s%s|r."
L["EQUIPMENT_DESC"] = "當你切換專精或進入戰場時自動更換裝備, 你可以在選項中選擇相關的裝備模組."
L["DURABILITY_DESC"] = "調整設置人物窗口裝備耐久度顯示."
L["FARMER_DESC"] = "調整設置以便你在日歌農莊更有效的耕作."
L["ITEMLEVEL_DESC"] = "調整在角色資訊上顯示物品裝等的各種設定."
L["WATCHFRAME_DESC"] = "Adjust the settings for the visibility of the watchframe (questlog) to your personal preference."

-- Actionbars
L["Sets actionbars' backgrounds to transparent template."] = true;
L["Sets actionbars buttons' backgrounds to transparent template."] = true;
L["Transparent ActionBars"] = true;
L["Transparent Backdrop"] = true;
L["Transparent Buttons"] = true;

-- Chat
L["Replaces long reports from damage meters with a clickeble hyperlink to reduce chat spam."] = true;

-- Datatext
L["Combat Indicator"] = true;
L["Datatext Disabled"] = true;
L["Distance"] = true;
L["Enhanced Time Color"] = true;
L["Equipped"] = true;
L["In Combat"] = true;
L["New Mail"] = true;
L["No Mail"] = true;
L["Out of Combat"] = true;
L["Reincarnation"] = true;
L["Target Range"] = true;
L["Total"] = true;
L["You are not playing a |cff0070DEShaman|r, datatext disabled."] = true;

-- Death Recap
L["%s %s"] = true;
L["%s by %s"] = true;
L["%s sec before death at %s%% health."] = true;
L["(%d Absorbed)"] = true;
L["(%d Blocked)"] = true;
L["(%d Overkill)"] = true;
L["(%d Resisted)"] = true;
L["Death Recap unavailable."] = true;
L["Death Recap"] = true;
L["Killing blow at %s%% health."] = true;
L["Recap"] = true;
L["You died."] = true;

-- Decline Duels
L["Auto decline all duels"] = "自動拒絕決鬥請求"
L["Auto decline all pet duels"] = true;
L["Decline Duel"] = true;
L["Decline Pet Duel"] = true;
L["Declined duel request from "] = "已拒絕決鬥請求自"
L["Declined pet duel request from "] = "拒絕寵物對戰請求 "

-- Equipment
L["Choose the equipment set to use for your primary specialization."] = "選擇當你使用主專精時的裝備模組."
L["Choose the equipment set to use for your secondary specialization."] = "選擇當你使用副專精時的裝備模組."
L["Choose the equipment set to use when you enter a battleground or arena."] = "選擇當你進入戰場時的裝備模組."
L["Damaged Only"] = "受損顯示"
L["Enable/Disable the battleground switch."] = "開啓/關閉 戰場切換"
L["Enable/Disable the display of durability information on the character screen."] = "開啓/關閉 人物窗口裝備耐久度顯示."
L["Enable/Disable the display of item levels on the character screen."] = "在角色資訊上顯示各裝備裝等"
L["Enable/Disable the specialization switch."] = "開啓/關閉 專精切換"
L["Equipment Set Overlay"] = true;
L["Equipment Set"] = "裝備模組"
L["Equipment"] = "自動換裝"
L["No Change"] = "不改變"
L["Only show durabitlity information for items that are damaged."] = "只在裝備受損時顯示耐久度."
L["Show the associated equipment sets for the items in your bags (or bank)."] = "在你包包或銀行中顯示相關的套裝設定"
L["Specialization"] = "專精"
L["You have equipped equipment set: "] = "你已裝備此模組: "

-- Farmer
L["Automatically drop tools from your bags when leaving the farming area."] = "當你離開農莊範圍時, 自動刪除背包中的工具."
L["Drop Tools"] = "刪除工具"
L["Enable/Disable the farmer bars."] = "開啓/關閉 農夫快捷列."
L["Farmer"] = "農夫"
L["Farmer Portal Bar"] = "農夫列:傳送"
L["Farmer Seed Bar"] = "農夫列:種子"
L["Farmer Tools Bar"] = "農夫列:工具"
L["Farmer Bars"] = "農夫列"
L["Only active buttons"] = "只顯示有效的按鈕"
L["Only show the buttons for the seeds, portals, tools you have in your bags."] = "只顯示你背包中有的種子, 傳送和工具."
L["Right-click to drop the item."] = "右鍵點擊需刪除的項目."
L["Seed Bar Direction"] = "種子條方向"
L["Sunsong Ranch"] = "日歌農莊"
L["The direction of the seed bar buttons (Horizontal or Vertical)."] = "種子條的方向 (水平或垂直)"
L["The Halfhill Market"] = "半丘市集"
L["Tilled Soil"] = "開墾過的沃土"

-- General
L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."] = "當你獲得某個陣營的聲望時, 將自動追蹤此陣營的聲望至經驗值欄位." 
L["Automatically release body when killed inside a battleground."] = "在戰場死亡後自動釋放靈魂."
L["Automatically select the quest reward with the highest vendor sell value."] = "自動選取有最高賣價的任務獎勵物品"
L["Changes the transparency of all the movers."] = "改變所有定位器的透明度"
L["Colorizes recipes, mounts & pets that are already known"] = true;
L["Display quest levels at Quest Log."] = true;
L["Hide Zone Text"] = true;
L["Mover Transparency"] = "定位器透明度"
L["PvP Autorelease"] = "PVP自動釋放靈魂"
L["Select Quest Reward"] = "自動選取任務獎勵"
L["Show Quest Level"] = true;
L["Track Reputation"] = "聲望追蹤"

-- Nameplates
L["Bars will transition smoothly."] = true;
L["Cache Unit Class"] = true;
L["Smooth Bars"] = true;

-- Minimap
L["Above Minimap"] = "小地圖之上"
L["FadeIn Delay"] = "隱藏延遲"
L["Hide minimap while in combat."] = "戰鬥中隱藏小地圖"
L["Location Digits"] = "坐標位數"
L["Location Panel"] = true;
L["Number of digits for map location."] = "坐標顯示的小數位數"
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = "戰鬥開始後隱藏小地圖前的延遲時間 (0=停用)"
L["Toggle Location Panel."] = true;

-- Tooltip
L["Display the players raid progression in the tooltip, this may not immediately update when mousing over a unit."] = true;
L["Progression Info"] = true;
L["Show/Hides an Icon for Achievements on the Tooltip."] = true;
L["Show/Hides an Icon for Items on the Tooltip."] = true;
L["Show/Hides an Icon for Spells on the Tooltip."] = true;
L["Show/Hides an Icon for Spells and Items on the Tooltip."] = true;
L["Tooltip Icon"] = true;

-- Misc
L["Undress"] = "無裝備"

-- Movers
L["Player Portrait"] = true;
L["Target Portrait"] = true;

-- Unitframes
L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."] = true;
L["Detached Height"] = true;
L["Hide Role Icon in combat"] = true;
L["Show class icon for units."] = "顯是職業圖標"

-- WatchFrame
L["Arena"] = "競技場"
L["City (Resting)"] = "城市 (休息)"
L["Collapsed"] = "收起"
L["Hidden"] = "隱藏"
L["Party"] = "隊伍"
L["PvP"] = true;
L["Raid"] = "團隊"
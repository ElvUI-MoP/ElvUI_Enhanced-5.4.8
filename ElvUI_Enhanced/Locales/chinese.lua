local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "zhCN")
if not L then return end

-- DESC locales
L["ENH_LOGIN_MSG"] = "您正在使用 |cff1784d1ElvUI|r |cff1784d1Enhanced|r |cffff8000(MoP)|r version %s%s|r."
L["DURABILITY_DESC"] = "调整设置人物窗口装备耐久度显示."
L["FARMER_DESC"] = "调整设置以便你在日歌农场更有效的耕作."
L["ITEMLEVEL_DESC"] = "Adjust the settings for the item level information on the character screen."
L["WATCHFRAME_DESC"] = "Adjust the settings for the visibility of the watchframe (questlog) to your personal preference."

-- Chat
L["Replaces long reports from damage meters with a clickeble hyperlink to reduce chat spam."] = true;

-- Datatext
L["Datatext Disabled"] = true;
L["Distance"] = true;
L["Enhanced Time Color"] = true;
L["Equipped"] = true;
L["In Combat"] = true;
L["New Mail"] = true;
L["No Mail"] = true;
L["Not Learned"] = true;
L["Out of Combat"] = true;
L["Ready"] = true;
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
L["Death Recap"] = "死亡回放"
L["Killing blow at %s%% health."] = true;
L["Recap"] = true;
L["You died."] = true;

-- Equipment
L["Damaged Only"] = "受损显示"
L["Equipment"] = "自动换装"
L["Enable/Disable the display of durability information on the character screen."] = "开启/关闭 人物窗口装备耐久度显示."
L["Enable/Disable the display of item levels on the character screen."] = true;
L["Only show durabitlity information for items that are damaged."] = "只在装备受损时显示耐久度."

-- Farmer
L["Automatically drop tools from your bags when leaving the farming area."] = "当你离开农场范围时, 自动删除背包中的工具."
L["Drop Tools"] = "删除工具"
L["Enable/Disable the farmer bars."] = "开启/关闭 农夫快捷列."
L["Farmer"] = "农夫"
L["Farmer Bars"] = "农夫列"
L["Farmer Portal Bar"] = "农夫列:传送"
L["Farmer Seed Bar"] = "农夫列:种子"
L["Farmer Tools Bar"] = "农夫列:工具"
L["Only active buttons"] = "只显示有效的按钮"
L["Only show the buttons for the seeds, portals, tools you have in your bags."] = "只显示你背包中有的种子, 传送门和工具."
L["Right-click to drop the item."] = "右键点击需删除的项目."
L["Seed Bar Direction"] = true
L["Sunsong Ranch"] = "日歌农场"
L["The direction of the seed bar buttons (Horizontal or Vertical)."] = true
L["The Halfhill Market"] = "半山市集"
L["Tilled Soil"] = "开垦过的土壤"

-- General
L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."] = "当你获得某个阵营的声望时, 将自动追踪此阵营的声望至经验栏位." 
L["Automatically release body when killed inside a battleground."] = "在战场死亡后自动释放灵魂."
L["Changes the transparency of all the movers."] = true;
L["Colorizes recipes, mounts & pets that are already known"] = true;
L["Display the players raid progression in the tooltip, this may not immediately update when mousing over a unit."] = true;
L["Display quest levels at Quest Log."] = true;
L["Mover Transparency"] = true;
L["PvP Autorelease"] = "PVP自动释放灵魂"
L["Progression Info"] = true;
L["Show Quest Level"] = true;
L["Track Reputation"] = "声望追踪"

-- Nameplates
L["Bars will transition smoothly."] = true;
L["Cache Unit Class"] = true;
L["Smooth Bars"] = true;

-- Minimap
L["Above Minimap"] = true;
L["FadeIn Delay"] = true;
L["Hide minimap while in combat."] = true;
L["Location Digits"] = true;
L["Location Panel"] = true;
L["Number of digits for map location."] = true;
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = true;
L["Toggle Location Panel."] = true;

-- Misc
L["Undress"] = "无装备"

-- Movers
L["Player Portrait"] = true;
L["Target Portrait"] = true;

-- Unitframes
L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."] = true;
L["Detached Height"] = true;
L["Hide Role Icon in combat"] = true;
L["Show class icon for units."] = true;

-- WatchFrame
L["Hidden"] = true;
L["Collapsed"] = true;
L["City (Resting)"] = true;
L["PvP"] = true;
L["Arena"] = true;
L["Party"] = true;
L["Raid"] = true;
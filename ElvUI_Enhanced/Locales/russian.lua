local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "ruRU")
if not L then return end

-- DESC locales
L["ENH_LOGIN_MSG"] = "Вы используете |cff1784d1ElvUI|r |cff1784d1Enhanced|r |cffff8000(MoP)|r версии %s%s|r."
L["DURABILITY_DESC"] = "Настройка параметров информации о прочности предметов в окне персонажа."
L["ITEMLEVEL_DESC"] = "Настройка параметров информации об уровне предмета в окне персонажа."
L["WATCHFRAME_DESC"] = "Настройте отображение списка заданий (квест лог) исходя из ваших личных предпочтений."

-- Chat
L["Replaces long reports from damage meters with a clickeble hyperlink to reduce chat spam."] = "Заменяет длинные отчеты от аддонов для измерения УВС на гиперссылку, сокращая уровень спама в чате."

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
L["Total"] = "Всего"
L["You are not playing a |cff0070DEShaman|r, datatext disabled."] = true;

-- Death Recap
L["%s %s"] = "Урон: %s %s"
L["%s by %s"] = "%s - %s"
L["%s sec before death at %s%% health."] = "%s сек. до смерти при объеме здоровья %s%%"
L["(%d Absorbed)"] = "Поглощено: %d ед. урона."
L["(%d Blocked)"] = "Заблокировано: %d уд. урона."
L["(%d Overkill)"] = "Избыточный урон: %d ед."
L["(%d Resisted)"] = "Сопротивление %d еденицам урона."
L["Death Recap unavailable."] = "Информация о смерти не доступна."
L["Death Recap"] = "Информация о смерти"
L["Killing blow at %s%% health."] = "Объем здоровья при получении смертельного удара: %s%%"
L["Recap"] = "Информация"
L["You died."] = "Вы умерли."

-- Equipment
L["Damaged Only"] = "Только поврежденные"
L["Equipment"] = "Экипировка"
L["Enable/Disable the display of durability information on the character screen."] = "Включить/Выключить отображение информации о прочности предметов в окне персонажа."
L["Enable/Disable the display of item levels on the character screen."] = "Включить/Выключить отображение уровня предмета в окне персонажа."
L["Only show durabitlity information for items that are damaged."] = "Показывать уровень прочности только на поврежденных предметах."

-- General
L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."] = "Автоматическое изменение фракции на панели репутации на ту, очки репутации которой вы получили."
L["Automatically release body when killed inside a battleground."] = "Автоматически покидать тело после смерти на полях боя."
L["Changes the transparency of all the movers."] = "Изменяет прозрачность фиксаторов"
L["Colorizes recipes, mounts & pets that are already known"] = true;
L["Display the players raid progression in the tooltip, this may not immediately update when mousing over a unit."] = true;
L["Display quest levels at Quest Log."] = true;
L["Mover Transparency"] = "Прозрачность фиксаторов"
L["PvP Autorelease"] = "Автовыход из тела"
L["Progression Info"] = true;
L["Show Quest Level"] = true;
L["Track Reputation"] = "Отслеживание репутации"

-- Nameplates
L["Bars will transition smoothly."] = true;
L["Cache Unit Class"] = true;
L["Smooth Bars"] = true;

-- Minimap
L["Above Minimap"] = "Над миникартой"
L["FadeIn Delay"] = "Задержка появления"
L["Hide minimap while in combat."] = "Скрывать миникарту во время боя."
L["Location Digits"] = "Цифры координат"
L["Location Panel"] = true;
L["Number of digits for map location."] = "Колличество цифр после запятой в координатах."
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = "Время ожидания появления миникарты после выхода из боя. (0 = Выключено)"
L["Toggle Location Panel."] = true;

-- Misc
L["Undress"] = "Раздеть"

-- Movers
L["Player Portrait"] = "Портрет игрока"
L["Target Portrait"] = "Портрет цели"

-- Unitframes
L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."] = "Все иконки ролей (дд/хил/танк) на фреймах юнитов будут скрыты во время боя."
L["Detached Height"] = "Высота при откреплении"
L["Hide Role Icon in combat"] = "Скрыть иконку роли в бою"
L["Show class icon for units."] = "Показывать иконку класса на цели."

-- WatchFrame
L["Arena"] = "Арена"
L["City (Resting)"] = "Город (отдых)"
L["Collapsed"] = "Развернуть"
L["Hidden"] = "Скрыть"
L["Party"] = "Группа"
L["PvP"] = "PvP"
L["Raid"] = "Рейд"
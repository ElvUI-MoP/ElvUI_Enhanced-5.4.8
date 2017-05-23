local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "deDE")
if not L then return end

-- DESC locales
L["ENH_LOGIN_MSG"] = "Sie verwenden |cff1784d1ElvUI|r |cff1784d1Enhanced|r |cffff8000(MoP)|r Version %s%s|r."
L["EQUIPMENT_DESC"] = "Passen Sie die Einstellungen für das Ändern Ihrer Ausrüstung an, wenn Sie Ihre Talentspezialisierung ändern oder ein Schlachtfeld betreten."
L["DURABILITY_DESC"] = "Passen Sie die Einstellungen für die Haltbarkeit im Charakterfenster an."
L["FARMER_DESC"] = "Einstellungen für alle Werkzeuge, die Sie effizienter auf Gehöft Sonnensang arbeiten lassen."
L["ITEMLEVEL_DESC"] = "Passen Sie die Einstellungen für die Anzeige von Gegenstandsstufen im Charakterfenster an."
L["WATCHFRAME_DESC"] = "Adjust the settings for the visibility of the watchframe (questlog) to your personal preference."

-- Actionbars
L["Sets actionbars' backgrounds to transparent template."] = "Setzt den Aktionsleisten Hintergrund transparent."
L["Sets actionbars buttons' backgrounds to transparent template."] = "Setzt die Aktionsleisten Tasten transparent."
L["Transparent ActionBars"] = true;
L["Transparent Backdrop"] = "Transparenter Hintergrund"
L["Transparent Buttons"] = "Transparente Tasten"

-- Chat
L["Replaces long reports from damage meters with a clickeble hyperlink to reduce chat spam."] = "Ersetzt lange Berichte von Damage Metern mit einem klickbaren Hyperlink um Chatspam zu vermeiden."

-- Datatext
L["Datatext Disabled"] = true;
L["Distance"] = true;
L["Enhanced Time Color"] = true;
L["Equipped"] = true;
L["In Combat"] = true;
L["New Mail"] = "Neue Post"
L["No Mail"] = "Keine Post"
L["Not Learned"] = true;
L["Out of Combat"] = true;
L["Ready"] = true;
L["Total"] = "Gesamt"
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
L["Death Recap"] = "Todesursache"
L["Killing blow at %s%% health."] = true;
L["Recap"] = true;
L["You died."] = true;

-- Equipment
L["Choose the equipment set to use for your primary specialization."] = "Wählen Sie das Ausrüstungsset für Ihre primäre Talentspezialisierung."
L["Choose the equipment set to use for your secondary specialization."] = "Wählen Sie das Ausrüstungsset für Ihre sekundäre Talentspezialisierung."
L["Choose the equipment set to use when you enter a battleground or arena."] = "Wählen Sie Ihr Ausrüstungsset für Schlachtfelder oder die Arena."
L["Damaged Only"] = "Nur Beschädigte"
L["Enable/Disable the battleground switch."] = "Automatische Änderung der Ausrüstung beim Betreten eines Schlachtfelds aktivieren / deaktivieren."
L["Enable/Disable the display of durability information on the character screen."] = "Anzeige der Haltbarkeit im Charakterfenster."
L["Enable/Disable the display of item levels on the character screen."] = "Anzeige von Gegenstandsstufen im Charakterfenster aktivieren / deaktivieren."
L["Enable/Disable the specialization switch."] = "Automatische Änderung der Ausrüstung beim Talentwechsel aktivieren / deaktivieren."
L["Equipment Set Overlay"] = "Ausrüstungssettext"
L["Equipment Set"] = "Ausrüstungsset"
L["Equipment"] = "Ausrüstung"
L["No Change"] = "Keine Änderung"
L["Only show durabitlity information for items that are damaged."] = "Nur die Haltbarkeit für beschädigte Ausrüstungsteile anzeigen."
L["Show the associated equipment sets for the items in your bags (or bank)."] = "Zeige auf Gegenständen im Rucksack (oder der Bank) die zugehörigen Ausrüstungssets als Text an."
L["Specialization"] = "Talentspezialisierung"
L["You have equipped equipment set: "] = "Sie haben das folgende Ausrüstungsset angelegt: "

-- Farmer
L["Automatically drop tools from your bags when leaving the farming area."] = "Beim Verlassen der Farm automatisch die Werkzeuge zerstören."
L["Drop Tools"] = "Werkzeuge ablegen"
L["Enable/Disable the farmer bars."] = "Aktivieren / Deaktivieren der Landwirtleisten"
L["Farmer"] = "Landwirt"
L["Farmer Bars"] = "Landwirt Aktionsleisten"
L["Farmer Portal Bar"] = "Landwirt Portalleiste"
L["Farmer Seed Bar"] = "Landwirt Saatleiste"
L["Farmer Tools Bar"] = "Landwirt Werkzeugleiste"
L["Only active buttons"] = "Nur aktive Buttons"
L["Only show the buttons for the seeds, portals, tools you have in your bags."] = "Nur Buttons für Saat, Portale und Werkzeuge anzeigen, wenn diese in Ihrem Rucksack vorhanden sind."
L["Right-click to drop the item."] = "Mit der rechten Maustaste klicken, um den Gegenstand abzulegen."
L["Seed Bar Direction"] = "Richtung Saatleiste"
L["Sunsong Ranch"] = "Gehöft Sonnensang"
L["The direction of the seed bar buttons (Horizontal or Vertical)."] = "Die Ausbreitungsrichtung der Saatleiste (horizontal oder vertikal)"
L["The Halfhill Market"] = "Der Halbhügelmarkt"
L["Tilled Soil"] = "Gepflügtes Erdreich"

-- General
L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."] = "Ändere automatisch die beobachtete Fraktion auf der Erfahrungsleiste zu der Fraktion für die Sie grade Rufpunkte erhalten haben."
L["Automatically release body when killed inside a battleground."] = "Gibt automatisch Ihren Geist frei, wenn Sie auf dem Schlachtfeld getötet wurden."
L["Automatically select the quest reward with the highest vendor sell value."] = "Wählt automatisch die Questbelohnung mit dem höchsten Wiederverkaufswert beim Händler"
L["Changes the transparency of all the movers."] = "Konfiguriere die Einstellungen der Transparenz der Ankerpukte"
L["Colorizes recipes, mounts & pets that are already known"] = true;
L["Display quest levels at Quest Log."] = true;
L["Hide Zone Text"] = true;
L["Mover Transparency"] = "Transparenz Ankerpunkte"
L["PvP Autorelease"] = "Automatische Freigabe im PvP"
L["Select Quest Reward"] = "Wähle Questbelohnung"
L["Show Quest Level"] = true;
L["Track Reputation"] = "Ruf beobachten"

-- Nameplates
L["Bars will transition smoothly."] = true;
L["Cache Unit Class"] = true;
L["Smooth Bars"] = true;

-- Minimap
L["Above Minimap"] = "Oberhalb der Minimap"
L["FadeIn Delay"] = "Einblendungsverzögerung"
L["Hide minimap while in combat."] = "Ausblenden der Minimap während des Kampfes."
L["Location Digits"] = "Koordinaten Nachkommastellen"
L["Location Panel"] = true;
L["Number of digits for map location."] = "Anzahl der Nachkommastellen der Koordinaten."
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = "Die Zeit vor dem wieder Einblenden der Minimap nach dem Kampf. (0 = deaktiviert)"
L["Toggle Location Panel."] = true;

-- Tooltip
L["Display the players raid progression in the tooltip, this may not immediately update when mousing over a unit."] = true;
L["Enable Achievements"] = "Aktiviere Erfolge"
L["Enable Items"] = "Aktiviere Gegenstände"
L["Enable Spell"] = "Aktiviere Zauber"
L["Progression Info"] = true;
L["Show/Hides an Icon for Achievements on the Tooltip."] = "Icon für Erfolge am Tooltip anzeigen oder ausblenden."
L["Show/Hides an Icon for Items on the Tooltip."] = "Icon für Gegenstände am Tooltip anzeigen oder ausblenden."
L["Show/Hides an Icon for Spells on the Tooltip."] = "Icon für Zauber am Tooltip anzeigen oder ausblenden."
L["Show/Hides an Icon for Spells and Items on the Tooltip."] = "Icon für Zauber oder Gegenstände am Tooltip anzeigen oder ausblenden."
L["Tooltip Icon"] = true;

-- Misc
L["Undress"] = "Ausziehen"

-- Movers
L["Player Portrait"] = true;
L["Target Portrait"] = true;

-- Unitframes
L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."] = "Alle Rollensymbole (Schaden/Heiler/Tank) auf den Einheitenfenstern werden versteckt, wenn der Charakter sich im Kampf befindet."
L["Detached Height"] = true;
L["Hide Role Icon in combat"] = "Verstecke Rollensymbol im Kampf"
L["Show class icon for units."] = "Zeige Klassensymbole für Einheiten"

-- WatchFrame
L["Arena"] = "Arena"
L["City (Resting)"] = "Stadt (erholend)"
L["Collapsed"] = "Eingeklappt"
L["Hidden"] = "Versteckt"
L["Party"] = "Gruppe"
L["PvP"] = "PvP"
L["Raid"] = "Schlachtzug"
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("ElvUI", "frFR");
if not L then return; end

-- DESC locales
L["ENH_LOGIN_MSG"] = "Vous utilisez |cff1784d1ElvUI|r |cff1784d1Enhanced|r |cffff8000(MoP)|r version %s%s|r."
L["DURABILITY_DESC"] = "Ajustez les réglages pour afficher la durabilité sur l'écran d'infos de personnage."
L["ITEMLEVEL_DESC"] = "Réglez les paramètres pour afficher le niveau d'objet sur l'écran d'infos de personnage."
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
L["Death Recap"] = "Récapitulatif lors de la mort"
L["Killing blow at %s%% health."] = true;
L["Recap"] = true;
L["You died."] = true;

-- Equipment
L["Damaged Only"] = "Dégâts seulement"
L["Equipment"] = "Équipement"
L["Enable/Disable the display of durability information on the character screen."] = "Activer / Désactiver l'affichage des informations de durabilité sur l'écran d'infos de personnage."
L["Enable/Disable the display of item levels on the character screen."] = "Activer / Désactiver l'affichage des informations du niveau d'objet sur l'écran d'infos de personnage."
L["Only show durabitlity information for items that are damaged."] = "Afficher la durabilité seulement quand l'équipement est endommagé."

-- General
L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."] = "Change automatiquement la réputation suivie sur la barre de réputation avec la faction que vous êtes en train de faire."
L["Automatically release body when killed inside a battleground."] = "Libère automatiquement votre corps quand vous êtes tué en Champs de Bataille."
L["Changes the transparency of all the movers."] = "Change la transparence des Ancres"
L["Colorizes recipes, mounts & pets that are already known"] = true;
L["Display the players raid progression in the tooltip, this may not immediately update when mousing over a unit."] = true;
L["Display quest levels at Quest Log."] = true;
L["Mover Transparency"] = "Transparence des Ancres"
L["PvP Autorelease"] = "Libération automatique en PVP"
L["Progression Info"] = true;
L["Show Quest Level"] = true;
L["Track Reputation"] = "Suivre la Réputation"

-- Nameplates
L["Bars will transition smoothly."] = true;
L["Cache Unit Class"] = true;
L["Smooth Bars"] = true;

-- Minimap
L["Above Minimap"] = "Sous la minicarte"
L["FadeIn Delay"] = "Délais d'estompage"
L["Hide minimap while in combat."] = "Cacher la minicarte quand vous êtes en combat"
L["Location Digits"] = "Chiffres d'emplacement"
L["Location Panel"] = true;
L["Number of digits for map location."] = "Nombre de chiffres pour l'emplacement."
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = "Le temps à attendre avant que la minicarte s'estompe avec que le combat ait commencé. (0 = désactié)"
L["Toggle Location Panel."] = true;

-- Misc
L["Undress"] = "Déshabillé"

-- Movers
L["Player Portrait"] = true;
L["Target Portrait"] = true;

-- Unitframes
L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."] = "Cachez toutes les icônes de rôle (Dommages/Healer/Tank) sur les cadres d'unité quand vous serait en combat."
L["Detached Height"] = true;
L["Hide Role Icon in combat"] = "Cachez les icônes de rôle en combat"
L["Show class icon for units."] = true;

-- WatchFrame
L["Hidden"] = "Caché"
L["Collapsed"] = "Replié"
L["City (Resting)"] = "Ville (repos)"
L["PvP"] = "PvP"
L["Arena"] = "Arêne"
L["Party"] = "Groupe"
L["Raid"] = "Raid"
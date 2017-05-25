local E, L, V, P, G = unpack(ElvUI);

-- Minimap
P.general.minimap.locationText = "ABOVE"

-- Unitframes
P.unitframe.units.player.portrait.detachFromFrame = false;
P.unitframe.units.player.portrait.detachedWidth = 54;
P.unitframe.units.player.portrait.detachedHeight = 54;

P.unitframe.units.target.portrait.detachFromFrame = false;
P.unitframe.units.target.portrait.detachedWidth = 54;
P.unitframe.units.target.portrait.detachedHeight = 54;

-- Quest
P.general.showQuestLevel = true;

-- Enhanced
P.enhanced = {
	general = {
		pvpAutoRelease = false,
		autoRepChange = false,
		moverTransparancy = 0.8,
		hideZoneText = false,
		declineduel = false,
		declinepetduel = false
	},
	actionbars = {
		transparentActionbars = {
			transparentBackdrops = true,
			transparentButtons = true
		}
	},
	chat = {
		dpsLinks = false,
	},
	datatexts = {
		timeColorEnch = false,
	},
	equipment = {
		enable = false,
		durability = {
			enable = true,
			onlydamaged = true
		},
		itemlevel = {
			enable = true
		}
	},
	minimap = {
		location = false,
		locationdigits = 1,
		hideincombat = false,
		fadeindelay = 5,
	},
	nameplates = {
		cacheUnitClass = false,
		smooth = false,
		smoothSpeed = 0.3,
	},
	tooltip = {
		progressInfo  = true,
		tooltipIcon = {
			enable = false,
			tooltipIconSpells  = true,
			tooltipIconItems  = true,
			tooltipIconAchievements  = true
		}
	},
	unitframe = {
		units = {
			target = {
				classicon = {
					enable = false,
					size = 28,
					xOffset = -58,
					yOffset = -22
				}
			}
		},
		hideRoleInCombat = false
	},
	watchframe = {
		enable = false,
		city = "COLLAPSED",
		pvp = "HIDDEN",
		arena = "HIDDEN",
		party = "COLLAPSED",
		raid = "COLLAPSED"
	}
};
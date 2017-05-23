local E, L, V, P, G = unpack(ElvUI);

V.general.selectQuestReward = true

V.equipment = {
	["specialization"] = {
		["enable"] = false,
	},
	["battleground"] = {
		["enable"] = false,
	},
	["primary"] = "none",
	["secondary"] = "none",
	["equipmentset"] = "none",
	["durability"] = {
		enable = true,
		onlydamaged = false
	},
	["itemlevel"] = {
		enable = true
	}
}

V.farmer = {
	["enabled"] = true,
	["farmbars"] = {
		["enable"] = true,
		["onlyactive"] = true,
		["droptools"] = true,
		["seedbardirection"] = "VERTICAL"
	}
}
local E, L, V, P, G = unpack(ElvUI)
local addon = E:GetModule("ElvUI_Enhanced")

local format = string.format

local function ColorizeSettingName(settingName)
	return format("|cffff8000%s|r", settingName)
end

-- General
local function GeneralOptions()
	local M = E:GetModule("Enhanced_Misc")

	local config = {
		order = 1,
		type = "group",
		name = L["General"],
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["General"])
			},
			pvpAutoRelease = {
				order = 2,
				type = "toggle",
				name = L["PvP Autorelease"],
				desc = L["Automatically release body when killed inside a battleground."],
				get = function(info) return E.db.enhanced.general.pvpAutoRelease end,
				set = function(info, value) E.db.enhanced.general.pvpAutoRelease = value M:AutoRelease() end
			},
			autoRepChange = {
				order = 3,
				type = "toggle",
				name = L["Track Reputation"],
				desc = L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."],
				get = function(info) return E.db.enhanced.general.autoRepChange end,
				set = function(info, value) E.db.enhanced.general.autoRepChange = value M:WatchedFaction() end
			},
			showQuestLevel = {
				order = 4,
				type = "toggle",
				name = L["Show Quest Level"],
				desc = L["Display quest levels at Quest Log."],
				get = function(info) return E.db.enhanced.general.showQuestLevel end,
				set = function(info, value) E.db.enhanced.general.showQuestLevel = value M:QuestLevelToggle() end
			},
			selectQuestReward = {
				order = 5,
				type = "toggle",
				name = L["Select Quest Reward"],
				desc = L["Automatically select the quest reward with the highest vendor sell value."],
				get = function(info) return E.db.enhanced.general.selectQuestReward end,
				set = function(info, value) E.db.enhanced.general.selectQuestReward = value end
			},
			declineduel = {
				order = 6,
				type = "toggle",
				name = L["Decline Duel"],
				desc = L["Auto decline all duels"],
				get = function(info) return E.db.enhanced.general.declineduel end,
				set = function(info, value) E.db.enhanced.general.declineduel = value M:DeclineDuel() end
			},
			declinepetduel = {
				order = 7,
				type = "toggle",
				name = L["Decline Pet Duel"],
				desc = L["Auto decline all pet duels"],
				get = function(info) return E.db.enhanced.general.declinepetduel end,
				set = function(info, value) E.db.enhanced.general.declinepetduel = value M:DeclinePetDuel() end
			},
			hideZoneText = {
				order = 8,
				type = "toggle",
				name = L["Hide Zone Text"],
				get = function(info) return E.db.enhanced.general.hideZoneText end,
				set = function(info, value) E.db.enhanced.general.hideZoneText = value M:HideZone() end
			},
			originalCloseButton = {
				order = 9,
				type = "toggle",
				name = L["Original Close Button"],
				desc = L["Display the original map buttons"],
				get = function(info) return E.db.enhanced.general.originalCloseButton end,
				set = function(info, value) E.db.enhanced.general.originalCloseButton = value M:UpdateCloseButtons() end
			},
			trainAllButton = {
				order = 10,
				type = "toggle",
				name = L["Train All Button"],
				desc = L["Add button to Trainer frame with ability to train all available skills in one click."],
				get = function(info) return E.db.enhanced.general.trainAllButton end,
				set = function(info, value) E.db.enhanced.general.trainAllButton = value E:GetModule("Enhanced_TrainAll"):ToggleState() end
			},
			undressButton = {
				order = 11,
				type = "toggle",
				name = L["Undress Button"],
				desc = L["Add button to Dressing Room frame with ability to undress model."],
				get = function(info) return E.db.enhanced.general.undressButton end,
				set = function(info, value) E.db.enhanced.general.undressButton = value E:GetModule("Enhanced_UndressButtons"):ToggleState() end
			},
			alreadyKnown = {
				order = 12,
				type = "toggle",
				name = L["Already Known"],
				desc = L["Change color of item icons which already known."],
				get = function(info) return E.db.enhanced.general.alreadyKnown end,
				set = function(info, value) E.db.enhanced.general.alreadyKnown = value E:GetModule("Enhanced_AlreadyKnown"):ToggleState() end
			},
			altBuyMaxStack = {
				order = 13,
				type = "toggle",
				name = L["Alt-Click Merchant"],
				desc = L["Holding Alt key while buying something from vendor will now buy an entire stack."],
				get = function(info) return E.db.enhanced.general.altBuyMaxStack end,
				set = function(info, value) E.db.enhanced.general.altBuyMaxStack = value M:BuyStackToggle() end
			},
			merchantItemLevel = {
				order = 14,
				type = "toggle",
				name = L["Merchant ItemLevel"],
				desc = L["Display the item level on the MerchantFrame, to change the font you have to set it in ElvUI - Bags - ItemLevel"],
				get = function(info) return E.db.enhanced.general.merchantItemLevel end,
				set = function(info, value) E.db.enhanced.general.merchantItemLevel = value M:MerchantItemLevel() end
			},
			questItemLevel = {
				order = 15,
				type = "toggle",
				name = L["Quest ItemLevel"],
				desc = L["Display the item level on the Quest frames, to change the font you have to set it in ElvUI - Bags - ItemLevel"],
				get = function(info) return E.db.enhanced.general.questItemLevel end,
				set = function(info, value) E.db.enhanced.general.questItemLevel = value M:QuestItemLevel() E:StaticPopup_Show("PRIVATE_RL") end
			},
			moverTransparancy = {
				order = 16,
				type = "range",
				isPercent = true,
				name = L["Mover Transparency"],
				desc = L["Changes the transparency of all the movers."],
				min = 0, max = 1, step = 0.01,
				get = function(info) return E.db.enhanced.general.moverTransparancy end,
				set = function(info, value) E.db.enhanced.general.moverTransparancy = value M:UpdateMoverTransparancy() end
			}
		}
	}
	return config
end

-- Actionbars
local function ActionbarOptions()
	local AB = E:GetModule("ActionBars")
	local EAB = E:GetModule("Enhanced_ActionBars")
	local ETAB = E:GetModule("Enhanced_TransparentActionbars")

	local config = {
		order = 2,
		type = "group",
		name = L["ActionBars"],
		childGroups = "tab",
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["ActionBars"])
			},
			general = {
				order = 2,
				type = "group",
				name = L["General"],
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["General"],
					},
					transparentActionbars = {
						order = 2,
						type = "group",
						name = L["Transparent ActionBars"],
						guiInline = true,
						get = function(info) return E.db.enhanced.actionbars.transparentActionbars[ info[#info] ] end,
						set = function(info, value) E.db.enhanced.actionbars.transparentActionbars[ info[#info] ] = value end,
						args = {
							transparentBackdrops = {
								order = 1,
								type = "toggle",
								name = L["Transparent Backdrop"],
								desc = L["Sets actionbars backgrounds to transparent template."],
								set = function(info, value) E.db.enhanced.actionbars.transparentActionbars[ info[#info] ] = value ETAB:StyleBackdrops() end
							},
							transparentButtons = {
								order = 2,
								type = "toggle",
								name = L["Transparent Buttons"],
								desc = L["Sets actionbars buttons backgrounds to transparent template."],
								set = function(info, value) E.db.enhanced.actionbars.transparentActionbars[ info[#info] ] = value ETAB:StyleBackdrops() end
							}
						},
						disabled = function() return not E.private.actionbar.enable end
					},
					equipped = {
						order = 3,
						type = "group",
						name = L["Equipped Item Border"],
						guiInline = true,
						args = {
							equipped = {
								order = 1,
								type = "toggle",
								name = L["Enable"],
								get = function(info) return E.db.enhanced.actionbars[ info[#info] ] end,
								set = function(info, value) E.db.enhanced.actionbars[ info[#info] ] = value EAB:UpdateCallback() AB:UpdateButtonSettings() end
							},
							equippedColor = {
								order = 2,
								type = "color",
								name = L["Border Color"],
								get = function(info)
									local t = E.db.enhanced.actionbars[ info[#info] ]
									local d = P.enhanced.actionbars[ info[#info] ]
									return t.r, t.g, t.b, t.a, d.r, d.g, d.b
								end,
								set = function(info, r, g, b)
									local t = E.db.enhanced.actionbars[ info[#info] ]
									t.r, t.g, t.b = r, g, b
									AB:UpdateButtonSettings()
								end,
								disabled = function() return not E.db.enhanced.actionbars.equipped end
							}
						},
						disabled = function() return not E.private.actionbar.enable end
					}
				}
			},
			pet = {
				order = 3,
				type = "group",
				name = L["Pet Bar"],
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Pet Bar"],
					},
					checked = {
						order = 2,
						type = "group",
						name = L["Checked Border"],
						guiInline = true,
						args = {
							checkedBorder = {
								order = 1,
								type = "toggle",
								name = L["Enable"],
								desc = L["Replaces the checked textures with colored borders."],
								get = function(info) return E.db.enhanced.actionbars.pet[ info[#info] ] end,
								set = function(info, value) E.db.enhanced.actionbars.pet[ info[#info] ] = value AB:UpdatePet() end
							},
							checkedBorderColor = {
								order = 2,
								type = "color",
								name = L["Border Color"],
								get = function(info)
									local t = E.db.enhanced.actionbars.pet[ info[#info] ]
									local d = P.enhanced.actionbars.pet[ info[#info] ]
									return t.r, t.g, t.b, t.a, d.r, d.g, d.b
								end,
								set = function(info, r, g, b)
									local t = E.db.enhanced.actionbars.pet[ info[#info] ]
									t.r, t.g, t.b = r, g, b
									AB:UpdatePet()
								end,
								disabled = function() return not E.db.enhanced.actionbars.pet.checkedBorder end
							}
						},
						disabled = function() return not E.private.actionbar.enable or not E.db.actionbar.barPet.enabled end
					},
					autoCast = {
						order = 3,
						type = "group",
						name = L["AutoCast Border"],
						guiInline = true,
						args = {
							autoCastBorder = {
								order = 1,
								type = "toggle",
								name = L["Enable"],
								desc = L["Replaces the auto cast textures with colored borders."],
								get = function(info) return E.db.enhanced.actionbars.pet[ info[#info] ] end,
								set = function(info, value) E.db.enhanced.actionbars.pet[ info[#info] ] = value AB:UpdatePet() end
							},
							autoCastBorderColor = {
								order = 2,
								type = "color",
								name = L["Border Color"],
								get = function(info)
									local t = E.db.enhanced.actionbars.pet[ info[#info] ]
									local d = P.enhanced.actionbars.pet[ info[#info] ]
									return t.r, t.g, t.b, t.a, d.r, d.g, d.b
								end,
								set = function(info, r, g, b)
									local t = E.db.enhanced.actionbars.pet[ info[#info] ]
									t.r, t.g, t.b = r, g, b
									AB:UpdatePet()
								end,
								disabled = function() return not E.db.enhanced.actionbars.pet.autoCastBorder end
							}
						},
						disabled = function() return not E.private.actionbar.enable or not E.db.actionbar.barPet.enabled end
					}
				}
			}
		}
	}
	return config
end

-- Chat
local function ChatOptions()
	local config = {
		order = 3,
		type = "group",
		name = L["Chat"],
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["Chat"])
			},
			dpsLinks = {
				order = 2,
				type = "toggle",
				name = L["Filter DPS meters Spam"],
				desc = L["Replaces long reports from damage meters with a clickable hyperlink to reduce chat spam.\nWorks correctly only with general reports such as DPS or HPS. May fail to filter te report of other things"],
				get = function(info) return E.db.enhanced.chat.dpsLinks end,
				set = function(info, value) E.db.enhanced.chat.dpsLinks = value E:GetModule("Enhanced_DPSLinks"):UpdateSettings() end
			}
		}
	}
	return config
end

-- Datatext
local function DataTextsOptions()
	local DTC = E:GetModule("DataTextColors")

	local config = {
		order = 4,
		type = "group",
		name = L["DataTexts"],
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["DataTexts"])
			},
			timeColorEnch = {
				order = 2,
				type = "toggle",
				name = L["Enhanced Time Color"],
				get = function(info) return E.db.enhanced.datatexts.timeColorEnch end,
				set = function(info, value) E.db.enhanced.datatexts.timeColorEnch = value E:GetModule("Enhanced_DatatextTime"):UpdateSettings() end
			},
			datatextColor = {
				order = 3,
				type = "group",
				name = L["DataText Color"],
				guiInline = true,
				args = {
					enable = {
						order = 1,
						type = "toggle",
						name = L["Enable"],
						get = function(info) return E.db.enhanced.datatexts.datatextColor.enable end,
						set = function(info, value) E.db.enhanced.datatexts.datatextColor.enable = value DTC:ColorFont() end
					},
					color = {
						order = 2,
						type = "select",
						name = L["DataText Color"],
						values = {
							["CLASS"] = L["Class"],
							["CUSTOM"] = L["Custom"],
							["VALUE"] = L["Value Color"]
						},
						get = function(info) return E.db.enhanced.datatexts.datatextColor.color end,
						set = function(info, value) E.db.enhanced.datatexts.datatextColor.color = value DTC:ColorFont() end
					},
					custom = {
						order = 3,
						type = "color",
						name = L["Color"],
						disabled = function() return E.db.enhanced.datatexts.datatextColor.color == "CLASS" or E.db.enhanced.datatexts.datatextColor.color == "VALUE" end,
						get = function(info)
							local t = E.db.enhanced.datatexts.datatextColor.custom
							local d = P.enhanced.datatexts.datatextColor.custom
							return t.r, t.g, t.b, t.a, d.r, d.g, d.b, d.a
						end,
						set = function(info, r, g, b)
							local t = E.db.enhanced.datatexts.datatextColor.custom
							t.r, t.g, t.b, t.a = r, g, b, a
							DTC:ColorFont()
						end
					}
				}
			}
		}
	}
	return config
end

-- Minimap
local function MinimapOptions()
	local config = {
		order = 5,
		type = "group",
		name = L["Minimap"],
		get = function(info) return E.db.enhanced.minimap[info[#info]] end,
		set = function(info, value) E.db.enhanced.minimap[info[#info]] = value E:GetModule("Minimap"):UpdateSettings() end,
		disabled = function() return not E.private.general.minimap.enable end,
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["Minimap"])
			},
			location = {
				order = 2,
				type = "toggle",
				name = L["Location Panel"],
				desc = L["Toggle Location Panel."],
				set = function(info, value)
					E.db.enhanced.minimap[info[#info]] = value
					E:GetModule("Enhanced_MinimapLocation"):UpdateSettings()
				end
			},
			locationdigits = {
				order = 3,
				type = "range",
				name = L["Location Digits"],
				desc = L["Number of digits for map location."],
				min = 0, max = 2, step = 1,
				disabled = function() return not (E.db.enhanced.minimap.location and E.db.general.minimap.locationText == "ABOVE") end
			},
			hideincombat = {
				order = 4,
				type = "toggle",
				name = L["Combat Hide"],
				desc = L["Hide minimap while in combat."],
			},
			fadeindelay = {
				order = 5,
				type = "range",
				name = L["FadeIn Delay"],
				desc = L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"],
				min = 0, max = 20, step = 1,
				disabled = function() return not E.db.enhanced.minimap.hideincombat end
			}
		}
	}
	E.Options.args.maps.args.minimap.args.locationTextGroup.args.locationText.values = {
		["MOUSEOVER"] = L["Minimap Mouseover"],
		["SHOW"] = L["Always Display"],
		["ABOVE"] = ColorizeSettingName(L["Above Minimap"]),
		["HIDE"] = L["Hide"]
	}
	config.args.locationText = E.Options.args.maps.args.minimap.args.locationTextGroup.args.locationText
	return config
end

-- Nameplates
local function NamePlatesOptions()
	local config = {
		order = 6,
		type = "group",
		name = L["NamePlates"],
		get = function(info) return E.db.enhanced.nameplates[info[#info]] end,
		args = {
			header = {
				order = 0,
				type = "header",
				name = ColorizeSettingName(L["NamePlates"])
			},
			cacheUnitClass = {
				order = 1,
				type = "toggle",
				name = L["Cache Unit Class"],
				set = function(info, value) E.db.enhanced.nameplates[info[#info]] = value E:GetModule("Enhanced_NamePlates"):CacheUnitClass() E:GetModule("NamePlates"):ConfigureAll() end
			},
			smoothBars = {
				order = 2,
				type = "group",
				name = L["Smooth Bars"],
				get = function(info) return E.db.enhanced.nameplates.smoothBars[info[#info]] end,
				guiInline = true,
				args = {
					enable = {
						order = 1,
						type = "toggle",
						name = L["Enable"],
						desc = L["Bars will transition smoothly."],
						set = function(info, value) E.db.enhanced.nameplates.smoothBars[ info[#info] ] = value E:GetModule("NamePlates"):ConfigureAll() end
					},
					smoothSpeed = {
						order = 2,
						type = "range",
						name = L["Animation Speed"],
						desc = L["Speed in seconds"],
						min = 0.1, max = 3, step = 0.10,
						disabled = function() return not E.db.enhanced.nameplates.smoothBars.enable end,
						set = function(info, value) E.db.enhanced.nameplates.smoothBars[ info[#info] ] = value E:GetModule("NamePlates"):ConfigureAll() end
					}
				}
			}
		}
	}

	return config
end

-- Tooltip
local function TooltipOptions()
	local config = {
		order = 7,
		type = "group",
		name = L["Tooltip"],
		get = function(info) return E.db.enhanced.tooltip[info[#info]] end,
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["Tooltip"])
			},
			itemQualityBorderColor = {
				order = 2,
				type = "toggle",
				name = L["Item Border Color"],
				desc = L["Colorize the tooltip border based on item quality."],
				get = function(info) return E.db.enhanced.tooltip.itemQualityBorderColor end,
				set = function(info, value) E.db.enhanced.tooltip.itemQualityBorderColor = value E:GetModule("Enhanced_ItemBorderColor"):ToggleState() end
			},
			progressInfo = {
				order = 3,
				type = "toggle",
				name = L["Progression Info"],
				desc = L["Display the players raid progression in the tooltip, this may not immediately update when mousing over a unit."],
				get = function(info) return E.db.enhanced.tooltip.progressInfo end,
				set = function(info, value) E.db.enhanced.tooltip.progressInfo = value end
			},
			tooltipIcon = {
				order = 4,
				type = "group",
				name = L["Tooltip Icon"],
				guiInline = true,
				args = {
					tooltipIcon = {
						order = 1,
						type = "toggle",
						name = L["Enable"],
						desc = L["Show/Hides an Icon for Spells and Items on the Tooltip."],
						get = function(info) return E.db.enhanced.tooltip.tooltipIcon.enable end,
						set = function(info, value)
							E.db.enhanced.tooltip.tooltipIcon.enable = value
							E:GetModule("Enhanced_TooltipIcon"):ToggleItemsState()
							E:GetModule("Enhanced_TooltipIcon"):ToggleSpellsState()
							E:GetModule("Enhanced_TooltipIcon"):ToggleAchievementsState()
						end
					},
					spacer = {
						order = 2,
						type = "description",
						name = "",
						width = "full"
					},
					tooltipIconSpells = {
						order = 3,
						type = "toggle",
						name = SPELLS,
						desc = L["Show/Hides an Icon for Spells on the Tooltip."],
						get = function(info) return E.db.enhanced.tooltip.tooltipIcon.tooltipIconSpells end,
						set = function(info, value)
							E.db.enhanced.tooltip.tooltipIcon.tooltipIconSpells = value
							E:GetModule("Enhanced_TooltipIcon"):ToggleSpellsState()
						end,
						disabled = function() return not E.db.enhanced.tooltip.tooltipIcon.enable end
					},
					tooltipIconItems = {
						order = 4,
						type = "toggle",
						name = ITEMS,
						desc = L["Show/Hides an Icon for Items on the Tooltip."],
						get = function(info) return E.db.enhanced.tooltip.tooltipIcon.tooltipIconItems end,
						set = function(info, value)
							E.db.enhanced.tooltip.tooltipIcon.tooltipIconItems = value
							E:GetModule("Enhanced_TooltipIcon"):ToggleItemsState()
						end,
						disabled = function() return not E.db.enhanced.tooltip.tooltipIcon.enable end
					},
					tooltipIconAchievements = {
						order = 5,
						type = "toggle",
						name = ACHIEVEMENTS,
						desc = L["Show/Hides an Icon for Achievements on the Tooltip."],
						get = function(info) return E.db.enhanced.tooltip.tooltipIcon.tooltipIconAchievements end,
						set = function(info, value)
							E.db.enhanced.tooltip.tooltipIcon.tooltipIconAchievements = value
							E:GetModule("Enhanced_TooltipIcon"):ToggleAchievementsState()
						end,
						disabled = function() return not E.db.enhanced.tooltip.tooltipIcon.enable end
					}
				}
			}
		}
	}
	return config
end

-- WatchFrame
local function WatchFrameOptions()
	local WF = E:GetModule("Enhanced_WatchFrame")

	local choices = {
		["NONE"] = L["None"],
		["COLLAPSED"] = L["Collapsed"],
		["HIDDEN"] = L["Hidden"]
	}

	local config = {
		order = 8,
		type = "group",
		name = L["Objective Frame"],
		get = function(info) return E.db.enhanced.watchframe[info[#info]] end,
		set = function(info, value) E.db.enhanced.watchframe[info[#info]] = value WF:UpdateSettings() end,
		args = {
			header = {
				order = 0,
				type = "header",
				name = ColorizeSettingName(L["Objective Frame"])
			},
			intro = {
				order = 1,
				type = "description",
				name = L["WATCHFRAME_DESC"]
			},
			enable = {
				order = 2,
				type = "toggle",
				name = L["Enable"]
			},
			settings = {
				order = 3,
				type = "group",
				name = L["Visibility State"],
				guiInline = true,
				get = function(info) return E.db.enhanced.watchframe[info[#info]] end,
				set = function(info, value) E.db.enhanced.watchframe[info[#info]] = value WF:ChangeState() end,
				disabled = function() return not E.db.enhanced.watchframe.enable end,
				args = {
					city = {
						order = 1,
						type = "select",
						name = L["City (Resting)"],
						values = choices
					},
					pvp = {
						order = 2,
						type = "select",
						name = L["PvP"],
						values = choices
					},
					arena = {
						order = 3,
						type = "select",
						name = L["Arena"],
						values = choices
					},
					party = {
						order = 4,
						type = "select",
						name = L["Party"],
						values = choices
					},
					raid = {
						order = 5,
						type = "select",
						name = L["Raid"],
						values = choices
					}
				}
			}
		}
	}
	return config
end

-- Unitframes
local function UnitFramesOptions()
	-- Player Detached Portrait
	E.Options.args.unitframe.args.player.args.portrait.args.spacer = {
		order = 9,
		type = "description",
		name = "",
		width = "full"
	}
	E.Options.args.unitframe.args.player.args.portrait.args.detachFromFrame = {
		order = 10,
		type = "toggle",
		name = ColorizeSettingName(L["Detach From Frame"])
	}
	E.Options.args.unitframe.args.player.args.portrait.args.detachedWidth = {
		order = 11,
		type = "range",
		name = ColorizeSettingName(L["Detached Width"]),
		min = 10, max = 600, step = 1,
		disabled = function() return not E.db.unitframe.units.player.portrait.detachFromFrame end
	}
	E.Options.args.unitframe.args.player.args.portrait.args.detachedHeight = {
		order = 12,
		type = "range",
		name = ColorizeSettingName(L["Detached Height"]),
		min = 10, max = 600, step = 1,
		disabled = function() return not E.db.unitframe.units.player.portrait.detachFromFrame end
	}

	-- Target Detached Portrait
	E.Options.args.unitframe.args.target.args.portrait.args.spacer = {
		order = 9,
		type = "description",
		name = "",
		width = "full"
	}
	E.Options.args.unitframe.args.target.args.portrait.args.detachFromFrame = {
		order = 10,
		type = "toggle",
		name = ColorizeSettingName(L["Detach From Frame"])
	}
	E.Options.args.unitframe.args.target.args.portrait.args.detachedWidth = {
		order = 11,
		type = "range",
		name = ColorizeSettingName(L["Detached Width"]),
		min = 10, max = 600, step = 1,
		disabled = function() return not E.db.unitframe.units.target.portrait.detachFromFrame end
	}
	E.Options.args.unitframe.args.target.args.portrait.args.detachedHeight = {
		order = 12,
		type = "range",
		name = ColorizeSettingName(L["Detached Height"]),
		min = 10, max = 600, step = 1,
		disabled = function() return not E.db.unitframe.units.target.portrait.detachFromFrame end
	}
end

-- Farmer
local function FarmerOptions()
	local F = E:GetModule("Farmer")

	local config = {
		order = 10,
		type = "group",
		name = L["Farmer"],
		get = function(info) return E.private.farmer[ info[#info] ] end,
		set = function(info, value) E.private.farmer[ info[#info] ] = value end,
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["Farmer"])
			},
			intro = {
				order = 2,
				type = "description",
				name = L["FARMER_DESC"]
			},
			enabled = {
				order = 3,
				type = "toggle",
				name = L["Enable"],
				set = function(info, value) E.private.farmer.enabled = value E:StaticPopup_Show("PRIVATE_RL") end
			},
			farmbars = {
				order = 4,
				type = "group",
				name = L["Farmer Bars"],
				guiInline = true,
				disabled = function() return not E.private.farmer.enabled end,
				get = function(info) return E.private.farmer.farmbars[ info[#info] ] end,
				set = function(info, value) E.private.farmer.farmbars[ info[#info] ] = value end,
				args = {
					enable = {
						type = "toggle",
						order = 1,
						name = L["Enable"],
						desc = L["Enable/Disable the farmer bars."],
						set = function(info, value) E.private.farmer.farmbars.enable = value F:UpdateLayout() end
					},
					onlyactive = {
						order = 2,
						type = "toggle",
						name = L["Only active buttons"],
						desc = L["Only show the buttons for the seeds, portals, tools you have in your bags."],
						set = function(info, value) E.private.farmer.farmbars.onlyactive = value F:UpdateLayout() end,
						disabled = function() return not E.private.farmer.farmbars.enable end
					},
					droptools = {
						order = 3,
						type = "toggle",
						name = L["Drop Tools"],
						desc = L["Automatically drop tools from your bags when leaving the farming area."],
						disabled = function() return not E.private.farmer.farmbars.enable end
					},
					seedbardirection = {
						order = 4,
						type = "select",
						name = L["Seed Bar Direction"],
						desc = L["The direction of the seed bar buttons (Horizontal or Vertical)."],
						set = function(info, value) E.private.farmer.farmbars.seedbardirection = value F:UpdateLayout() end,
						disabled = function() return not E.private.farmer.farmbars.enable end,
						values = {
							["VERTICAL"] = L["Vertical"],
							["HORIZONTAL"] = L["Horizontal"]
						}
					}
				}
			}
		}
	}

	return config
end

local function UnitFrameOptions()
	local TC = E:GetModule("Enhanced_TargetClass")

	local config = {
		order = 9,
		type = "group",
		name = L["UnitFrames"],
		childGroups = "tab",
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["UnitFrames"])
			},
			player = {
				order = 2,
				type = "group",
				name = L["Player"],
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Player"]
					},
					animatedLoss = {
						order = 2,
						type = "group",
						name = L["Animated Loss"],
						get = function(info) return E.db.unitframe.units.player.animatedLoss[ info[#info] ] end,
						set = function(info, value) E.db.unitframe.units.player.animatedLoss[ info[#info] ] = value E:GetModule("UnitFrames"):CreateAndUpdateUF("player") end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Animated Loss"]
							},
							enable = {
								order = 2,
								type = "toggle",
								name = L["Enable"]
							},
							spacer = {
								order = 3,
								type = "description",
								name = " "
							},
							duration = {
								order = 4,
								type = "range",
								name = L["Duration"],
								min = 0.01, max = 1.50, step = 0.01,
								disabled = function() return not E.db.unitframe.units.player.animatedLoss.enable end
							},
							startDelay = {
								order = 5,
								type = "range",
								name = L["Start Delay"],
								min = 0.01, max = 1.00, step = 0.01,
								disabled = function() return not E.db.unitframe.units.player.animatedLoss.enable end
							},
							pauseDelay = {
								order = 6,
								type = "range",
								name = L["Pause Delay"],
								min = 0.01, max = 0.30, step = 0.01,
								disabled = function() return not E.db.unitframe.units.player.animatedLoss.enable end
							},
							postponeDelay = {
								order = 7,
								type = "range",
								name = L["Postpone Delay"],
								min = 0.01, max = 0.30, step = 0.01,
								disabled = function() return not E.db.unitframe.units.player.animatedLoss.enable end
							}
						}
					},
					detachPortrait = {
						order = 3,
						type = "group",
						name = L["Portrait"],
						get = function(info) return E.db.unitframe.units.player.portrait[ info[#info] ] end,
						set = function(info, value) E.db.unitframe.units.player.portrait[ info[#info] ] = value E:GetModule("UnitFrames"):CreateAndUpdateUF("player") end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Portrait"]
							},
							detachFromFrame = {
								order = 2,
								type = "toggle",
								name = L["Detach From Frame"],
								disabled = function() return not E.db.unitframe.units.player.portrait.enable end
							},
							spacer = {
								order = 3,
								type = "description",
								name = " "
							},
							detachedWidth = {
								order = 4,
								type = "range",
								name = L["Detached Width"],
								min = 10, max = 600, step = 1,
								disabled = function() return not E.db.unitframe.units.player.portrait.enable end
							},
							detachedHeight = {
								order = 5,
								type = "range",
								name = L["Detached Height"],
								min = 10, max = 600, step = 1,
								disabled = function() return not E.db.unitframe.units.player.portrait.enable end
							}
						}
					}
				}
			},
			target = {
				order = 3,
				type = "group",
				name = L["Target"],
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Target"]
					},
					classIcon = {
						order = 2,
						type = "group",
						name = L["Class Icons"],
						args = {
							header = {
								order = 0,
								type = "header",
								name = L["Class Icons"]
							},
							enable = {
								order = 1,
								type = "toggle",
								name = L["Enable"],
								desc = L["Show class icon for units."],
								get = function(info) return E.db.enhanced.unitframe.units.target.classicon.enable end,
								set = function(info, value) E.db.enhanced.unitframe.units.target.classicon.enable = value TC:ToggleSettings() end
							},
							spacer = {
								order = 2,
								type = "description",
								name = " "
							},
							size = {
								order = 3,
								type = "range",
								name = L["Size"],
								desc = L["Size of the indicator icon."],
								min = 16, max = 40, step = 1,
								get = function(info) return E.db.enhanced.unitframe.units.target.classicon.size end,
								set = function(info, value) E.db.enhanced.unitframe.units.target.classicon.size = value TC:ToggleSettings() end,
								disabled = function() return not E.db.enhanced.unitframe.units.target.classicon.enable end
							},
							xOffset = {
								order = 4,
								type = "range",
								name = L["xOffset"],
								min = -100, max = 100, step = 1,
								get = function(info) return E.db.enhanced.unitframe.units.target.classicon.xOffset end,
								set = function(info, value) E.db.enhanced.unitframe.units.target.classicon.xOffset = value TC:ToggleSettings() end,
								disabled = function() return not E.db.enhanced.unitframe.units.target.classicon.enable end
							},
							yOffset = {
								order = 5,
								type = "range",
								name = L["yOffset"],
								min = -80, max = 40, step = 1,
								get = function(info) return E.db.enhanced.unitframe.units.target.classicon.yOffset end,
								set = function(info, value) E.db.enhanced.unitframe.units.target.classicon.yOffset = value TC:ToggleSettings() end,
								disabled = function() return not E.db.enhanced.unitframe.units.target.classicon.enable end
							}
						}
					},
					detachPortrait = {
						order = 3,
						type = "group",
						name = L["Portrait"],
						get = function(info) return E.db.unitframe.units.target.portrait[ info[#info] ] end,
						set = function(info, value) E.db.unitframe.units.target.portrait[ info[#info] ] = value E:GetModule("UnitFrames"):CreateAndUpdateUF("target") end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Portrait"]
							},
							detachFromFrame = {
								order = 2,
								type = "toggle",
								name = L["Detach From Frame"],
								disabled = function() return not E.db.unitframe.units.target.portrait.enable end
							},
							spacer = {
								order = 3,
								type = "description",
								name = " "
							},
							detachedWidth = {
								order = 4,
								type = "range",
								name = L["Detached Width"],
								min = 10, max = 600, step = 1,
								disabled = function() return not E.db.unitframe.units.target.portrait.enable end
							},
							detachedHeight = {
								order = 5,
								type = "range",
								name = L["Detached Height"],
								min = 10, max = 600, step = 1,
								disabled = function() return not E.db.unitframe.units.target.portrait.enable end
							}
						}
					}
				}
			}
		}
	}
	return config
end

-- Misc
local function MiscOptions()
	local PD = E:GetModule("Enhanced_PaperDoll")
	local BI = E:GetModule("Enhanced_BagInfo")
	local RM = E:GetModule("RaidMarkerBar")

	local choices = {
		["NONE"] = L["None"],
		["HIDDEN"] = L["Hidden"]
	}

	local config = {
		order = 9,
		type = "group",
		name = L["Miscellaneous"],
		childGroups = "tab",
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["Miscellaneous"])
			},
			equipment = {
				order = 2,
				type = "group",
				name = L["Equipment"],
				childGroups = "tab",
				get = function(info) return E.db.enhanced.equipment[info[#info]] end,
				set = function(info, value) E.db.enhanced.equipment[info[#info]] = value end,
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Equipment"]
					},
					durability = {
						order = 2,
						type = "group",
						name = L["Durability"],
						get = function(info) return E.db.enhanced.equipment.durability[info[#info]] end,
						set = function(info, value) E.db.enhanced.equipment.durability[info[#info]] = value PD:UpdatePaperDoll() end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Durability"]
							},
							info = {
								order = 2,
								type = "description",
								name = L["DURABILITY_DESC"]
							},
							enable = {
								order = 3,
								type = "toggle",
								name = L["Enable"],
								desc = L["Enable/Disable the display of durability information on the character screen."],
								disabled = function() return not E.db.enhanced.equipment.enable end
							},
							onlydamaged = {
								order = 4,
								type = "toggle",
								name = L["Damaged Only"],
								desc = L["Only show durabitlity information for items that are damaged."],
								disabled = function() return not E.db.enhanced.equipment.durability.enable end
							},
							spacer = {
								order = 5,
								type = "description",
								name = " "
							},
							position = {
								order = 6,
								type = "select",
								name = L["Position"],
								values = {
									["TOP"] = "TOP",
									["TOPLEFT"] = "TOPLEFT",
									["TOPRIGHT"] = "TOPRIGHT",
									["BOTTOM"] = "BOTTOM",
									["BOTTOMLEFT"] = "BOTTOMLEFT",
									["BOTTOMRIGHT"] = "BOTTOMRIGHT"
								},
								disabled = function() return not E.db.enhanced.equipment.durability.enable end
							},
							xOffset = {
								order = 7,
								type = "range",
								name = L["X-Offset"],
								min = -50, max = 50, step = 1,
								disabled = function() return not E.db.enhanced.equipment.durability.enable end
							},
							yOffset = {
								order = 8,
								type = "range",
								name = L["Y-Offset"],
								min = -50, max = 50, step = 1,
								disabled = function() return not E.db.enhanced.equipment.durability.enable end
							},
							font = {
								order = 9,
								type = "select",
								dialogControl = "LSM30_Font",
								name = L["Font"],
								values = AceGUIWidgetLSMlists.font,
								disabled = function() return not E.db.enhanced.equipment.durability.enable end
							},
							fontSize = {
								order = 10,
								type = "range",
								name = L["Font Size"],
								min = 6, max = 36, step = 1,
								disabled = function() return not E.db.enhanced.equipment.durability.enable end
							},
							fontOutline = {
								order = 11,
								type = "select",
								name = L["Font Outline"],
								values = {
									["NONE"] = L["None"],
									["OUTLINE"] = "OUTLINE",
									["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
									["THICKOUTLINE"] = "THICKOUTLINE"
								},
								disabled = function() return not E.db.enhanced.equipment.durability.enable end
							}
						}
					},
					itemlevel = {
						order = 3,
						type = "group",
						name = L["Item Level"],
						get = function(info) return E.db.enhanced.equipment.itemlevel[info[#info]] end,
						set = function(info, value) E.db.enhanced.equipment.itemlevel[info[#info]] = value PD:UpdatePaperDoll() end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Item Level"]
							},
							info = {
								order = 2,
								type = "description",
								name = L["ITEMLEVEL_DESC"]
							},
							enable = {
								order = 3,
								type = "toggle",
								name = L["Enable"],
								desc = L["Enable/Disable the display of item levels on the character screen."],
								disabled = function() return not E.db.enhanced.equipment.enable end
							},
							qualityColor = {
								order = 4,
								type = "toggle",
								name = L["Quality Color"],
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable end
							},
							spacer = {
								order = 5,
								type = "description",
								name = " "
							},
							position = {
								order = 6,
								type = "select",
								name = L["Position"],
								values = {
									["TOP"] = "TOP",
									["TOPLEFT"] = "TOPLEFT",
									["TOPRIGHT"] = "TOPRIGHT",
									["BOTTOM"] = "BOTTOM",
									["BOTTOMLEFT"] = "BOTTOMLEFT",
									["BOTTOMRIGHT"] = "BOTTOMRIGHT"
								},
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable end
							},
							xOffset = {
								order = 7,
								type = "range",
								name = L["X-Offset"],
								min = -50, max = 50, step = 1,
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable end
							},
							yOffset = {
								order = 8,
								type = "range",
								name = L["Y-Offset"],
								min = -50, max = 50, step = 1,
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable end
							},
							font = {
								order = 9,
								type = "select",
								dialogControl = "LSM30_Font",
								name = L["Font"],
								values = AceGUIWidgetLSMlists.font,
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable end
							},
							fontSize = {
								order = 10,
								type = "range",
								name = L["Font Size"],
								min = 6, max = 36, step = 1,
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable end
							},
							fontOutline = {
								order = 11,
								type = "select",
								name = L["Font Outline"],
								values = {
									["NONE"] = L["None"],
									["OUTLINE"] = "OUTLINE",
									["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
									["THICKOUTLINE"] = "THICKOUTLINE"
								},
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable end
							}
						}
					},
					equipmentSet = {
						order = 4,
						type = "group",
						name = L["Equipment Set"],
						get = function(info) return E.db.enhanced.equipment.equipmentSet[info[#info]] end,
						set = function(info, value) E.db.enhanced.equipment.equipmentSet[info[#info]] = value BI:ToggleSettings() end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Equipment Set"]
							},
							info = {
								order = 2,
								type = "description",
								name = L["EQUIPMENTSET_DESC"]
							},
							enable = {
								order = 3,
								type = "toggle",
								name = L["Enable"],
								desc = L["Show the associated equipment sets for the items in your bags (or bank)."],
							},
							spacer = {
								order = 4,
								type = "description",
								name = " "
							},
							position = {
								order = 6,
								type = "select",
								name = L["Position"],
								values = {
									["TOP"] = "TOP",
									["CENTER"] = "CENTER",
									["BOTTOM"] = "BOTTOM"
								},
								disabled = function() return not E.db.enhanced.equipment.equipmentSet.enable end
							},
							xOffset = {
								order = 7,
								type = "range",
								name = L["X-Offset"],
								min = -50, max = 50, step = 1,
								disabled = function() return not E.db.enhanced.equipment.equipmentSet.enable end
							},
							yOffset = {
								order = 8,
								type = "range",
								name = L["Y-Offset"],
								min = -50, max = 50, step = 1,
								disabled = function() return not E.db.enhanced.equipment.equipmentSet.enable end
							},
							font = {
								order = 9,
								type = "select",
								dialogControl = "LSM30_Font",
								name = L["Font"],
								values = AceGUIWidgetLSMlists.font,
								disabled = function() return not E.db.enhanced.equipment.equipmentSet.enable end
							},
							fontSize = {
								order = 10,
								type = "range",
								name = L["Font Size"],
								min = 6, max = 36, step = 1,
								disabled = function() return not E.db.enhanced.equipment.equipmentSet.enable end
							},
							fontOutline = {
								order = 11,
								type = "select",
								name = L["Font Outline"],
								values = {
									["NONE"] = L["None"],
									["OUTLINE"] = "OUTLINE",
									["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
									["THICKOUTLINE"] = "THICKOUTLINE"
								},
								disabled = function() return not E.db.enhanced.equipment.equipmentSet.enable end
							}
						}
					}
				}
			},
			raidMarkerBar = {
				order = 3,
				type = "group",
				name = L["Raid Markers"],
				get = function(info) return E.db.enhanced.raidmarkerbar[ info[#info] ] end,	
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Raid Markers"]
					},
					enable = {
						order = 2,
						type = "toggle",
						name = L["Enable"],
						desc = L["Display a quick action bar for raid targets and world markers."],
						set = function(info, value) E.db.enhanced.raidmarkerbar.enable = value RM:Visibility() end
					},
					reverse = {
						order = 3,
						type = "toggle",
						name = L["Reverse"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value) E.db.enhanced.raidmarkerbar.reverse = value RM:UpdateBar() end
					},
					backdrop = {
						order = 4,
						type = "toggle",
						name = L["Backdrop"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value) E.db.enhanced.raidmarkerbar.backdrop = value RM:Backdrop() end
					},
					transparentButtons = {
						order = 5,
						type = "toggle",
						name = L["Transparent Buttons"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value) E.db.enhanced.raidmarkerbar.transparentButtons = value RM:ButtonBackdrop() end
					},
					transparentBackdrop = {
						order = 6,
						type = "toggle",
						name = L["Transparent Backdrop"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value) E.db.enhanced.raidmarkerbar.transparentBackdrop = value RM:Backdrop() end
					},
					spacer = {
						order = 7,
						type = "description",
						name = " "
					},
					buttonSize = {
						order = 8,
						type = "range",
						name = L["Button Size"],
						min = 16, max = 60, step = 1,
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value) E.db.enhanced.raidmarkerbar.buttonSize = value RM:UpdateBar() end
					},
					spacing = {
						order = 9,
						type = "range",
						name = L["Button Spacing"],
						min = -1, max = 20, step = 1,
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value) E.db.enhanced.raidmarkerbar.spacing = value RM:UpdateBar() end
					},
					orientation = {
						order = 10,
						type = "select",
						name = L["Orientation"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						values = {
							["HORIZONTAL"] = L["Horizontal"],
							["VERTICAL"] = L["Vertical"]
						},
						set = function(info, value) E.db.enhanced.raidmarkerbar.orientation = value RM:UpdateBar() end
					},
					visibility = {
						order = 11,
						type = "select",
						name = L["Visibility"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						values = {
							["DEFAULT"] = L["Default"],
							["INPARTY"] = L["In Party"],
							["ALWAYS"] = L["Always"],
							["CUSTOM"] = L["Custom"]
						},
						set = function(info, value) E.db.enhanced.raidmarkerbar.visibility = value RM:Visibility() end
					},
					customVisibility = {
						order = 12,
						type = "input",
						width = "full",
						name = L["Visibility State"],
						disabled = function() return E.db.enhanced.raidmarkerbar.visibility ~= "CUSTOM" or not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value) E.db.enhanced.raidmarkerbar.customVisibility = value RM:Visibility() end
					}
				}
			}
		}
	}

	return config
end

function addon:GetOptions()
	if not E.Options.args.elvuiPlugins then
		E.Options.args.elvuiPlugins = {
			order = 50,
			type = "group",
			name = "|cff00dd91E|r|cffe5e3e3lvUI |r|cff00dd91P|r|cffe5e3e3lugins|r",
			args = {
				header = {
					order = 0,
					type = "header",
					name = "|cff00dd91E|r|cffe5e3e3lvUI |r|cff00dd91P|r|cffe5e3e3lugins|r"
				},
				enhancedShortcut = {
					type = "execute",
					name = ColorizeSettingName(L["Enhanced"]),
					func = function()
						if IsAddOnLoaded("ElvUI_Config") then
							local ACD = LibStub("AceConfigDialog-3.0-ElvUI")
							ACD:SelectGroup("ElvUI", "elvuiPlugins", "enhanced", "generalGroup")
						end
					end
				}
			}
		}
	elseif not E.Options.args.elvuiPlugins.args.enhancedShortcut then
		E.Options.args.elvuiPlugins.args.enhancedShortcut = {
			type = "execute",
			name = ColorizeSettingName(L["Enhanced"]),
			func = function()
				if IsAddOnLoaded("ElvUI_Config") then
					local ACD = LibStub("AceConfigDialog-3.0-ElvUI")
					ACD:SelectGroup("ElvUI", "elvuiPlugins", "enhanced", "generalGroup")
				end
			end
		}
	end

	E.Options.args.elvuiPlugins.args.enhanced = {
		type = "group",
		name = ColorizeSettingName(L["Enhanced"]),
		childGroups = "tab",
		args = {
			header = {
				order = 0,
				type = "header",
				name = L["Enhanced"]
			},
			generalGroup = GeneralOptions(),
			actionbarGroup = ActionbarOptions(),
			chatGroup = ChatOptions(),
			datatextsGroup = DataTextsOptions(),
			minimapGroup = MinimapOptions(),
			namePlatesGroup = NamePlatesOptions(),
			tooltipGroup = TooltipOptions(),
			unitframesGroup = UnitFrameOptions(),
			watchFrameGroup = WatchFrameOptions(),
			farmerOptions = FarmerOptions(),
			miscGroup = MiscOptions()
		}
	}
end

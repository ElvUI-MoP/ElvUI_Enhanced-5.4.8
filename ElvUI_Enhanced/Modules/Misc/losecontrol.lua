local E, L, V, P, G = unpack(ElvUI)
local LOS = E:NewModule("LoseOfControl", "AceEvent-3.0")
local LSM = LibStub("LibSharedMedia-3.0")

local function SpellName(id)
	local name = GetSpellInfo(id)
	if not name then
		print("|cff1784d1ElvUI:|r SpellID is not valid: "..id..". Please check for an updated version, if none exists report to ElvUI author.")
		return "Impale"
	else
		return name
	end
end

G.loseofcontrol = { 
	-- Death Knight
	[SpellName(108194)] = "CC",			-- Asphyxiate
	[SpellName(115001)] = "CC",			-- Remorseless Winter
	[SpellName(47476)]  = "Silence",	-- Strangulate
	[SpellName(96294)]  = "Root",		-- Chains of Ice (Chilblains)
	[SpellName(45524)]  = "Snare",		-- Chains of Ice
	[SpellName(50435)]  = "Snare",		-- Chilblains
	--[SpellName(43265)]  = "Snare",	-- Death and Decay (Glyph of Death and Decay) - no way to distinguish between glyphed spell and normal. :(
	[SpellName(115000)] = "Snare",		-- Remorseless Winter
	[SpellName(115018)] = "Immune",		-- Desecrated Ground
	[SpellName(48707)]  = "ImmuneSpell",-- Anti-Magic Shell
	[SpellName(48792)]  = "Other",		-- Icebound Fortitude
	[SpellName(49039)]  = "Other",		-- Lichborne
	--[SpellName(51271)] = "Other",		-- Pillar of Frost
	-- Death Knight Ghoul
	[SpellName(91800)]  = "CC",			-- Gnaw
	[SpellName(91797)]  = "CC",			-- Monstrous Blow (Dark Transformation)
	[SpellName(91807)]  = "Root",		-- Shambling Rush (Dark Transformation)
	-- Druid
	[SpellName(113801)] = "CC",			-- Bash (Force of Nature - Feral Treants)
	[SpellName(102795)] = "CC",			-- Bear Hug
	[SpellName(33786)]  = "CC",			-- Cyclone
	[SpellName(99)]     = "CC",			-- Disorienting Roar
	[SpellName(2637)]   = "CC",			-- Hibernate
	[SpellName(22570)]  = "CC",			-- Maim
	[SpellName(5211)]   = "CC",			-- Mighty Bash
	[SpellName(9005)]   = "CC",			-- Pounce
	[SpellName(102546)] = "CC",			-- Pounce (Incarnation)
	[SpellName(114238)] = "Silence",	-- Fae Silence (Glyph of Fae Silence)
	[SpellName(81261)]  = "Silence",	-- Solar Beam
	[SpellName(339)]    = "Root",		-- Entangling Roots
	[SpellName(113770)] = "Root",		-- Entangling Roots (Force of Nature - Balance Treants)
	[SpellName(19975)]  = "Root",		-- Entangling Roots (Nature's Grasp)
	[SpellName(45334)]  = "Root",		-- Immobilized (Wild Charge - Bear)
	[SpellName(102359)] = "Root",		-- Mass Entanglement
	[SpellName(50259)]  = "Snare",		-- Dazed (Wild Charge - Cat)
	[SpellName(58180)]  = "Snare",		-- Infected Wounds
	[SpellName(61391)]  = "Snare",		-- Typhoon
	[SpellName(127797)] = "Snare",		-- Ursol's Vortex
	--[???] = "Snare",					-- Wild Mushroom: Detonate
	-- Druid Symbiosis
	[SpellName(110698)] = "CC",			-- Hammer of Justice (Paladin)
	[SpellName(113004)] = "CC",			-- Intimidating Roar [Fleeing in fear] (Warrior)
	[SpellName(113056)] = "CC",			-- Intimidating Roar [Cowering in fear] (Warrior)
	[SpellName(126458)] = "Disarm",		-- Grapple Weapon (Monk)
	[SpellName(110693)] = "Root",		-- Frost Nova (Mage)
	--[SpellName(110610)] = "Snare",	-- Ice Trap (Hunter)
	[SpellName(110617)] = "Immune",		-- Deterrence (Hunter)
	[SpellName(110715)] = "Immune",		-- Dispersion (Priest)
	[SpellName(110700)] = "Immune",		-- Divine Shield (Paladin)
	[SpellName(110696)] = "Immune",		-- Ice Block (Mage)
	[SpellName(110570)] = "ImmuneSpell",-- Anti-Magic Shell (Death Knight)
	[SpellName(110788)] = "ImmuneSpell",-- Cloak of Shadows (Rogue)
	[SpellName(113002)] = "ImmuneSpell",-- Spell Reflection (Warrior)
	[SpellName(110791)] = "Other",		-- Evasion (Rogue)
	[SpellName(110575)] = "Other",		-- Icebound Fortitude (Death Knight)
	[SpellName(122291)] = "Other",		-- Unending Resolve (Warlock)
	-- Hunter
	[SpellName(117526)] = "CC",			-- Binding Shot
	[SpellName(3355)]   = "CC",			-- Freezing Trap
	[SpellName(1513)]   = "CC",			-- Scare Beast
	[SpellName(19503)]  = "CC",			-- Scatter Shot
	[SpellName(19386)]  = "CC",			-- Wyvern Sting
	[SpellName(34490)]  = "Silence",	-- Silencing Shot
	[SpellName(19185)]  = "Root",		-- Entrapment
	[SpellName(64803)]  = "Root",		-- Entrapment
	[SpellName(128405)] = "Root",		-- Narrow Escape
	[SpellName(35101)]  = "Snare",		-- Concussive Barrage
	[SpellName(5116)]   = "Snare",		-- Concussive Shot
	[SpellName(61394)]  = "Snare",		-- Frozen Wake (Glyph of Freezing Trap)
	[SpellName(13810)]  = "Snare",		-- Ice Trap
	[SpellName(19263)]  = "Immune",		-- Deterrence
	-- Hunter Pets
	[SpellName(90337)]  = "CC",			-- Bad Manner (Monkey)
	[SpellName(24394)]  = "CC",			-- Intimidation
	[SpellName(126246)] = "CC",			-- Lullaby (Crane)
	[SpellName(126355)] = "CC",			-- Paralyzing Quill (Porcupine)
	[SpellName(126423)] = "CC",			-- Petrifying Gaze (Basilisk)
	[SpellName(50519)]  = "CC",			-- Sonic Blast (Bat)
	[SpellName(56626)]  = "CC",			-- Sting (Wasp)
	[SpellName(96201)]  = "CC",			-- Web Wrap (Shale Spider)
	[SpellName(50541)]  = "Disarm",		-- Clench (Scorpid)
	[SpellName(91644)]  = "Disarm",		-- Snatch (Bird of Prey)
	[SpellName(90327)]  = "Root",		-- Lock Jaw (Dog)
	[SpellName(50245)]  = "Root",		-- Pin (Crab)
	[SpellName(54706)]  = "Root",		-- Venom Web Spray (Silithid)
	[SpellName(4167)]   = "Root",		-- Web (Spider)
	[SpellName(50433)]  = "Snare",		-- Ankle Crack (Crocolisk)
	[SpellName(54644)]  = "Snare",		-- Frost Breath (Chimaera)
	[SpellName(54216)]  = "Other",		-- Master's Call (root and snare immune only)
	-- Mage
	[SpellName(118271)] = "CC",			-- Combustion Impact
	[SpellName(44572)]  = "CC",			-- Deep Freeze
	[SpellName(31661)]  = "CC",			-- Dragon's Breath
	[SpellName(118)]    = "CC",			-- Polymorph
	[SpellName(61305)]  = "CC",			-- Polymorph: Black Cat
	[SpellName(28272)]  = "CC",			-- Polymorph: Pig
	[SpellName(61721)]  = "CC",			-- Polymorph: Rabbit
	[SpellName(61780)]  = "CC",			-- Polymorph: Turkey
	[SpellName(28271)]  = "CC",			-- Polymorph: Turtle
	[SpellName(82691)]  = "CC",			-- Ring of Frost
	[SpellName(102051)] = "Silence",	-- Frostjaw (also a root)
	[SpellName(55021)]  = "Silence",	-- Silenced - Improved Counterspell
	[SpellName(122)]    = "Root",		-- Frost Nova
	[SpellName(111340)] = "Root",		-- Ice Ward
	[SpellName(121288)] = "Snare",		-- Chilled (Frost Armor)
	[SpellName(120)]    = "Snare",		-- Cone of Cold
	[SpellName(116)]    = "Snare",		-- Frostbolt
	[SpellName(44614)]  = "Snare",		-- Frostfire Bolt
	[SpellName(113092)] = "Snare",		-- Frost Bomb
	[SpellName(31589)]  = "Snare",		-- Slow
	[SpellName(45438)]  = "Immune",		-- Ice Block
	[SpellName(115760)] = "ImmuneSpell",-- Glyph of Ice Block
	-- Mage Water Elemental
	[SpellName(33395)]  = "Root",		-- Freeze
	-- Monk
	[SpellName(123393)] = "CC",			-- Breath of Fire (Glyph of Breath of Fire)
	[SpellName(126451)] = "CC",			-- Clash
	[SpellName(122242)] = "CC",			-- Clash (not sure which one is right)
	[SpellName(119392)] = "CC",			-- Charging Ox Wave
	[SpellName(120086)] = "CC",			-- Fists of Fury
	[SpellName(119381)] = "CC",			-- Leg Sweep
	[SpellName(115078)] = "CC",			-- Paralysis
	[SpellName(117368)] = "Disarm",		-- Grapple Weapon
	[SpellName(140023)] = "Disarm",		-- Ring of Peace
	[SpellName(137461)] = "Disarm",		-- Disarmed (Ring of Peace)
	[SpellName(137460)] = "Silence",	-- Silenced (Ring of Peace)
	[SpellName(116709)] = "Silence",	-- Spear Hand Strike
	[SpellName(116706)] = "Root",		-- Disable
	[SpellName(113275)] = "Root",		-- Entangling Roots (Symbiosis)
	[SpellName(123407)] = "Root",		-- Spinning Fire Blossom
	[SpellName(116095)] = "Snare",		-- Disable
	[SpellName(118585)] = "Snare",		-- Leer of the Ox
	[SpellName(123727)] = "Snare",		-- Dizzying Haze
	[SpellName(123586)] = "Snare",		-- Flying Serpent Kick
	[SpellName(131523)] = "ImmuneSpell",-- Zen Meditation
	-- Paladin
	[SpellName(105421)] = "CC",			-- Blinding Light
	[SpellName(115752)] = "CC",			-- Blinding Light (Glyph of Blinding Light)
	[SpellName(105593)] = "CC",			-- Fist of Justice
	[SpellName(853)]    = "CC",			-- Hammer of Justice
	[SpellName(119072)] = "CC",			-- Holy Wrath
	[SpellName(20066)]  = "CC",			-- Repentance
	[SpellName(10326)]  = "CC",			-- Turn Evil
	[SpellName(145067)] = "CC",			-- Turn Evil (Evil is a Point of View)
	[SpellName(31935)]  = "Silence",	-- Avenger's Shield
	[SpellName(110300)] = "Snare",		-- Burden of Guilt
	[SpellName(63529)]  = "Snare",		-- Dazed - Avenger's Shield
	[SpellName(20170)]  = "Snare",		-- Seal of Justice
	[SpellName(642)]    = "Immune",		-- Divine Shield
	[SpellName(31821)]  = "Other",		-- Aura Mastery
	[SpellName(1022)]   = "Other",		-- Hand of Protection
	-- Priest
	[SpellName(113506)] = "CC",			-- Cyclone (Symbiosis)
	[SpellName(605)]    = "CC",			-- Dominate Mind
	[SpellName(88625)]  = "CC",			-- Holy Word: Chastise
	[SpellName(64044)]  = "CC",			-- Psychic Horror
	[SpellName(8122)]   = "CC",			-- Psychic Scream
	[SpellName(113792)] = "CC",			-- Psychic Terror (Psyfiend)
	[SpellName(9484)]   = "CC",			-- Shackle Undead
	[SpellName(87204)]  = "CC",			-- Sin and Punishment
	[SpellName(15487)]  = "Silence",	-- Silence
	[SpellName(64058)]  = "Disarm",		-- Psychic Horror
	[SpellName(113275)] = "Root",		-- Entangling Roots (Symbiosis)
	[SpellName(87194)]  = "Root",		-- Glyph of Mind Blast
	[SpellName(114404)] = "Root",		-- Void Tendril's Grasp
	[SpellName(15407)]  = "Snare",		-- Mind Flay
	[SpellName(47585)]  = "Immune",		-- Dispersion
	[SpellName(114239)] = "ImmuneSpell",-- Phantasm
	-- Rogue
	[SpellName(2094)]   = "CC",			-- Blind
	[SpellName(1833)]   = "CC",			-- Cheap Shot
	[SpellName(1776)]   = "CC",			-- Gouge
	[SpellName(408)]    = "CC",			-- Kidney Shot
	[SpellName(113953)] = "CC",			-- Paralysis (Paralytic Poison)
	[SpellName(6770)]   = "CC",			-- Sap
	[SpellName(1330)]   = "Silence",	-- Garrote - Silence
	[SpellName(51722)]  = "Disarm",		-- Dismantle
	[SpellName(115197)] = "Root",		-- Partial Paralysis
	[SpellName(3409)]   = "Snare",		-- Crippling Poison
	[SpellName(26679)]  = "Snare",		-- Deadly Throw
	[SpellName(119696)] = "Snare",		-- Debilitation
	[SpellName(31224)]  = "ImmuneSpell",-- Cloak of Shadows
	[SpellName(45182)]  = "Other",		-- Cheating Death
	[SpellName(5277)]   = "Other",		-- Evasion
	--[SpellName(76577)]  = "Other",	-- Smoke Bomb
	[SpellName(88611)]  = "Other",		-- Smoke Bomb
	-- Shaman
	[SpellName(76780)]  = "CC",			-- Bind Elemental
	[SpellName(77505)]  = "CC",			-- Earthquake
	[SpellName(51514)]  = "CC",			-- Hex
	[SpellName(118905)] = "CC",			-- Static Charge (Capacitor Totem)
	[SpellName(113287)] = "Silence",	-- Solar Beam (Symbiosis)
	[SpellName(64695)]  = "Root",		-- Earthgrab (Earthgrab Totem)
	[SpellName(63685)]  = "Root",		-- Freeze (Frozen Power)
	[SpellName(3600)]   = "Snare",		-- Earthbind (Earthbind Totem)
	[SpellName(116947)] = "Snare",		-- Earthbind (Earthgrab Totem)
	[SpellName(77478)]  = "Snare",		-- Earthquake (Glyph of Unstable Earth)
	[SpellName(8034)]   = "Snare",		-- Frostbrand Attack
	[SpellName(8056)]   = "Snare",		-- Frost Shock
	[SpellName(51490)]  = "Snare",		-- Thunderstorm
	[SpellName(8178)]   = "ImmuneSpell",-- Grounding Totem Effect (Grounding Totem)
	-- Shaman Primal Earth Elemental
	[SpellName(118345)] = "CC",			-- Pulverize
	-- Warlock
	[SpellName(710)]    = "CC",			-- Banish
	[SpellName(137143)] = "CC",			-- Blood Horror
	[SpellName(54786)]  = "CC",			-- Demonic Leap (Metamorphosis)
	[SpellName(5782)]   = "CC",			-- Fear
	[SpellName(118699)] = "CC",			-- Fear
	[SpellName(130616)] = "CC",			-- Fear (Glyph of Fear)
	[SpellName(5484)]   = "CC",			-- Howl of Terror
	[SpellName(22703)]  = "CC",			-- Infernal Awakening
	[SpellName(6789)]   = "CC",			-- Mortal Coil
	[SpellName(132412)] = "CC",			-- Seduction (Grimoire of Sacrifice)
	[SpellName(30283)]  = "CC",			-- Shadowfury
	[SpellName(104045)] = "CC",			-- Sleep (Metamorphosis)
	[SpellName(132409)] = "Silence",	-- Spell Lock (Grimoire of Sacrifice)
	[SpellName(31117)]  = "Silence",	-- Unstable Affliction
	[SpellName(18223)]  = "Snare",		-- Curse of Exhaustion
	[SpellName(47960)]  = "Snare",		-- Shadowflame
	[SpellName(110913)] = "Other",		-- Dark Bargain
	[SpellName(104773)] = "Other",		-- Unending Resolve
	-- Warlock Pets
	[SpellName(89766)]  = "CC",			-- Axe Toss (Felguard/Wrathguard)
	[SpellName(115268)] = "CC",			-- Mesmerize (Shivarra)
	[SpellName(6358)]   = "CC",			-- Seduction (Succubus)
	[SpellName(115782)] = "Silence",	-- Optical Blast (Observer)
	[SpellName(24259)]  = "Silence",	-- Spell Lock (Felhunter)
	[SpellName(118093)] = "Disarm",		-- Disarm (Voidwalker/Voidlord)
	-- Warrior
	[SpellName(7922)]   = "CC",			-- Charge Stun
	[SpellName(118895)] = "CC",			-- Dragon Roar
	[SpellName(5246)]   = "CC",			-- Intimidating Shout (aoe)
	[SpellName(20511)]  = "CC",			-- Intimidating Shout (targeted)
	[SpellName(132168)] = "CC",			-- Shockwave
	[SpellName(107570)] = "CC",			-- Storm Bolt
	[SpellName(132169)] = "CC",			-- Storm Bolt
	[SpellName(18498)]  = "Silence",	-- Silenced - Gag Order (PvE only)
	[SpellName(676)]    = "Disarm",		-- Disarm
	[SpellName(107566)] = "Root",		-- Staggering Shout
	[SpellName(105771)] = "Root",		-- Warbringer
	[SpellName(147531)] = "Snare",		-- Bloodbath
	[SpellName(1715)]   = "Snare",		-- Hamstring
	[SpellName(12323)]  = "Snare",		-- Piercing Howl
	[SpellName(129923)] = "Snare",		-- Sluggish (Glyph of Hindering Strikes)
	[SpellName(137637)] = "Snare",		-- Warbringer
	[SpellName(46924)]  = "Immune",		-- Bladestorm
	[SpellName(23920)]  = "ImmuneSpell",-- Spell Reflection
	[SpellName(114028)] = "ImmuneSpell",-- Mass Spell Reflection
	[SpellName(18499)]  = "Other",		-- Berserker Rage
	-- Other
	[SpellName(30217)]  = "CC",			-- Adamantite Grenade
	[SpellName(67769)]  = "CC",			-- Cobalt Frag Bomb
	[SpellName(30216)]  = "CC",			-- Fel Iron Bomb
	[SpellName(107079)] = "CC",			-- Quaking Palm
	[SpellName(13327)]  = "CC",			-- Reckless Charge
	[SpellName(20549)]  = "CC",			-- War Stomp
	[SpellName(25046)]  = "Silence",	-- Arcane Torrent (Energy)
	[SpellName(28730)]  = "Silence",	-- Arcane Torrent (Mana)
	[SpellName(50613)]  = "Silence",	-- Arcane Torrent (Runic Power)
	[SpellName(69179)]  = "Silence",	-- Arcane Torrent (Rage)
	[SpellName(80483)]  = "Silence",	-- Arcane Torrent (Focus)
	[SpellName(129597)] = "Silence",	-- Arcane Torrent (Chi)
	[SpellName(39965)]  = "Root",		-- Frost Grenade
	[SpellName(55536)]  = "Root",		-- Frostweave Net
	[SpellName(13099)]  = "Root",		-- Net-o-Matic
	[SpellName(1604)]   = "Snare",		-- Dazed
	-- PvE
	--[SpellName(123456)] = "PvE",		-- This is just an example, not a real spell
}

local abilities = {}

function LOS:OnUpdate(elapsed)
	if self.timeLeft then
		self.timeLeft = self.timeLeft - elapsed

		if self.timeLeft >= 10 then
			self.NumberText:SetFormattedText("%d", self.timeLeft)
		elseif self.timeLeft < 9.95 then
			self.NumberText:SetFormattedText("%.1f", self.timeLeft)
		end
	end
end

function LOS:UNIT_AURA(_, unit)
	if unit ~= "player" then return end

	local maxExpirationTime = 0
	local Icon, Duration

	for i = 1, 40 do
		local name, _, icon, _, _, duration, expirationTime = UnitDebuff("player", i)

		if E.db.enhanced.loseofcontrol[abilities[name]] and expirationTime > maxExpirationTime then
			maxExpirationTime = expirationTime
			Icon = icon
			Duration = duration

			self.AbilityName:SetText(name)
		end
	end

	if maxExpirationTime == 0 then
		self.maxExpirationTime = 0
		self.frame.timeLeft = nil
		self.frame:SetScript("OnUpdate", nil)
		self.frame:Hide()
	elseif maxExpirationTime ~= self.maxExpirationTime then
		self.maxExpirationTime = maxExpirationTime

		self.Icon:SetTexture(Icon)

		self.Cooldown:SetCooldown(maxExpirationTime - Duration, Duration)

		local timeLeft = maxExpirationTime - GetTime()
		if not self.frame.timeLeft then
			self.frame.timeLeft = timeLeft

			self.frame:SetScript("OnUpdate", self.OnUpdate)
		else
			self.frame.timeLeft = timeLeft
		end

		self.frame:Show()
	end
end

function LOS:Initialize()
	if not E.private.loseofcontrol.enable then return end

	self.frame = CreateFrame("Frame", "ElvUI_LoseOfControlFrame", UIParent)
	self.frame:Point("CENTER", 0, 0)
	self.frame:Size(54)
	self.frame:SetTemplate()
	self.frame:Hide()

	for name, v in pairs(G.loseofcontrol) do
		if name then
			abilities[name] = v
		end
	end

	E:CreateMover(self.frame, "LossControlMover", L["Loss Control Icon"])

	self.Icon = self.frame:CreateTexture(nil, "ARTWORK")
	self.Icon:SetInside()
	self.Icon:SetTexCoord(unpack(E.TexCoords))

	self.AbilityName = self.frame:CreateFontString(nil, "OVERLAY")
	self.AbilityName:FontTemplate(E["media"].normFont, 20, "OUTLINE")
	self.AbilityName:Point("BOTTOM", self.frame, 0, -28)

	self.Cooldown = CreateFrame("Cooldown", self.frame:GetName().."Cooldown", self.frame, "CooldownFrameTemplate")
	self.Cooldown:SetInside()

	self.frame.NumberText = self.frame:CreateFontString(nil, "OVERLAY")
	self.frame.NumberText:FontTemplate(E["media"].normFont, 20, "OUTLINE")
	self.frame.NumberText:Point("BOTTOM", self.frame, 0, -58)

	self.SecondsText = self.frame:CreateFontString(nil, "OVERLAY")
	self.SecondsText:FontTemplate(E["media"].normFont, 20, "OUTLINE")
	self.SecondsText:Point("BOTTOM", self.frame, 0, -80)
	self.SecondsText:SetText(L["seconds"])

	self:RegisterEvent("UNIT_AURA")
end

local function InitializeCallback()
	LOS:Initialize()
end

E:RegisterModule(LOS:GetName(), InitializeCallback)
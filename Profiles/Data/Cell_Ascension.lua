local MaddinUI = _G.MaddinUI
if not MaddinUI then return end

MaddinUI.profileData = MaddinUI.profileData or {}
MaddinUI.profileData.Cell_Ascension = {
	["general"] = {
		["fadeOut"] = true,
		["hideTooltipsInCombat"] = false,
		["hideBlizzardRaid"] = true,
		["menuPosition"] = "left_right",
		["translit"] = false,
		["tooltipsPosition"] = {
			"BOTTOMLEFT", -- [1]
			"Default", -- [2]
			"TOPLEFT", -- [3]
			0, -- [4]
			15, -- [5]
		},
		["alwaysUpdateAuras"] = false,
		["hideBlizzardRaidManager"] = true,
		["hideBlizzardParty"] = true,
		["framePriority"] = {
			{
				"Main", -- [1]
				true, -- [2]
			}, -- [1]
			{
				"Spotlight", -- [1]
				false, -- [2]
			}, -- [2]
			{
				"Quick Assist", -- [1]
				false, -- [2]
			}, -- [3]
		},
		["locked"] = false,
		["useCleuHealthUpdater"] = false,
		["customRangeSpell"] = 0,
		["enableTooltips"] = true,
	},
	["customTextures"] = {
	},
	["bigDebuffs"] = {
		46392, -- [1]
		47476, -- [2]
		51209, -- [3]
		99, -- [4]
		339, -- [5]
		2637, -- [6]
		5211, -- [7]
		9005, -- [8]
		22570, -- [9]
		33786, -- [10]
		45334, -- [11]
		1513, -- [12]
		3355, -- [13]
		19386, -- [14]
		19503, -- [15]
		24394, -- [16]
		34490, -- [17]
		50245, -- [18]
		50519, -- [19]
		50541, -- [20]
		54706, -- [21]
		56626, -- [22]
		60210, -- [23]
		64803, -- [24]
		118, -- [25]
		122, -- [26]
		18469, -- [27]
		31589, -- [28]
		31661, -- [29]
		33395, -- [30]
		44572, -- [31]
		55080, -- [32]
		61305, -- [33]
		55021, -- [34]
		853, -- [35]
		10326, -- [36]
		20066, -- [37]
		31935, -- [38]
		605, -- [39]
		8122, -- [40]
		9484, -- [41]
		15487, -- [42]
		64044, -- [43]
		408, -- [44]
		1330, -- [45]
		1776, -- [46]
		1833, -- [47]
		2094, -- [48]
		6770, -- [49]
		18425, -- [50]
		51722, -- [51]
		3600, -- [52]
		8056, -- [53]
		39796, -- [54]
		51514, -- [55]
		63685, -- [56]
		64695, -- [57]
		710, -- [58]
		5782, -- [59]
		6358, -- [60]
		6789, -- [61]
		17928, -- [62]
		24259, -- [63]
		30283, -- [64]
		676, -- [65]
		7922, -- [66]
		18498, -- [67]
		20511, -- [68]
		25046, -- [69]
		20549, -- [70]
		73787, -- [71]
	},
	["debuffBlacklist"] = {
		8326, -- [1]
		57723, -- [2]
		57724, -- [3]
		572746, -- [4]
	},
	["changelogsViewed"] = "r1.0.6-release",
	["spellRequest"] = {
		["enabled"] = false,
		["timeout"] = 10,
		["responseType"] = "me",
		["spells"] = {
			{
				["glowOptions"] = {
					"pixel", -- [1]
					{
						{
							1, -- [1]
							1, -- [2]
							0, -- [3]
							1, -- [4]
						}, -- [1]
						0, -- [2]
						0, -- [3]
						9, -- [4]
						0.25, -- [5]
						8, -- [6]
						2, -- [7]
					}, -- [2]
				},
				["type"] = "icon",
				["spellId"] = 10060,
				["isBuiltIn"] = true,
				["keywords"] = "Power Infusion",
				["iconColor"] = {
					1, -- [1]
					1, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["icon"] = "Interface\\Icons\\Spell_Holy_PowerInfusion",
				["buffId"] = 10060,
			}, -- [1]
			{
				["glowOptions"] = {
					"pixel", -- [1]
					{
						{
							0, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						}, -- [1]
						0, -- [2]
						0, -- [3]
						9, -- [4]
						0.25, -- [5]
						8, -- [6]
						2, -- [7]
					}, -- [2]
				},
				["type"] = "icon",
				["spellId"] = 29166,
				["isBuiltIn"] = true,
				["keywords"] = "Innervate",
				["iconColor"] = {
					0, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["icon"] = "Interface\\Icons\\Spell_Nature_Lightning",
				["buffId"] = 29166,
			}, -- [2]
		},
		["sharedIconOptions"] = {
			"beat", -- [1]
			27, -- [2]
			"BOTTOMRIGHT", -- [3]
			"BOTTOMRIGHT", -- [4]
			0, -- [5]
			0, -- [6]
		},
		["knownSpellsOnly"] = true,
		["checkIfExists"] = true,
		["replyCooldown"] = true,
		["freeCooldownOnly"] = true,
	},
	["tools"] = {
		["battleResTimer"] = {
			true, -- [1]
			false, -- [2]
			{
			}, -- [3]
		},
		["fadeOut"] = false,
		["deathReport"] = {
			false, -- [1]
			10, -- [2]
		},
		["buffTracker"] = {
			false, -- [1]
			"left-to-right", -- [2]
			27, -- [3]
			{
			}, -- [4]
			{
				["MotW"] = true,
				["AB"] = true,
				["PWF"] = true,
				["SP"] = true,
				["BoS"] = true,
				["DS"] = true,
				["BoM"] = true,
				["BoW"] = true,
				["BoK"] = true,
			}, -- [5]
		},
		["marks"] = {
			false, -- [1]
			false, -- [2]
			"target_h", -- [3]
			{
			}, -- [4]
		},
		["readyAndPull"] = {
			false, -- [1]
			"text_button", -- [2]
			{
				"default", -- [1]
				7, -- [2]
			}, -- [3]
			{
			}, -- [4]
		},
	},
	["snippets"] = {
		[0] = {
			["autorun"] = true,
			["code"] = "-- snippets can be found at https://github.com/enderneko/Cell/tree/master/.snippets\n-- use \"/run CellDB['snippets'][0]=nil ReloadUI()\" to reset this snippet\n\n-- cooldown style for icon/block indicators (\"VERTICAL\", \"CLOCK\")\nCELL_COOLDOWN_STYLE = \"VERTICAL\"\n\n-- fade out unit button if hp percent > (number: 0-1)\nCELL_FADE_OUT_HEALTH_PERCENT = nil\n\n-- add summon icons to Status Icon indicator (boolean, retail only)\nCELL_SUMMON_ICONS_ENABLED = false\n\n-- use separate width and height for custom indicator icons (boolean)\nCELL_RECTANGULAR_CUSTOM_INDICATOR_ICONS = false\n\n-- Use nicknames from Details! Damage Meter (boolean, NickTag-1.0 library)\nCELL_NICKTAG_ENABLED = false\n\n-- remove raid setup details from the tooltip of the Raid button (boolean)\nCELL_TOOLTIP_REMOVE_RAID_SETUP_DETAILS = false\n\n-- border thickness: unit button and icon (number)\nCELL_BORDER_SIZE = 1\n\n-- unit button border color ({r, g, b, a}, number: 0-1)\nCELL_BORDER_COLOR = {0, 0, 0, 1}\n\n-- show raid pet owner name (\"VEHICLE\", \"NAME\", nil)\nCELL_SHOW_GROUP_PET_OWNER_NAME = nil\n\n-- use LibHealComm (boolean, non-retail)\nCELL_USE_LIBHEALCOMM = true -- Auto-fixed for standard WotLK",
		},
	},
	["dispelBlacklist"] = {
	},
	["indicatorPreview"] = {
		["scale"] = 2,
		["showAll"] = false,
	},
	["externals"] = {
		["disabled"] = {
		},
		["custom"] = {
		},
	},
	["actions"] = {
	},
	["optionsFramePosition"] = {
		"TOPLEFT", -- [1]
		806, -- [2]
		-387, -- [3]
	},
	["appearance"] = {
		["optionsFontSizeOffset"] = 0,
		["strata"] = "LOW",
		["auraIconOptions"] = {
			["durationColorEnabled"] = false,
			["durationDecimal"] = 0,
			["animation"] = "duration",
			["durationRoundUp"] = false,
			["durationColors"] = {
				{
					0, -- [1]
					1, -- [2]
					0, -- [3]
				}, -- [1]
				{
					1, -- [1]
					1, -- [2]
					0, -- [3]
					0.5, -- [4]
				}, -- [2]
				{
					1, -- [1]
					0, -- [2]
					0, -- [3]
					3, -- [4]
				}, -- [3]
			},
		},
		["bgAlpha"] = 0.45,
		["shield"] = {
			true, -- [1]
			{
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.4, -- [4]
			}, -- [2]
		},
		["targetColor"] = {
			1, -- [1]
			0.31, -- [2]
			0.31, -- [3]
			1, -- [4]
		},
		["outOfRangeAlpha"] = 0.45,
		["fullColor"] = {
			false, -- [1]
			{
				0.2, -- [1]
				0.2, -- [2]
				0.2, -- [3]
			}, -- [2]
		},
		["overshieldReverseFill"] = true,
		["overshield"] = {
			false, -- [1]
			{
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			}, -- [2]
		},
		["barAnimation"] = "Flash",
		["powerColor"] = {
			"power_color", -- [1]
			{
				0.7, -- [1]
				0.7, -- [2]
				0.7, -- [3]
			}, -- [2]
		},
		["scale"] = 1,
		["healPrediction"] = {
			false, -- [1]
			false, -- [2]
			{
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.4, -- [4]
			}, -- [3]
		},
		["colorThresholds"] = {
			{
				1, -- [1]
				0, -- [2]
				0, -- [3]
			}, -- [1]
			{
				1, -- [1]
				0.7, -- [2]
				0, -- [3]
			}, -- [2]
			{
				0.7, -- [1]
				1, -- [2]
				0, -- [3]
			}, -- [3]
			0.05, -- [4]
			0.95, -- [5]
			true, -- [6]
		},
		["mouseoverColor"] = {
			1, -- [1]
			1, -- [2]
			1, -- [3]
			0.6, -- [4]
		},
		["highlightSize"] = -1,
		["lossColor"] = {
			"custom", -- [1]
			{
				1, -- [1]
				1, -- [2]
				1, -- [3]
			}, -- [2]
		},
		["barColor"] = {
			"custom", -- [1]
			{
				0, -- [1]
				0, -- [2]
				0, -- [3]
			}, -- [2]
		},
		["useGameFont"] = true,
		["lossAlpha"] = 1,
		["deathColor"] = {
			true, -- [1]
			{
				0.7300000190734863, -- [1]
				0, -- [2]
				0, -- [3]
			}, -- [2]
		},
		["accentColor"] = {
			"class_color", -- [1]
			{
				1, -- [1]
				0.26667, -- [2]
				0.4, -- [3]
			}, -- [2]
		},
		["healAbsorbInvertColor"] = false,
		["colorThresholdsLoss"] = {
			{
				1, -- [1]
				0, -- [2]
				0, -- [3]
			}, -- [1]
			{
				1, -- [1]
				0.7, -- [2]
				0, -- [3]
			}, -- [2]
			{
				0.7, -- [1]
				1, -- [2]
				0, -- [3]
			}, -- [3]
			0.05, -- [4]
			0.95, -- [5]
			true, -- [6]
		},
		["healAbsorb"] = {
			false, -- [1]
			{
				1, -- [1]
				0.1, -- [2]
				0.1, -- [3]
				1, -- [4]
			}, -- [2]
		},
		["barAlpha"] = 0.45,
		["texture"] = "Solid",
	},
	["layouts"] = {
		["default"] = {
			["indicators"] = {
				{
					["enabled"] = true,
					["type"] = "built-in",
					["frameLevel"] = 1,
					["color"] = {
						"class_color", -- [1]
						{
							1, -- [1]
							1, -- [2]
							1, -- [3]
						}, -- [2]
					},
					["vehicleNamePosition"] = {
						"TOP", -- [1]
						0, -- [2]
					},
					["font"] = {
						"Cell Default", -- [1]
						15, -- [2]
						"None", -- [3]
						1, -- [4]
					},
					["name"] = "Name Text",
					["position"] = {
						"CENTER", -- [1]
						"healthBar", -- [2]
						"CENTER", -- [3]
						0, -- [4]
						0, -- [5]
					},
					["indicatorName"] = "nameText",
					["showGroupNumber"] = false,
					["textWidth"] = {
						"percentage", -- [1]
						0.75, -- [2]
					},
				}, -- [1]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["frameLevel"] = 30,
					["font"] = {
						"Cell Default", -- [1]
						11, -- [2]
						"None", -- [3]
						true, -- [4]
					},
					["name"] = "Status Text",
					["position"] = {
						"BOTTOM", -- [1]
						0, -- [2]
						"justify", -- [3]
					},
					["indicatorName"] = "statusText",
					["showBackground"] = true,
					["colors"] = {
						["OFFLINE"] = {
							1, -- [1]
							0.19, -- [2]
							0.19, -- [3]
							1, -- [4]
						},
						["GHOST"] = {
							1, -- [1]
							0.19, -- [2]
							0.19, -- [3]
							1, -- [4]
						},
						["DECLINED"] = {
							1, -- [1]
							0.19, -- [2]
							0.19, -- [3]
							1, -- [4]
						},
						["ACCEPTED"] = {
							0.12, -- [1]
							1, -- [2]
							0.12, -- [3]
							1, -- [4]
						},
						["DEAD"] = {
							1, -- [1]
							0.19, -- [2]
							0.19, -- [3]
							1, -- [4]
						},
						["DRINKING"] = {
							0.12, -- [1]
							0.75, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["FEIGN"] = {
							1, -- [1]
							1, -- [2]
							0.12, -- [3]
							1, -- [4]
						},
						["PENDING"] = {
							1, -- [1]
							1, -- [2]
							0.12, -- [3]
							1, -- [4]
						},
						["AFK"] = {
							1, -- [1]
							0.19, -- [2]
							0.19, -- [3]
							1, -- [4]
						},
					},
					["showTimer"] = true,
				}, -- [2]
				{
					["enabled"] = false,
					["type"] = "built-in",
					["name"] = "Health Text",
					["position"] = {
						"TOP", -- [1]
						"button", -- [2]
						"CENTER", -- [3]
						0, -- [4]
						-6, -- [5]
					},
					["indicatorName"] = "healthText",
					["format"] = {
						["health1"] = {
							["color"] = {
								"custom_color", -- [1]
								{
									1, -- [1]
									1, -- [2]
									1, -- [3]
								}, -- [2]
							},
							["format"] = "effective_percent",
							["hideIfEmptyOrFull"] = false,
						},
						["health2"] = {
							["color"] = {
								"custom_color", -- [1]
								{
									1, -- [1]
									1, -- [2]
									1, -- [3]
								}, -- [2]
							},
							["format"] = "none",
							["delimiter"] = " ",
							["hideIfEmptyOrFull"] = false,
						},
						["shields"] = {
							["color"] = {
								"custom_color", -- [1]
								{
									0, -- [1]
									1, -- [2]
									0, -- [3]
								}, -- [2]
							},
							["format"] = "none",
							["delimiter"] = "+",
						},
						["healAbsorbs"] = {
							["color"] = {
								"custom_color", -- [1]
								{
									1, -- [1]
									0, -- [2]
									0, -- [3]
								}, -- [2]
							},
							["format"] = "none",
							["delimiter"] = "-",
						},
					},
					["font"] = {
						"Cell Default", -- [1]
						10, -- [2]
						"None", -- [3]
						true, -- [4]
					},
					["frameLevel"] = 2,
				}, -- [3]
				{
					["enabled"] = false,
					["type"] = "built-in",
					["frameLevel"] = 2,
					["color"] = {
						"custom_color", -- [1]
						{
							1, -- [1]
							1, -- [2]
							1, -- [3]
						}, -- [2]
					},
					["font"] = {
						"Cell Default", -- [1]
						10, -- [2]
						"None", -- [3]
						true, -- [4]
					},
					["name"] = "Power Text",
					["position"] = {
						"BOTTOMRIGHT", -- [1]
						"button", -- [2]
						"BOTTOMRIGHT", -- [3]
						0, -- [4]
						3, -- [5]
					},
					["indicatorName"] = "powerText",
					["format"] = "number",
					["hideIfEmptyOrFull"] = true,
					["filters"] = {
						["DEATHKNIGHT"] = {
							["DAMAGER"] = true,
							["TANK"] = true,
						},
						["WARRIOR"] = {
							["DAMAGER"] = true,
							["TANK"] = true,
						},
						["SHAMAN"] = {
							["DAMAGER"] = true,
							["HEALER"] = true,
						},
						["MAGE"] = true,
						["VEHICLE"] = true,
						["PRIEST"] = {
							["DAMAGER"] = true,
							["HEALER"] = true,
						},
						["PALADIN"] = {
							["DAMAGER"] = true,
							["TANK"] = true,
							["HEALER"] = true,
						},
						["WARLOCK"] = true,
						["PET"] = true,
						["NPC"] = true,
						["DRUID"] = {
							["DAMAGER"] = true,
							["TANK"] = true,
							["HEALER"] = true,
						},
						["ROGUE"] = true,
						["HUNTER"] = true,
					},
				}, -- [4]
				{
					["enabled"] = false,
					["type"] = "built-in",
					["name"] = "Health Thresholds",
					["indicatorName"] = "healthThresholds",
					["thresholds"] = {
						{
							0.35, -- [1]
							{
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							}, -- [2]
						}, -- [1]
					},
					["thickness"] = 1,
				}, -- [5]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["name"] = "Status Icon",
					["position"] = {
						"TOP", -- [1]
						"button", -- [2]
						"TOP", -- [3]
						0, -- [4]
						-3, -- [5]
					},
					["indicatorName"] = "statusIcon",
					["frameLevel"] = 10,
					["size"] = {
						18, -- [1]
						18, -- [2]
					},
				}, -- [6]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["frameLevel"] = 5,
					["name"] = "Role Icon",
					["position"] = {
						"TOPLEFT", -- [1]
						"button", -- [2]
						"TOPLEFT", -- [3]
						1, -- [4]
						-1, -- [5]
					},
					["indicatorName"] = "roleIcon",
					["roleTexture"] = {
						"miirgui", -- [1]
						"Interface\\AddOns\\Cell_Ascension\\Media\\Roles\\Default_TANK.tga", -- [2]
						"Interface\\AddOns\\Cell_Ascension\\Media\\Roles\\Default_HEALER.tga", -- [3]
						"Interface\\AddOns\\Cell_Ascension\\Media\\Roles\\Default_DAMAGER.tga", -- [4]
					},
					["hideDamager"] = true,
					["size"] = {
						15, -- [1]
						15, -- [2]
					},
				}, -- [7]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["name"] = "Leader Icon",
					["position"] = {
						"TOPLEFT", -- [1]
						"button", -- [2]
						"TOPLEFT", -- [3]
						2, -- [4]
						7, -- [5]
					},
					["indicatorName"] = "leaderIcon",
					["hideInCombat"] = true,
					["size"] = {
						11, -- [1]
						11, -- [2]
					},
				}, -- [8]
				{
					["enabled"] = false,
					["type"] = "built-in",
					["name"] = "Combat Icon",
					["position"] = {
						"BOTTOMRIGHT", -- [1]
						"button", -- [2]
						"BOTTOMRIGHT", -- [3]
						4, -- [4]
						-4, -- [5]
					},
					["indicatorName"] = "combatIcon",
					["onlyEnableNotInCombat"] = true,
					["frameLevel"] = 5,
					["size"] = {
						16, -- [1]
						16, -- [2]
					},
				}, -- [9]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["name"] = "Ready Check Icon",
					["position"] = {
						"CENTER", -- [1]
						"button", -- [2]
						"CENTER", -- [3]
						0, -- [4]
						0, -- [5]
					},
					["indicatorName"] = "readyCheckIcon",
					["frameLevel"] = 100,
					["size"] = {
						16, -- [1]
						16, -- [2]
					},
				}, -- [10]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["name"] = "Raid Icon (player)",
					["position"] = {
						"TOP", -- [1]
						"button", -- [2]
						"TOP", -- [3]
						0, -- [4]
						3, -- [5]
					},
					["indicatorName"] = "playerRaidIcon",
					["frameLevel"] = 5,
					["alpha"] = 0.77,
					["size"] = {
						14, -- [1]
						14, -- [2]
					},
				}, -- [11]
				{
					["enabled"] = false,
					["type"] = "built-in",
					["name"] = "Raid Icon (target)",
					["position"] = {
						"TOP", -- [1]
						"button", -- [2]
						"TOP", -- [3]
						-14, -- [4]
						3, -- [5]
					},
					["indicatorName"] = "targetRaidIcon",
					["frameLevel"] = 5,
					["alpha"] = 0.77,
					["size"] = {
						14, -- [1]
						14, -- [2]
					},
				}, -- [12]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["name"] = "Aggro (blink)",
					["position"] = {
						"TOPLEFT", -- [1]
						"button", -- [2]
						"TOPLEFT", -- [3]
						0, -- [4]
						0, -- [5]
					},
					["indicatorName"] = "aggroBlink",
					["frameLevel"] = 7,
					["size"] = {
						11, -- [1]
						11, -- [2]
					},
				}, -- [13]
				{
					["enabled"] = false,
					["type"] = "built-in",
					["name"] = "Aggro (bar)",
					["position"] = {
						"BOTTOMLEFT", -- [1]
						"button", -- [2]
						"TOPLEFT", -- [3]
						0, -- [4]
						-1, -- [5]
					},
					["indicatorName"] = "aggroBar",
					["frameLevel"] = 1,
					["size"] = {
						20, -- [1]
						4, -- [2]
					},
				}, -- [14]
				{
					["enabled"] = false,
					["type"] = "built-in",
					["name"] = "Aggro (border)",
					["indicatorName"] = "aggroBorder",
					["thickness"] = 2,
					["frameLevel"] = 3,
				}, -- [15]
				{
					["enabled"] = false,
					["type"] = "built-in",
					["frameLevel"] = 5,
					["color"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["name"] = "Shield Bar",
					["position"] = {
						"BOTTOMLEFT", -- [1]
						nil, -- [2]
						"BOTTOMLEFT", -- [3]
						0, -- [4]
						0, -- [5]
					},
					["indicatorName"] = "shieldBar",
					["onlyShowOvershields"] = false,
					["height"] = 4,
				}, -- [16]
				{
					["enabled"] = false,
					["type"] = "built-in",
					["name"] = "PW:S",
					["position"] = {
						"CENTER", -- [1]
						"healthBar", -- [2]
						"RIGHT", -- [3]
						0, -- [4]
						0, -- [5]
					},
					["indicatorName"] = "powerWordShield",
					["shieldByMe"] = true,
					["frameLevel"] = 20,
					["size"] = {
						4, -- [1]
						0, -- [2]
					},
				}, -- [17]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["name"] = "AoE Healing",
					["indicatorName"] = "aoeHealing",
					["color"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
					},
					["height"] = 10,
				}, -- [18]
				{
					["glowOptions"] = {
						"None", -- [1]
						{
							0.95, -- [1]
							0.95, -- [2]
							0.32, -- [3]
							1, -- [4]
						}, -- [2]
					},
					["showDuration"] = false,
					["frameLevel"] = 10,
					["type"] = "built-in",
					["indicatorName"] = "externalCooldowns",
					["showAnimation"] = true,
					["font"] = {
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"TOPRIGHT", -- [5]
							2, -- [6]
							1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [1]
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"BOTTOMRIGHT", -- [5]
							2, -- [6]
							-1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [2]
					},
					["name"] = "External Cooldowns",
					["position"] = {
						"RIGHT", -- [1]
						"button", -- [2]
						"RIGHT", -- [3]
						2, -- [4]
						5, -- [5]
					},
					["orientation"] = "right-to-left",
					["num"] = 2,
					["enabled"] = true,
					["size"] = {
						12, -- [1]
						20, -- [2]
					},
				}, -- [19]
				{
					["glowOptions"] = {
						"None", -- [1]
						{
							0.95, -- [1]
							0.95, -- [2]
							0.32, -- [3]
							1, -- [4]
						}, -- [2]
					},
					["showDuration"] = false,
					["frameLevel"] = 10,
					["type"] = "built-in",
					["indicatorName"] = "defensiveCooldowns",
					["showAnimation"] = true,
					["font"] = {
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"TOPRIGHT", -- [5]
							2, -- [6]
							1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [1]
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"BOTTOMRIGHT", -- [5]
							2, -- [6]
							-1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [2]
					},
					["name"] = "Defensive Cooldowns",
					["position"] = {
						"LEFT", -- [1]
						"button", -- [2]
						"LEFT", -- [3]
						-2, -- [4]
						5, -- [5]
					},
					["orientation"] = "left-to-right",
					["num"] = 2,
					["enabled"] = true,
					["size"] = {
						12, -- [1]
						20, -- [2]
					},
				}, -- [20]
				{
					["glowOptions"] = {
						"None", -- [1]
						{
							0.95, -- [1]
							0.95, -- [2]
							0.32, -- [3]
							1, -- [4]
						}, -- [2]
					},
					["showDuration"] = false,
					["frameLevel"] = 10,
					["type"] = "built-in",
					["indicatorName"] = "allCooldowns",
					["showAnimation"] = true,
					["font"] = {
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"TOPRIGHT", -- [5]
							2, -- [6]
							1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [1]
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"BOTTOMRIGHT", -- [5]
							2, -- [6]
							-1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [2]
					},
					["name"] = "Externals + Defensives",
					["position"] = {
						"LEFT", -- [1]
						"button", -- [2]
						"LEFT", -- [3]
						-2, -- [4]
						5, -- [5]
					},
					["orientation"] = "left-to-right",
					["num"] = 2,
					["enabled"] = false,
					["size"] = {
						12, -- [1]
						20, -- [2]
					},
				}, -- [21]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["frameLevel"] = 15,
					["filters"] = {
						["dispellableByMe"] = false,
						["Disease"] = true,
						["Bleed"] = true,
						["Curse"] = true,
						["Magic"] = true,
						["Poison"] = true,
					},
					["orientation"] = "right-to-left",
					["name"] = "Dispels",
					["position"] = {
						"BOTTOMRIGHT", -- [1]
						"button", -- [2]
						"BOTTOMRIGHT", -- [3]
						0, -- [4]
						4, -- [5]
					},
					["iconStyle"] = "blizzard",
					["highlightType"] = "gradient-half",
					["indicatorName"] = "dispels",
					["size"] = {
						12, -- [1]
						12, -- [2]
					},
				}, -- [22]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["frameLevel"] = 5,
					["showJumpingAnimation"] = false,
					["num"] = 3,
					["enableBlacklistShortcut"] = false,
					["dispellableByMe"] = false,
					["indicatorName"] = "debuffs",
					["showAnimation"] = true,
					["font"] = {
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"TOPRIGHT", -- [5]
							2, -- [6]
							1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [1]
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"BOTTOMRIGHT", -- [5]
							2, -- [6]
							-1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [2]
					},
					["name"] = "Debuffs",
					["showTooltip"] = false,
					["orientation"] = "left-to-right",
					["position"] = {
						"BOTTOMLEFT", -- [1]
						"button", -- [2]
						"BOTTOMLEFT", -- [3]
						0, -- [4]
						0, -- [5]
					},
					["showDuration"] = false,
					["size"] = {
						{
							19, -- [1]
							19, -- [2]
						}, -- [1]
						{
							19, -- [1]
							19, -- [2]
						}, -- [2]
					},
				}, -- [23]
				{
					["enabled"] = true,
					["num"] = 1,
					["frameLevel"] = 20,
					["showDuration"] = true,
					["border"] = 2,
					["type"] = "built-in",
					["indicatorName"] = "raidDebuffs",
					["font"] = {
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"TOPRIGHT", -- [5]
							2, -- [6]
							1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [1]
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"BOTTOMRIGHT", -- [5]
							2, -- [6]
							-1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [2]
					},
					["name"] = "Raid Debuffs",
					["position"] = {
						"CENTER", -- [1]
						"button", -- [2]
						"CENTER", -- [3]
						0, -- [4]
						3, -- [5]
					},
					["orientation"] = "left-to-right",
					["showTooltip"] = false,
					["onlyShowTopGlow"] = false,
					["size"] = {
						22, -- [1]
						22, -- [2]
					},
				}, -- [24]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["frameLevel"] = 50,
					["border"] = 2,
					["orientation"] = "left-to-right",
					["font"] = {
						"Cell Default", -- [1]
						12, -- [2]
						"Outline", -- [3]
						false, -- [4]
						"TOPRIGHT", -- [5]
						2, -- [6]
						1, -- [7]
						{
							1, -- [1]
							1, -- [2]
							1, -- [3]
						}, -- [8]
					},
					["name"] = "Targeted Spells",
					["position"] = {
						"TOPLEFT", -- [1]
						"button", -- [2]
						"TOPLEFT", -- [3]
						-4, -- [4]
						4, -- [5]
					},
					["indicatorName"] = "targetedSpells",
					["num"] = 1,
					["showAllSpells"] = false,
					["size"] = {
						20, -- [1]
						20, -- [2]
					},
				}, -- [25]
				{
					["enabled"] = false,
					["type"] = "built-in",
					["frameLevel"] = 15,
					["color"] = {
						1, -- [1]
						0.1, -- [2]
						0.1, -- [3]
					},
					["font"] = {
						"Cell Default", -- [1]
						15, -- [2]
						"Outline", -- [3]
						false, -- [4]
					},
					["name"] = "Target Counter",
					["position"] = {
						"TOP", -- [1]
						"button", -- [2]
						"TOP", -- [3]
						0, -- [4]
						5, -- [5]
					},
					["indicatorName"] = "targetCounter",
					["filters"] = {
						["pve"] = false,
						["pvp"] = true,
						["outdoor"] = false,
					},
				}, -- [26]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["frameLevel"] = 10,
					["border"] = 2,
					["orientation"] = "left-to-right",
					["font"] = {
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"TOPRIGHT", -- [5]
							2, -- [6]
							1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [1]
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"BOTTOMRIGHT", -- [5]
							2, -- [6]
							-1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [2]
					},
					["name"] = "Crowd Controls",
					["position"] = {
						"TOPLEFT", -- [1]
						"button", -- [2]
						"TOPLEFT", -- [3]
						15, -- [4]
						-4, -- [5]
					},
					["indicatorName"] = "crowdControls",
					["showDuration"] = false,
					["num"] = 2,
					["size"] = {
						20, -- [1]
						20, -- [2]
					},
				}, -- [27]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["name"] = "Actions",
					["indicatorName"] = "actions",
					["speed"] = 1,
				}, -- [28]
				{
					["enabled"] = false,
					["type"] = "built-in",
					["name"] = "Missing Buffs",
					["position"] = {
						"BOTTOMRIGHT", -- [1]
						"button", -- [2]
						"BOTTOMRIGHT", -- [3]
						0, -- [4]
						4, -- [5]
					},
					["indicatorName"] = "missingBuffs",
					["orientation"] = "right-to-left",
					["frameLevel"] = 10,
					["size"] = {
						13, -- [1]
						13, -- [2]
					},
				}, -- [29]
				{
					["enabled"] = true,
					["type"] = "built-in",
					["name"] = "Direction Arrow",
					["position"] = {
						"CENTER", -- [1]
						"healthBar", -- [2]
						"CENTER", -- [3]
						0, -- [4]
						0, -- [5]
					},
					["indicatorName"] = "directionArrow",
					["color"] = {
						1, -- [1]
						0.2, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["frameLevel"] = 50,
					["size"] = {
						16, -- [1]
						16, -- [2]
					},
				}, -- [30]
				{
					["glowOptions"] = {
						"None", -- [1]
						{
							0.95, -- [1]
							0.95, -- [2]
							0.32, -- [3]
							1, -- [4]
						}, -- [2]
					},
					["showDuration"] = true,
					["auras"] = {
						802971, -- [1]
						802973, -- [2]
						802969, -- [3]
						802975, -- [4]
						803698, -- [5]
						803271, -- [6]
						803273, -- [7]
						803699, -- [8]
						801809, -- [9]
						502552, -- [10]
						803552, -- [11]
						800347, -- [12]
						801709, -- [13]
						800857, -- [14]
						502951, -- [15]
						502975, -- [16]
						800901, -- [17]
						800939, -- [18]
						502941, -- [19]
					},
					["showAnimation"] = true,
					["showStack"] = true,
					["spacing"] = {
						0, -- [1]
						0, -- [2]
					},
					["indicatorName"] = "indicator1",
					["size"] = {
						19, -- [1]
						19, -- [2]
					},
					["enabled"] = true,
					["type"] = "icons",
					["frameLevel"] = 5,
					["showJumpingAnimation"] = false,
					["numPerLine"] = 5,
					["num"] = 5,
					["font"] = {
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"TOPRIGHT", -- [5]
							2, -- [6]
							1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [1]
						{
							"Cell Default", -- [1]
							11, -- [2]
							"Outline", -- [3]
							false, -- [4]
							"BOTTOMRIGHT", -- [5]
							2, -- [6]
							-1, -- [7]
							{
								1, -- [1]
								1, -- [2]
								1, -- [3]
							}, -- [8]
						}, -- [2]
					},
					["name"] = "Healer Indicators",
					["position"] = {
						"TOPRIGHT", -- [1]
						"button", -- [2]
						"TOPRIGHT", -- [3]
						0, -- [4]
						0, -- [5]
					},
					["orientation"] = "right-to-left",
					["trackByName"] = true,
					["auraType"] = "buff",
					["castBy"] = "me",
				}, -- [31]
				{
					["enabled"] = false,
					["type"] = "glow",
					["frameLevel"] = 1,
					["auraType"] = "buff",
					["auras"] = {
						800857, -- [1]
					},
					["name"] = "AR Glow",
					["glowOptions"] = {
						"Pixel", -- [1]
						{
							0.95, -- [1]
							0.95, -- [2]
							0.32, -- [3]
							1, -- [4]
						}, -- [2]
						14, -- [3]
						0.13, -- [4]
						6, -- [5]
						1, -- [6]
					},
					["indicatorName"] = "indicator2",
					["trackByName"] = true,
					["fadeOut"] = false,
					["castBy"] = "me",
				}, -- [32]
			},
			["groupFilter"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				true, -- [6]
				true, -- [7]
				true, -- [8]
			},
			["main"] = {
				["spacingY"] = 1,
				["size"] = {
					111, -- [1]
					66, -- [2]
				},
				["spacingX"] = 1,
				["unitsPerColumn"] = 5,
				["maxColumns"] = 8,
				["position"] = {
					"BOTTOM", -- [1]
					-266, -- [2]
					278, -- [3]
				},
				["combineGroups"] = false,
				["roleOrder"] = {
					"HEALER", -- [1]
					"TANK", -- [2]
					"DAMAGER", -- [3]
				},
				["anchor"] = "TOPLEFT",
				["groupSpacing"] = 0,
				["orientation"] = "horizontal",
				["sortByRole"] = true,
				["powerSize"] = 0,
				["hideSelf"] = false,
			},
			["spotlight"] = {
				["enabled"] = false,
				["spacingY"] = 3,
				["spacingX"] = 3,
				["units"] = {
				},
				["sameArrangementAsMain"] = true,
				["position"] = {
				},
				["orientation"] = "vertical",
				["sameSizeAsMain"] = true,
				["anchor"] = "TOPLEFT",
				["hidePlaceholder"] = false,
				["powerSize"] = 2,
				["size"] = {
					66, -- [1]
					46, -- [2]
				},
			},
			["powerFilters"] = {
				["DEATHKNIGHT"] = {
					["DAMAGER"] = true,
					["TANK"] = true,
				},
				["WARRIOR"] = {
					["DAMAGER"] = true,
					["TANK"] = true,
				},
				["SHAMAN"] = {
					["DAMAGER"] = true,
					["HEALER"] = true,
				},
				["MAGE"] = true,
				["VEHICLE"] = true,
				["PRIEST"] = {
					["DAMAGER"] = true,
					["HEALER"] = true,
				},
				["PALADIN"] = {
					["DAMAGER"] = true,
					["TANK"] = true,
					["HEALER"] = true,
				},
				["WARLOCK"] = true,
				["PET"] = true,
				["NPC"] = true,
				["DRUID"] = {
					["DAMAGER"] = true,
					["TANK"] = true,
					["HEALER"] = true,
				},
				["ROGUE"] = true,
				["HUNTER"] = true,
			},
			["barOrientation"] = {
				"horizontal", -- [1]
				false, -- [2]
			},
			["npc"] = {
				["enabled"] = true,
				["spacingY"] = 3,
				["separate"] = false,
				["spacingX"] = 3,
				["sameArrangementAsMain"] = true,
				["anchor"] = "TOPLEFT",
				["sameSizeAsMain"] = true,
				["orientation"] = "vertical",
				["position"] = {
				},
				["powerSize"] = 2,
				["size"] = {
					66, -- [1]
					46, -- [2]
				},
			},
			["pet"] = {
				["sameArrangementAsMain"] = true,
				["spacingY"] = 3,
				["spacingX"] = 3,
				["partyEnabled"] = false,
				["anchor"] = "TOPLEFT",
				["powerSize"] = 2,
				["sameSizeAsMain"] = true,
				["orientation"] = "vertical",
				["position"] = {
				},
				["raidEnabled"] = false,
				["size"] = {
					66, -- [1]
					46, -- [2]
				},
			},
		},
	},
	["debuffTypeColor"] = {
		[""] = {
			["b"] = 0,
			["g"] = 0,
			["r"] = 0.8,
		},
		["Disease"] = {
			["b"] = 0,
			["g"] = 0.4,
			["r"] = 0.6,
		},
		["Bleed"] = {
			["r"] = 1,
			["g"] = 0.2,
			["b"] = 0.6,
		},
		["Poison"] = {
			["b"] = 0,
			["g"] = 0.6,
			["r"] = 0,
		},
		["Curse"] = {
			["b"] = 1,
			["g"] = 0,
			["r"] = 0.6,
		},
		["Magic"] = {
			["b"] = 1,
			["g"] = 0.6,
			["r"] = 0.2,
		},
		["none"] = {
			["b"] = 0,
			["g"] = 0,
			["r"] = 0.8,
		},
	},
	["crowdControls"] = {
		["disabled"] = {
		},
		["custom"] = {
		},
	},
	["defensives"] = {
		["disabled"] = {
		},
		["custom"] = {
		},
	},
	["raidDebuffs"] = {
	},
	["aoeHealings"] = {
		["disabled"] = {
		},
		["custom"] = {
		},
	},
	["dispelRequest"] = {
		["enabled"] = false,
		["debuffs"] = {
		},
		["timeout"] = 10,
		["responseType"] = "all",
		["dispellableByMe"] = true,
		["textOptions"] = {
			"A", -- [1]
			{
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			}, -- [2]
			32, -- [3]
			"TOPLEFT", -- [4]
			"TOPLEFT", -- [5]
			-1, -- [6]
			5, -- [7]
		},
		["type"] = "text",
		["glowOptions"] = {
			"shine", -- [1]
			{
				{
					1, -- [1]
					0, -- [2]
					0.4, -- [3]
					1, -- [4]
				}, -- [1]
				0, -- [2]
				0, -- [3]
				9, -- [4]
				0.5, -- [5]
				2, -- [6]
			}, -- [2]
		},
	},
	["targetedSpellsGlow"] = {
		"Pixel", -- [1]
		{
			0.95, -- [1]
			0.95, -- [2]
			0.32, -- [3]
			1, -- [4]
		}, -- [2]
		9, -- [3]
		0.25, -- [4]
		8, -- [5]
		2, -- [6]
	},
	["revise"] = "r1.0.6-release",
	["targetedSpellsList"] = {
	},
	["nicknames"] = {
		["sync"] = false,
		["list"] = {
		},
		["custom"] = false,
		["mine"] = "",
		["blacklist"] = {
		},
	},
	["firstRun"] = false,
}

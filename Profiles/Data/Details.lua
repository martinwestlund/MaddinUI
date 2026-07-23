local MaddinUI = _G.MaddinUI
if not MaddinUI then return end

MaddinUI.profileData = MaddinUI.profileData or {}
MaddinUI.profileData.Details = {
    profileName = "MaddinUI",
    profile = {
			["show_arena_role_icon"] = false,
			["capture_real"] = {
				["heal"] = true,
				["spellcast"] = true,
				["miscdata"] = true,
				["aura"] = true,
				["energy"] = true,
				["damage"] = true,
			},
			["row_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["streamer_config"] = {
				["faster_updates"] = false,
				["quick_detection"] = false,
				["reset_spec_cache"] = false,
				["no_alerts"] = false,
				["no_helptips"] = false,
				["disable_mythic_dungeon"] = false,
				["use_animation_accel"] = true,
			},
			["all_players_are_group"] = false,
			["use_row_animations"] = true,
			["report_heal_links"] = false,
			["remove_realm_from_name"] = true,
			["minimum_overall_combat_time"] = 10,
			["event_tracker"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["line_height"] = 16,
				["line_color"] = {
					0.1, -- [1]
					0.1, -- [2]
					0.1, -- [3]
					0.3, -- [4]
				},
				["font_shadow"] = "NONE",
				["font_size"] = 10,
				["font_face"] = "Friz Quadrata TT",
				["show_crowdcontrol_pvm"] = false,
				["show_crowdcontrol_pvp"] = true,
				["frame"] = {
					["show_title"] = true,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0.16, -- [1]
						0.16, -- [2]
						0.16, -- [3]
						0.47, -- [4]
					},
					["locked"] = false,
					["height"] = 300,
					["width"] = 250,
				},
				["line_texture"] = "Details Serenity",
				["options_frame"] = {
				},
			},
			["report_to_who"] = "",
			["class_specs_coords"] = {
				{
					0.41015625, -- [1]
					0.4921875, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [1]
				{
					0, -- [1]
					0.08203125, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [2]
				{
					0.08203125, -- [1]
					0.1640625, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [3]
				{
					0.41015625, -- [1]
					0.4921875, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [4]
				{
					0.328125, -- [1]
					0.41015625, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [5]
				{
					0.08203125, -- [1]
					0.1640625, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [6]
				{
					0.90234375, -- [1]
					0.984375, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [7]
				{
					0.8203125, -- [1]
					0.90234375, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [8]
				{
					0, -- [1]
					0.08203125, -- [2]
					0.65625, -- [3]
					0.73828125, -- [4]
				}, -- [9]
				{
					0.24609375, -- [1]
					0.328125, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [10]
				{
					0.1640625, -- [1]
					0.24609375, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [11]
				{
					0, -- [1]
					0.08203125, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [12]
				{
					0.90234375, -- [1]
					0.984375, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [13]
				{
					0.08203125, -- [1]
					0.1640625, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [14]
				{
					0, -- [1]
					0.08203125, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [15]
				{
					0.41015625, -- [1]
					0.4921875, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [16]
				{
					0.4921875, -- [1]
					0.57421875, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [17]
				{
					0.328125, -- [1]
					0.41015625, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [18]
				{
					0.24609375, -- [1]
					0.328125, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [19]
				{
					0.1640625, -- [1]
					0.24609375, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [20]
				{
					0.08203125, -- [1]
					0.1640625, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [21]
				{
					0.4921875, -- [1]
					0.57421875, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [22]
				{
					0.41015625, -- [1]
					0.4921875, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [23]
				{
					0.328125, -- [1]
					0.41015625, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [24]
				{
					0.8203125, -- [1]
					0.90234375, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [25]
				{
					0, -- [1]
					0.08203125, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [26]
				{
					0.90234375, -- [1]
					0.984375, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [27]
				{
					0, -- [1]
					0.08203125, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [28]
				{
					0.8203125, -- [1]
					0.90234375, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [29]
				{
					0.90234375, -- [1]
					0.984375, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [30]
				{
					0.4921875, -- [1]
					0.57421875, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [31]
				{
					0.57421875, -- [1]
					0.65625, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [32]
				{
					0.65625, -- [1]
					0.73828125, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [33]
				{
					0.1640625, -- [1]
					0.24609375, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [34]
				{
					0.24609375, -- [1]
					0.328125, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [35]
				{
					0.08203125, -- [1]
					0.1640625, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [36]
				{
					0.24609375, -- [1]
					0.328125, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [37]
				{
					0.08203125, -- [1]
					0.1640625, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [38]
				{
					0.1640625, -- [1]
					0.24609375, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [39]
				{
					0.328125, -- [1]
					0.41015625, -- [2]
					0.65625, -- [3]
					0.73828125, -- [4]
				}, -- [40]
				{
					0.8203125, -- [1]
					0.90234375, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [41]
				{
					0.90234375, -- [1]
					0.984375, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [42]
				{
					0.1640625, -- [1]
					0.24609375, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [43]
				{
					0.24609375, -- [1]
					0.328125, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [44]
				{
					0.328125, -- [1]
					0.41015625, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [45]
				{
					0.65625, -- [1]
					0.73828125, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [46]
				{
					0.4921875, -- [1]
					0.57421875, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [47]
				{
					0.57421875, -- [1]
					0.65625, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [48]
				{
					0.41015625, -- [1]
					0.4921875, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [49]
				{
					0.24609375, -- [1]
					0.328125, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [50]
				{
					0.328125, -- [1]
					0.41015625, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [51]
				{
					0.4921875, -- [1]
					0.57421875, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [52]
				{
					0.41015625, -- [1]
					0.4921875, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [53]
				{
					0.328125, -- [1]
					0.41015625, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [54]
				{
					0.57421875, -- [1]
					0.65625, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [55]
				{
					0.65625, -- [1]
					0.73828125, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [56]
				{
					0.73828125, -- [1]
					0.8203125, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [57]
				{
					0.57421875, -- [1]
					0.65625, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [58]
				{
					0.8203125, -- [1]
					0.90234375, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [59]
				{
					0.4921875, -- [1]
					0.57421875, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [60]
				{
					0.4921875, -- [1]
					0.57421875, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [61]
				{
					0.65625, -- [1]
					0.73828125, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [62]
				{
					0.57421875, -- [1]
					0.65625, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [63]
				{
					0.90234375, -- [1]
					0.984375, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [64]
				{
					0.8203125, -- [1]
					0.90234375, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [65]
				{
					0.73828125, -- [1]
					0.8203125, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [66]
				{
					0, -- [1]
					0.08203125, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [67]
				{
					0.90234375, -- [1]
					0.984375, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [68]
				{
					0.8203125, -- [1]
					0.90234375, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [69]
				{
					0, -- [1]
					0.08203125, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [70]
				{
					0.90234375, -- [1]
					0.984375, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [71]
				{
					0.8203125, -- [1]
					0.90234375, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [72]
				{
					0.4921875, -- [1]
					0.57421875, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [73]
				{
					0.41015625, -- [1]
					0.4921875, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [74]
				{
					0.328125, -- [1]
					0.41015625, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [75]
				{
					0.73828125, -- [1]
					0.8203125, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [76]
				{
					0.65625, -- [1]
					0.73828125, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [77]
				{
					0.57421875, -- [1]
					0.65625, -- [2]
					0.1640625, -- [3]
					0.24609375, -- [4]
				}, -- [78]
				{
					0.24609375, -- [1]
					0.328125, -- [2]
					0.65625, -- [3]
					0.73828125, -- [4]
				}, -- [79]
				{
					0.1640625, -- [1]
					0.24609375, -- [2]
					0.65625, -- [3]
					0.73828125, -- [4]
				}, -- [80]
				{
					0.08203125, -- [1]
					0.1640625, -- [2]
					0.65625, -- [3]
					0.73828125, -- [4]
				}, -- [81]
				{
					0.24609375, -- [1]
					0.328125, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [82]
				{
					0.1640625, -- [1]
					0.24609375, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [83]
				{
					0.08203125, -- [1]
					0.1640625, -- [2]
					0.4921875, -- [3]
					0.57421875, -- [4]
				}, -- [84]
				{
					0.73828125, -- [1]
					0.8203125, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [85]
				{
					0.65625, -- [1]
					0.73828125, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [86]
				{
					0.57421875, -- [1]
					0.65625, -- [2]
					0.57421875, -- [3]
					0.65625, -- [4]
				}, -- [87]
				{
					0.1640625, -- [1]
					0.24609375, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [88]
				{
					0, -- [1]
					0.08203125, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [89]
				{
					0.08203125, -- [1]
					0.1640625, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [90]
				{
					0.73828125, -- [1]
					0.8203125, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [91]
				{
					0.65625, -- [1]
					0.73828125, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [92]
				{
					0.57421875, -- [1]
					0.65625, -- [2]
					0.24609375, -- [3]
					0.328125, -- [4]
				}, -- [93]
				{
					0.328125, -- [1]
					0.41015625, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [94]
				{
					0.65625, -- [1]
					0.73828125, -- [2]
					0, -- [3]
					0.08203125, -- [4]
				}, -- [95]
				{
					0.73828125, -- [1]
					0.8203125, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [96]
				{
					0.24609375, -- [1]
					0.328125, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [97]
				{
					0.73828125, -- [1]
					0.8203125, -- [2]
					0.41015625, -- [3]
					0.4921875, -- [4]
				}, -- [98]
				{
					0.73828125, -- [1]
					0.8203125, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [99]
				{
					0.41015625, -- [1]
					0.4921875, -- [2]
					0.08203125, -- [3]
					0.1640625, -- [4]
				}, -- [100]
				{
					0.1640625, -- [1]
					0.24609375, -- [2]
					0.328125, -- [3]
					0.41015625, -- [4]
				}, -- [101]
			},
			["profile_save_pos"] = true,
			["tooltip"] = {
				["tooltip_max_abilities"] = 8,
				["bar_color"] = {
					0.1647058874368668, -- [1]
					0.1647058874368668, -- [2]
					0.1647058874368668, -- [3]
					1, -- [4]
				},
				["tooltip_max_pets"] = 2,
				["abbreviation"] = 2,
				["header_text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["background"] = {
					0.0313725508749485, -- [1]
					0.0313725508749485, -- [2]
					0.0313725508749485, -- [3]
					0.8, -- [4]
				},
				["rounded_corner"] = false,
				["divisor_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
				["anchor_screen_pos"] = {
					799.7005615234375, -- [1]
					-708.0000581741333, -- [2]
				},
				["fontcontour"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["header_statusbar"] = {
					0.3, -- [1]
					0.3, -- [2]
					0.3, -- [3]
					0.8, -- [4]
					false, -- [5]
					false, -- [6]
					"WorldState Score", -- [7]
				},
				["fontcolor_right"] = {
					0.9019608497619629, -- [1]
					0.9019608497619629, -- [2]
					0.9019608497619629, -- [3]
					1, -- [4]
				},
				["line_height"] = 17,
				["tooltip_max_targets"] = 2,
				["icon_size"] = {
					["W"] = 17,
					["H"] = 17,
				},
				["anchor_relative"] = "topright",
				["anchored_to"] = 2,
				["fontsize"] = 14,
				["submenu_wallpaper"] = true,
				["fontsize_title"] = 10,
				["commands"] = {
				},
				["menus_bg_color"] = {
					0.8, -- [1]
					0.8, -- [2]
					0.8, -- [3]
					0.2, -- [4]
				},
				["fontface"] = "Expressway",
				["border_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["border_texture"] = "Details BarBorder 3",
				["fontcolor"] = {
					0.9019608497619629, -- [1]
					0.9019608497619629, -- [2]
					0.9019608497619629, -- [3]
					1, -- [4]
				},
				["anchor_offset"] = {
					5, -- [1]
					-28, -- [2]
				},
				["show_amount"] = true,
				["border_size"] = 14,
				["maximize_method"] = 1,
				["fontshadow"] = true,
				["anchor_point"] = "bottomright",
				["menus_bg_coords"] = {
					0.309777336120606, -- [1]
					0.9240000152587891, -- [2]
					0.213000011444092, -- [3]
					0.279000015258789, -- [4]
				},
				["icon_border_texcoord"] = {
					["R"] = 0.921875,
					["L"] = 0.078125,
					["T"] = 0.078125,
					["B"] = 0.921875,
				},
				["show_border_shadow"] = true,
			},
			["ps_abbreviation"] = 2,
			["world_combat_is_trash"] = false,
			["pvp_as_group"] = true,
			["bookmark_text_size"] = 11,
			["animation_speed_mintravel"] = 0.45,
			["track_item_level"] = true,
			["fade_speed"] = 0.15,
			["death_tooltip_spark"] = false,
			["windows_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["instances_menu_click_to_open"] = false,
			["overall_clear_newchallenge"] = true,
			["segments_amount_boss_wipes"] = 10,
			["use_self_color"] = false,
			["data_cleanup_logout"] = false,
			["instances_disable_bar_highlight"] = false,
			["death_log_colors"] = {
				["debuff"] = "purple",
				["buff"] = "silver",
				["friendlyfire"] = "darkorange",
				["heal"] = "green",
				["cooldown"] = "yellow",
				["damage"] = "red",
			},
			["grouping_horizontal_gap"] = 0,
			["deadlog_limit"] = 16,
			["instances_segments_locked"] = true,
			["trash_concatenate"] = false,
			["deny_score_messages"] = false,
			["instances_no_libwindow"] = false,
			["data_broker_text"] = "",
			["animation_speed"] = 33,
			["disable_lock_ungroup_buttons"] = true,
			["disable_stretch_from_toolbar"] = false,
			["realtime_dps_meter"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["arena_enabled"] = true,
				["font_shadow"] = "NONE",
				["font_size"] = 18,
				["mythic_dungeon_enabled"] = false,
				["sample_size"] = 3,
				["frame_settings"] = {
					["show_title"] = true,
					["strata"] = "LOW",
					["point"] = "TOP",
					["scale"] = 1,
					["width"] = 300,
					["y"] = -110,
					["x"] = 0,
					["backdrop_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.2, -- [4]
					},
					["locked"] = true,
					["height"] = 23,
				},
				["update_interval"] = 0.3,
				["text_offset"] = 2,
				["font_face"] = "Friz Quadrata TT",
				["options_frame"] = {
				},
			},
			["memory_ram"] = 64,
			["clear_ungrouped"] = true,
			["numerical_system_symbols"] = "auto",
			["disable_window_groups"] = true,
			["report_schema"] = 1,
			["update_speed"] = 0.5,
			["instances_suppress_trash"] = 0,
			["time_type"] = 2,
			["options_window"] = {
				["scale"] = 1.2,
			},
			["animation_speed_maxtravel"] = 3,
			["player_details_window"] = {
				["scale"] = 1,
				["skin"] = "ElvUI",
				["bar_texture"] = "Skyline",
			},
			["row_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["font_faces"] = {
				["menus"] = "Expressway",
			},
			["overall_clear_newtorghast"] = true,
			["segments_amount"] = 15,
			["report_lines"] = 3,
			["instances"] = {
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -620.9997151717319,
							["x"] = 1416.989118112752,
							["w"] = 197.9983861454568,
							["h"] = 192.0001488757554,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["fontstrings_text3_anchor"] = 35,
					["titlebar_shown"] = false,
					["menu_anchor"] = {
						16, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.0941176563501358,
					["fullborder_size"] = 0.5,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons_2",
					["bars_sort_direction"] = 1,
					["use_auto_align_multi_fontstrings"] = true,
					["rowareaborder_shown"] = false,
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["clickthrough_rows"] = false,
					["titlebar_texture"] = "Atrocity",
					["ignore_mass_showhide"] = false,
					["plugins_grow_direction"] = 1,
					["icon_desaturated"] = false,
					["switch_damager"] = false,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["attribute_icon_size"] = 0,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.0941176563501358,
					["menu_icons_alpha"] = 0.92,
					["bg_b"] = 0.0941176563501358,
					["switch_healer_in_combat"] = false,
					["color"] = {
						0.07058823853731155, -- [1]
						0.07058823853731155, -- [2]
						0.07058823853731155, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["__snapV"] = false,
					["__snapH"] = false,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						false, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -2,
						["shadow"] = false,
					},
					["backdrop_texture"] = "None",
					["__was_opened"] = true,
					["skin"] = "Minimalistic",
					["switch_damager_in_combat"] = false,
					["following"] = {
						["enabled"] = false,
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["fullborder_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["switch_healer"] = false,
					["fontstrings_text2_anchor"] = 70,
					["use_multi_fontstrings"] = false,
					["show_sidebars"] = false,
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["fontstrings_text_limit_offset"] = -10,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 3,
								["timeType"] = 1,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 1,
								["timeType"] = 1,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 2,
								["timeType"] = 1,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["clickthrough_window"] = false,
					["switch_tank_in_combat"] = false,
					["version"] = 3,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onleave"] = 1,
						["ignorebars"] = false,
						["iconstoo"] = true,
						["onenter"] = 1,
					},
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["auto_hide_menu"] = {
						["left"] = true,
						["right"] = false,
					},
					["strata"] = "LOW",
					["rowareaborder_size"] = 0.5,
					["clickthrough_incombatonly"] = true,
					["__snap"] = {
					},
					["switch_all_roles_after_wipe"] = false,
					["hide_in_combat_alpha"] = 0,
					["desaturated_menu"] = false,
					["rounded_corner_enabled"] = false,
					["libwindow"] = {
						["y"] = 3.000221245914317,
						["x"] = -204.0116598664563,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.07058823853731155, -- [1]
							0.07058823853731155, -- [2]
							0.07058823853731155, -- [3]
						},
					},
					["skin_custom"] = "",
					["bars_grow_direction"] = 1,
					["show_statusbar"] = false,
					["rowareaborder_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["menu_icons_size"] = 0.8500000238418579,
					["grab_on_top"] = false,
					["bg_alpha"] = 0,
					["micro_displays_locked"] = true,
					["auto_current"] = true,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["fullborder_shown"] = false,
					["attribute_text"] = {
						["enabled"] = true,
						["shadow"] = false,
						["side"] = 1,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["show_timer_arena"] = true,
						["text_face"] = "Expressway",
						["show_timer_always"] = false,
						["show_timer"] = false,
						["anchor"] = {
							-16, -- [1]
							3, -- [2]
						},
						["enable_custom_text"] = false,
						["text_size"] = 14,
						["show_timer_bg"] = true,
					},
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -620.9997151717319,
							["x"] = 1416.989118112752,
							["w"] = 197.9983861454568,
							["h"] = 192.0001488757554,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["switch_tank"] = false,
					["bars_inverted"] = false,
					["wallpaper"] = {
						["overlay"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["enabled"] = false,
						["texcoord"] = {
							0, -- [1]
							1, -- [2]
							0, -- [3]
							0.7, -- [4]
						},
						["height"] = 114.042518615723,
						["anchor"] = "all",
						["level"] = 2,
						["alpha"] = 0.5,
						["width"] = 283.000183105469,
					},
					["stretch_button_side"] = 1,
					["titlebar_height"] = 14,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
						["textL_outline"] = true,
						["row_offsets"] = {
							["top"] = 0,
							["right"] = 0,
							["left"] = 0,
							["bottom"] = 0,
						},
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textL_outline_small"] = true,
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["textL_offset"] = 0,
						["text_yoffset"] = 0,
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.2000000029802322, -- [4]
						},
						["font_face_file"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["faction_icon_size_offset"] = -10,
						["texture_custom_file"] = "Interface\\",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["backdrop"] = {
							["color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["texture"] = "Details BarBorder 2",
							["enabled"] = false,
							["size"] = 0.2999999821186066,
						},
						["font_size"] = 14,
						["percent_type"] = 1,
						["start_after_icon"] = false,
						["textL_translit_text"] = false,
						["height"] = 23,
						["texture_file"] = "Interface\\Buttons\\WHITE8X8",
						["icon_size_offset"] = 0,
						["show_faction_icon"] = true,
						["icon_mask"] = "",
						["overlay_color"] = {
							0.7019608020782471, -- [1]
							0.7019608020782471, -- [2]
							0.7019608020782471, -- [3]
							0, -- [4]
						},
						["textR_show_data"] = {
							false, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["use_spec_icons"] = true,
						["arena_role_icon_size_offset"] = -10,
						["icon_grayscale"] = false,
						["texture_custom"] = "",
						["textR_bracket"] = "NONE",
						["textR_enable_custom_text"] = false,
						["show_arena_role_icon"] = false,
						["fixed_texture_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
						},
						["textL_show_number"] = false,
						["alpha"] = 1,
						["textL_class_colors"] = false,
						["textR_custom_text"] = "{data1} | {data2}",
						["texture"] = "Solid",
						["fixed_texture_background_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0, -- [4]
						},
						["texture_background_file"] = "Interface\\TargetingFrame\\UI-StatusBar",
						["overlay_texture"] = "Atrocity",
						["textR_outline_small"] = true,
						["texture_background"] = "Atrocity",
						["textR_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.1500000357627869, -- [4]
						},
						["no_icon"] = false,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
						["font_face"] = "Expressway",
						["texture_class_colors"] = true,
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 1,
						},
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
					},
					["menu_icons_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["titlebar_texture_color"] = {
						0.2000000178813934, -- [1]
						0.2000000178813934, -- [2]
						0.2000000178813934, -- [3]
						0, -- [4]
					},
				}, -- [1]
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -583.9983416895021,
							["x"] = 1616.992645641068,
							["w"] = 197.9991470659845,
							["h"] = 120.0004673044545,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["fontstrings_text3_anchor"] = 35,
					["titlebar_shown"] = false,
					["menu_anchor"] = {
						16, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.0941176563501358,
					["fullborder_size"] = 0.5,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons_2",
					["bars_sort_direction"] = 1,
					["use_auto_align_multi_fontstrings"] = true,
					["rowareaborder_shown"] = false,
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["clickthrough_rows"] = false,
					["titlebar_texture"] = "Atrocity",
					["ignore_mass_showhide"] = false,
					["plugins_grow_direction"] = 1,
					["icon_desaturated"] = false,
					["switch_damager"] = false,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["attribute_icon_size"] = 0,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.0941176563501358,
					["menu_icons_alpha"] = 0.92,
					["bg_b"] = 0.0941176563501358,
					["switch_healer_in_combat"] = false,
					["color"] = {
						0.07058823853731155, -- [1]
						0.07058823853731155, -- [2]
						0.07058823853731155, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["__snapV"] = false,
					["__snapH"] = false,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						false, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -2,
						["shadow"] = false,
					},
					["backdrop_texture"] = "None",
					["__was_opened"] = true,
					["skin"] = "Minimalistic",
					["switch_damager_in_combat"] = false,
					["following"] = {
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["enabled"] = false,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["fullborder_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["switch_healer"] = false,
					["fontstrings_text2_anchor"] = 70,
					["use_multi_fontstrings"] = false,
					["show_sidebars"] = false,
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["fontstrings_text_limit_offset"] = -10,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 3,
								["timeType"] = 1,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 1,
								["timeType"] = 1,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 2,
								["timeType"] = 1,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["clickthrough_window"] = false,
					["switch_tank_in_combat"] = false,
					["version"] = 3,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onenter"] = 1,
						["iconstoo"] = true,
						["ignorebars"] = false,
						["onleave"] = 1,
					},
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["auto_hide_menu"] = {
						["left"] = true,
						["right"] = false,
					},
					["strata"] = "LOW",
					["rowareaborder_size"] = 0.5,
					["clickthrough_incombatonly"] = true,
					["__snap"] = {
					},
					["switch_all_roles_after_wipe"] = false,
					["hide_in_combat_alpha"] = 0,
					["desaturated_menu"] = false,
					["rounded_corner_enabled"] = false,
					["libwindow"] = {
						["y"] = 76.00143706458364,
						["x"] = -4.007867670130509,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.07058823853731155, -- [1]
							0.07058823853731155, -- [2]
							0.07058823853731155, -- [3]
						},
					},
					["skin_custom"] = "",
					["bars_grow_direction"] = 1,
					["show_statusbar"] = false,
					["rowareaborder_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["menu_icons_size"] = 0.8500000238418579,
					["grab_on_top"] = false,
					["bg_alpha"] = 0,
					["micro_displays_locked"] = true,
					["auto_current"] = true,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["fullborder_shown"] = false,
					["attribute_text"] = {
						["enabled"] = true,
						["shadow"] = false,
						["side"] = 1,
						["text_size"] = 14,
						["custom_text"] = "{name}",
						["show_timer_arena"] = true,
						["text_face"] = "Expressway",
						["show_timer_always"] = false,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["anchor"] = {
							-16, -- [1]
							3, -- [2]
						},
						["enable_custom_text"] = false,
						["show_timer"] = false,
						["show_timer_bg"] = true,
					},
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -583.9983416895021,
							["x"] = 1616.992645641068,
							["w"] = 197.9991470659845,
							["h"] = 120.0004673044545,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["switch_tank"] = false,
					["bars_inverted"] = false,
					["wallpaper"] = {
						["enabled"] = false,
						["overlay"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["texcoord"] = {
							0, -- [1]
							1, -- [2]
							0, -- [3]
							0.7, -- [4]
						},
						["height"] = 114.042518615723,
						["anchor"] = "all",
						["level"] = 2,
						["alpha"] = 0.5,
						["width"] = 283.000183105469,
					},
					["stretch_button_side"] = 1,
					["titlebar_height"] = 14,
					["row_info"] = {
						["show_arena_role_icon"] = false,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
						["textL_outline"] = true,
						["row_offsets"] = {
							["top"] = 0,
							["right"] = 0,
							["left"] = 0,
							["bottom"] = 0,
						},
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textR_show_data"] = {
							false, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["textL_offset"] = 0,
						["text_yoffset"] = 0,
						["texture_background_class_color"] = false,
						["start_after_icon"] = false,
						["font_face_file"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["faction_icon_size_offset"] = -10,
						["texture_custom_file"] = "Interface\\",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["backdrop"] = {
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["size"] = 0.2999999821186066,
							["enabled"] = false,
							["texture"] = "Details BarBorder 2",
						},
						["font_size"] = 14,
						["percent_type"] = 1,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.2000000029802322, -- [4]
						},
						["textL_translit_text"] = false,
						["height"] = 23,
						["texture_file"] = "Interface\\Buttons\\WHITE8X8",
						["icon_size_offset"] = 0,
						["show_faction_icon"] = true,
						["icon_mask"] = "",
						["overlay_color"] = {
							0.7019608020782471, -- [1]
							0.7019608020782471, -- [2]
							0.7019608020782471, -- [3]
							0, -- [4]
						},
						["textL_outline_small"] = true,
						["textR_outline_small"] = true,
						["arena_role_icon_size_offset"] = -10,
						["icon_grayscale"] = false,
						["textR_bracket"] = "NONE",
						["use_spec_icons"] = true,
						["textR_enable_custom_text"] = false,
						["textR_outline"] = true,
						["fixed_texture_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
						},
						["textL_show_number"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.1500000357627869, -- [4]
						},
						["texture_background"] = "Atrocity",
						["textR_custom_text"] = "{data1} | {data2}",
						["fixed_texture_background_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0, -- [4]
						},
						["texture_custom"] = "",
						["texture_background_file"] = "Interface\\TargetingFrame\\UI-StatusBar",
						["overlay_texture"] = "Atrocity",
						["texture"] = "Solid",
						["textR_class_colors"] = false,
						["textL_class_colors"] = false,
						["alpha"] = 1,
						["no_icon"] = false,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
						["font_face"] = "Expressway",
						["texture_class_colors"] = true,
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 1,
						},
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
					},
					["menu_icons_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["titlebar_texture_color"] = {
						0.2000000178813934, -- [1]
						0.2000000178813934, -- [2]
						0.2000000178813934, -- [3]
						0, -- [4]
					},
				}, -- [2]
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -692.9997399843578,
							["x"] = 1616.492158434819,
							["w"] = 198.9997741017183,
							["h"] = 48.00023985538375,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["fontstrings_text3_anchor"] = 38,
					["titlebar_shown"] = false,
					["menu_anchor"] = {
						16, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.0941176563501358,
					["fullborder_size"] = 0.5,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons_2_shadow",
					["bars_sort_direction"] = 1,
					["use_auto_align_multi_fontstrings"] = true,
					["rowareaborder_shown"] = false,
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["clickthrough_rows"] = false,
					["titlebar_texture"] = "Atrocity",
					["ignore_mass_showhide"] = false,
					["plugins_grow_direction"] = 1,
					["icon_desaturated"] = false,
					["switch_damager"] = false,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["attribute_icon_size"] = 0,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.0941176563501358,
					["menu_icons_alpha"] = 0.92,
					["bg_b"] = 0.0941176563501358,
					["switch_healer_in_combat"] = false,
					["color"] = {
						0.07058823853731155, -- [1]
						0.07058823853731155, -- [2]
						0.07058823853731155, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["__snapV"] = false,
					["__snapH"] = false,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -2,
						["shadow"] = false,
					},
					["backdrop_texture"] = "None",
					["__was_opened"] = true,
					["skin"] = "Minimalistic",
					["switch_damager_in_combat"] = false,
					["following"] = {
						["enabled"] = false,
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["fullborder_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["switch_healer"] = false,
					["fontstrings_text2_anchor"] = 73,
					["use_multi_fontstrings"] = false,
					["show_sidebars"] = false,
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["fontstrings_text_limit_offset"] = -10,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 3,
								["textStyle"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textXMod"] = 0,
								["textAlign"] = 1,
								["textStyle"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textFace"] = "Accidental Presidency",
								["textXMod"] = 6,
								["textAlign"] = 2,
								["textStyle"] = 2,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["clickthrough_window"] = false,
					["switch_tank_in_combat"] = false,
					["version"] = 3,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onleave"] = 1,
						["ignorebars"] = false,
						["iconstoo"] = true,
						["onenter"] = 1,
					},
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["auto_hide_menu"] = {
						["left"] = true,
						["right"] = false,
					},
					["strata"] = "LOW",
					["rowareaborder_size"] = 0.5,
					["clickthrough_incombatonly"] = true,
					["__snap"] = {
					},
					["switch_all_roles_after_wipe"] = false,
					["hide_in_combat_alpha"] = 0,
					["desaturated_menu"] = false,
					["rounded_corner_enabled"] = false,
					["libwindow"] = {
						["y"] = 3.000147841896015,
						["x"] = -4.007867670130509,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.07058823853731155, -- [1]
							0.07058823853731155, -- [2]
							0.07058823853731155, -- [3]
						},
					},
					["skin_custom"] = "",
					["bars_grow_direction"] = 1,
					["show_statusbar"] = false,
					["rowareaborder_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["menu_icons_size"] = 0.8500000238418579,
					["grab_on_top"] = false,
					["bg_alpha"] = 0,
					["micro_displays_locked"] = true,
					["auto_current"] = true,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["fullborder_shown"] = false,
					["attribute_text"] = {
						["enabled"] = true,
						["shadow"] = false,
						["side"] = 1,
						["text_size"] = 14,
						["custom_text"] = "{name}",
						["show_timer_arena"] = true,
						["text_face"] = "Expressway",
						["show_timer_always"] = true,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["anchor"] = {
							-16, -- [1]
							4, -- [2]
						},
						["show_timer"] = false,
						["enable_custom_text"] = false,
						["show_timer_bg"] = true,
					},
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -692.9997399843578,
							["x"] = 1616.492158434819,
							["w"] = 198.9997741017183,
							["h"] = 48.00023985538375,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["switch_tank"] = false,
					["bars_inverted"] = false,
					["wallpaper"] = {
						["enabled"] = false,
						["overlay"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["texcoord"] = {
							0, -- [1]
							1, -- [2]
							0, -- [3]
							0.7, -- [4]
						},
						["anchor"] = "all",
						["height"] = 114.042518615723,
						["level"] = 2,
						["alpha"] = 0.5,
						["width"] = 283.000183105469,
					},
					["stretch_button_side"] = 1,
					["titlebar_height"] = 14,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
						["textL_outline"] = true,
						["row_offsets"] = {
							["top"] = 0,
							["right"] = 0,
							["left"] = 0,
							["bottom"] = 0,
						},
						["textR_outline_small"] = true,
						["textL_outline_small"] = true,
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["textL_offset"] = 0,
						["text_yoffset"] = 0,
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.2000000029802322, -- [4]
						},
						["font_face_file"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["faction_icon_size_offset"] = -10,
						["texture_custom_file"] = "Interface\\",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["font_size"] = 14,
						["backdrop"] = {
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["texture"] = "Details BarBorder 2",
							["enabled"] = false,
							["size"] = 0.2999999821186066,
						},
						["start_after_icon"] = false,
						["textL_translit_text"] = false,
						["height"] = 23,
						["texture_file"] = "Interface\\Buttons\\WHITE8X8",
						["icon_size_offset"] = 0,
						["textR_show_data"] = {
							false, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["icon_mask"] = "",
						["overlay_color"] = {
							0.7, -- [1]
							0.7, -- [2]
							0.7, -- [3]
							0, -- [4]
						},
						["arena_role_icon_size_offset"] = -10,
						["show_arena_role_icon"] = false,
						["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
						["icon_grayscale"] = false,
						["texture_custom"] = "",
						["use_spec_icons"] = true,
						["textR_enable_custom_text"] = false,
						["texture_background"] = "Atrocity",
						["fixed_texture_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
						},
						["textL_show_number"] = false,
						["alpha"] = 1,
						["textR_class_colors"] = false,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "Solid",
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 1,
						},
						["fixed_texture_background_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.150228589773178, -- [4]
						},
						["overlay_texture"] = "Atrocity",
						["texture_background_file"] = "Interface\\TargetingFrame\\UI-StatusBar",
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textL_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.1500000357627869, -- [4]
						},
						["no_icon"] = false,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["textR_bracket"] = "NONE",
						["font_face"] = "Expressway",
						["texture_class_colors"] = true,
						["show_faction_icon"] = true,
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["percent_type"] = 1,
					},
					["menu_icons_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["titlebar_texture_color"] = {
						0.2, -- [1]
						0.2, -- [2]
						0.2, -- [3]
						0.8, -- [4]
					},
				}, -- [3]
			},
			["overall_clear_pvp"] = true,
			["overall_flag"] = 16,
			["use_scroll"] = false,
			["skin"] = "Minimalistic",
			["override_spellids"] = true,
			["color_by_arena_team"] = true,
			["realtimedps_always_arena"] = false,
			["overall_clear_logout"] = false,
			["window_clamp"] = {
				-8, -- [1]
				0, -- [2]
				21, -- [3]
				-14, -- [4]
			},
			["minimum_combat_time"] = 5,
			["memory_threshold"] = 3,
			["cloud_capture"] = true,
			["damage_taken_everything"] = false,
			["scroll_speed"] = 2,
			["font_sizes"] = {
				["menus"] = 14,
			},
			["chat_tab_embed"] = {
				["enabled"] = false,
				["y_offset"] = 0,
				["x_offset"] = 0,
				["tab_name"] = "",
				["single_window"] = false,
			},
			["deadlog_events"] = 32,
			["total_abbreviation"] = 2,
			["close_shields"] = false,
			["class_coords"] = {
				["HUNTER"] = {
					0, -- [1]
					0.125, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				["WARRIOR"] = {
					0, -- [1]
					0.125, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				["ROGUE"] = {
					0.248046875, -- [1]
					0.37109375, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				["MAGE"] = {
					0.125, -- [1]
					0.248046875, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				["TINKER"] = {
					0.25, -- [1]
					0.375, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["PROPHET"] = {
					0.875, -- [1]
					1, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				["RANGER"] = {
					0.125, -- [1]
					0.25, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				["NECROMANCER"] = {
					0.5, -- [1]
					0.625, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				["WILDWALKER"] = {
					0.625, -- [1]
					0.75, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["UNGROUPPLAYER"] = {
					0.25, -- [1]
					0.375, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["DRUID"] = {
					0.37109375, -- [1]
					0.494140625, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				["MONK"] = {
					0.25, -- [1]
					0.369140625, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				["BARBARIAN"] = {
					0, -- [1]
					0.125, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				["HERO"] = {
					0, -- [1]
					0.125, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				["STORMBRINGER"] = {
					0, -- [1]
					0.125, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["SPIRITMAGE"] = {
					0.75, -- [1]
					0.875, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				["PYROMANCER"] = {
					0, -- [1]
					0.125, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				["WARLOCK"] = {
					0.37109375, -- [1]
					0.494140625, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				["DEMONHUNTER"] = {
					0.36914063, -- [1]
					0.5, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				["Horde"] = {
					0.37109375, -- [1]
					0.494140625, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["WITCHHUNTER"] = {
					0.875, -- [1]
					1, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["EVOKER"] = {
					0.50390625, -- [1]
					0.625, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				["FLESHWARDEN"] = {
					0.75, -- [1]
					0.875, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				["SHAMAN"] = {
					0.125, -- [1]
					0.248046875, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				["REAPER"] = {
					0.25, -- [1]
					0.375, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				["CULTIST"] = {
					0.25, -- [1]
					0.375, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				["GUARDIAN"] = {
					0.875, -- [1]
					1, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				["MONSTER"] = {
					0, -- [1]
					0.125, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["SONOFARUGAL"] = {
					0.625, -- [1]
					0.75, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				["DEATHKNIGHT"] = {
					0.125, -- [1]
					0.25, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				["WITCHDOCTOR"] = {
					0.75, -- [1]
					0.875, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["UNKNOW"] = {
					0.25, -- [1]
					0.375, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["PRIEST"] = {
					0.248046875, -- [1]
					0.37109375, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				["STARCALLER"] = {
					0.875, -- [1]
					1, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				["Alliance"] = {
					0.248046875, -- [1]
					0.02968748, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["SUNCLERIC"] = {
					0.125, -- [1]
					0.25, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["CHRONOMANCER"] = {
					0.125, -- [1]
					0.25, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				["PALADIN"] = {
					0, -- [1]
					0.125, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				["PET"] = {
					0.125, -- [1]
					0.248046875, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				["ENEMY"] = {
					0, -- [1]
					0.125, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
			},
			["class_colors"] = {
				["HUNTER"] = {
					0.67, -- [1]
					0.83, -- [2]
					0.45, -- [3]
				},
				["WARRIOR"] = {
					0.78, -- [1]
					0.61, -- [2]
					0.43, -- [3]
				},
				["PALADIN"] = {
					0.96, -- [1]
					0.55, -- [2]
					0.73, -- [3]
				},
				["MAGE"] = {
					0.41, -- [1]
					0.8, -- [2]
					0.94, -- [3]
				},
				["TINKER"] = {
					0.64, -- [1]
					0.64, -- [2]
					0.64, -- [3]
				},
				["PROPHET"] = {
					1, -- [1]
					0.49, -- [2]
					0.04, -- [3]
				},
				["RANGER"] = {
					1, -- [1]
					0.96, -- [2]
					0.41, -- [3]
				},
				["NECROMANCER"] = {
					0.53, -- [1]
					0.53, -- [2]
					0.9300000000000001, -- [3]
				},
				["WILDWALKER"] = {
					0.05, -- [1]
					0.18, -- [2]
					0.84, -- [3]
				},
				["SELF"] = {
					0.89019, -- [1]
					0.32156, -- [2]
					0.89019, -- [3]
				},
				["DRUID"] = {
					1, -- [1]
					0.49, -- [2]
					0.04, -- [3]
				},
				["ARENA_GREEN"] = {
					0.6862745098039216, -- [1]
					0.3843137254901961, -- [2]
					1, -- [3]
				},
				["BARBARIAN"] = {
					0.54, -- [1]
					0.2, -- [2]
					0.01, -- [3]
				},
				["HERO"] = {
					1, -- [1]
					0.84, -- [2]
					0.14, -- [3]
				},
				["STORMBRINGER"] = {
					0, -- [1]
					0.44, -- [2]
					0.87, -- [3]
				},
				["SPIRITMAGE"] = {
					0.25, -- [1]
					0.78, -- [2]
					0.92, -- [3]
				},
				["PYROMANCER"] = {
					1, -- [1]
					0.19, -- [2]
					0.06, -- [3]
				},
				["version"] = 1,
				["DEMONHUNTER"] = {
					0.64, -- [1]
					0.19, -- [2]
					0.79, -- [3]
				},
				["SUNCLERIC"] = {
					0.96, -- [1]
					0.55, -- [2]
					0.73, -- [3]
				},
				["EVOKER"] = {
					0.2, -- [1]
					0.498, -- [2]
					0.5764, -- [3]
				},
				["FLESHWARDEN"] = {
					0.84, -- [1]
					0.28, -- [2]
					0.28, -- [3]
				},
				["SHAMAN"] = {
					0, -- [1]
					0.44, -- [2]
					0.87, -- [3]
				},
				["REAPER"] = {
					0.77, -- [1]
					0.12, -- [2]
					0.23, -- [3]
				},
				["CULTIST"] = {
					0.88, -- [1]
					0.78, -- [2]
					1, -- [3]
				},
				["GUARDIAN"] = {
					0.78, -- [1]
					0.61, -- [2]
					0.43, -- [3]
				},
				["SONOFARUGAL"] = {
					0.8, -- [1]
					0.6, -- [2]
					0, -- [3]
				},
				["DEATHKNIGHT"] = {
					0.77, -- [1]
					0.12, -- [2]
					0.23, -- [3]
				},
				["CHRONOMANCER"] = {
					0.95, -- [1]
					0.9, -- [2]
					0.6, -- [3]
				},
				["WARLOCK"] = {
					0.58, -- [1]
					0.51, -- [2]
					0.79, -- [3]
				},
				["WITCHHUNTER"] = {
					0.67, -- [1]
					0.83, -- [2]
					0.45, -- [3]
				},
				["WITCHDOCTOR"] = {
					0.43, -- [1]
					1, -- [2]
					0, -- [3]
				},
				["UNKNOW"] = {
					0.2, -- [1]
					0.2, -- [2]
					0.2, -- [3]
				},
				["PRIEST"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["STARCALLER"] = {
					0.71, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["ARENA_YELLOW"] = {
					1, -- [1]
					1, -- [2]
					0.25, -- [3]
				},
				["ROGUE"] = {
					1, -- [1]
					0.96, -- [2]
					0.41, -- [3]
				},
				["UNGROUPPLAYER"] = {
					0.4, -- [1]
					0.4, -- [2]
					0.4, -- [3]
				},
				["MONK"] = {
					0, -- [1]
					1, -- [2]
					0.59, -- [3]
				},
				["NEUTRAL"] = {
					1, -- [1]
					1, -- [2]
					0, -- [3]
				},
				["PET"] = {
					0.3, -- [1]
					0.4, -- [2]
					0.5, -- [3]
				},
				["ENEMY"] = {
					0.94117, -- [1]
					0, -- [2]
					0.0196, -- [3]
					1, -- [4]
				},
			},
			["disable_alldisplays_window"] = false,
			["segments_amount_to_save"] = 15.22327136993408,
			["segments_boss_wipes_keep_best_performance"] = true,
			["hotcorner_topleft"] = {
				["hide"] = false,
			},
			["animation_speed_triggertravel"] = 5,
			["clear_graphic"] = true,
			["trash_auto_remove"] = true,
			["segments_auto_erase"] = 1,
			["options_group_edit"] = true,
			["broadcaster_enabled"] = false,
			["minimap"] = {
				["onclick_what_todo"] = 1,
				["radius"] = 160,
				["hide"] = true,
				["minimapPos"] = 220,
				["text_format"] = 3,
				["text_type"] = 1,
			},
			["instances_amount"] = 3,
			["max_window_size"] = {
				["height"] = 450,
				["width"] = 480,
			},
			["new_window_size"] = {
				["height"] = 158,
				["width"] = 310,
			},
			["only_pvp_frags"] = false,
			["disable_stretch_button"] = true,
			["default_bg_color"] = 0.0941,
			["windows_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["overall_clear_newboss"] = true,
			["segments_panic_mode"] = false,
			["realtimedps_order_bars"] = false,
			["time_type_original"] = 2,
			["auto_swap_to_dynamic_overall"] = false,
			["use_realtimedps"] = false,
			["numerical_system"] = 1,
			["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
			["force_activity_time_pvp"] = true,
			["death_tooltip_width"] = 350,
			["death_tooltip_texture"] = "Details Serenity",
			["disable_reset_button"] = false,
			["animate_scroll"] = false,
			["standard_skin"] = false,
			["use_battleground_server_parser"] = false,
			["default_bg_alpha"] = 0.5,
			["all_in_one_windows"] = {
			},
		},
}

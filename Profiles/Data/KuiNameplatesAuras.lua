local MaddinUI = _G.MaddinUI
if not MaddinUI then return end

MaddinUI.profileData = MaddinUI.profileData or {}
MaddinUI.profileData.KuiSpellListCustom = {
	["Classes"] = {
		["PROPHET"] = {
			[804983] = true,
			[804982] = true,
			[805896] = true,
		},
		["CULTIST"] = {
			[502215] = true,
		},
	},
	["Ignore"] = {
	},
}

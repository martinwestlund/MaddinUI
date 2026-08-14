local MaddinUI = _G.MaddinUI
if not MaddinUI then return end

MaddinUI.profileData = MaddinUI.profileData or {}
MaddinUI.profileData.KuiNameplates = {
    profileName = "MaddinUI",
    profile = {
					["display"] = {
						["casttime"] = true,
						["cbheight"] = 14,
						["barcolour"] = {
							0.3058823529411765, -- [1]
							0.6549019607843137, -- [2]
							0.3137254901960784, -- [3]
						},
					},
				},
    namespaces = {
        ["Castbar"] = {
					["display"] = {
						["casttime"] = true,
						["cbheight"] = 14,
						["barcolour"] = {
							0.3058823529411765, -- [1]
							0.6549019607843137, -- [2]
							0.3137254901960784, -- [3]
						},
					},
				},
        ["LowHealthColours"] = {
					["enabled"] = false,
				},
        ["Auras"] = {
					["display"] = {
						["timerThreshold"] = 5,
					},
					["icons"] = {
						["squareness"] = 0.7000000000000001,
						["icon_size"] = 32,
					},
				},
        ["TankMode"] = {
					["brackets"] = {
						["scale"] = 0.599395751953125,
					},
					["tankmode"] = {
						["enabled"] = 2,
					},
				},
    },
}

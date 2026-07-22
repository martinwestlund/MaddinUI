local MaddinUI = _G.MaddinUI
if not MaddinUI then return end

MaddinUI.profileData = MaddinUI.profileData or {}
MaddinUI.profileData.KuiNameplates = {
    profileName = "MaddinUI",
    profile = {
        fonts = {
            options = {
                fontscale = 2.163720846176148,
                font = "Accidental Presidency",
            },
        },
        nameoffsety = -6.5,
        general = {
            glowshadow = false,
            thheight = 6,
            bartexture = "Flat",
            targetarrows = true,
            width = 198,
            hheight = 28,
            targetglowcolour = {
                0.9921568627450981,
                1,
            },
        },
        nameoffsetx = -18,
        text = {
            nameoffsety = -6.5,
            nameoffsetx = -18,
            level = true,
        },
    },
    namespaces = {
        Castbar = {
            display = {
                casttime = true,
                cbheight = 14,
                barcolour = {
                    0.3058823529411765,
                    0.6549019607843137,
                    0.3137254901960784,
                },
            },
        },
        LowHealthColours = {
            enabled = false,
        },
        Auras = {
            display = {
                timerThreshold = 5,
            },
            icons = {
                squareness = 0.7000000000000001,
                icon_size = 32,
            },
        },
        TankMode = {
            tankmode = {
                enabled = 3,
            },
            brackets = {
                scale = 0.599395751953125,
            },
        },
    },
}

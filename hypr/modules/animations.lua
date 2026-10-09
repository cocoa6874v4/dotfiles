hl.config({
    animations = {
        enabled = true
    }
})

hl.curve("springOpen", {
    type = "spring",
    mass = 1,
    stiffness = 180,
    damping = 14
})

hl.curve("springMove", {
    type = "spring",
    mass = 1,
    stiffness = 240,
    damping = 20
})

hl.curve("smooth", {
    type = "bezier",
    points = { { 0.22, 1 }, { 0.36, 1 } }
})

hl.curve("exit", {
    type = "bezier",
    points = { { 0.6, 0 }, { 1, 1 } }
})

-- animations
local anims = {
    { "global",           4,   "smooth" },

    { "windowsIn",        4.2, "springOpen", "popin 85%",         "spring" },
    { "windowsOut",       2,   "exit",       "popin 90%" },
    { "windowsMove",      4,   "springMove", nil,                 "spring" },

    { "border",           3,   "smooth" },

    { "fade",             3,   "smooth" },
    { "fadeIn",           2.5, "smooth" },
    { "fadeOut",          1.8, "exit" },
    { "fadeSwitch",       2.5, "smooth" },
    { "fadeShadow",       3,   "smooth" },
    { "fadeGlow",         3,   "smooth" },

    { "workspacesIn",     4.5, "springMove", "slidefade 18%",     "spring" },
    { "workspacesOut",    4.5, "springMove", "slidefade 18%",     "spring" },

    { "specialWorkspace", 4.5, "springOpen", "slidefadevert 20%", "spring" },

    { "layersIn",         3,   "smooth",     "fade" },
    { "layersOut",        2,   "exit",       "fade" },
}

for _, anim in ipairs(anims) do
    local opts = {
        leaf = anim[1],
        enabled = true,
        speed = anim[2],
        style = anim[4]
    }

    if anim[5] == "spring" then
        opts.spring = anim[3]
    else
        opts.bezier = anim[3]
    end

    hl.animation(opts)
end

hl.animation({
    leaf = "borderangle",
    enabled = false
})

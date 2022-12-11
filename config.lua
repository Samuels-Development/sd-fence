Config = {}

-- Time to Open the Menu

Config.MinimumTime = 5 -- 5:00am
Config.MaximumTime = 22 -- 10:00pm

-- Blip Creation

Config.Blip = {
    Enable = false, -- Change to false to disable blip creation
    Location = vector3(973.25, -2190.45, 30.55), -- Blip location
    Sprite = 480,
    Display = 4,
    Scale = 0.6,
    Colour = 1,
    Name = "Mysterious Person", -- Name of the blip
}

-- NPC Creation

Config.fenceNPC = {
    [1] = {
        location = vector3(973.25, -2190.45, 29.55),
        heading = 263.29, 
        model = "u_m_y_militarybum"
    },
}

-- Goods

Config.Items = {
    [1] = {
        item = 'goldchain',
        price = math.random(500,1500)
    },
    [2] = {
        item = 'diamond_ring',
        price = math.random(1000,1750)
    },
    [3] = {
        item = 'rolex',
        price = math.random(1000,1500)
    },
    [4] = {
        item = '10kgoldchain',
        price = math.random(500,1000)
    },
    [5] = {
        item = 'tablet',
        price = math.random(400,1200)
    },
    [6] = {
        item = 'iphone',
        price = math.random(600,1400)
    },
    [7] = {
        item = 'samsungphone',
        price = math.random(500,900)
    },
    [8] = {
        item = 'laptop',
        price = math.random(400,1200)
    }
}



--Learning Lua: Ultizing Tables with randomizationMar 9 2025

--[[ 'leaderboard' table
* empty table contruction
* index based on placement (need function to ensure placement is accurate based on value)
* key = player
* value = wins
]]
local leaderboard = {} -- empty table contruction


--[[ Colors table
* key = color 
* value = "state" integer
]]
local colors = {
    ["white"] = 0,
    ["green"] = 1,
    ["red"] = -1
}

-- table insert (Note: params)
table.insert(colors, {["blue"] = -2})

-- Easier accessed by the integers, colors redone for game logic
--[[ Colors table
* key = value
* numberical state = index (1 = white, 2 for red, etc.)
]]
local colorFunctions = {
    white = nil,
    red = Loss(),
    green = Win(),
    blue = Freeze(),
    black = Disorient()
}

local colorsHex = {
    white = "#FFFFFF",  -- Bright White
    red = "#FF073A",    -- Neon Red
    green = "#39FF14",  -- Neon Green
    blue = "#1E90FF",   -- Neon Blue
    black = "#0F0F0F"   -- Deep Black 
}

local colorProbability = {
    white = 0.3,  -- 30% chance
    red = 0.2,    -- 20% chance
    green = 0.3,  -- 20% chance
    blue = 0.1,   -- 15% chance
    black = 0.1   -- 15% chance
}

-- Button Functions

function Loss ()
    
end

function Win()
    
end

function Freeze()
    
end

function Disorient()
    
end
-- LoveButton.lua
local LoveButton = {}

-- Global Variables
LoveButton.State = 1                 -- set to white on default
LoveButton.HexCode = "#FFFFFF"      -- set to white on default
LoveButton.Time = 5                 -- set to 5 seconds on default
LoveButton.ApperanceProbalityLevel = "easy"  -- set to easy on default

-- Functions for the different button states
LoveButton.Loss = function()
    print("L")
end

LoveButton.Win = function()
    print("dub")
end

LoveButton.Stun = function()
    print("stun")
end

LoveButton.Freeze = function()
    print("freeze")
end

LoveButton.Disorient = function()
    print("disorient")
end

-- Color functions table
local colorFunctions = {
    [1] = LoveButton.Stun,
    [2] = LoveButton.Loss,
    [3] = LoveButton.Win,
    [4] = LoveButton.Freeze,
    [5] = LoveButton.Disorient
}

function LoveButton.ClickButton()
    print("Clicked!")
    local action = colorFunctions[LoveButton.State]
    if action ~= nil then
        action()
    else 
        print("Invalid " .. LoveButton.State)
    end
end

-- Colors hex values table
local colorsHex = {
    white = "#FFFFFF",  -- Bright White
    red = "#FF073A",    -- Neon Red
    green = "#39FF14",  -- Neon Green
    blue = "#1E90FF",   -- Neon Blue
    black = "#0F0F0F"   -- Deep Black 
}

-- Probality tables for apperance level
local easyColorAppearanceTable = {
    { color = "white", probability = 0.3 },
    { color = "red", probability = 0.25 },
    { color = "green", probability = 0.1 },
    { color = "blue", probability = 0.2 },
    { color = "black", probability = 0.15 }
}

function LoveButton.GetRandomColor()
    local value = math.random() -- float val from 0 to 1

    -- Use proper probability table (easy only)
    return LoveButton.GetColorFromProbability(easyColorAppearanceTable, value)
end

-- Helper for picking a random color based on probability table
function LoveButton.GetColorFromProbability(probTable, value)
    local cumulative = 0

    for i = 1, #probTable do
        local entry = probTable[i]
        local lowerBound = cumulative
        cumulative = cumulative + entry.probability

        if value >= lowerBound and value < cumulative then
            print("Probability entry: " .. entry.color)

            LoveButton.State = i
            LoveButton.HexCode = colorsHex[entry.color]  -- Access colorsHex by name
            LoveButton.GetRandomTime()
            return entry.color
        end
    end
    return nil
end

-- Random time function
function LoveButton.GetRandomTime()
    local val
    if LoveButton.ApperanceProbalityLevel == "hard" then
        val = math.random(1, 3)
        if val == 1 then
            LoveButton.Time = math.random(8, 10)
        elseif val == 2 then
            LoveButton.Time = math.random(3, 5)
        else
            LoveButton.Time = 1
        end
    elseif LoveButton.ApperanceProbalityLevel == "medium" then
        LoveButton.Time = math.random(1, 2)
    else 
        LoveButton.Time = math.random(1, 3)
    end
    print("Time: " .. LoveButton.Time)
end

-- Return the module table
return LoveButton

-- BUTTON FUNCTIONALTY
-- Tables: keys on left = values on right

-- Global Variables
State = 1                 -- set to white on default
HexCode = "#FFFFFF"      -- set to white on default
Time = 5             -- set to 5 seconds on default
ApperanceProbalityLevel = "easy"     -- set to easy on default

-- !! Tables !!

-- Colors function table
-- values: functions to handle game logic based on button color
local colorFunctions = {
    white = Stun(),
    red = Loss(),
    green = Win(),
    blue = Freeze(),
    black = Disorient()
}

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
    { color = "red", probability = 0.2 },
    { color = "green", probability = 0.3 },
    { color = "blue", probability = 0.1 },
    { color = "black", probability = 0.1 }
}
local mediumColorAppearanceTable = {
    { color = "white", probability = 0.2 },
    { color = "red", probability = 0.3 },
    { color = "green", probability = 0.2 },
    { color = "blue", probability = 0.2 },
    { color = "black", probability = 0.1 }
}
local hardColorAppearanceTable = {
    { color = "white", probability = 0.05 },
    { color = "red", probability = 0.35 },
    { color = "green", probability = 0.1 },
    { color = "blue", probability = 0.3 },
    { color = "black", probability = 0.2 }
}

-- !! Button Functions (game logic) !!

-- Button Click logic
function ClickButton(color)
    local action = colorFunctions[color]
    if action ~= nil then
        action()
    else 
        print("Invalid " .. color .. ":" .. action)
    end
end

-- Hand player an L
function Loss()
    print("L")
end

-- Hand player a W
function Win()
    print("dub")
end

-- "Stun" the player (brief input delay of next press)
function Stun() 
    print("stun")
end

-- Cause player to freeze
function Freeze()
    print("freeze")
end

-- Disorient the player
function Disorient()
    print("disorient")
end

-- !! Random Probality functions !!

-- Pick random color to appear
function ColorAppear()
    local value = math.random() -- float val from 0 to 1

    -- Use proper probability table
    if ApperanceProbalityLevel == "hard" then
        return GetColorFromProbability(hardColorAppearanceTable, value)
    elseif ApperanceProbalityLevel == "medium" then
        return GetColorFromProbability(mediumColorAppearanceTable, value)
    else 
        return GetColorFromProbability(easyColorAppearanceTable, value)
    end

end

-- Helper for appear color, find based on given probability table
function GetColorFromProbability(probTable, value)
    local cumulative = 0

    for i = 1, #probTable do
        local entry = probTable[i]
        local lowerBound = cumulative
        cumulative = cumulative + entry.probability

        if value >= lowerBound and value < cumulative then
            print("Cumulative Probality: " .. Time)
            print("Probality entry: " .. entry.color)

            State = i
            HexCode = colorsHex[i]
            GetButtonColorTime()
            return entry.color
        end
    end
   
    return nil -- Shouldnt happen if probabilities sum to 1
end


function GetButtonColorTime()
    if ApperanceProbalityLevel == "hard" then
        Time = math.random(1, 6)
    elseif ApperanceProbalityLevel == "medium" then
        Time = math.random(2, 8)
    else 
        Time = math.random(2, 10)
    end
    print("Time: " .. Time)
end


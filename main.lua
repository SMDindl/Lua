-- main.lua
local LoveButton = require("LoveButton")  -- This assumes LoveButton.lua is in the same folder
local timeAccumulator = 0

-- LOVE2D Functions

-- load
function love.load()
    love.window.setMode(1024, 768, {
        resizable = true,  -- Allows resizing the window
    })
    love.window.setTitle("Lovely Button")
    LoveButton.GetRandomTime()  -- Initialize a random time for button appearance
end

-- update
function love.update(dt)
    -- Accumulate delta time
    timeAccumulator = timeAccumulator + dt

    -- When 1 second passes, decrement LoveButton.Time
    if timeAccumulator >= 1 then
        LoveButton.Time = LoveButton.Time - 1
        -- print("Time Left:", LoveButton.Time)

        -- Reset the accumulator for the next second
        timeAccumulator = timeAccumulator - 1
    end

    if(LoveButton.Time <= 0) then
        LoveButton.GetRandomColor()
    end
end

-- draw
function love.draw()
    -- Set background color
    local width, height = love.graphics.getDimensions()
    love.graphics.setBackgroundColor(0.2, 0.9, 0.8)  -- Light blue

    -- Get button color
    local r, g, b = HexToRgb(LoveButton.HexCode)  -- Access LoveButton's color

    -- Draw the button with the current color
    love.graphics.setColor(r, g, b)
    love.graphics.circle("fill", width/2, height/2, 250)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(10)
    love.graphics.circle("line", width/2, height/2, 250)
end

-- CHATGPT
-- mousepressed
function love.mousepressed(x, y, button, istouch, presses)
    local width, height = love.graphics.getDimensions()
    local circleX, circleY, radius = width / 2, height / 2, 100

    if button == 1 then  -- Left mouse button
        local dist = math.sqrt((x - circleX)^2 + (y - circleY)^2)
        if dist <= radius then
            LoveButton.ClickButton()
            LoveButton.GetRandomColor()
        end
    end
end


-- Convert Hex to RGB
function HexToRgb(hex)
    hex = hex:gsub("#", "")
    return tonumber("0x" .. hex:sub(1, 2)) / 255,
           tonumber("0x" .. hex:sub(3, 4)) / 255,
           tonumber("0x" .. hex:sub(5, 6)) / 255
end

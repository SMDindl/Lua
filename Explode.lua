-- Learning Lua: Explode function - Mar 6 2024

-- Functions

function Explode (input, delim)
    local result = {}
    local element = ""
    local char = ""
    for i = 1, #input, 1 do
        char = input:sub(i, i)
        if char == delim then
            if element ~= "" then
            table.insert(result, element)
            end
            element = ""
        else
        element = element .. char
        end
    end
    if element ~= "" then
        table.insert(result, element)
    end
    return result
end

-- Program

local input = "S.T.E.V...E.N..."
local delim = "."

local resultTable = Explode(input, delim) -- Use Explode function

for i, value in ipairs(resultTable) do    -- Print each element from resultTable
    print(value)
end

local resultingString = ""

for i, value in ipairs(resultTable) do     -- Create string from each value of resultTable
    resultingString = resultingString .. value
end

print(resultingString)
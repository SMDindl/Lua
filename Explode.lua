-- Learning Lua: Explode function - Mar 6 2024

-- Functions

function Explode (string, delim)
    local table = 
    local element = ""
    for i = 1, #string, 1 do
        if string[i] == delim then
            table.add(element) 
            element = ""
        end

        element = element + string[i] -- likely going to be an issue (string[i])
    end
    return table
end

-- Program 

local string = "S.T.E.V.E.N"
local delim = "."

local table = Explode(string, delim)

for i = 1, #table, 1 do
    print(table[i])
end
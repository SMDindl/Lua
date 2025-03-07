# Lua Explode function - Learning

## Inital attempt (with errors)

```Lua
function Explode (string, delim)
    local table 
    local element = ""
    for i = 1, #string, 1 do
        if string[i] == delim then
            table.add(element) 
            element = ""
        else
        element = element + string[i] -- likely going to be an issue (string[i])
        end
    end
    return table
end
```

### Mistakes made

*   `String` and `table` are not reserved keywords, but they're just standard library names and shouldn't be used

*   Variable `local table` not initalized, leading to table being nil.
    Do, `local table = {}`.

*   Variable `string` cannot have its chars accessed by n-th term. E.g. `string[i]`.
    Do, `local char = string:sub(i, i)`.
    Params: 1st param = lower bound index of substring, 2nd param = upperbound index of substring.
    `sub(i, i)` extracts a substring from i to i (a single character)

*   `table.add(element)` is inproper, need to use table libary, and pass in both elements. E.g. `table.add(tableName, element)`

*   Cannot concatenate local variables with `+`.
    Do, `element = element .. char`

## Corrected code

```Lua
function Explode (input, delim) -- o(n) runtime, each element of the input is visited once
    local result = {}
    local element = ""
    local char = ""
    for i = 1, #input, 1 do
        char = input:sub(i, i)
        if char == delim then
            if element ~= delim then   -- Logic fix to not insert blank values (s.t...ven...)
                table.insert(result, element) 
            end
            table.add(result, element) 
            element = ""
        end
        element = element .. char
    end
    if element ~= delim then   -- Note: ~= is the Lua equivalent to != (not equal to)
        table.insert(result, element) 
    end
    return result
end
```

```Lua

-- Proper way to print elements of table
-- Note: Synax is a 'for each' loop; for each 'value' in ipairs

local resultTable = Explode(input, delim)

for i, value in ipairs(resultTable) do
    print(value)
end

-- Create string from values of table

local resultingString = ""

for i, value in ipairs(resultTable) do
    resultingString = resultingString .. value
end

```





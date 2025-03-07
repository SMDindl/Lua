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
        end

        element = element + string[i] -- likely going to be an issue (string[i])
    end
    return table
end
```

## Mistakes made

*   Varible `local table` not initalized, leading to table being nil
    Do, `local table = {}`

*   Varible `string` cannot have it`s chars accessed by n-th term. E.g. `string[i]`
    Do, `local char = string:sub(i, i)`
    Params: 1st param = starting index of substring, 2nd param = econd index of substring
    `sub(i, i)` extracts a substring from i to i (a single character)
          

*   Cannot concatenate local variables with `+`
    Do, `element = element .. char`






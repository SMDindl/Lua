# Lua Explode function - Learning

## Inital attempt, with errors:

```
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
```

## Mistakes made





-- 1 is start post, 10 is max, 2 is ++
for i = 1, 10, 2 do
    print("Hello:", i, "Hello.", "Hello!")
end

print()

-- 10 is start post, 1 is min, -1 = --
-- for i = 10, 1, -1 do
--     print("Hello.", i, "Hello.", "Hello!")
-- end

local table = {"one", "two", "three"}

for i = 1, #table, 1 do
    print(i, table[i])
end


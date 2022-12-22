local x = 0
local print = print
local function f(x) print(x) end
while (x <= 1000) do
    (function (x) print(x) end)(x);
    -- print(x)
    x = x + 1
end

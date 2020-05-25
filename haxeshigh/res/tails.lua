local function g(i)
    if (i > 10000000) then
        return i
    end
    return g(i+1)
end

-- fuck me sideways, it works...
print(g(0))
-- could be used for threading (with light- cooperative -threads) implementation
-- like in Io, or Racket.

local quote
quote = function(v)
  if type(v) == 'string' then
    return ('%q'):format(v)
  else
    return tostring(v)
  end
end
local _
_ = function(t, options)
  options = options or { }
  local limit = options.limit or 1000
  local buff = {
    tables = {
      [t] = true
    }
  }
  local k, tbuff = 1, nil
  local put
  put = function(v)
    buff[k] = v
    k = k + 1
  end
  local put_value
  put_value = function(value)
    if type(value) ~= 'table' then
      put(quote(value))
      if limit and k > limit then
        buff[k] = "..."
        error("buffer overrun")
      end
    else
      if not buff.tables[value] then
        buff.tables[value] = true
        tbuff(value)
      else
        put("<cycle>")
      end
    end
    return put(',')
  end
  tbuff = function(t)
    local mt
    if not (options.raw) then
      mt = getmetatable(t)
    end
    if type(t) ~= 'table' or mt and mt.__tostring then
      return put(quote(t))
    else
      put('{')
      local indices = #t > 0 and (function()
        local _tbl_0 = { }
        for i = 1, #t do
          _tbl_0[i] = true
        end
        return _tbl_0
      end)()
      for key, value in pairs(t) do
        local _continue_0 = false
        repeat
          if indices and indices[key] then
            _continue_0 = true
            break
          end
          if type(key) ~= 'string' then
            key = '[' .. tostring(key) .. ']'
          elseif key:match('%s') then
            key = quote(key)
          end
          put(key .. ':')
          put_value(value)
          _continue_0 = true
        until true
        if not _continue_0 then
          break
        end
      end
      if indices then
        for _index_0 = 1, #t do
          local v = t[_index_0]
          put_value(v)
        end
      end
      if buff[k - 1] == "," then
        k = k - 1
      end
      return put('}')
    end
  end
  pcall(tbuff, t)
  return table.concat(buff)
end
local ilevel = 0
local indent
indent = function(a, b)
  local steps, fn
  if b then
    steps, fn = a, b
  else
    steps, fn = 1, a
  end
  ilevel = ilevel + steps
  fn()
  ilevel = ilevel - steps
end
local writeindent
writeindent = function()
  return io.write(("   "):rep(ilevel))
end
debug.write = function(self)
  local visited = { }
  local _write
  _write = function(self)
    if type(self) == 'table' and not visited[self] then
      if not (self.__class and self.__class.__name and not self.__tostring) then
        visited[self] = true
        print("{")
        for k, v in pairs(self) do
          indent(function()
            writeindent()
            _write(k)
            io.write(': ')
            _write(v)
            return print()
          end)
        end
        writeindent()
        return _write("}")
      elseif self.__tostring then
        return io.write(self:__tostring())
      else
        return io.write(self.__class.__name)
      end
    else
      return io.write(tostring(self))
    end
  end
  return _write(self)
end
debug.print = function(...)
  local values = {
    ...
  }
  for key, value in pairs(values) do
    debug.write(value)
    if next(values, key) then
      io.write(', ')
    end
  end
  return print()
end

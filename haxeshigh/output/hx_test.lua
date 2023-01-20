-- Generated by Haxe 4.3.0-rc.1
pcall(function () require"luarocks.loader" end)
local _M = {}; setfenv(1, setmetatable(_M, {__index = _G}))
local _hx_hidden = {__id__=true, hx__closures=true, super=true, prototype=true, __fields__=true, __ifields__=true, __class__=true, __properties__=true, __fields__=true, __name__=true}

_hx_array_mt = {
    __newindex = function(t,k,v)
        local len = t.length
        t.length = (type(k) == "number" and k >= len and (k + 1)) or len
        rawset(t,k,v)
    end
}

function _hx_is_array(o)
    return type(o) == "table"
        and o.__enum__ == nil
        and getmetatable(o) == _hx_array_mt
end



function _hx_tab_array(tab, length)
    tab.length = length
    return setmetatable(tab, _hx_array_mt)
end

function _hx_print_function(obj)
    local info = debug.getinfo(obj, "fnSlu")
    local name = info.name or "(anonymous)"
    local res = tostring(info.what) .. "@" .. tostring(info.short_src) .. ":" .. tostring(info.linedefined)
    return "<function: " .. name .. "/" .. res .. ">"
end

function _hx_print_class(obj, depth)
    local first = true
    local result = ''
    for k,v in pairs(obj) do
        if _hx_hidden[k] == nil then
            if first then
                first = false
            else
                result = result .. ', '
            end
            if _hx_hidden[k] == nil then
                result = result .. k .. ':' .. _hx_tostring(v, depth+1)
            end
        end
    end
    return '{ ' .. result .. ' }'
end

function _hx_print_enum(o, depth)
    if o.length == 2 then
        return o[0]
    else
        local str = o[0] .. "("
        for i = 2, (o.length-1) do
            if i ~= 2 then
                str = str .. "," .. _hx_tostring(o[i], depth+1)
            else
                str = str .. _hx_tostring(o[i], depth+1)
            end
        end
        return str .. ")"
    end
end
_hx_tostring_limits = _G._hx_tostring_limits or {
    depth = 15,
    alen = 15,
    slen = nil
}
function _hx_tostring(obj, depth)
    local cfg = _hx_tostring_limits
    if depth == nil then
        depth = 0
    elseif depth > cfg.depth then
        return "<...>"
    end

    local tstr = _G.type(obj)
    if tstr == "string" then
        if _hx_tostring_limits.slen and string.len(obj) > 15 then
            return string.sub(obj, 1, 150) .. "..."
        else
            return obj
        end
    elseif tstr == "nil" then return "null"
    elseif tstr == "number" then
        if obj == _G.math.POSITIVE_INFINITY then return "Infinity"
        elseif obj == _G.math.NEGATIVE_INFINITY then return "-Infinity"
        elseif obj == 0 then return "0"
        elseif obj ~= obj then return "NaN"
        else return _G.tostring(obj)
        end
    elseif tstr == "boolean" then return _G.tostring(obj)
    elseif tstr == "userdata" then
        local mt = _G.getmetatable(obj)
        if mt ~= nil and mt.__tostring ~= nil then
            return _G.tostring(obj)
        else
            return "<userdata>"
        end
    elseif tstr == "function" then return _hx_print_function(obj)
    elseif tstr == "thread" then return "<thread>"
    elseif tstr == "table" then
        if obj.__enum__ ~= nil then
            return _hx_print_enum(obj, depth)
        elseif obj.toString ~= nil and not _hx_is_array(obj) then return obj:toString()
        elseif _hx_is_array(obj) then
            if obj.length > cfg.alen then
                local str = ""
                for i=0, (cfg.alen-1) do
                    if i == 0 then
                        str = str .. _hx_tostring(obj[i], depth+1)
                    else
                        str = str .. ", " .. _hx_tostring(obj[i], depth+1)
                    end
                end
                return "[" .. str .. ", ...]"
            else
                local str = ""
                for i=0, (obj.length-1) do
                    if i == 0 then
                        str = str .. _hx_tostring(obj[i], depth+1)
                    else
                        str = str .. ", " .. _hx_tostring(obj[i], depth+1)
                    end
                end
                return "[" .. str .. "]"
            end
        elseif obj.__class__ ~= nil then
            return _hx_print_class(obj, depth)
        else
            local buffer = {}
            local ref = obj
            if obj.__fields__ ~= nil then
                ref = obj.__fields__
            end
            for k,v in pairs(ref) do
                if _hx_hidden[k] == nil then
                    _G.table.insert(buffer, _hx_tostring(k, depth+1) .. ' : ' .. _hx_tostring(obj[k], depth+1))
                end
            end

            return "{ " .. table.concat(buffer, ", ") .. " }"
        end
    else
        local i = require("inspect")
        if i ~= nil then
            return "#Lua:(" .. i(obj) .. ")"
        else
            _G.error("Unknown Lua type", 0)
            return ""
        end
    end
end

function _hx_error(obj)
    if obj.value then
        _G.print("runtime error:\n " .. _hx_tostring(obj.value));
    else
        _G.print("runtime error:\n " .. tostring(obj));
    end

    if _G.debug and _G.debug.traceback then
        _G.print(debug.traceback());
    end
end

local function _hx_obj_newindex(t,k,v)
    t.__fields__[k] = true
    rawset(t,k,v)
end

local _hx_obj_mt = {__newindex=_hx_obj_newindex, __tostring=_hx_tostring}

local function _hx_a(...)
  local __fields__ = {};
  local ret = {__fields__ = __fields__};
  local max = select('#',...);
  local tab = {...};
  local cur = 1;
  while cur < max do
    local v = tab[cur];
    __fields__[v] = true;
    ret[v] = tab[cur+1];
    cur = cur + 2
  end
  return setmetatable(ret, _hx_obj_mt)
end

local function _hx_e()
  return setmetatable({__fields__ = {}}, _hx_obj_mt)
end

local function _hx_o(obj)
  return setmetatable(obj, _hx_obj_mt)
end

local function _hx_new(prototype)
  return setmetatable({__fields__ = {}}, {__newindex=_hx_obj_newindex, __index=prototype, __tostring=_hx_tostring})
end

function _hx_field_arr(obj)
    local res = {}
    local idx = 0
    if obj.__fields__ ~= nil then
        obj = obj.__fields__
    end
    for k,v in pairs(obj) do
        if _hx_hidden[k] == nil then
            res[idx] = k
            idx = idx + 1
        end
    end
    return _hx_tab_array(res, idx)
end

local _hxClasses = {}
local Int = _hx_e();
local Dynamic = _hx_e();
local Float = _hx_e();
local Bool = _hx_e();
local Class = _hx_e();
local Enum = _hx_e();

local Array = _hx_e()
local __lua_Boot = _hx_e()
local __lua_lib_luautf8_Utf8 = _G.require("lua-utf8")
local String = _hx_e()
local Std = _hx_e()
local __haxe_IMap = _hx_e()
local __haxe_ds_ObjectMap = _hx_e()
local __lua_PairTools = _hx_e()
local Math = _hx_e()
local __haxe_Log = _hx_e()
local __haxe_iterators_ArrayIterator = _hx_e()
local __haxe_iterators_ArrayKeyValueIterator = _hx_e()
local __lib__LuaTable_LuaTable_Impl_ = _hx_e()
local __lib_TableTools = _hx_e()
local __lua_Thread = _hx_e()
local __lua_UserData = _hx_e()
local __test_AwesomeTest = _hx_e()
local __test_Main = _hx_e()

local _hx_bind, _hx_bit, _hx_staticToInstance, _hx_funcToField, _hx_maxn, _hx_print, _hx_apply_self, _hx_box_mr, _hx_bit_clamp, _hx_table, _hx_bit_raw
local _hx_pcall_default = {};
local _hx_pcall_break = {};

Array.new = function() 
  local self = _hx_new(Array.prototype)
  Array.super(self)
  return self
end
Array.super = function(self) 
  _hx_tab_array(self, 0);
end
Array.__name__ = true
Array.prototype = _hx_e();
Array.prototype.concat = function(self,a) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  while (_g1 < self.length) do 
    local i = self[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  local _g1 = 0;
  while (_g1 < a.length) do 
    local i = a[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  do return _g end
end
Array.prototype.join = function(self,sep) 
  local tbl = ({});
  local _g_current = 0;
  while (_g_current < self.length) do 
    _g_current = _g_current + 1;
    _G.table.insert(tbl, Std.string(self[_g_current - 1]));
  end;
  do return _G.table.concat(tbl, sep) end
end
Array.prototype.pop = function(self) 
  if (self.length == 0) then 
    do return nil end;
  end;
  local ret = self[self.length - 1];
  self[self.length - 1] = nil;
  self.length = self.length - 1;
  do return ret end
end
Array.prototype.push = function(self,x) 
  self[self.length] = x;
  do return self.length end
end
Array.prototype.reverse = function(self) 
  local tmp;
  local i = 0;
  while (i < Std.int(self.length / 2)) do 
    tmp = self[i];
    self[i] = self[(self.length - i) - 1];
    self[(self.length - i) - 1] = tmp;
    i = i + 1;
  end;
end
Array.prototype.shift = function(self) 
  if (self.length == 0) then 
    do return nil end;
  end;
  local ret = self[0];
  if (self.length == 1) then 
    self[0] = nil;
  else
    if (self.length > 1) then 
      self[0] = self[1];
      _G.table.remove(self, 1);
    end;
  end;
  local tmp = self;
  tmp.length = tmp.length - 1;
  do return ret end
end
Array.prototype.slice = function(self,pos,_end) 
  if ((_end == nil) or (_end > self.length)) then 
    _end = self.length;
  else
    if (_end < 0) then 
      _end = _G.math.fmod((self.length - (_G.math.fmod(-_end, self.length))), self.length);
    end;
  end;
  if (pos < 0) then 
    pos = _G.math.fmod((self.length - (_G.math.fmod(-pos, self.length))), self.length);
  end;
  if ((pos > _end) or (pos > self.length)) then 
    do return _hx_tab_array({}, 0) end;
  end;
  local ret = _hx_tab_array({}, 0);
  local _g = pos;
  local _g1 = _end;
  while (_g < _g1) do 
    _g = _g + 1;
    ret:push(self[_g - 1]);
  end;
  do return ret end
end
Array.prototype.sort = function(self,f) 
  local i = 0;
  local l = self.length;
  while (i < l) do 
    local swap = false;
    local j = 0;
    local max = (l - i) - 1;
    while (j < max) do 
      if (f(self[j], self[j + 1]) > 0) then 
        local tmp = self[j + 1];
        self[j + 1] = self[j];
        self[j] = tmp;
        swap = true;
      end;
      j = j + 1;
    end;
    if (not swap) then 
      break;
    end;
    i = i + 1;
  end;
end
Array.prototype.splice = function(self,pos,len) 
  if ((len < 0) or (pos > self.length)) then 
    do return _hx_tab_array({}, 0) end;
  else
    if (pos < 0) then 
      pos = self.length - (_G.math.fmod(-pos, self.length));
    end;
  end;
  len = Math.min(len, self.length - pos);
  local ret = _hx_tab_array({}, 0);
  local _g = pos;
  local _g1 = pos + len;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    ret:push(self[i]);
    self[i] = self[i + len];
  end;
  local _g = pos + len;
  local _g1 = self.length;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    self[i] = self[i + len];
  end;
  self.length = self.length - len;
  do return ret end
end
Array.prototype.toString = function(self) 
  local tbl = ({});
  _G.table.insert(tbl, "[");
  _G.table.insert(tbl, self:join(","));
  _G.table.insert(tbl, "]");
  do return _G.table.concat(tbl, "") end
end
Array.prototype.unshift = function(self,x) 
  local len = self.length;
  local _g = 0;
  while (_g < len) do 
    _g = _g + 1;
    local i = _g - 1;
    self[len - i] = self[(len - i) - 1];
  end;
  self[0] = x;
end
Array.prototype.insert = function(self,pos,x) 
  if (pos > self.length) then 
    pos = self.length;
  end;
  if (pos < 0) then 
    pos = self.length + pos;
    if (pos < 0) then 
      pos = 0;
    end;
  end;
  local cur_len = self.length;
  while (cur_len > pos) do 
    self[cur_len] = self[cur_len - 1];
    cur_len = cur_len - 1;
  end;
  self[pos] = x;
end
Array.prototype.remove = function(self,x) 
  local _g = 0;
  local _g1 = self.length;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    if (self[i] == x) then 
      local _g = i;
      local _g1 = self.length - 1;
      while (_g < _g1) do 
        _g = _g + 1;
        local j = _g - 1;
        self[j] = self[j + 1];
      end;
      self[self.length - 1] = nil;
      self.length = self.length - 1;
      do return true end;
    end;
  end;
  do return false end
end
Array.prototype.contains = function(self,x) 
  local _g = 0;
  local _g1 = self.length;
  while (_g < _g1) do 
    _g = _g + 1;
    if (self[_g - 1] == x) then 
      do return true end;
    end;
  end;
  do return false end
end
Array.prototype.indexOf = function(self,x,fromIndex) 
  local _end = self.length;
  if (fromIndex == nil) then 
    fromIndex = 0;
  else
    if (fromIndex < 0) then 
      fromIndex = self.length + fromIndex;
      if (fromIndex < 0) then 
        fromIndex = 0;
      end;
    end;
  end;
  local _g = fromIndex;
  while (_g < _end) do 
    _g = _g + 1;
    local i = _g - 1;
    if (x == self[i]) then 
      do return i end;
    end;
  end;
  do return -1 end
end
Array.prototype.lastIndexOf = function(self,x,fromIndex) 
  if ((fromIndex == nil) or (fromIndex >= self.length)) then 
    fromIndex = self.length - 1;
  else
    if (fromIndex < 0) then 
      fromIndex = self.length + fromIndex;
      if (fromIndex < 0) then 
        do return -1 end;
      end;
    end;
  end;
  local i = fromIndex;
  while (i >= 0) do 
    if (self[i] == x) then 
      do return i end;
    else
      i = i - 1;
    end;
  end;
  do return -1 end
end
Array.prototype.copy = function(self) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  while (_g1 < self.length) do 
    local i = self[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  do return _g end
end
Array.prototype.map = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  while (_g1 < self.length) do 
    local i = self[_g1];
    _g1 = _g1 + 1;
    _g:push(f(i));
  end;
  do return _g end
end
Array.prototype.filter = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  while (_g1 < self.length) do 
    local i = self[_g1];
    _g1 = _g1 + 1;
    if (f(i)) then 
      _g:push(i);
    end;
  end;
  do return _g end
end
Array.prototype.iterator = function(self) 
  do return __haxe_iterators_ArrayIterator.new(self) end
end
Array.prototype.keyValueIterator = function(self) 
  do return __haxe_iterators_ArrayKeyValueIterator.new(self) end
end
Array.prototype.resize = function(self,len) 
  if (self.length < len) then 
    self.length = len;
  else
    if (self.length > len) then 
      local _g = len;
      local _g1 = self.length;
      while (_g < _g1) do 
        _g = _g + 1;
        self[_g - 1] = nil;
      end;
      self.length = len;
    end;
  end;
end

Array.prototype.__class__ =  Array

__lua_Boot.new = {}
__lua_Boot.__name__ = true
__lua_Boot.__instanceof = function(o,cl) 
  if (cl == nil) then 
    do return false end;
  end;
  local cl1 = cl;
  if (cl1) == Array then 
    do return __lua_Boot.isArray(o) end;
  elseif (cl1) == Bool then 
    do return _G.type(o) == "boolean" end;
  elseif (cl1) == Dynamic then 
    do return o ~= nil end;
  elseif (cl1) == Float then 
    do return _G.type(o) == "number" end;
  elseif (cl1) == Int then 
    if (_G.type(o) == "number") then 
      do return _hx_bit_clamp(o) == o end;
    else
      do return false end;
    end;
  elseif (cl1) == String then 
    do return _G.type(o) == "string" end;
  elseif (cl1) == _G.table then 
    do return _G.type(o) == "table" end;
  elseif (cl1) == __lua_Thread then 
    do return _G.type(o) == "thread" end;
  elseif (cl1) == __lua_UserData then 
    do return _G.type(o) == "userdata" end;else
  if (((o ~= nil) and (_G.type(o) == "table")) and (_G.type(cl) == "table")) then 
    local tmp;
    if (__lua_Boot.__instanceof(o, Array)) then 
      tmp = Array;
    else
      if (__lua_Boot.__instanceof(o, String)) then 
        tmp = String;
      else
        local cl = o.__class__;
        tmp = (function() 
          local _hx_1
          if (cl ~= nil) then 
          _hx_1 = cl; else 
          _hx_1 = nil; end
          return _hx_1
        end )();
      end;
    end;
    if (__lua_Boot.extendsOrImplements(tmp, cl)) then 
      do return true end;
    end;
    if ((function() 
      local _hx_2
      if (cl == Class) then 
      _hx_2 = o.__name__ ~= nil; else 
      _hx_2 = false; end
      return _hx_2
    end )()) then 
      do return true end;
    end;
    if ((function() 
      local _hx_3
      if (cl == Enum) then 
      _hx_3 = o.__ename__ ~= nil; else 
      _hx_3 = false; end
      return _hx_3
    end )()) then 
      do return true end;
    end;
    do return o.__enum__ == cl end;
  else
    do return false end;
  end; end;
end
__lua_Boot.isArray = function(o) 
  if (_G.type(o) == "table") then 
    if ((o.__enum__ == nil) and (_G.getmetatable(o) ~= nil)) then 
      do return _G.getmetatable(o).__index == Array.prototype end;
    else
      do return false end;
    end;
  else
    do return false end;
  end;
end
__lua_Boot.extendsOrImplements = function(cl1,cl2) 
  while (true) do 
    if ((cl1 == nil) or (cl2 == nil)) then 
      do return false end;
    else
      if (cl1 == cl2) then 
        do return true end;
      else
        if (cl1.__interfaces__ ~= nil) then 
          local intf = cl1.__interfaces__;
          local _g = 1;
          local _g1 = _hx_table.maxn(intf) + 1;
          while (_g < _g1) do 
            _g = _g + 1;
            local i = _g - 1;
            if (__lua_Boot.extendsOrImplements(intf[i], cl2)) then 
              do return true end;
            end;
          end;
        end;
      end;
    end;
    cl1 = cl1.__super__;
  end;
end

String.new = function(string) 
  local self = _hx_new(String.prototype)
  String.super(self,string)
  self = string
  return self
end
String.super = function(self,string) 
end
String.__name__ = true
String.__index = function(s,k) 
  if (k == "length") then 
    do return __lua_lib_luautf8_Utf8.len(s) end;
  else
    local o = String.prototype;
    local field = k;
    if ((function() 
      local _hx_1
      if ((_G.type(o) == "string") and ((String.prototype[field] ~= nil) or (field == "length"))) then 
      _hx_1 = true; elseif (o.__fields__ ~= nil) then 
      _hx_1 = o.__fields__[field] ~= nil; else 
      _hx_1 = o[field] ~= nil; end
      return _hx_1
    end )()) then 
      do return String.prototype[k] end;
    else
      if (String.__oldindex ~= nil) then 
        if (_G.type(String.__oldindex) == "function") then 
          do return String.prototype.__oldindex(String, s, k) end;
        else
          if (_G.type(String.__oldindex) == "table") then 
            do return String.__oldindex[k] end;
          end;
        end;
        do return nil end;
      else
        do return nil end;
      end;
    end;
  end;
end
String.indexOfEmpty = function(s,startIndex) 
  local length = __lua_lib_luautf8_Utf8.len(s);
  if (startIndex < 0) then 
    startIndex = length + startIndex;
    if (startIndex < 0) then 
      startIndex = 0;
    end;
  end;
  if (startIndex > length) then 
    do return length end;
  else
    do return startIndex end;
  end;
end
String.fromCharCode = function(code) 
  do return __lua_lib_luautf8_Utf8.char(code) end;
end
String.prototype = _hx_e();
String.prototype.toUpperCase = function(self) 
  do return __lua_lib_luautf8_Utf8.upper(self) end
end
String.prototype.toLowerCase = function(self) 
  do return __lua_lib_luautf8_Utf8.lower(self) end
end
String.prototype.indexOf = function(self,str,startIndex) 
  if (startIndex == nil) then 
    startIndex = 1;
  else
    startIndex = startIndex + 1;
  end;
  if (str == "") then 
    do return String.prototype.indexOfEmpty(String, self, startIndex - 1) end;
  end;
  local r = __lua_lib_luautf8_Utf8.find(self, str, startIndex, true);
  if ((r ~= nil) and (r > 0)) then 
    do return r - 1 end;
  else
    do return -1 end;
  end;
end
String.prototype.lastIndexOf = function(self,str,startIndex) 
  local ret = -1;
  if (startIndex == nil) then 
    startIndex = __lua_lib_luautf8_Utf8.len(self);
  end;
  while (true) do 
    local startIndex1 = ret + 1;
    if (startIndex1 == nil) then 
      startIndex1 = 1;
    else
      startIndex1 = startIndex1 + 1;
    end;
    local p;
    if (str == "") then 
      p = String.prototype.indexOfEmpty(String, self, startIndex1 - 1);
    else
      local r = __lua_lib_luautf8_Utf8.find(self, str, startIndex1, true);
      p = (function() 
        local _hx_1
        if ((r ~= nil) and (r > 0)) then 
        _hx_1 = r - 1; else 
        _hx_1 = -1; end
        return _hx_1
      end )();
    end;
    if (((p == -1) or (p > startIndex)) or (p == ret)) then 
      break;
    end;
    ret = p;
  end;
  do return ret end
end
String.prototype.split = function(self,delimiter) 
  local idx = 1;
  local ret = _hx_tab_array({}, 0);
  while (idx ~= nil) do 
    local newidx = 0;
    if (__lua_lib_luautf8_Utf8.len(delimiter) > 0) then 
      newidx = __lua_lib_luautf8_Utf8.find(self, delimiter, idx, true);
    else
      if (idx >= __lua_lib_luautf8_Utf8.len(self)) then 
        newidx = nil;
      else
        newidx = idx + 1;
      end;
    end;
    if (newidx ~= nil) then 
      local match = __lua_lib_luautf8_Utf8.sub(self, idx, newidx - 1);
      ret:push(match);
      idx = newidx + __lua_lib_luautf8_Utf8.len(delimiter);
    else
      ret:push(__lua_lib_luautf8_Utf8.sub(self, idx, __lua_lib_luautf8_Utf8.len(self)));
      idx = nil;
    end;
  end;
  do return ret end
end
String.prototype.toString = function(self) 
  do return self end
end
String.prototype.substring = function(self,startIndex,endIndex) 
  if (endIndex == nil) then 
    endIndex = __lua_lib_luautf8_Utf8.len(self);
  end;
  if (endIndex < 0) then 
    endIndex = 0;
  end;
  if (startIndex < 0) then 
    startIndex = 0;
  end;
  if (endIndex < startIndex) then 
    do return __lua_lib_luautf8_Utf8.sub(self, endIndex + 1, startIndex) end;
  else
    do return __lua_lib_luautf8_Utf8.sub(self, startIndex + 1, endIndex) end;
  end;
end
String.prototype.charAt = function(self,index) 
  do return __lua_lib_luautf8_Utf8.sub(self, index + 1, index + 1) end
end
String.prototype.charCodeAt = function(self,index) 
  do return __lua_lib_luautf8_Utf8.byte(self, index + 1) end
end
String.prototype.substr = function(self,pos,len) 
  if ((len == nil) or (len > (pos + __lua_lib_luautf8_Utf8.len(self)))) then 
    len = __lua_lib_luautf8_Utf8.len(self);
  else
    if (len < 0) then 
      len = __lua_lib_luautf8_Utf8.len(self) + len;
    end;
  end;
  if (pos < 0) then 
    pos = __lua_lib_luautf8_Utf8.len(self) + pos;
  end;
  if (pos < 0) then 
    pos = 0;
  end;
  do return __lua_lib_luautf8_Utf8.sub(self, pos + 1, pos + len) end
end

String.prototype.__class__ =  String

Std.new = {}
Std.__name__ = true
Std.string = function(s) 
  do return _hx_tostring(s, 0) end;
end
Std.int = function(x) 
  if (not Math.isFinite(x) or Math.isNaN(x)) then 
    do return 0 end;
  else
    do return _hx_bit_clamp(x) end;
  end;
end

__haxe_IMap.new = {}
__haxe_IMap.__name__ = true

__haxe_ds_ObjectMap.new = function() 
  local self = _hx_new(__haxe_ds_ObjectMap.prototype)
  __haxe_ds_ObjectMap.super(self)
  return self
end
__haxe_ds_ObjectMap.super = function(self) 
  self.h = ({});
  self.k = ({});
end
__haxe_ds_ObjectMap.__name__ = true
__haxe_ds_ObjectMap.__interfaces__ = {__haxe_IMap}
__haxe_ds_ObjectMap.prototype = _hx_e();
__haxe_ds_ObjectMap.prototype.keys = function(self) 
  local _gthis = self;
  local cur = next(self.h, nil);
  do return _hx_o({__fields__={next=true,hasNext=true},next=function(self) 
    local ret = cur;
    cur = next(_gthis.k, cur);
    do return ret end;
  end,hasNext=function(self) 
    do return cur ~= nil end;
  end}) end
end
__haxe_ds_ObjectMap.prototype.toString = function(self) 
  local s_b = ({});
  _G.table.insert(s_b, "{");
  local it = self:keys();
  while (it:hasNext()) do 
    local i = it:next();
    _G.table.insert(s_b, Std.string(i));
    _G.table.insert(s_b, " => ");
    _G.table.insert(s_b, Std.string(self.h[i]));
    if (it:hasNext()) then 
      _G.table.insert(s_b, ", ");
    end;
  end;
  _G.table.insert(s_b, "}");
  do return _G.table.concat(s_b) end
end

__haxe_ds_ObjectMap.prototype.__class__ =  __haxe_ds_ObjectMap

__lua_PairTools.new = {}
__lua_PairTools.__name__ = true
__lua_PairTools.copy = function(table1) 
  local ret = ({});
  for k,v in _G.pairs(table1) do ret[k] = v end;
  do return ret end;
end
__lua_PairTools.pairsIterator = function(table) 
  local _hx_1_p_next, _hx_1_p_table, _hx_1_p_index = _G.pairs(table);
  local next = _hx_1_p_next;
  local i = _hx_1_p_index;
  do return _hx_o({__fields__={next=true,hasNext=true},next=function(self) 
    local _hx_2_res_index, _hx_2_res_value = next(table, i);
    i = _hx_2_res_index;
    do return _hx_o({__fields__={index=true,value=true},index=_hx_2_res_index,value=_hx_2_res_value}) end;
  end,hasNext=function(self) 
    do return _G.select(2, _G.next(table, i)) ~= nil end;
  end}) end;
end

Math.new = {}
Math.__name__ = true
Math.isNaN = function(f) 
  do return f ~= f end;
end
Math.isFinite = function(f) 
  if (f > -_G.math.huge) then 
    do return f < _G.math.huge end;
  else
    do return false end;
  end;
end
Math.min = function(a,b) 
  if (Math.isNaN(a) or Math.isNaN(b)) then 
    do return (0/0) end;
  else
    do return _G.math.min(a, b) end;
  end;
end

__haxe_Log.new = {}
__haxe_Log.__name__ = true
__haxe_Log.formatOutput = function(v,infos) 
  local str = Std.string(v);
  if (infos == nil) then 
    do return str end;
  end;
  local pstr = infos.fileName .. ":" .. Std.string(infos.lineNumber);
  if (infos.customParams ~= nil) then 
    local _g = 0;
    local _g1 = infos.customParams;
    while (_g < _g1.length) do 
      local v = _g1[_g];
      _g = _g + 1;
      str = str .. (", " .. Std.string(v));
    end;
  end;
  do return pstr .. ": " .. str end;
end
__haxe_Log.trace = function(v,infos) 
  local str = __haxe_Log.formatOutput(v, infos);
  _hx_print(str);
end

__haxe_iterators_ArrayIterator.new = function(array) 
  local self = _hx_new(__haxe_iterators_ArrayIterator.prototype)
  __haxe_iterators_ArrayIterator.super(self,array)
  return self
end
__haxe_iterators_ArrayIterator.super = function(self,array) 
  self.current = 0;
  self.array = array;
end
__haxe_iterators_ArrayIterator.__name__ = true
__haxe_iterators_ArrayIterator.prototype = _hx_e();
__haxe_iterators_ArrayIterator.prototype.hasNext = function(self) 
  do return self.current < self.array.length end
end
__haxe_iterators_ArrayIterator.prototype.next = function(self) 
  do return self.array[(function() 
  local _hx_obj = self;
  local _hx_fld = 'current';
  local _ = _hx_obj[_hx_fld];
  _hx_obj[_hx_fld] = _hx_obj[_hx_fld]  + 1;
   return _;
   end)()] end
end

__haxe_iterators_ArrayIterator.prototype.__class__ =  __haxe_iterators_ArrayIterator

__haxe_iterators_ArrayKeyValueIterator.new = function(array) 
  local self = _hx_new(__haxe_iterators_ArrayKeyValueIterator.prototype)
  __haxe_iterators_ArrayKeyValueIterator.super(self,array)
  return self
end
__haxe_iterators_ArrayKeyValueIterator.super = function(self,array) 
  self.array = array;
end
__haxe_iterators_ArrayKeyValueIterator.__name__ = true
__haxe_iterators_ArrayKeyValueIterator.prototype = _hx_e();

__haxe_iterators_ArrayKeyValueIterator.prototype.__class__ =  __haxe_iterators_ArrayKeyValueIterator

__lib__LuaTable_LuaTable_Impl_.new = {}
__lib__LuaTable_LuaTable_Impl_.__name__ = true
__lib__LuaTable_LuaTable_Impl_.toMap = function(this1) 
  local ret = __haxe_ds_ObjectMap.new();
  local o = __lua_PairTools.pairsIterator(this1);
  while (o:hasNext()) do 
    local o = o:next();
    local key = o.index;
    ret.h[key] = o.value;
    ret.k[key] = true;
  end;
  do return ret end;
end
__lib__LuaTable_LuaTable_Impl_.toArray = function(this1) 
  local length = nil;
  local tab = __lua_PairTools.copy(this1);
  local length = length;
  if (length == nil) then 
    length = _hx_table.maxn(tab);
    if (length > 0) then 
      local head = tab[1];
      _G.table.remove(tab, 1);
      tab[0] = head;
      do return _hx_tab_array(tab, length) end;
    else
      do return _hx_tab_array({}, 0) end;
    end;
  else
    do return _hx_tab_array(tab, length) end;
  end;
end

__lib_TableTools.new = {}
__lib_TableTools.__name__ = true
__lib_TableTools.pop = function(tbl) 
  local pos = nil;
  local fst = _hx_box_mr(_hx_table.pack(next(tbl, pos)), {"key", "val"});
  if (fst == nil) then 
    do return nil end;
  else
    local fst1 = fst;
    _G.table.remove(tbl, fst1.key);
    do return fst1.val end;
  end;
end

__lua_Thread.new = {}
__lua_Thread.__name__ = true

__lua_UserData.new = {}
__lua_UserData.__name__ = true

__test_AwesomeTest.new = {}
__test_AwesomeTest.__name__ = true
__test_AwesomeTest.main = function() 
  local t = ({2,3,4,5});
  __haxe_Log.trace(__lib_TableTools.pop(t), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/test/AwesomeTest.hx",lineNumber=35,className="test.AwesomeTest",methodName="main"}));
  local tmp = __haxe_Log.trace;
  local tmp1;
  local pos = nil;
  if (_hx_box_mr(_hx_table.pack(next(t, pos)), {"key", "val"}) == nil) then 
    tmp1 = _hx_tab_array({}, 0);
  else
    local ret = ({});
    for k,v in pairs(t) do _G.table.insert(ret, v); end;
    local len = #ret;
    ret[0] = __lib_TableTools.pop(ret);
    tmp1 = _hx_tab_array(ret, len);
  end;
  tmp(tmp1, _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/test/AwesomeTest.hx",lineNumber=36,className="test.AwesomeTest",methodName="main"}));
  _G.table.insert(t, 45);
  local tmp = __haxe_Log.trace;
  local tmp1;
  local pos = nil;
  if (_hx_box_mr(_hx_table.pack(next(t, pos)), {"key", "val"}) == nil) then 
    tmp1 = _hx_tab_array({}, 0);
  else
    local ret = ({});
    for k,v in pairs(t) do _G.table.insert(ret, k); end;
    local len = #ret;
    ret[0] = __lib_TableTools.pop(ret);
    tmp1 = _hx_tab_array(ret, len);
  end;
  tmp(tmp1, _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/test/AwesomeTest.hx",lineNumber=38,className="test.AwesomeTest",methodName="main"}));
  local tmp = __haxe_Log.trace;
  local vs;
  local pos = nil;
  if (_hx_box_mr(_hx_table.pack(next(t, pos)), {"key", "val"}) == nil) then 
    vs = _hx_tab_array({}, 0);
  else
    local ret = ({});
    for k,v in pairs(t) do _G.table.insert(ret, v); end;
    local len = #ret;
    ret[0] = __lib_TableTools.pop(ret);
    vs = _hx_tab_array(ret, len);
  end;
  local tmp1;
  if (vs ~= nil) then 
    local _g = _hx_tab_array({}, 0);
    local _g1 = 0;
    local _g2 = vs;
    while (_g1 < _g2.length) do 
      local i = _g2[_g1];
      _g1 = _g1 + 1;
      _G.print(_hx_tostring(i));
      _g:push(3);
    end;
    tmp1 = _g;
  else
    tmp1 = _hx_tab_array({}, 0);
  end;
  tmp(tmp1, _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/test/AwesomeTest.hx",lineNumber=39,className="test.AwesomeTest",methodName="main"}));
  local tmp = __haxe_Log.trace;
  local ret = false;
  for _,v in pairs(t) do if v == 4 then ret = true; break; end end;
  tmp(ret, _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/test/AwesomeTest.hx",lineNumber=40,className="test.AwesomeTest",methodName="main"}));
  __haxe_Log.trace(__lib__LuaTable_LuaTable_Impl_.toMap(t), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/test/AwesomeTest.hx",lineNumber=41,className="test.AwesomeTest",methodName="main"}));
  __haxe_Log.trace(__lib__LuaTable_LuaTable_Impl_.toArray(t), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/test/AwesomeTest.hx",lineNumber=42,className="test.AwesomeTest",methodName="main"}));
  __haxe_Log.trace(__lua_Boot.__instanceof(t, _G.table), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/test/AwesomeTest.hx",lineNumber=43,className="test.AwesomeTest",methodName="main"}));
  __haxe_Log.trace(_hx_o({__fields__={a=true},a=3}), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/test/AwesomeTest.hx",lineNumber=44,className="test.AwesomeTest",methodName="main"}));
end

__test_Main.new = {}
__test_Main.__name__ = true
__test_Main.main = function() 
  __test_AwesomeTest.main();
end
if _hx_bit_raw then
    _hx_bit_clamp = function(v)
    if v <= 2147483647 and v >= -2147483648 then
        if v > 0 then return _G.math.floor(v)
        else return _G.math.ceil(v)
        end
    end
    if v > 2251798999999999 then v = v*2 end;
    if (v ~= v or math.abs(v) == _G.math.huge) then return nil end
    return _hx_bit_raw.band(v, 2147483647 ) - math.abs(_hx_bit_raw.band(v, 2147483648))
    end
else
    _hx_bit_clamp = function(v)
        if v < -2147483648 then
            return -2147483648
        elseif v > 2147483647 then
            return 2147483647
        elseif v > 0 then
            return _G.math.floor(v)
        else
            return _G.math.ceil(v)
        end
    end
end;



_hx_array_mt.__index = Array.prototype

if package.loaded.luv then
  _hx_luv = _G.require("luv");
else
  _hx_luv = {
    run=function(mode) return false end,
    loop_alive=function() return false end
  }
end
local _hx_static_init = function()
  
  String.__name__ = true;
  Array.__name__ = true;
end

_hx_print = print or (function() end)

_hx_box_mr = function(x,nt)
    res = _hx_o({__fields__={}})
    for i,v in ipairs(nt) do
      res[v] = x[i]
    end
    return res
end

_hx_table = {}
_hx_table.pack = _G.table.pack or function(...)
    return {...}
end
_hx_table.unpack = _G.table.unpack or _G.unpack
_hx_table.maxn = _G.table.maxn or function(t)
  local maxn=0;
  for i in pairs(t) do
    maxn=type(i)=='number'and i>maxn and i or maxn
  end
  return maxn
end;

_hx_static_init();
_G.xpcall(function() 
  __test_Main.main();
  _hx_luv.run();
end, _hx_error)

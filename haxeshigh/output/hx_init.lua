-- Generated by Haxe 4.2.0-rc.1
local _hx_hidden = {__id__=true, hx__closures=true, super=true, prototype=true, __fields__=true, __ifields__=true, __class__=true, __properties__=true, __fields__=true, __name__=true}

_hx_array_mt = {
    __newindex = function(t,k,v)
        local len = t.length
        t.length =  k >= len and (k + 1) or len
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

function _hx_tostring(obj, depth)
    if depth == nil then
        depth = 0
    elseif depth > 5 then
        return "<...>"
    end

    local tstr = _G.type(obj)
    if tstr == "string" then return obj
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
    elseif tstr == "function" then return "<function>"
    elseif tstr == "thread" then return "<thread>"
    elseif tstr == "table" then
        if obj.__enum__ ~= nil then
            return _hx_print_enum(obj, depth)
        elseif obj.toString ~= nil and not _hx_is_array(obj) then return obj:toString()
        elseif _hx_is_array(obj) then
            if obj.length > 5 then
                return "[...]"
            else
                str = ""
                for i=0, (obj.length-1) do
                    if i == 0 then
                        str = str .. _hx_tostring(obj[i], depth+1)
                    else
                        str = str .. "," .. _hx_tostring(obj[i], depth+1)
                    end
                end
                return "[" .. str .. "]"
            end
        elseif obj.__class__ ~= nil then
            return _hx_print_class(obj, depth)
        else
            first = true
            buffer = {}
            for k,v in pairs(obj) do
                if _hx_hidden[k] == nil then
                    _G.table.insert(buffer, _hx_tostring(k, depth+1) .. ' : ' .. _hx_tostring(obj[k], depth+1))
                end
            end
            return "{ " .. table.concat(buffer, ", ") .. " }"
        end
    else
        _G.error("Unknown Lua type", 0)
        return ""
    end
end

function _hx_error(obj)
    print(obj)
    if obj.value then
        _G.print("Runtime Error: " .. _hx_tostring(obj.value));
    else
        _G.print("Runtime Error: " .. tostring(obj));
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
    res = {}
    idx = 0
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

local _hx_exports = _hx_exports or {}
_hx_exports["init"] = _hx_exports["init"] or _hx_e()
local Array = _hx_e()
local __lua_lib_luautf8_Utf8 = _G.require("lua-utf8")
local Math = _hx_e()
local Reflect = _hx_e()
local String = _hx_e()
local Std = _hx_e()
local __awful_Naughty = _G.require("naughty")
local __awful_Screen = _G.require("awful.screen")
local __awful_Wibox = _G.require("wibox")
local __haxe_IMap = _hx_e()
local __haxe_Exception = _hx_e()
local __haxe_NativeStackTrace = _hx_e()
local __haxe_ValueException = _hx_e()
local __haxe_ds_StringMap = _hx_e()
local __haxe_iterators_ArrayIterator = _hx_e()
local __haxe_iterators_ArrayKeyValueIterator = _hx_e()
local __init_Init = _hx_e()
local __pkg_PackageBase = _hx_e()
local __pkg_PackageDefinition = _hx_e()
local __init_Pkg = _hx_e()
local __init_Transcript = _hx_e()
local __lib_Inspect = _G.require("inspect")
local __log_Log = _hx_e()
local __lua_Boot = _hx_e()
local __lua_UserData = _hx_e()
local __lua_PairTools = _hx_e()
local __lua_Thread = _hx_e()

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
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
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
  local _g_array = self;
  while (_g_current < _g_array.length) do 
    _g_current = _g_current + 1;
    _G.table.insert(tbl, Std.string(_g_array[_g_current - 1]));
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
  local tmp = self;
  tmp.length = tmp.length - len;
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
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  do return _g end
end
Array.prototype.map = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(f(i));
  end;
  do return _g end
end
Array.prototype.filter = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
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

Reflect.new = {}
Reflect.__name__ = true
Reflect.field = function(o,field) 
  if (_G.type(o) == "string") then 
    if (field == "length") then 
      do return _hx_wrap_if_string_field(o,'length') end;
    else
      do return String.prototype[field] end;
    end;
  else
    local _hx_status, _hx_result = pcall(function() 
    
        do return o[field] end;
      return _hx_pcall_default
    end)
    if not _hx_status and _hx_result == "_hx_pcall_break" then
    elseif not _hx_status then 
      local _g = _hx_result;
      do return nil end;
    elseif _hx_result ~= _hx_pcall_default then
      return _hx_result
    end;
  end;
end
Reflect.fields = function(o) 
  local _hx_continue_1 = false;
  while (true) do repeat 
    if (_G.type(o) == "string") then 
      o = String.prototype;
      break;
    else
      do return _hx_field_arr(o) end;
    end;until true
    if _hx_continue_1 then 
    _hx_continue_1 = false;
    break;
    end;
    
  end;
end
Reflect.copy = function(o) 
  if (o == nil) then 
    do return nil end;
  end;
  local o2 = _hx_e();
  local _g = 0;
  local _g1 = Reflect.fields(o);
  while (_g < _g1.length) do 
    local f = _g1[_g];
    _g = _g + 1;
    o2[f] = Reflect.field(o, f);
  end;
  do return o2 end;
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
          do return String.__oldindex(s, k) end;
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
    do return String.indexOfEmpty(self, startIndex - 1) end;
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
      p = String.indexOfEmpty(self, startIndex1 - 1);
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
      ret:push(__lua_lib_luautf8_Utf8.sub(self, idx, newidx - 1));
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
__haxe_IMap.prototype = _hx_e();

__haxe_IMap.prototype.__class__ =  __haxe_IMap

__haxe_Exception.new = function(message,previous,native) 
  local self = _hx_new(__haxe_Exception.prototype)
  __haxe_Exception.super(self,message,previous,native)
  return self
end
__haxe_Exception.super = function(self,message,previous,native) 
  self.__skipStack = 0;
  self.__exceptionMessage = message;
  self.__previousException = previous;
  if (native ~= nil) then 
    self.__nativeException = native;
    self.__nativeStack = __haxe_NativeStackTrace.exceptionStack();
  else
    self.__nativeException = self;
    self.__nativeStack = __haxe_NativeStackTrace.callStack();
    self.__skipStack = 1;
  end;
end
__haxe_Exception.__name__ = true
__haxe_Exception.thrown = function(value) 
  if (__lua_Boot.__instanceof(value, __haxe_Exception)) then 
    do return value:get_native() end;
  else
    local e = __haxe_ValueException.new(value);
    e.__skipStack = e.__skipStack + 1;
    do return e end;
  end;
end
__haxe_Exception.prototype = _hx_e();
__haxe_Exception.prototype.get_native = function(self) 
  do return self.__nativeException end
end

__haxe_Exception.prototype.__class__ =  __haxe_Exception

__haxe_NativeStackTrace.new = {}
__haxe_NativeStackTrace.__name__ = true
__haxe_NativeStackTrace.saveStack = function(exception) 
end
__haxe_NativeStackTrace.callStack = function() 
  local _g = debug.traceback();
  if (_g == nil) then 
    do return _hx_tab_array({}, 0) end;
  else
    local idx = 1;
    local ret = _hx_tab_array({}, 0);
    while (idx ~= nil) do 
      local newidx = 0;
      if (__lua_lib_luautf8_Utf8.len("\n") > 0) then 
        newidx = __lua_lib_luautf8_Utf8.find(_g, "\n", idx, true);
      else
        if (idx >= __lua_lib_luautf8_Utf8.len(_g)) then 
          newidx = nil;
        else
          newidx = idx + 1;
        end;
      end;
      if (newidx ~= nil) then 
        ret:push(__lua_lib_luautf8_Utf8.sub(_g, idx, newidx - 1));
        idx = newidx + __lua_lib_luautf8_Utf8.len("\n");
      else
        ret:push(__lua_lib_luautf8_Utf8.sub(_g, idx, __lua_lib_luautf8_Utf8.len(_g)));
        idx = nil;
      end;
    end;
    do return ret:slice(3) end;
  end;
end
__haxe_NativeStackTrace.exceptionStack = function() 
  do return _hx_tab_array({}, 0) end;
end

__haxe_ValueException.new = function(value,previous,native) 
  local self = _hx_new(__haxe_ValueException.prototype)
  __haxe_ValueException.super(self,value,previous,native)
  return self
end
__haxe_ValueException.super = function(self,value,previous,native) 
  __haxe_Exception.super(self,Std.string(value),previous,native);
  self.value = value;
end
__haxe_ValueException.__name__ = true
__haxe_ValueException.prototype = _hx_e();

__haxe_ValueException.prototype.__class__ =  __haxe_ValueException
__haxe_ValueException.__super__ = __haxe_Exception
setmetatable(__haxe_ValueException.prototype,{__index=__haxe_Exception.prototype})

__haxe_ds_StringMap.new = function() 
  local self = _hx_new(__haxe_ds_StringMap.prototype)
  __haxe_ds_StringMap.super(self)
  return self
end
__haxe_ds_StringMap.super = function(self) 
  self.h = ({});
end
__haxe_ds_StringMap.__name__ = true
__haxe_ds_StringMap.__interfaces__ = {__haxe_IMap}
__haxe_ds_StringMap.prototype = _hx_e();
__haxe_ds_StringMap.prototype.set = function(self,key,value) 
  if (value == nil) then 
    self.h[key] = __haxe_ds_StringMap.tnull;
  else
    self.h[key] = value;
  end;
end
__haxe_ds_StringMap.prototype.get = function(self,key) 
  local ret = self.h[key];
  if (ret == __haxe_ds_StringMap.tnull) then 
    ret = nil;
  end;
  do return ret end
end

__haxe_ds_StringMap.prototype.__class__ =  __haxe_ds_StringMap

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

__init_Init.new = {}
__init_Init.__name__ = true
__init_Init.main = function() 
end

__pkg_PackageBase.new = function() 
  local self = _hx_new(__pkg_PackageBase.prototype)
  __pkg_PackageBase.super(self)
  return self
end
__pkg_PackageBase.super = function(self) 
end
__pkg_PackageBase.__name__ = true
__pkg_PackageBase.prototype = _hx_e();

__pkg_PackageBase.prototype.__class__ =  __pkg_PackageBase

__pkg_PackageDefinition.new = {}
__pkg_PackageDefinition.__name__ = true

__init_Pkg.new = function() 
  local self = _hx_new(__init_Pkg.prototype)
  __init_Pkg.super(self)
  return self
end
__init_Pkg.super = function(self) 
  self.name = "init";
  __pkg_PackageBase.super(self);
end
_hx_exports["init"]["Pkg"] = __init_Pkg
__init_Pkg.__name__ = true
__init_Pkg.__interfaces__ = {__pkg_PackageDefinition}
__init_Pkg.main = function() 
end
__init_Pkg.instance = function() 
  do return __init_Pkg.new() end;
end
__init_Pkg.prototype = _hx_e();
__init_Pkg.prototype.start = function(self) 
  if (__init_Pkg.widget == nil) then 
    __init_Pkg.widget = __init_Transcript.get_wibox();
  end;
  __init_Pkg.widget.visible = true;
end
__init_Pkg.prototype.stop = function(self) 
  if (__init_Pkg.widget ~= nil) then 
    __init_Pkg.widget.visible = false;
  end;
end
__init_Pkg.prototype.unload = function(self) 
  self:stop();
  __init_Pkg.widget = nil;
  __log_Log.log(Std.string(Std.string("INIT(") .. Std.string(__init_Pkg.ver)) .. Std.string("): unload!"), _hx_o({__fields__={bg=true,icon=true},bg=__log_Log.backgrounds:get("Info"),icon=Std.string(Std.string("") .. Std.string(__log_Log.res_path)) .. Std.string("/debug2.png")}), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/init/Pkg.hx",lineNumber=35,className="init.Pkg",methodName="unload"}));
end
__init_Pkg.prototype.load = function(self) 
  __log_Log.log(Std.string(Std.string("INIT(") .. Std.string(__init_Pkg.ver)) .. Std.string(") loaded!!!"), _hx_o({__fields__={bg=true,icon=true},bg=__log_Log.backgrounds:get("Info"),icon=Std.string(Std.string("") .. Std.string(__log_Log.res_path)) .. Std.string("/debug2.png")}), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/init/Pkg.hx",lineNumber=39,className="init.Pkg",methodName="load"}));
end

__init_Pkg.prototype.__class__ =  __init_Pkg
__init_Pkg.__super__ = __pkg_PackageBase
setmetatable(__init_Pkg.prototype,{__index=__pkg_PackageBase.prototype})

__init_Transcript.new = {}
_hx_exports["init"]["Transcript"] = __init_Transcript
__init_Transcript.__name__ = true
__init_Transcript.get_wibox = function(s) 
  if (s == nil) then 
    s = __awful_Screen.focused();
  end;
  local wb = __awful_Wibox(__init_Transcript.wiboxConfig);
  if (wb == nil) then 
    _G.error(__haxe_Exception.thrown("null pointer in .sure() call"),0);
  end;
  __init_Transcript.setup(wb, __init_Transcript.mkWidget(s));
  do return wb end;
end
__init_Transcript.setup = function(wibox,widget) 
  local _tmp_0 = ({widget});
  _tmp_0.margins = 15;
  _tmp_0.layout = __awful_Wibox.container.margin;
  local widgetTable = _tmp_0;
  local _tmp_1 = ({widgetTable});
  _tmp_1.id = "bg";
  _tmp_1.border_color = "#919191";
  _tmp_1.border_width = 1;
  _tmp_1.border_strategy = "inner";
  _tmp_1.widget = __awful_Wibox.container.background;
  local setupTable = _tmp_1;
  local prev_coords = _hx_o({__fields__={x=true,y=true},x=0,y=0});
  local is_pressed = false;
  wibox:setup(setupTable);
  wibox:connect_signal("button::press", function() 
    is_pressed = true;
    local t = __lua_PairTools.copy(mouse.coords());
    prev_coords = _hx_o(t);
  end);
  wibox:connect_signal("button::release", function() 
    is_pressed = false;
  end);
  wibox:connect_signal("mouse::move", function() 
    local t = __lua_PairTools.copy(mouse.coords());
    local coords = _hx_o(t);
    if (is_pressed) then 
      local wibox1 = wibox;
      wibox1.x = wibox1.x + (coords.x - prev_coords.x);
      local wibox = wibox;
      wibox.y = wibox.y + (coords.y - prev_coords.y);
    end;
    widget:set_markup(__init_Transcript.makeText(coords));
    prev_coords = coords;
  end);
  wibox.visible = true;
  do return wibox end;
end
__init_Transcript.makeText = function(pos) 
  if (pos == nil) then 
    pos = _hx_e();
  end;
  if (pos.x == nil) then 
    pos.x = 0;
  end;
  if (pos.y == nil) then 
    pos.y = 0;
  end;
  do return Std.string(Std.string(Std.string(Std.string(Std.string(Std.string("<span foreground=\"blue\">") .. Std.string(__init_Transcript.ver)) .. Std.string("</span>\n<b>")) .. Std.string(pos.x)) .. Std.string("x")) .. Std.string(pos.y)) .. Std.string("</b>!!!") end;
end
__init_Transcript.mkWidget = function(s) 
  local ret = _hx_o({__fields__={markup=true,align=true,valign=true,widget=true},markup=__init_Transcript.makeText(),align="center",valign="center",widget=wibox.widget.textbox});
  do return __awful_Wibox.widget(ret) end;
end

__log_Log.new = {}
__log_Log.__name__ = true
__log_Log.display = function(s,opts) 
  if (opts == nil) then 
    opts = _hx_e();
  end;
  local value = Reflect.copy(__log_Log.defaults);
  if (value == nil) then 
    _G.error(__haxe_Exception.thrown("null pointer in .sure() call"),0);
  end;
  local _g = 0;
  local _g1 = Reflect.fields(opts);
  while (_g < _g1.length) do 
    local f = _g1[_g];
    _g = _g + 1;
    value[f] = Reflect.field(opts, f);
  end;
  value.text = s;
  __awful_Naughty.notify(value);
end
__log_Log.formatInfos = function(i) 
  if (i == nil) then 
    do return "    ERROR: no pos info!\n" end;
  else
    local i = i;
    do return _G.table.concat(({Std.string(Std.string(Std.string("    ") .. Std.string(i.fileName)) .. Std.string(":")) .. Std.string(i.lineNumber),Std.string(Std.string(Std.string("    ") .. Std.string(i.className)) .. Std.string(".")) .. Std.string(i.methodName)}), "\n") end;
  end;
end
__log_Log.debug = function(x,infos) 
  __log_Log.log(x, _hx_o({__fields__={bg=true,icon=true},bg=__log_Log.backgrounds:get("Debug"),icon=Std.string(Std.string("") .. Std.string(__log_Log.res_path)) .. Std.string("/debug4.png")}), infos);
end
__log_Log.info = function(x,infos) 
  __log_Log.log(x, _hx_o({__fields__={bg=true,icon=true},bg=__log_Log.backgrounds:get("Info"),icon=Std.string(Std.string("") .. Std.string(__log_Log.res_path)) .. Std.string("/debug2.png")}), infos);
end
__log_Log.warn = function(x,infos) 
  __log_Log.log(x, _hx_o({__fields__={bg=true,icon=true},bg=__log_Log.backgrounds:get("Warn"),icon=Std.string(Std.string("") .. Std.string(__log_Log.res_path)) .. Std.string("/warn2.png")}), infos);
end
__log_Log.error = function(x,infos) 
  __log_Log.log(x, _hx_o({__fields__={bg=true,icon=true},bg=__log_Log.backgrounds:get("Error"),icon=Std.string(Std.string("") .. Std.string(__log_Log.res_path)) .. Std.string("/error2.png")}), infos);
end
__log_Log.log = function(x,opts,infos) 
  local _hx_continue_1 = false;
  while (true) do repeat 
    if (opts == nil) then 
      opts = _hx_e();
    end;
    local _hx_tmp = (function() 
      local _hx_1
      if (__lua_Boot.__instanceof(x, String)) then 
      _hx_1 = _hx_tab_array({[0]=x}, 1); else 
      _hx_1 = _hx_tab_array({}, 0); end
      return _hx_1
    end )();
    if (_hx_tmp.length == 1) then 
      local s = _hx_tmp[0];
      local infos = __log_Log.formatInfos(infos);
      __log_Log.display(Std.string(Std.string(Std.string(Std.string("") .. Std.string(infos)) .. Std.string("\n    -----------------------\n\n")) .. Std.string(s)) .. Std.string("\n"), opts);
    else
      x = __lib_Inspect.inspect(x, ({depth = 2}));
      break;
    end;
    do return end;until true
    if _hx_continue_1 then 
    _hx_continue_1 = false;
    break;
    end;
    
  end;
end

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

__lua_UserData.new = {}
__lua_UserData.__name__ = true

__lua_PairTools.new = {}
__lua_PairTools.__name__ = true
__lua_PairTools.copy = function(table1) 
  local ret = ({});
  for k,v in _G.pairs(table1) do ret[k] = v end;
  do return ret end;
end

__lua_Thread.new = {}
__lua_Thread.__name__ = true
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

local _hx_static_init = function()
  
  String.__name__ = true;
  Array.__name__ = true;
  _G.Logger = __log_Log;__haxe_ds_StringMap.tnull = ({});
  
  __init_Pkg.ver = "1590443480";
  
  __init_Transcript.wiboxConfig = ({ontop = true, opacity = 0.9, x = 120, y = 440, height = 115, width = 495});
  
  __init_Transcript.ver = "1590443480";
  
  __log_Log.backgrounds = (function() 
    local _hx_1
    
    local _g = __haxe_ds_StringMap.new();
    
    _g:set("Debug", "#45cf65");
    
    _g:set("Info", "#55aaff");
    
    _g:set("Warn", "#ffff7f");
    
    _g:set("Error", "#b91e1e");
    
    _hx_1 = _g;
    return _hx_1
  end )();
  
  __log_Log.res_path = "/home/cji/portless/lua/awesome-config/haxeshigh/res";
  
  __log_Log.defaults = _hx_o({__fields__={fg=true,bg=true,font=true,icon=true,width=true,position=true,timeout=true,hover_timeout=true},fg="black",bg="#96413F",font="mono 10",icon=Std.string(Std.string("") .. Std.string(__log_Log.res_path)) .. Std.string("/bang2.png"),width=720,position="bottom_right",timeout=20,hover_timeout=0.2});
  
  
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

_hx_wrap_if_string_field = function(o, fld)
  if _G.type(o) == 'string' then
    if fld == 'length' then
      return _G.string.len(o)
    else
      return String.prototype[fld]
    end
  else
    return o[fld]
  end
end

_hx_static_init();
_G.xpcall(__init_Init.main, _hx_error)
return _hx_exports

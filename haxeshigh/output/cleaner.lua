-- Generated by Haxe 4.0.5
local _hx_array_mt = {
  __newindex = function(t,k,v)
    local len = t.length
    t.length =  k >= len and (k + 1) or len
    rawset(t,k,v)
  end
}

local function _hx_tab_array(tab,length)
  tab.length = length
  return setmetatable(tab, _hx_array_mt)
end

local function _hx_anon_newindex(t,k,v) t.__fields__[k] = true; rawset(t,k,v); end
local _hx_anon_mt = {__newindex=_hx_anon_newindex}
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
  return setmetatable(ret, _hx_anon_mt)
end

local function _hx_e()
  return setmetatable({__fields__ = {}}, _hx_anon_mt)
end

local function _hx_o(obj)
  return setmetatable(obj, _hx_anon_mt)
end

local function _hx_new(prototype)
  return setmetatable({__fields__ = {}}, {__newindex=_hx_anon_newindex, __index=prototype})
end

local _hxClasses = {}
local Int = _hx_e();
local Dynamic = _hx_e();
local Float = _hx_e();
local Bool = _hx_e();
local Class = _hx_e();
local Enum = _hx_e();

local _hx_exports = _hx_exports or {}
_hx_exports["pkg"] = _hx_exports["pkg"] or _hx_e()
local Array = _hx_e()
local Cleaner = _hx_e()
local __lua_lib_luautf8_Utf8 = _G.require("lua-utf8")
local Lambda = _hx_e()
local Math = _hx_e()
local Reflect = _hx_e()
local String = _hx_e()
local Std = _hx_e()
local StringTools = _hx_e()
local __awful_Naughty = _G.require("naughty")
local __lib_Inspect = _G.require("inspect")
local __log_Log = _hx_e()
local __lua_Boot = _hx_e()
local __lua_UserData = _hx_e()
local __lua_Thread = _hx_e()
local __pkg_PackageCommand = _hx_e()
local __pkg_PackageDefinition = _hx_e()
local __pkg_PackageManager = _hx_e()
local __sys_io_File = _hx_e()
local __utils_Common = _hx_e()

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
Array.prototype = _hx_a();
Array.prototype.concat = function(self,a) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  local _g3 = 0;
  while (_g3 < a.length) do 
    local i1 = a[_g3];
    _g3 = _g3 + 1;
    _g:push(i1);
  end;
  do return _g end
end
Array.prototype.join = function(self,sep) 
  local tbl = ({});
  local _gthis = self;
  local cur_length = 0;
  local i = _hx_o({__fields__={hasNext=true,next=true},hasNext=function(self) 
    do return cur_length < _gthis.length end;
  end,next=function(self) 
    cur_length = cur_length + 1;
    do return _gthis[cur_length - 1] end;
  end});
  while (i:hasNext()) do 
    _G.table.insert(tbl, Std.string(i:next()));
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
  local _g2 = pos + len;
  local _g3 = self.length;
  while (_g2 < _g3) do 
    _g2 = _g2 + 1;
    local i1 = _g2 - 1;
    self[i1] = self[i1 + len];
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
      local _g2 = i;
      local _g11 = self.length - 1;
      while (_g2 < _g11) do 
        _g2 = _g2 + 1;
        local j = _g2 - 1;
        self[j] = self[j + 1];
      end;
      self[self.length - 1] = nil;
      self.length = self.length - 1;
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
  local _gthis = self;
  local cur_length = 0;
  do return _hx_o({__fields__={hasNext=true,next=true},hasNext=function(self) 
    do return cur_length < _gthis.length end;
  end,next=function(self) 
    cur_length = cur_length + 1;
    do return _gthis[cur_length - 1] end;
  end}) end
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

Cleaner.new = {}
_hx_exports["Cleaner"] = Cleaner
Cleaner.__name__ = true
Cleaner.main = function() 
  local cmd = __pkg_PackageCommand.new();
  local pkg1 = cmd:getPackage();
  __log_Log.log(Std.string(Std.string("Cleaner: removing package \"") .. Std.string(pkg1)) .. Std.string("\"..."), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Cleaner.hx",lineNumber=17,className="Cleaner",methodName="main"}));
  local _hx_status, _hx_result = pcall(function() 
  
      if (not cmd.PackageManager:unload(pkg1, true)) then 
        Cleaner.handleError(pkg1);
      else
        __log_Log.log(Std.string(Std.string("Cleaner: package \"") .. Std.string(pkg1)) .. Std.string("\" removed!"), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Cleaner.hx",lineNumber=23,className="Cleaner",methodName="main"}));
      end;
    return _hx_pcall_default
  end)
  if not _hx_status and _hx_result == "_hx_pcall_break" then
  elseif not _hx_status then 
  
    local _hx_1 = _hx_result
    if( __lua_Boot.__instanceof(_hx_1,String) ) then 
      local ex = _hx_1
      Cleaner.handleError(pkg1, ex);
    else _G.error(_hx_1)
    end
  elseif _hx_result ~= _hx_pcall_default then
    return _hx_result
  end;
end
Cleaner.handleError = function(pkg,ex) 
  if (ex == nil) then 
    ex = "";
  end;
  __log_Log.log(Std.string(Std.string("Cleaner: removing package \"") .. Std.string(pkg)) .. Std.string("\" failed!"), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Cleaner.hx",lineNumber=31,className="Cleaner",methodName="handleError"}));
  if (__lua_lib_luautf8_Utf8.len(ex) > 0) then 
    __log_Log.log(Std.string("Exception data:\n") .. Std.string(__utils_Common.formatSimpleEx(ex)), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/Cleaner.hx",lineNumber=33,className="Cleaner",methodName="handleError"}));
  end;
end

Lambda.new = {}
Lambda.__name__ = true
Lambda.iter = function(it,f) 
  local x = it:iterator();
  while (x:hasNext()) do 
    f(x:next());
  end;
end
Lambda.find = function(it,f) 
  local v = it:iterator();
  while (v:hasNext()) do 
    local v1 = v:next();
    if (f(v1)) then 
      do return v1 end;
    end;
  end;
  do return nil end;
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
    
      local _hx_1 = _hx_result
      local e = _hx_1
      do return nil end;
    elseif _hx_result ~= _hx_pcall_default then
      return _hx_result
    end;
  end;
end
Reflect.fields = function(o) 
  if (_G.type(o) == "string") then 
    do return Reflect.fields(String.prototype) end;
  else
    local _g = _hx_tab_array({}, 0);
    local f = __lua_Boot.fieldIterator(o);
    while (f:hasNext()) do 
      local f1 = f:next();
      _g:push(f1);
    end;
    do return _g end;
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
String.fromCharCode = function(code) 
  do return __lua_lib_luautf8_Utf8.char(code) end;
end
String.prototype = _hx_a();
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
    local r = __lua_lib_luautf8_Utf8.find(self, str, startIndex1, true);
    local p = (function() 
      local _hx_1
      if ((r ~= nil) and (r > 0)) then 
      _hx_1 = r - 1; else 
      _hx_1 = -1; end
      return _hx_1
    end )();
    if ((p == -1) or (p > startIndex)) then 
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
  do return __lua_Boot.__string_rec(s) end;
end
Std.int = function(x) 
  if (not Math.isFinite(x) or Math.isNaN(x)) then 
    do return 0 end;
  else
    do return _hx_bit_clamp(x) end;
  end;
end

StringTools.new = {}
StringTools.__name__ = true
StringTools.isSpace = function(s,pos) 
  if (((__lua_lib_luautf8_Utf8.len(s) == 0) or (pos < 0)) or (pos >= __lua_lib_luautf8_Utf8.len(s))) then 
    do return false end;
  end;
  local c = __lua_lib_luautf8_Utf8.byte(s, pos + 1);
  if (not ((c > 8) and (c < 14))) then 
    do return c == 32 end;
  else
    do return true end;
  end;
end
StringTools.ltrim = function(s) 
  local l = __lua_lib_luautf8_Utf8.len(s);
  local r = 0;
  while ((r < l) and StringTools.isSpace(s, r)) do 
    r = r + 1;
  end;
  if (r > 0) then 
    local pos = r;
    local len = l - r;
    if ((len == nil) or (len > (pos + __lua_lib_luautf8_Utf8.len(s)))) then 
      len = __lua_lib_luautf8_Utf8.len(s);
    else
      if (len < 0) then 
        len = __lua_lib_luautf8_Utf8.len(s) + len;
      end;
    end;
    if (pos < 0) then 
      pos = __lua_lib_luautf8_Utf8.len(s) + pos;
    end;
    if (pos < 0) then 
      pos = 0;
    end;
    do return __lua_lib_luautf8_Utf8.sub(s, pos + 1, pos + len) end;
  else
    do return s end;
  end;
end
StringTools.rtrim = function(s) 
  local l = __lua_lib_luautf8_Utf8.len(s);
  local r = 0;
  while ((r < l) and StringTools.isSpace(s, (l - r) - 1)) do 
    r = r + 1;
  end;
  if (r > 0) then 
    local len = l - r;
    if ((len == nil) or (len > __lua_lib_luautf8_Utf8.len(s))) then 
      len = __lua_lib_luautf8_Utf8.len(s);
    else
      if (len < 0) then 
        len = __lua_lib_luautf8_Utf8.len(s) + len;
      end;
    end;
    do return __lua_lib_luautf8_Utf8.sub(s, 1, len) end;
  else
    do return s end;
  end;
end
StringTools.trim = function(s) 
  do return StringTools.ltrim(StringTools.rtrim(s)) end;
end

__log_Log.new = {}
__log_Log.__name__ = true
__log_Log.display = function(s,opts) 
  if (opts == nil) then 
    opts = _hx_e();
  end;
  local value = Reflect.copy(__log_Log.defaults);
  if (value == nil) then 
    _G.error("null pointer in .sure() call",0);
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
    local i1 = i;
    do return _G.table.concat(({Std.string(Std.string(Std.string("    ") .. Std.string(i1.fileName)) .. Std.string(":")) .. Std.string(i1.lineNumber),Std.string(Std.string(Std.string("    ") .. Std.string(i1.className)) .. Std.string(".")) .. Std.string(i1.methodName)}), "\n") end;
  end;
end
__log_Log.log = function(x,infos) 
  local _hx_tmp = (function() 
    local _hx_1
    if (__lua_Boot.__instanceof(x, String)) then 
    _hx_1 = _hx_tab_array({[0]=x}, 1); else 
    _hx_1 = _hx_tab_array({}, 0); end
    return _hx_1
  end )();
  if (_hx_tmp.length == 1) then 
    local s = _hx_tmp[0];
    local infos1 = __log_Log.formatInfos(infos);
    __log_Log.display(Std.string(Std.string(Std.string(Std.string("") .. Std.string(infos1)) .. Std.string("\n    -----------------------\n\n")) .. Std.string(s)) .. Std.string("\n"));
  else
    __log_Log.log(__lib_Inspect.inspect(x, ({depth = 2})), infos);
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
        local cl2 = o.__class__;
        tmp = (function() 
          local _hx_1
          if (cl2 ~= nil) then 
          _hx_1 = cl2; else 
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
__lua_Boot.printEnum = function(o,s) 
  if (o.length == 2) then 
    do return o[0] end;
  else
    local str = Std.string(Std.string(o[0])) .. Std.string("(");
    s = Std.string(s) .. Std.string("\t");
    local _g = 2;
    local _g1 = o.length;
    while (_g < _g1) do 
      _g = _g + 1;
      local i = _g - 1;
      if (i ~= 2) then 
        str = Std.string(str) .. Std.string((Std.string(",") .. Std.string(__lua_Boot.__string_rec(o[i], s))));
      else
        str = Std.string(str) .. Std.string(__lua_Boot.__string_rec(o[i], s));
      end;
    end;
    do return Std.string(str) .. Std.string(")") end;
  end;
end
__lua_Boot.printClassRec = function(c,result,s) 
  if (result == nil) then 
    result = "";
  end;
  local f = __lua_Boot.__string_rec;
  for k,v in pairs(c) do if result ~= '' then result = result .. ', ' end result = result .. k .. ':' .. f(v, s.. '	') end;
  do return result end;
end
__lua_Boot.__string_rec = function(o,s) 
  if (s == nil) then 
    s = "";
  end;
  if (__lua_lib_luautf8_Utf8.len(s) >= 5) then 
    do return "<...>" end;
  end;
  local _g = type(o);
  if (_g) == "boolean" then 
    do return tostring(o) end;
  elseif (_g) == "function" then 
    do return "<function>" end;
  elseif (_g) == "nil" then 
    do return "null" end;
  elseif (_g) == "number" then 
    if (o == _G.math.huge) then 
      do return "Infinity" end;
    else
      if (o == -_G.math.huge) then 
        do return "-Infinity" end;
      else
        if (o == 0) then 
          do return "0" end;
        else
          if (o ~= o) then 
            do return "NaN" end;
          else
            do return tostring(o) end;
          end;
        end;
      end;
    end;
  elseif (_g) == "string" then 
    do return o end;
  elseif (_g) == "table" then 
    if (o.__enum__ ~= nil) then 
      do return __lua_Boot.printEnum(o, s) end;
    else
      if ((_hx_wrap_if_string_field(o,'toString') ~= nil) and not __lua_Boot.isArray(o)) then 
        do return _hx_wrap_if_string_field(o,'toString')(o) end;
      else
        if (__lua_Boot.isArray(o)) then 
          local o2 = o;
          if (__lua_lib_luautf8_Utf8.len(s) > 5) then 
            do return "[...]" end;
          else
            local _g1 = _hx_tab_array({}, 0);
            local _g11 = 0;
            while (_g11 < o2.length) do 
              local i = o2[_g11];
              _g11 = _g11 + 1;
              _g1:push(__lua_Boot.__string_rec(i, Std.string(s) .. Std.string(1)));
            end;
            do return Std.string(Std.string("[") .. Std.string(_g1:join(","))) .. Std.string("]") end;
          end;
        else
          if (o.__class__ ~= nil) then 
            do return Std.string(Std.string("{") .. Std.string(__lua_Boot.printClassRec(o, "", Std.string(s) .. Std.string("\t")))) .. Std.string("}") end;
          else
            local fields = __lua_Boot.fieldIterator(o);
            local buffer = ({});
            local first = true;
            _G.table.insert(buffer, "{ ");
            local f = fields;
            while (f:hasNext()) do 
              local f1 = f:next();
              if (first) then 
                first = false;
              else
                _G.table.insert(buffer, ", ");
              end;
              _G.table.insert(buffer, Std.string(Std.string(Std.string("") .. Std.string(Std.string(f1))) .. Std.string(" : ")) .. Std.string(__lua_Boot.__string_rec(o[f1], Std.string(s) .. Std.string("\t"))));
            end;
            _G.table.insert(buffer, " }");
            do return _G.table.concat(buffer, "") end;
          end;
        end;
      end;
    end;
  elseif (_g) == "thread" then 
    do return "<thread>" end;
  elseif (_g) == "userdata" then 
    local mt = _G.getmetatable(o);
    if ((mt ~= nil) and (mt.__tostring ~= nil)) then 
      do return _G.tostring(o) end;
    else
      do return "<userdata>" end;
    end;else
  _G.error("Unknown Lua type",0); end;
end
__lua_Boot.extendsOrImplements = function(cl1,cl2) 
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
  do return __lua_Boot.extendsOrImplements(cl1.__super__, cl2) end;
end
__lua_Boot.fieldIterator = function(o) 
  if (_G.type(o) ~= "table") then 
    do return _hx_o({__fields__={next=true,hasNext=true},next=function(self) 
      do return nil end;
    end,hasNext=function(self) 
      do return false end;
    end}) end;
  end;
  local tbl = (function() 
    local _hx_1
    if (o.__fields__ ~= nil) then 
    _hx_1 = o.__fields__; else 
    _hx_1 = o; end
    return _hx_1
  end )();
  local cur = _G.pairs(tbl);
  local next_valid = function(tbl1,val) 
    while (__lua_Boot.hiddenFields[val] ~= nil) do 
      val = cur(tbl1, val);
    end;
    do return val end;
  end;
  local cur_val = next_valid(tbl, cur(tbl, nil));
  do return _hx_o({__fields__={next=true,hasNext=true},next=function(self) 
    local ret = cur_val;
    cur_val = next_valid(tbl, cur(tbl, cur_val));
    do return ret end;
  end,hasNext=function(self) 
    do return cur_val ~= nil end;
  end}) end;
end

__lua_UserData.new = {}
__lua_UserData.__name__ = true

__lua_Thread.new = {}
__lua_Thread.__name__ = true

__pkg_PackageCommand.new = function() 
  local self = _hx_new(__pkg_PackageCommand.prototype)
  __pkg_PackageCommand.super(self)
  return self
end
__pkg_PackageCommand.super = function(self) 
  self.argFilePath = "/home/cji/portless/lua/awesome-config/haxeshigh/tmp/loading";
  self.PackageManager = _hx_funcToField(_G.PackageManager);
end
__pkg_PackageCommand.__name__ = true
__pkg_PackageCommand.prototype = _hx_a();
__pkg_PackageCommand.prototype.getPackage = function(self) 
  do return StringTools.trim(__sys_io_File.getContent(self.argFilePath)) end
end

__pkg_PackageCommand.prototype.__class__ =  __pkg_PackageCommand

__pkg_PackageDefinition.new = {}
__pkg_PackageDefinition.__name__ = true
__pkg_PackageDefinition.prototype = _hx_a();

__pkg_PackageDefinition.prototype.__class__ =  __pkg_PackageDefinition

__pkg_PackageManager.new = function() 
  local self = _hx_new(__pkg_PackageManager.prototype)
  __pkg_PackageManager.super(self)
  return self
end
__pkg_PackageManager.super = function(self) 
  self.packages = _hx_tab_array({}, 0);
  self.argFilePath = "/home/cji/portless/lua/awesome-config/haxeshigh/tmp/loading";
end
_hx_exports["pkg"]["PackageManager"] = __pkg_PackageManager
__pkg_PackageManager.__name__ = true
__pkg_PackageManager.main = function() 
  __utils_Common.check_path();
  local _g = _G.PackageManager;
  if (_g == nil) then 
    __log_Log.log("No previous PackageManager found, creating new instance...", _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/pkg/PackageManager.hx",lineNumber=100,className="pkg.PackageManager",methodName="main"}));
    _G.PackageManager = __pkg_PackageManager.new();
  else
    __log_Log.log("Found previous PackageManager instance, updating...", _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/pkg/PackageManager.hx",lineNumber=103,className="pkg.PackageManager",methodName="main"}));
    local mgr = __pkg_PackageManager.new();
    Lambda.iter(_g.packages, _hx_bind(mgr.packages,mgr.packages.push));
    _G.PackageManager = mgr;
  end;
  local value = _G.PackageManager;
  if (value == nil) then 
    _G.error("null pointer in .sure() call",0);
  end;
  __log_Log.log(Std.string(Std.string("Loaded! ") .. Std.string(value.packages.length)) .. Std.string(" packages available."), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/pkg/PackageManager.hx",lineNumber=110,className="pkg.PackageManager",methodName="main"}));
end
__pkg_PackageManager.prototype = _hx_a();
__pkg_PackageManager.prototype.clear = function(self) 
  self.packages:resize(0);
end
__pkg_PackageManager.prototype.findByName = function(self,name) 
  do return Lambda.find(self.packages, function(o) 
    do return o.name == name end;
  end) end
end
__pkg_PackageManager.prototype.load = function(self,name,require) 
  if (require == nil) then 
    require = false;
  end;
  local name1 = name;
  local pkg1 = Lambda.find(self.packages, function(o) 
    do return o.name == name1 end;
  end);
  if (pkg1 == nil) then 
    if (require) then 
      self:requirePkg(name);
      do return self:load(name, false) end;
    else
      __log_Log.log(Std.string(Std.string("ERROR: ") .. Std.string(name)) .. Std.string(" not found!"), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/pkg/PackageManager.hx",lineNumber=39,className="pkg.PackageManager",methodName="load"}));
      do return false end;
    end;
  else
    pkg1:load();
    do return true end;
  end;
end
__pkg_PackageManager.prototype.unload = function(self,name,remove) 
  if (remove == nil) then 
    remove = false;
  end;
  local name1 = name;
  local pkg1 = Lambda.find(self.packages, function(o) 
    do return o.name == name1 end;
  end);
  if (pkg1 == nil) then 
    __log_Log.log(Std.string(Std.string("ERROR: \"") .. Std.string(name)) .. Std.string("\" not found!"), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/pkg/PackageManager.hx",lineNumber=55,className="pkg.PackageManager",methodName="unload"}));
    do return false end;
  else
    if (remove) then 
      self:remove(pkg1);
    end;
    pkg1:unload();
    do return true end;
  end;
end
__pkg_PackageManager.prototype.requirePkg = function(self,pkgName) 
  local mod = Reflect.field(_G.require(Std.string("hx_") .. Std.string(pkgName)), pkgName);
  self:add(mod.Pkg.instance());
end
__pkg_PackageManager.prototype.remove = function(self,pkg1) 
  self.packages:remove(pkg1);
  _G.package.loaded[Std.string("hx_") .. Std.string(pkg1.name)] = nil;
end
__pkg_PackageManager.prototype.add = function(self,pkg1) 
  local name = pkg1.name;
  local name1 = name;
  if (Lambda.find(self.packages, function(o) 
    do return o.name == name1 end;
  end) == nil) then 
    self.packages:push(pkg1);
  else
    __log_Log.log(Std.string(Std.string("PackageManager: package \"") .. Std.string(name)) .. Std.string("\" already exists."), _hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="src/pkg/PackageManager.hx",lineNumber=88,className="pkg.PackageManager",methodName="add"}));
  end;
end

__pkg_PackageManager.prototype.__class__ =  __pkg_PackageManager

__sys_io_File.new = {}
__sys_io_File.__name__ = true
__sys_io_File.getContent = function(path) 
  local f = _G.io.open(path, "r");
  if (f == nil) then 
    _G.error(Std.string("Invalid path : ") .. Std.string(path),0);
  end;
  local s = f:read("*all");
  f:close();
  do return s end;
end

__utils_Common.new = {}
__utils_Common.__name__ = true
__utils_Common.formatSimpleEx = function(exception) 
  local ex = Std.string(exception);
  local idx = 1;
  local ret = _hx_tab_array({}, 0);
  while (idx ~= nil) do 
    local newidx = 0;
    if (__lua_lib_luautf8_Utf8.len(":") > 0) then 
      newidx = __lua_lib_luautf8_Utf8.find(ex, ":", idx, true);
    else
      if (idx >= __lua_lib_luautf8_Utf8.len(ex)) then 
        newidx = nil;
      else
        newidx = idx + 1;
      end;
    end;
    if (newidx ~= nil) then 
      ret:push(__lua_lib_luautf8_Utf8.sub(ex, idx, newidx - 1));
      idx = newidx + __lua_lib_luautf8_Utf8.len(":");
    else
      ret:push(__lua_lib_luautf8_Utf8.sub(ex, idx, __lua_lib_luautf8_Utf8.len(ex)));
      idx = nil;
    end;
  end;
  local value = ret:join("\n");
  if (value == nil) then 
    _G.error("null pointer in .sure() call",0);
  end;
  do return value end;
end
__utils_Common.check_path = function() 
  local r = __lua_lib_luautf8_Utf8.find(_G.package.path, "haxeshigh/output", 1, true);
  if ((function() 
    local _hx_1
    if ((r ~= nil) and (r > 0)) then 
    _hx_1 = r - 1; else 
    _hx_1 = -1; end
    return _hx_1
  end )() == -1) then 
    _G.package.path = Std.string("/home/cji/portless/lua/awesome-config/haxeshigh/output/?.lua;") .. Std.string(_G.package.path);
  end;
end
_hx_bit_clamp = function(v)
  if v <= 2147483647 and v >= -2147483648 then
    if v > 0 then return _G.math.floor(v)
    else return _G.math.ceil(v)
    end
  end
  if v > 2251798999999999 then v = v*2 end;
  if (v ~= v or math.abs(v) == _G.math.huge) then return nil end
  return _hx_bit.band(v, 2147483647 ) - math.abs(_hx_bit.band(v, 2147483648))
end

-- require this for lua 5.1
pcall(require, 'bit')
if bit then
  _hx_bit = bit
else
  local _hx_bit_raw = _G.require('bit32')
  _hx_bit = setmetatable({}, { __index = _hx_bit_raw });
  -- lua 5.2 weirdness
  _hx_bit.bnot = function(...) return _hx_bit_clamp(_hx_bit_raw.bnot(...)) end;
  _hx_bit.bxor = function(...) return _hx_bit_clamp(_hx_bit_raw.bxor(...)) end;
end

_hx_array_mt.__index = Array.prototype

local _hx_static_init = function()
  __log_Log.defaults = _hx_o({__fields__={fg=true,bg=true,icon=true,width=true,position=true,timeout=true,hover_timeout=true},fg="white",bg="#96413F",icon="/home/cji/portless/lua/awesome-config/haxeshigh/bang2.png",width=520,position="bottom_right",timeout=20,hover_timeout=0});
  
  __lua_Boot.hiddenFields = {__id__=true, hx__closures=true, super=true, prototype=true, __fields__=true, __ifields__=true, __class__=true, __properties__=true}
  
  
  String.__name__ = true;
  Array.__name__ = true;
end

_hx_bind = function(o,m)
  if m == nil then return nil end;
  local f;
  if o._hx__closures == nil then
    _G.rawset(o, '_hx__closures', {});
  else
    f = o._hx__closures[m];
  end
  if (f == nil) then
    f = function(...) return m(o, ...) end;
    o._hx__closures[m] = f;
  end
  return f;
end

_hx_funcToField = function(f)
  if type(f) == 'function' then
    return function(self,...)
      return f(...)
    end
  else
    return f
  end
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
Cleaner.main()
return _hx_exports

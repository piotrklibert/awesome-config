local a={__newindex=function(b,c,d)local e=b.length;b.length=c>=e and c+1 or e;rawset(b,c,d)end}local function f(g,h)g.length=h;return setmetatable(g,a)end;local function i(b,c,d)b.__fields__[c]=true;rawset(b,c,d)end;local j={__newindex=i}local function k(...)local l={}local m={__fields__=l}local n=select('#',...)local g={...}local o=1;while o<n do local d=g[o]l[d]=true;m[d]=g[o+1]o=o+2 end;return setmetatable(m,j)end;local function p()return setmetatable({__fields__={}},j)end;local function q(r)return setmetatable(r,j)end;local function s(t)return setmetatable({__fields__={}},{__newindex=i,__index=t})end;local u={}local v=p()local w=p()local x=p()local y=p()local z=p()local A=p()local _hx_exports=_hx_exports or{}_hx_exports["app"]=_hx_exports["app"]or p()local B=p()__lua_lib_luautf8_Utf8=_G.require("lua-utf8")local C=p()local D=p()local E=p()local F=p()local G=p()__app_Taglist=p()__app_TaglistAnimation=p()__app_Timers=p()__awful_Screen=_G.require("awful.screen")__awful_Timer=_G.require("gears.timer")__awful_Wibox=_G.require("wibox")__awful_Widget=_G.require("awful.widget")__haxe_EntryPoint=p()__haxe_MainEvent=p()__haxe_MainLoop=p()__haxe_ds_Option=p()__haxe_io_Bytes=p()__haxe_io_Encoding=p()__haxe_io_Error=p()__haxe_io_Output=p()__lib_Inspect=_G.require("inspect")__lua_Boot=p()__lua_Thread=p()__lua_UserData=p()__lua_lib_luasocket_Socket=_G.require("socket")__sys_io_File=p()__sys_io_FileOutput=p()__utils_Utils=p()__utils_FileLogger=p()local H,I,J,K,L,M,N,O,P,Q,R;local S={}local T={}B.new=function()local self=s(B.prototype)B.super(self)return self end;B.super=function(self)f(self,0)end;B.prototype=k()B.prototype.concat=function(self,U)local V=f({},0)local W=0;local X=self;while W<X.length do local Y=X[W]W=W+1;V:push(Y)end;local Z=0;while Z<U.length do local _=U[Z]Z=Z+1;V:push(_)end;do return V end end;B.prototype.join=function(self,a0)local a1={}local a2=self;local a3=0;local Y=q({__fields__={hasNext=true,next=true},hasNext=function(self)do return a3<a2.length end end,next=function(self)a3=a3+1;do return a2[a3-1]end end})while Y:hasNext()do _G.table.insert(a1,F.string(Y:next()))end;do return _G.table.concat(a1,a0)end end;B.prototype.pop=function(self)if self.length==0 then do return nil end end;local m=self[self.length-1]self[self.length-1]=nil;self.length=self.length-1;do return m end end;B.prototype.push=function(self,a4)self[self.length]=a4;do return self.length end end;B.prototype.reverse=function(self)local a5;local Y=0;while Y<F.int(self.length/2)do a5=self[Y]self[Y]=self[self.length-Y-1]self[self.length-Y-1]=a5;Y=Y+1 end end;B.prototype.shift=function(self)if self.length==0 then do return nil end end;local m=self[0]if self.length==1 then self[0]=nil else if self.length>1 then self[0]=self[1]_G.table.remove(self,1)end end;local a5=self;a5.length=a5.length-1;do return m end end;B.prototype.slice=function(self,a6,a7)if a7==nil or a7>self.length then a7=self.length else if a7<0 then a7=_G.math.fmod(self.length-_G.math.fmod(-a7,self.length),self.length)end end;if a6<0 then a6=_G.math.fmod(self.length-_G.math.fmod(-a6,self.length),self.length)end;if a6>a7 or a6>self.length then do return f({},0)end end;local m=f({},0)local V=a6;local W=a7;while V<W do V=V+1;m:push(self[V-1])end;do return m end end;B.prototype.sort=function(self,a8)local Y=0;local a9=self.length;while Y<a9 do local aa=false;local ab=0;local n=a9-Y-1;while ab<n do if a8(self[ab],self[ab+1])>0 then local a5=self[ab+1]self[ab+1]=self[ab]self[ab]=a5;aa=true end;ab=ab+1 end;if not aa then break end;Y=Y+1 end end;B.prototype.splice=function(self,a6,e)if e<0 or a6>self.length then do return f({},0)end else if a6<0 then a6=self.length-_G.math.fmod(-a6,self.length)end end;e=C.min(e,self.length-a6)local m=f({},0)local V=a6;local W=a6+e;while V<W do V=V+1;local Y=V-1;m:push(self[Y])self[Y]=self[Y+e]end;local X=a6+e;local Z=self.length;while X<Z do X=X+1;local _=X-1;self[_]=self[_+e]end;local a5=self;a5.length=a5.length-e;do return m end end;B.prototype.toString=function(self)local a1={}_G.table.insert(a1,"[")_G.table.insert(a1,self:join(","))_G.table.insert(a1,"]")do return _G.table.concat(a1,"")end end;B.prototype.unshift=function(self,a4)local e=self.length;local V=0;while V<e do V=V+1;local Y=V-1;self[e-Y]=self[e-Y-1]end;self[0]=a4 end;B.prototype.insert=function(self,a6,a4)if a6>self.length then a6=self.length end;if a6<0 then a6=self.length+a6;if a6<0 then a6=0 end end;local ac=self.length;while ac>a6 do self[ac]=self[ac-1]ac=ac-1 end;self[a6]=a4 end;B.prototype.remove=function(self,a4)local V=0;local W=self.length;while V<W do V=V+1;local Y=V-1;if self[Y]==a4 then local X=Y;local ad=self.length-1;while X<ad do X=X+1;local ab=X-1;self[ab]=self[ab+1]end;self[self.length-1]=nil;self.length=self.length-1;do return true end end end;do return false end end;B.prototype.indexOf=function(self,a4,ae)local a7=self.length;if ae==nil then ae=0 else if ae<0 then ae=self.length+ae;if ae<0 then ae=0 end end end;local V=ae;while V<a7 do V=V+1;local Y=V-1;if a4==self[Y]then do return Y end end end;do return-1 end end;B.prototype.lastIndexOf=function(self,a4,ae)if ae==nil or ae>=self.length then ae=self.length-1 else if ae<0 then ae=self.length+ae;if ae<0 then do return-1 end end end end;local Y=ae;while Y>=0 do if self[Y]==a4 then do return Y end else Y=Y-1 end end;do return-1 end end;B.prototype.copy=function(self)local V=f({},0)local W=0;local X=self;while W<X.length do local Y=X[W]W=W+1;V:push(Y)end;do return V end end;B.prototype.map=function(self,a8)local V=f({},0)local W=0;local X=self;while W<X.length do local Y=X[W]W=W+1;V:push(a8(Y))end;do return V end end;B.prototype.filter=function(self,a8)local V=f({},0)local W=0;local X=self;while W<X.length do local Y=X[W]W=W+1;if a8(Y)then V:push(Y)end end;do return V end end;B.prototype.iterator=function(self)local a2=self;local a3=0;do return q({__fields__={hasNext=true,next=true},hasNext=function(self)do return a3<a2.length end end,next=function(self)a3=a3+1;do return a2[a3-1]end end})end end;B.prototype.resize=function(self,e)if self.length<e then self.length=e else if self.length>e then local V=e;local W=self.length;while V<W do V=V+1;self[V-1]=nil end;self.length=e end end end;C.new={}C.isNaN=function(a8)do return a8~=a8 end end;C.isFinite=function(a8)if a8>-_G.math.huge then do return a8<_G.math.huge end else do return false end end end;C.min=function(U,af)if C.isNaN(U)or C.isNaN(af)then do return 0/0 end else do return _G.math.min(U,af)end end end;D.new={}D.fields=function(ag)if _G.type(ag)=="string"then do return D.fields(E.prototype)end else local V=f({},0)local a8=__lua_Boot.fieldIterator(ag)while a8:hasNext()do local ah=a8:next()V:push(ah)end;do return V end end end;E.new=function(ai)local self=s(E.prototype)E.super(self,ai)self=ai;return self end;E.super=function(self,ai)end;E.__index=function(aj,c)if c=="length"then do return __lua_lib_luautf8_Utf8.len(aj)end else local ag=E.prototype;local ak=c;if(function()local al;if _G.type(ag)=="string"and(E.prototype[ak]~=nil or ak=="length")then al=true elseif ag.__fields__~=nil then al=ag.__fields__[ak]~=nil else al=ag[ak]~=nil end;return al end)()then do return E.prototype[c]end else if E.__oldindex~=nil then if _G.type(E.__oldindex)=="function"then do return E.__oldindex(aj,c)end else if _G.type(E.__oldindex)=="table"then do return E.__oldindex[c]end end end;do return nil end else do return nil end end end end end;E.fromCharCode=function(am)do return __lua_lib_luautf8_Utf8.char(am)end end;E.prototype=k()E.prototype.toUpperCase=function(self)do return __lua_lib_luautf8_Utf8.upper(self)end end;E.prototype.toLowerCase=function(self)do return __lua_lib_luautf8_Utf8.lower(self)end end;E.prototype.indexOf=function(self,an,ao)if ao==nil then ao=1 else ao=ao+1 end;local ap=__lua_lib_luautf8_Utf8.find(self,an,ao,true)if ap~=nil and ap>0 then do return ap-1 end else do return-1 end end end;E.prototype.lastIndexOf=function(self,an,ao)local m=-1;if ao==nil then ao=__lua_lib_luautf8_Utf8.len(self)end;while true do local aq=m+1;if aq==nil then aq=1 else aq=aq+1 end;local ap=__lua_lib_luautf8_Utf8.find(self,an,aq,true)local ar=(function()local al;if ap~=nil and ap>0 then al=ap-1 else al=-1 end;return al end)()if ar==-1 or ar>ao then break end;m=ar end;do return m end end;E.prototype.split=function(self,as)local at=1;local m=f({},0)while at~=nil do local au=0;if __lua_lib_luautf8_Utf8.len(as)>0 then au=__lua_lib_luautf8_Utf8.find(self,as,at,true)else if at>=__lua_lib_luautf8_Utf8.len(self)then au=nil else au=at+1 end end;if au~=nil then m:push(__lua_lib_luautf8_Utf8.sub(self,at,au-1))at=au+__lua_lib_luautf8_Utf8.len(as)else m:push(__lua_lib_luautf8_Utf8.sub(self,at,__lua_lib_luautf8_Utf8.len(self)))at=nil end end;do return m end end;E.prototype.toString=function(self)do return self end end;E.prototype.substring=function(self,ao,av)if av==nil then av=__lua_lib_luautf8_Utf8.len(self)end;if av<0 then av=0 end;if ao<0 then ao=0 end;if av<ao then do return __lua_lib_luautf8_Utf8.sub(self,av+1,ao)end else do return __lua_lib_luautf8_Utf8.sub(self,ao+1,av)end end end;E.prototype.charAt=function(self,aw)do return __lua_lib_luautf8_Utf8.sub(self,aw+1,aw+1)end end;E.prototype.charCodeAt=function(self,aw)do return __lua_lib_luautf8_Utf8.byte(self,aw+1)end end;E.prototype.substr=function(self,a6,e)if e==nil or e>a6+__lua_lib_luautf8_Utf8.len(self)then e=__lua_lib_luautf8_Utf8.len(self)else if e<0 then e=__lua_lib_luautf8_Utf8.len(self)+e end end;if a6<0 then a6=__lua_lib_luautf8_Utf8.len(self)+a6 end;if a6<0 then a6=0 end;do return __lua_lib_luautf8_Utf8.sub(self,a6+1,a6+e)end end;F.new={}F.string=function(aj)do return __lua_Boot.__string_rec(aj)end end;F.int=function(a4)if not C.isFinite(a4)or C.isNaN(a4)then do return 0 end else do return P(a4)end end end;G.new={}G.time=function()do return __lua_lib_luasocket_Socket.gettime()end end;__app_Taglist.new=function()local self=s(__app_Taglist.prototype)__app_Taglist.super(self)return self end;__app_Taglist.super=function(self)self.my_wibox=__haxe_ds_Option.None end;_hx_exports["app"]["Taglist"]=__app_Taglist;__app_Taglist.mkWibox=function()do return __awful_Wibox(__app_Taglist.wibox_config)end end;__app_Taglist.mkWidget=function(aj)local b=function(a4)do return a4.name end end;local ax=function(ay)do return __utils_Utils.filterIn(ay,b)end end;local az=f({[0]=__awful_Widget.taglist(q({__fields__={screen=true,filter=true},screen=aj,filter=function(aA,...)return ax(f({[0]="1","2","3"},3))(...)end})),__awful_Widget.taglist(q({__fields__={screen=true,filter=true},screen=aj,filter=function(aA,...)return ax(f({[0]="4","5","6"},3))(...)end})),__awful_Widget.taglist(q({__fields__={screen=true,filter=true},screen=aj,filter=function(aA,...)return ax(f({[0]="7","8","9"},3))(...)end}))},3)local m={}local V=0;local W=az.length;while V<W do V=V+1;local at=V-1;m[at+1]=az[at]end;local aB=m;aB.spacing=6;aB.id="grid"aB.layout=__awful_Wibox.layout.fixed.vertical;do return __awful_Wibox.widget(aB)end end;__app_Taglist.prototype=k()__app_Taglist.prototype.enable=function(self)if self.my_wibox==__haxe_ds_Option.None then self.my_wibox=__haxe_ds_Option.Some(__app_Taglist.mkWibox())end;local aC=self.my_wibox;local a5;local aD=aC[1]if aD==0 then a5=aC[2]elseif aD==1 then _G.error("None in OptionTools.sure() call",0)end;self:setup(a5,__app_Taglist.mkWidget(__awful_Screen.focused()))end;__app_Taglist.prototype.disable=function(self)local aC=self.my_wibox;local aE;local aF=aC[1]if aF==0 then aE=aC[2]elseif aF==1 then _G.error("None in OptionTools.sure() call",0)end;aE.visible=false;self.my_wibox=__haxe_ds_Option.None end;__app_Taglist.prototype.setup=function(self,aG,aH)local aI=__utils_Utils.structToTable(q({__fields__={margins=true,layout=true},margins=15,layout=__awful_Wibox.container.margin}))aI[1]=aH;local aJ=__utils_Utils.structToTable(q({__fields__={id=true,border_color=true,border_width=true,border_strategy=true,widget=true},id="bg",border_color="#919191",border_width=1,border_strategy="inner",widget=__awful_Wibox.container.background}))aJ[1]=aI;local aK=__app_TaglistAnimation.new(self)aG:setup(aJ)aG:connect_signal("mouse::enter",function()aK:slide("in")do return end end)aG:connect_signal("mouse::leave",function()aK:slide("out")do return end end)aG.visible=true;do return aG end end;__app_TaglistAnimation.new=function(b)local self=s(__app_TaglistAnimation.prototype)__app_TaglistAnimation.super(self,b)return self end;__app_TaglistAnimation.super=function(self,b)self.timers=__app_Timers.new()local V=b.my_wibox;local a5=V[1]if a5==0 then self.my_wibox=V[2]elseif a5==1 then _G.error("Cannot animate nonexistent widget",0)end end;__app_TaglistAnimation.prototype=k()__app_TaglistAnimation.prototype.slideOut=function(self,aL)local aM=self.my_wibox.x;local aN=0;local aO=_G.math.ceil((__app_TaglistAnimation.slideConf.last-aM)/2)while aN<aO do aN=aN+1;self.my_wibox:geometry(q({__fields__={x=true},x=aM+(aN-1)*2}))_G.coroutine.yield()end;aL:stop()end;__app_TaglistAnimation.prototype.slideIn=function(self,aL)local a7=__app_TaglistAnimation.slideConf.init;local aN=_G.math.ceil((self.my_wibox.x-a7)/2)while aN>0 do aN=aN-1;self.my_wibox:geometry(q({__fields__={x=true},x=a7+aN*2}))_G.coroutine.yield()end;aL:stop()end;__app_TaglistAnimation.prototype.slide=function(self,aP)local a2=self;if self.timers.slide_timer~=__haxe_ds_Option.None then local aC=self.timers.slide_timer;local a5;local aD=aC[1]if aD==0 then a5=aC[2]elseif aD==1 then _G.error("None in OptionTools.sure() call",0)end;a5:stop()self.timers.slide_timer=__haxe_ds_Option.None end;self.generator=_G.coroutine.wrap((function()local al;if aP=="in"then al=H(self,self.slideIn)else al=H(self,self.slideOut)end;return al end)())local aQ=__awful_Timer.new(q({__fields__={timeout=true,callback=true,autostart=true,single_shot=true},timeout=__app_TaglistAnimation.slideConf.step_time,callback=function(b)local aR=a2.generator;local aS=a2.timers.slide_timer;local aT;local aU=aS[1]if aU==0 then aT=aS[2]elseif aU==1 then _G.error("None in OptionTools.sure() call",0)end;aR(aT)end,autostart=true,single_shot=false}))self.timers.slide_timer=__haxe_ds_Option.Some(aQ)end;__app_Timers.new=function()local self=s()__app_Timers.super(self)return self end;__app_Timers.super=function(self)self.slide_timer=__haxe_ds_Option.None end;__haxe_EntryPoint.new={}__haxe_EntryPoint.processEvents=function()while true do local a8=__haxe_EntryPoint.pending:shift()if a8==nil then break end;a8()end;local aV=__haxe_MainLoop.tick()if not __haxe_MainLoop.hasEvents()and __haxe_EntryPoint.threadCount==0 then do return-1 end end;do return aV end end;__haxe_EntryPoint.run=function()while not(__haxe_EntryPoint.processEvents()<0)do end end;__haxe_MainEvent.new=function(a8,ar)local self=s()__haxe_MainEvent.super(self,a8,ar)return self end;__haxe_MainEvent.super=function(self,a8,ar)self.isBlocking=true;self.f=K(a8)self.priority=ar;self.nextRun=-_G.math.huge end;__haxe_MainLoop.new={}__haxe_MainLoop.hasEvents=function()local ar=__haxe_MainLoop.pending;while ar~=nil do if ar.isBlocking then do return true end end;ar=ar.next end;do return false end end;__haxe_MainLoop.sortEvents=function()local aW=__haxe_MainLoop.pending;if aW==nil then do return end end;local aX=1;local aY;local aZ=0;local a_=0;local ar;local b0;local b1;local b2;while true do ar=aW;aW=nil;b2=nil;aY=0;while ar~=nil do aY=aY+1;b0=ar;aZ=0;local V=0;local W=aX;while V<W do V=V+1;aZ=aZ+1;b0=b0.next;if b0==nil then break end end;a_=aX;while aZ>0 or a_>0 and b0~=nil do if aZ==0 then b1=b0;b0=b0.next;a_=a_-1 else if a_==0 or b0==nil or(ar.priority>b0.priority or ar.priority==b0.priority and ar.nextRun<=b0.nextRun)then b1=ar;ar=ar.next;aZ=aZ-1 else b1=b0;b0=b0.next;a_=a_-1 end end;if b2~=nil then b2.next=b1 else aW=b1 end;b1.prev=b2;b2=b1 end;ar=b0 end;b2.next=nil;if aY<=1 then break end;aX=aX*2 end;aW.prev=nil;__haxe_MainLoop.pending=aW end;__haxe_MainLoop.tick=function()__haxe_MainLoop.sortEvents()local b1=__haxe_MainLoop.pending;local b3=G.time()local b4=1e9;while b1~=nil do local b5=b1.next;local b6=b1.nextRun-b3;if b6<=0 then b4=0;if b1.f~=nil then b1:f()end else if b4>b6 then b4=b6 end end;b1=b5 end;do return b4 end end;__haxe_ds_Option.Some=function(d)local b7=f({[0]="Some",0,d,__enum__=__haxe_ds_Option},3)return b7 end;__haxe_ds_Option.None=f({[0]="None",1,__enum__=__haxe_ds_Option},2)__haxe_io_Bytes.new=function(h,af)local self=s(__haxe_io_Bytes.prototype)__haxe_io_Bytes.super(self,h,af)return self end;__haxe_io_Bytes.super=function(self,h,af)self.length=h;self.b=af end;__haxe_io_Bytes.ofString=function(aj,b8)local V=f({},0)local W=0;local X=_G.string.len(aj)while W<X do W=W+1;V:push(_G.string.byte(aj,W-1+1))end;do return __haxe_io_Bytes.new(V.length,V)end end;__haxe_io_Bytes.prototype=k()__haxe_io_Bytes.prototype.getString=function(self,a6,e,b8)local a5=b8==nil;if a6<0 or e<0 or a6+e>self.length then _G.error(__haxe_io_Error.OutsideBounds,0)end;if self.b.length-a6<=__lua_Boot.MAXSTACKSIZE then local a7=C.min(self.b.length,a6+e)-1;do return _G.string.char(Q.unpack(self.b,a6,a7))end else local a1={}local V=a6;local W=a6+e;while V<W do V=V+1;local at=V-1;_G.table.insert(a1,_G.string.char(self.b[at]))end;do return _G.table.concat(a1,"")end end end;__haxe_io_Encoding.UTF8=f({[0]="UTF8",0,__enum__=__haxe_io_Encoding},2)__haxe_io_Encoding.RawNative=f({[0]="RawNative",1,__enum__=__haxe_io_Encoding},2)__haxe_io_Error.Blocked=f({[0]="Blocked",0,__enum__=__haxe_io_Error},2)__haxe_io_Error.Overflow=f({[0]="Overflow",1,__enum__=__haxe_io_Error},2)__haxe_io_Error.OutsideBounds=f({[0]="OutsideBounds",2,__enum__=__haxe_io_Error},2)__haxe_io_Error.Custom=function(b1)local b7=f({[0]="Custom",3,b1,__enum__=__haxe_io_Error},3)return b7 end;__haxe_io_Output.new={}__haxe_io_Output.prototype=k()__haxe_io_Output.prototype.writeByte=function(self,b9)_G.error("Not implemented",0)end;__haxe_io_Output.prototype.writeBytes=function(self,aj,a6,e)if a6<0 or e<0 or a6+e>aj.length then _G.error(__haxe_io_Error.OutsideBounds,0)end;local af=aj.b;local c=e;while c>0 do self:writeByte(af[a6])a6=a6+1;c=c-1 end;do return e end end;__haxe_io_Output.prototype.writeFullBytes=function(self,aj,a6,e)while e>0 do local c=self:writeBytes(aj,a6,e)a6=a6+c;e=e-c end end;__haxe_io_Output.prototype.writeString=function(self,aj,b8)local af=__haxe_io_Bytes.ofString(aj,b8)self:writeFullBytes(af,0,af.length)end;__lua_Boot.new={}__lua_Boot.isArray=function(ag)if _G.type(ag)=="table"then if ag.__enum__==nil and _G.getmetatable(ag)~=nil then do return _G.getmetatable(ag).__index==B.prototype end else do return false end end else do return false end end end;__lua_Boot.printEnum=function(ag,aj)if ag.length==2 then do return ag[0]end else local an=F.string(F.string(ag[0]))..F.string("(")aj=F.string(aj)..F.string("\t")local V=2;local W=ag.length;while V<W do V=V+1;local Y=V-1;if Y~=2 then an=F.string(an)..F.string(F.string(",")..F.string(__lua_Boot.__string_rec(ag[Y],aj)))else an=F.string(an)..F.string(__lua_Boot.__string_rec(ag[Y],aj))end end;do return F.string(an)..F.string(")")end end end;__lua_Boot.printClassRec=function(b9,ba,aj)if ba==nil then ba=""end;local a8=__lua_Boot.__string_rec;for c,d in pairs(b9)do if ba~=''then ba=ba..', 'end;ba=ba..c..':'..a8(d,aj..'	')end;do return ba end end;__lua_Boot.__string_rec=function(ag,aj)if aj==nil then aj=""end;if __lua_lib_luautf8_Utf8.len(aj)>=5 then do return"<...>"end end;local V=type(ag)if V=="boolean"then do return tostring(ag)end elseif V=="function"then do return"<function>"end elseif V=="nil"then do return"null"end elseif V=="number"then if ag==_G.math.huge then do return"Infinity"end else if ag==-_G.math.huge then do return"-Infinity"end else if ag==0 then do return"0"end else if ag~=ag then do return"NaN"end else do return tostring(ag)end end end end end elseif V=="string"then do return ag end elseif V=="table"then if ag.__enum__~=nil then do return __lua_Boot.printEnum(ag,aj)end else if _hx_wrap_if_string_field(ag,'toString')~=nil and not __lua_Boot.isArray(ag)then do return _hx_wrap_if_string_field(ag,'toString')(ag)end else if __lua_Boot.isArray(ag)then local bb=ag;if __lua_lib_luautf8_Utf8.len(aj)>5 then do return"[...]"end else local W=f({},0)local ad=0;while ad<bb.length do local Y=bb[ad]ad=ad+1;W:push(__lua_Boot.__string_rec(Y,F.string(aj)..F.string(1)))end;do return F.string(F.string("[")..F.string(W:join(",")))..F.string("]")end end else if ag.__class__~=nil then do return F.string(F.string("{")..F.string(__lua_Boot.printClassRec(ag,"",F.string(aj)..F.string("\t"))))..F.string("}")end else local bc=__lua_Boot.fieldIterator(ag)local bd={}local be=true;_G.table.insert(bd,"{ ")local a8=bc;while a8:hasNext()do local ah=a8:next()if be then be=false else _G.table.insert(bd,", ")end;_G.table.insert(bd,F.string(F.string(F.string("")..F.string(F.string(ah)))..F.string(" : "))..F.string(__lua_Boot.__string_rec(ag[ah],F.string(aj)..F.string("\t"))))end;_G.table.insert(bd," }")do return _G.table.concat(bd,"")end end end end end elseif V=="thread"then do return"<thread>"end elseif V=="userdata"then local bf=_G.getmetatable(ag)if bf~=nil and bf.__tostring~=nil then do return _G.tostring(ag)end else do return"<userdata>"end end else _G.error("Unknown Lua type",0)end end;__lua_Boot.fieldIterator=function(ag)if _G.type(ag)~="table"then do return q({__fields__={next=true,hasNext=true},next=function(self)do return nil end end,hasNext=function(self)do return false end end})end end;local a1=(function()local al;if ag.__fields__~=nil then al=ag.__fields__ else al=ag end;return al end)()local o=_G.pairs(a1)local bg=function(bh,bi)while __lua_Boot.hiddenFields[bi]~=nil do bi=o(bh,bi)end;do return bi end end;local bj=bg(a1,o(a1,nil))do return q({__fields__={next=true,hasNext=true},next=function(self)local m=bj;bj=bg(a1,o(a1,bj))do return m end end,hasNext=function(self)do return bj~=nil end end})end end;__lua_Thread.new={}__lua_UserData.new={}__sys_io_File.new={}__sys_io_File.append=function(bk,bl)if bl==nil then bl=true end;do return __sys_io_FileOutput.new(_G.io.open(bk,"a"))end end;__sys_io_FileOutput.new=function(a8)local self=s(__sys_io_FileOutput.prototype)__sys_io_FileOutput.super(self,a8)return self end;__sys_io_FileOutput.super=function(self,a8)if a8==nil then _G.error(F.string("Invalid filehandle : ")..F.string(F.string(a8)),0)end;self.f=a8 end;__sys_io_FileOutput.prototype=k()__sys_io_FileOutput.prototype.writeByte=function(self,b9)self.f:write(__lua_lib_luautf8_Utf8.char(b9))end;__sys_io_FileOutput.prototype.writeBytes=function(self,aj,a6,e)self.f:write(aj:getString(a6,e))do return aj.length end end;__sys_io_FileOutput.prototype.close=function(self)self.f:close()end;__sys_io_FileOutput.__super__=__haxe_io_Output;setmetatable(__sys_io_FileOutput.prototype,{__index=__haxe_io_Output.prototype})__utils_Utils.new={}__utils_Utils.ident=function(a4)do return a4 end end;__utils_Utils.filterIn=function(aj,b)local bm=(function()local al;if b==nil then al=__utils_Utils.ident else al=b end;return al end)()do return function(a4)__utils_FileLogger.log(_G.type(a4))__utils_FileLogger.log(bm(a4))local a5=bm(a4)do return aj:indexOf(a5)~=-1 end end end end;__utils_Utils.mkLua=function()do return{}end end;__utils_Utils.structToTable=function(aj)local r=__utils_Utils.mkLua()local V=0;local W=D.fields(aj)while V<W.length do local Y=W[V]V=V+1;r[Y]=aj[Y]end;do return r end end;__utils_FileLogger.new={}__utils_FileLogger.log=function(r)local bn=__sys_io_File.append(__utils_FileLogger.path)bn:writeString(F.string(__lib_Inspect.inspect(r))..F.string("\n\n"))bn:close()end;P=function(d)if d<=2147483647 and d>=-2147483648 then if d>0 then return _G.math.floor(d)else return _G.math.ceil(d)end end;if d>2251798999999999 then d=d*2 end;if d~=d or math.abs(d)==_G.math.huge then return nil end;return I.band(d,2147483647)-math.abs(I.band(d,2147483648))end;pcall(require,'bit')if bit then I=bit else local R=_G.require('bit32')I=setmetatable({},{__index=R})I.bnot=function(...)return P(R.bnot(...))end;I.bxor=function(...)return P(R.bxor(...))end end;a.__index=B.prototype;local bo=function()__app_Taglist.wibox_config=q({__fields__={ontop=true,opacity=true,x=true,y=true,height=true,width=true},ontop=true,opacity=0.7,x=1820,y=440,height=115,width=95})__app_TaglistAnimation.slideConf=q({__fields__={init=true,last=true,step_time=true},init=1820,last=1895,step_time=0.05})__haxe_EntryPoint.pending=B.new()__haxe_EntryPoint.threadCount=0;__lua_Boot.MAXSTACKSIZE=1000;__lua_Boot.hiddenFields={__id__=true,hx__closures=true,super=true,prototype=true,__fields__=true,__ifields__=true,__class__=true,__properties__=true}__utils_FileLogger.path="/home/cji/portless/lua/awesome-config/haxeshigh/logs/std.log"end;H=function(ag,bp)if bp==nil then return nil end;local a8;if ag._hx__closures==nil then _G.rawset(ag,'_hx__closures',{})else a8=ag._hx__closures[bp]end;if a8==nil then a8=function(...)return bp(ag,...)end;ag._hx__closures[bp]=a8 end;return a8 end;K=function(a8)if type(a8)=='function'then return function(self,...)return a8(...)end else return a8 end end;Q={}Q.pack=_G.table.pack or function(...)return{...}end;Q.unpack=_G.table.unpack or _G.unpack;Q.maxn=_G.table.maxn or function(b)local bq=0;for Y in pairs(b)do bq=type(Y)=='number'and Y>bq and Y or bq end;return bq end;_hx_wrap_if_string_field=function(ag,br)if _G.type(ag)=='string'then if br=='length'then return _G.string.len(ag)else return E.prototype[br]end else return ag[br]end end;bo()return _hx_exports
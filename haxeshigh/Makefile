
all: haxe minify

haxe:
	haxe main.hxml

minify:
	node_modules/luamin/bin/luamin -f build/loader.lua >build/loader_min.lua
	node_modules/luamin/bin/luamin -f build/app.lua >build/app_min.lua

run: all
	(cat build/loader.lua | awesome-client)

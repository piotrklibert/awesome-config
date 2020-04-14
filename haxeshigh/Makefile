
.PHONY: all
all: build minify


.PHONY: build
build: build/app.lua build/cleaner.lua build/loader.lua

build/cleaner.lua: src/Cleaner.hx src/utils/*.hx src/utils/lua/*.hx
	haxe cleaner.hxml

build/loader.lua: src/Loader.hx src/utils/*.hx src/utils/lua/*.hx
	haxe loader.hxml

build/app.lua: src/*/*.hx src/utils/*.hx src/utils/lua/*.hx
	haxe main.hxml

.PHONY: minify
minify:
#   TODO: split to separate rules or use wildcard %
#	node_modules/luamin/bin/luamin -f build/loader.lua >build/loader_min.lua
#	node_modules/luamin/bin/luamin -f build/cleaner.lua >build/cleaner_min.lua
#	node_modules/luamin/bin/luamin -f build/app.lua >build/app_min.lua

.PHONY: clean
clean: build
	(cat build/cleaner.lua | awesome-client)

.PHONY: load
load: build
	(cat build/loader.lua | awesome-client)

.PHONY: checkstyle
checkstyle:
	haxelib run checkstyle --nostyle \
		-s src/app -s src/utils \
		-c checkstyle.json

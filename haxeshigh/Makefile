.PHONY: build
build: output/hx_init.lua \
	output/loader.lua \
	output/hx_pkg.lua \
	output/hx_taglist.lua \
	output/hx_brightness.lua \
	output/hx_battery.lua \
	output/cleaner.lua

.PHONY: rebuild
rebuild:
	touch build/*
	make build


common = src/log/*.hx src/utils/*.hx src/utils/lua/*.hx src/awful/*.hx src/awful/*/*.hx src/awful/*/*/*.hx


output/cleaner.lua: src/Cleaner.hx build/cleaner.hxml $(common)
	./bin/build cleaner

output/loader.lua: src/Loader.hx build/loader.hxml $(common)
	./bin/build loader

output/hx_taglist.lua: src/taglist/*.hx build/taglist.hxml $(common)
	./bin/build taglist

output/hx_brightness.lua: src/brightness/*.hx build/brightness.hxml $(common)
	./bin/build brightness

output/hx_pkg.lua: src/pkg/*.hx build/pkg.hxml $(common)
	./bin/build pkg

output/hx_init.lua: src/init/*.hx build/init.hxml $(common)
	./bin/build init

output/hx_volume.lua: src/volume/*.hx build/volume.hxml $(common)
	./bin/build volume

output/hx_battery.lua: src/battery/*.hx build/battery.hxml $(common)
	./bin/build battery


.PHONY: test
test:
	./bin/build test


.PHONY: pkg
pkg: output/hx_pkg.lua
	awesome-client "dofile('`pwd`/output/hx_pkg.lua')"

.PHONY: init
init: output/hx_init.lua
	awesome-client "dofile('`pwd`/output/hx_init.lua')"

.PHONY: volume
volume: output/hx_volume.lua
	awesome-client "dofile('`pwd`/output/hx_volume.lua')"


.PHONY: battery
battery: output/hx_battery.lua
	awesome-client "dofile('`pwd`/output/hx_battery.lua')"

.PHONY: clean
clean: build
	awesome-client "dofile('`pwd`/output/cleaner.lua')"

.PHONY: load
load: build
	awesome-client "dofile('`pwd`/output/loader.lua')"


.PHONY: checkstyle
checkstyle:
	haxelib run checkstyle --nostyle \
		-s src/app -s src/utils \
		-c checkstyle.json



# .PHONY: minify
# minify:
#   TODO: split to separate rules or use wildcard %
#	node_modules/luamin/bin/luamin -f build/loader.lua >build/loader_min.lua
#	node_modules/luamin/bin/luamin -f build/cleaner.lua >build/cleaner_min.lua
#	node_modules/luamin/bin/luamin -f build/hx_taglist.lua >build/app_min.lua

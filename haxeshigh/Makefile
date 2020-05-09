.PHONY: build
build: output/hx_init.lua \
	output/loader.lua \
	output/hx_pkg.lua \
	output/hx_taglist.lua \
	output/hx_brightness.lua \
	output/cleaner.lua


output/cleaner.lua: src/log/*.hx src/Cleaner.hx src/utils/*.hx src/utils/lua/*.hx build/cleaner.hxml
	./bin/build cleaner

output/loader.lua: src/log/*.hx src/Loader.hx src/utils/*.hx src/utils/lua/*.hx build/loader.hxml
	./bin/build loader

output/hx_taglist.lua: src/log/*.hx src/taglist/*.hx src/utils/*.hx src/utils/lua/*.hx build/taglist.hxml
	./bin/build taglist

output/hx_brightness.lua: src/log/*.hx src/brightness/*.hx src/utils/*.hx src/utils/lua/*.hx build/brightness.hxml
	./bin/build brightness

output/hx_pkg.lua: src/log/*.hx src/pkg/*.hx src/utils/*.hx src/utils/lua/*.hx build/pkg.hxml
	./bin/build pkg

output/hx_init.lua: src/log/*.hx src/init/*.hx src/utils/*.hx src/utils/lua/*.hx build/init.hxml
	./bin/build init




.PHONY: pkg
pkg: output/hx_pkg.lua
	(cat output/hx_pkg.lua | awesome-client)

.PHONY: init
init: output/hx_init.lua
	(cat output/hx_init.lua | awesome-client)


.PHONY: clean
clean: build
	(cat output/cleaner.lua | awesome-client)


.PHONY: load
load: build
	(cat output/loader.lua | awesome-client)


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

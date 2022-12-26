#! /usr/bin/env bash

set -e

export MOD=$1
echo $MOD
make output/hx_$MOD.lua && (
    cp output/hx_${MOD}_clean.lua output/hx_${MOD}_clean_2.lua || true
    ./node_modules/lua-fmt/dist/bin/luafmt.js output/hx_${MOD}.lua >t;
    mv -f t output/hx_${MOD}_clean.lua
    # diff --color output/hx_${MOD}_clean_2.lua output/hx_${MOD}_clean.lua
)

.SILENT:

install_dependencies:
	luarocks install simple_test

test:
	LUA_PATH="./src/?.lua;./src/?/init.lua;./src/Set/?.lua;;" lua test.lua

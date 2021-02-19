mtbench = {
	-- name -> fn
	benchmarks = {}
}

local MP = minetest.get_modpath("mtbench")
dofile(MP .. "/api.lua")
dofile(MP .. "/is_protected.lua")
dofile(MP .. "/vmanip.lua")
dofile(MP .. "/check_player_privs.lua")
dofile(MP .. "/get_auth_handler.lua")
dofile(MP .. "/node_operations.lua")
dofile(MP .. "/load_area.lua")

local function benchmark()
	print("[mtbench] starting benchmarks")

	for name, fn in pairs(mtbench.benchmarks) do
		local bench_time = 1
		local start = os.time()
		local stop = start + bench_time

		local function executeCondition()
			return os.time() < stop
		end

		local result = fn(executeCondition)

		print("[mtbench][" .. name .. "] " .. result .. " iterations in " .. bench_time .. " seconds")
	end
	print("[mtbench] benchmarks completed!")
	minetest.request_shutdown("benchmarks completed", false, 0)
end

minetest.register_on_mods_loaded(function()
	-- vmanip isn't available yet, wait a globalstep
	minetest.after(0, benchmark)
end)

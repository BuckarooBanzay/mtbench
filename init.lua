mtbench = {
	-- name -> fn
	benchmarks = {}
}

local MP = minetest.get_modpath("mtbench")
dofile(MP .. "/api.lua")
dofile(MP .. "/handle_async.lua")
dofile(MP .. "/itemstack.lua")
dofile(MP .. "/is_protected.lua")
dofile(MP .. "/vmanip.lua")
dofile(MP .. "/check_player_privs.lua")
dofile(MP .. "/get_auth_handler.lua")
dofile(MP .. "/node_operations.lua")
dofile(MP .. "/load_area.lua")

local function createExecutionCondition(seconds)
	local start = os.time()
	local stop = start + seconds

	return function()
		return os.time() < stop
	end
end

local function benchmark()
	print("[mtbench] starting benchmarks")

	for name, fn in pairs(mtbench.benchmarks) do
		local bench_time = 1
		local iterations = 5
		local min, max
		local avg = 0
		for _=1,iterations do
			local executeCondition = createExecutionCondition(bench_time)
			local result = fn(executeCondition)
			if not min or result < min then
				min = result
			end
			if not max or result > max then
				max = result
			end
			avg = avg + (result / iterations)
		end

		print("[mtbench][" .. name .. "] " ..
			" min/max/avg " .. min .. "/" .. max .. "/" .. avg ..
			" iterations in " .. bench_time .. " seconds")
	end
	print("[mtbench] benchmarks completed!")
	minetest.request_shutdown("benchmarks completed", false, 0)
end

minetest.register_on_mods_loaded(function()
	-- vmanip isn't available yet, wait a globalstep
	minetest.after(0, benchmark)
end)

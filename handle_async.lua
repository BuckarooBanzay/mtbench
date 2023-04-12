
local function async_fn(vm)
    local data = vm:get_data()
    assert(#data == 4096)
end

mtbench.register("handle_async", function(executeCondition)
    local count = 0
	while executeCondition() do
        local manip = minetest.get_voxel_manip()
        local pos1 = { x=0, y=0, z=0 }
        local pos2 = vector.add(pos1, 15)
        manip:read_from_map(pos1, pos2)

        local callback = function() end
        minetest.handle_async(async_fn, callback, manip)
        -- TODO: handle asnyc result

		count = count + 1
	end

	return count
end)
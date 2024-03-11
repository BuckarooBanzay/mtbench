
mtbench.register("handle_async with vmanip", function(executeCondition)
    local function async_fn(vm)
        local data = vm:get_data()
        assert(#data == 4096)
    end

    local manip = minetest.get_voxel_manip()
    local pos1 = { x=0, y=0, z=0 }
    local pos2 = vector.add(pos1, 15)
    manip:read_from_map(pos1, pos2)

    local count = 0
	while executeCondition() do
        local callback = function() end
        minetest.handle_async(async_fn, callback, manip)
		count = count + 1
	end

	return count
end)

for _, size in ipairs({100, 1000, 10000, 20000}) do
    mtbench.register("handle_async with string buffer " .. size .. " bytes", function(executeCondition)
        local function async_fn(data, s)
            assert(#data == s, "passed data is " .. #data .. " bytes, expected " .. s)
        end

        local items = {}
        for _ = 1,size do
            table.insert(items, string.char(math.random(255)))
        end
        local buf = table.concat(items)
        assert(#buf == size)
        local count = 0
        while executeCondition() do
            local callback = function() end
            minetest.handle_async(async_fn, callback, buf, size)
            count = count + 1
        end

        return count
    end)
end

mtbench.register("vmanip_read_unaligned", function(executeCondition)

	local count = 0
	while executeCondition() do
		local pos1 = {
			x = math.random(10000),
			y = math.random(10000),
			z = math.random(10000)
		}

		local pos2 = vector.add(pos1, 16)

		local manip = minetest.get_voxel_manip()
		manip:read_from_map(pos1, pos2)
		manip:get_data()

		count = count + 1
	end

	return count
end)

mtbench.register("vmanip_read_aligned", function(executeCondition)

	local count = 0
	while executeCondition() do
		local pos1 = {
			x = math.floor(math.random(30000) / 16),
			y = math.floor(math.random(30000) / 16),
			z = math.floor(math.random(30000) / 16)
		}

		local pos2 = vector.add(pos1, 16)

		local manip = minetest.get_voxel_manip()
		manip:read_from_map(pos1, pos2)
		manip:get_data()

		count = count + 1
	end

	return count
end)

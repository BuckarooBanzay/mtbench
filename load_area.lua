
mtbench.register("load_area", function(executeCondition)

	local count = 0
	while executeCondition() do
		local pos = {
			x = math.random(10000),
			y = math.random(10000),
			z = math.random(10000)
		}

		minetest.load_area(pos)
		count = count + 1
	end

	return count
end)

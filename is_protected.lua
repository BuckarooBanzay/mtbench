
mtbench.register("is_protected", function(executeCondition)

	local count = 0
	while executeCondition() do
		local pos = {
			x = math.random(10000),
			y = math.random(10000),
			z = math.random(10000)
		}

		local playername = "name_" .. math.random(10000)

		minetest.is_protected(pos, playername)
		count = count + 1
	end

	return count
end)

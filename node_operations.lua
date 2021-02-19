
mtbench.register("get_node", function(executeCondition)

	local count = 0
	while executeCondition() do
		local pos = {
			x = math.random(10000),
			y = math.random(10000),
			z = math.random(10000)
		}

		minetest.get_node(pos)
		count = count + 1
	end

	return count
end)


mtbench.register("get_node_or_nil", function(executeCondition)

	local count = 0
	while executeCondition() do
		local pos = {
			x = math.random(10000),
			y = math.random(10000),
			z = math.random(10000)
		}

		minetest.get_node_or_nil(pos)
		count = count + 1
	end

	return count
end)

mtbench.register("get_meta", function(executeCondition)

	local count = 0
	while executeCondition() do
		local pos = {
			x = math.random(10000),
			y = math.random(10000),
			z = math.random(10000)
		}

		minetest.get_meta(pos)
		count = count + 1
	end

	return count
end)

mtbench.register("get_node_timer", function(executeCondition)

	local count = 0
	while executeCondition() do
		local pos = {
			x = math.random(10000),
			y = math.random(10000),
			z = math.random(10000)
		}

		minetest.get_node_timer(pos)
		count = count + 1
	end

	return count
end)

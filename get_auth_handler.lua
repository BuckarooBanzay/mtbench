
mtbench.register("get_auth_handler", function(executeCondition)

	local count = 0
	while executeCondition() do
		assert(minetest.get_auth_handler())
		count = count + 1
	end

	return count
end)

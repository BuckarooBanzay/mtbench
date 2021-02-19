
mtbench.register("check_player_privs", function(executeCondition)

	local count = 0
	while executeCondition() do
		local playername = "name_" .. math.random(10000)
		local priv = "priv_" .. math.random(10000)

		minetest.check_player_privs(playername, priv)
		count = count + 1
	end

	return count
end)

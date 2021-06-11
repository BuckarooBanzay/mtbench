
mtbench.register("itemstack", function(executeCondition)

	local count = 0
	while executeCondition() do
		ItemStack()
		count = count + 1
	end

	return count
end)

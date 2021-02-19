
Simple benchmarking mod for minetest

# Overview

Benchmarks for:
* `minetest.check_player_privs`
* `minetest.get_auth_handler`
* `minetest.is_protected`
* `minetest.load_area`
* `minetest.get_voxel_manip`
* `minetest.get_node`
* `minetest.get_node_or_nil`
* `minetest.get_node_timer`
* `minetest.get_meta`


Prints the result on the console and shuts the server down afterwards:

```
[mtbench] starting benchmarks
[mtbench][get_meta] 357244 iterations in 1 seconds
[mtbench][load_area] 58314 iterations in 1 seconds
[mtbench][check_player_privs] 102268 iterations in 1 seconds
[mtbench][vmanip_read_aligned] 1413 iterations in 1 seconds
[mtbench][vmanip_read_unaligned] 2053 iterations in 1 seconds
[mtbench][get_node_timer] 470937 iterations in 1 seconds
[mtbench][get_node_or_nil] 404147 iterations in 1 seconds
[mtbench][get_auth_handler] 5147658 iterations in 1 seconds
[mtbench][is_protected] 411708 iterations in 1 seconds
[mtbench][get_node] 326029 iterations in 1 seconds
[mtbench] benchmarks completed!
```

# License

MIT

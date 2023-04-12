
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
* `minetest.handle_async`


Prints the result on the console and shuts the server down afterwards:

```
[mtbench] starting benchmarks
[mtbench][get_meta]  min/max/avg 417752/444433/425825 iterations in 1 seconds
[mtbench][load_area]  min/max/avg 17162/48216/39623 iterations in 1 seconds
[mtbench][check_player_privs]  min/max/avg 95636/109644/103710.6 iterations in 1 seconds
[mtbench][vmanip_read_aligned]  min/max/avg 947/1301/1174.6 iterations in 1 seconds
[mtbench][vmanip_read_unaligned]  min/max/avg 1843/1961/1912.6 iterations in 1 seconds
[mtbench][get_node_timer]  min/max/avg 341679/431836/366200.8 iterations in 1 seconds
[mtbench][get_node_or_nil]  min/max/avg 304849/327796/319762.2 iterations in 1 seconds
[mtbench][get_auth_handler]  min/max/avg 5226374/5328942/5292459.8 iterations in 1 seconds
[mtbench][is_protected]  min/max/avg 324779/362279/340922.6 iterations in 1 seconds
[mtbench][get_node]  min/max/avg 222810/237190/226423.4 iterations in 1 seconds
[mtbench][handle_async]  min/max/avg 42533/47539/45012.2 iterations in 1 seconds
[mtbench] benchmarks completed!
```

# License

MIT

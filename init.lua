minetest.register_privilege("liquid", "Can place liquid source nodes.")

minetest.override_item("default:lava_source", {
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		if not minetest.check_player_privs(placer:get_player_name(),
				{liquid = true}) then
			minetest.remove_node(pos)
		end
	end,
})

minetest.override_item("default:water_source", {
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		if not minetest.check_player_privs(placer:get_player_name(),
				{liquid = true}) then
			minetest.remove_node(pos)
		end
	end,
})

minetest.override_item("default:river_water_source", {
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		if not minetest.check_player_privs(placer:get_player_name(),
				{liquid = true}) then
			minetest.remove_node(pos)
		end
	end,
})

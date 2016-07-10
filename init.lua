minetest.register_privilege("liquid", "Can place liquid source nodes.")
minetest.register_privilege("lava", "Can use liquid igniters.")

local old_lava_bucket_place = minetest.registered_items["bucket:bucket_lava"].on_place

minetest.override_item("bucket:bucket_lava", {
	on_place = function(itemstack, placer, pointed_thing)
		if not minetest.check_player_privs(placer:get_player_name(),
				{lava = true}) then
			return itemstack
		else
			return old_lava_bucket_place(itemstack, placer, pointed_thing)
		end
	end,
})

minetest.override_item("default:lava_source", {
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		if not minetest.check_player_privs(placer:get_player_name(),
				{liquid = true, lava = true}) then
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

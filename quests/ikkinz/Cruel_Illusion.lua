-- Ikkinz Group 1 Expedition
-- #Cruel_Illusion NPCID: 294136
function event_death_complete(e)
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	local charid_list = eq.get_characters_in_instance(instance_id);
	-- Lua loop basics:
	-- k = key which is generally the current index of the array, not used in this example
	-- v = value for the current key, in this example it would be the character ID
	for k,v in pairs(charid_list) do
		eq.target_global("lockout_ikky_g1", "1", "H17", 0,v, 0);
	end
end
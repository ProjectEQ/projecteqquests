-- NPCID: 289038 an_aneuk_fleshweaver
function event_death_complete(e)
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- set the global that I have been killed
	eq.set_global(instance_id.."_tipt_status","8",7,"H6");
end
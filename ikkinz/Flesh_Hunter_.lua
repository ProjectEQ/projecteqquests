function event_death_complete(e)
	eq.signal(294142,1)
	local instance_requests = require("instance_requests")
	local instance_id = eq.get_zone_instance_id();
	local charid_list = eq.get_characters_in_instance(instance_id);
	
	for k,v in pairs(charid_list) do
		eq.target_global("lockout_ikky_g3", tostring(instance_requests.GetLockoutEndTimeForHours(24)), "H24", 0,v, 0);
	end
end
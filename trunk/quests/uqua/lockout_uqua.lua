local instance_id;
local charid_list;

function event_spawn(e)
	-- get the zone instance id
	instance_id = eq.get_zone_instance_id();
	charid_list = eq.get_characters_in_instance(instance_id);
end

function event_signal(e)
	if (e.signal == 1) then
		--Twins dead
		for k,v in pairs(charid_list) do
			eq.target_global("uqualockout", "1", "H24", 0,v, 0);
		end
	end
end
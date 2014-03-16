-- Temp use for setting lockout
-- lockout_inktuta NPCID: 296076

local instance_id;
local charid_list;

function event_spawn(e)
	-- get the zone instance id
	instance_id = eq.get_zone_instance_id();
	charid_list = eq.get_characters_in_instance(instance_id);
	eq.signal(296070, instance_id);
	
end

function event_signal(e)
	if (e.signal == 1) then
		--Kelekdrix dead
		for k,v in pairs(charid_list) do
			eq.target_global("lockout_inktuta", "1", "H16", 0,v, 0);
		end
	elseif (e.signal == 2) then
		--Stonemites done
		for k,v in pairs(charid_list) do
			eq.target_global("lockout_inktuta", "1", "H24", 0,v, 0);
		end
	elseif (e.signal == 3) then
		--Cursecallers done
		for k,v in pairs(charid_list) do
			eq.target_global("lockout_inktuta", "1", "H36", 0,v, 0);
		end
	elseif (e.signal == 4) then
		--Noqufiel dead
		for k,v in pairs(charid_list) do
			eq.target_global("lockout_inktuta", "1", "H108", 0,v, 0);
		end
	elseif (e.signal == 5) then
		--zone status needs instid
		eq.signal(296070, instance_id);
	end
end
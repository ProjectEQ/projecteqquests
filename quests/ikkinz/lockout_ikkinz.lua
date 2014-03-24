-- Temp use for setting lockout
-- lockout_ikkinz NPCID: 294631

local instance_id;
local charid_list;

function event_spawn(e)
	-- get the zone instance id
	instance_id = eq.get_zone_instance_id();
	charid_list = eq.get_characters_in_instance(instance_id);
end

function event_signal(e)
	if (e.signal == 1) then
		--Guardian of Righteousness dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout3", "1", "H33", 0,v, 0);
		end
	elseif (e.signal == 2) then
		--Crumbling monolith dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout3", "1", "H41", 0,v, 0);
		end
	elseif (e.signal == 3) then
		--Spirit of Tunik Tamuk dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout3", "1", "H67", 0,v, 0);
		end
	elseif (e.signal == 4) then
		--Guardian of Glorification dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout4", "1", "H67", 0,v, 0);
		end
	elseif (e.signal == 5) then
		--Guardian of Transcendence dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout5", "1", "H33", 0,v, 0);
		end
	elseif (e.signal == 6) then
		--Vrex Xalkak Nixki dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout5", "1", "H67", 0,v, 0);
		end
	elseif (e.signal == 7) then
		--Oracle of the Altar dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout6", "1", "H33", 0,v, 0);
		end
	elseif (e.signal == 8) then
		--Keeper of the Altar dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout6", "1", "H67", 0,v, 0);
		end
	end
end
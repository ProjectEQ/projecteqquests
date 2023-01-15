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
	local instance_requests = require("instance_requests")
	if (e.signal == 1) then
		--Guardian of Righteousness dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout3", tostring(instance_requests.GetLockoutEndTimeForHours(33)), "H33", 0,v, 0);
		end
	elseif (e.signal == 2) then
		--Crumbling monolith dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout3", tostring(instance_requests.GetLockoutEndTimeForHours(41)), "H41", 0,v, 0);
		end
	elseif (e.signal == 3) then
		--Spirit of Tunik Tamuk dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout3", tostring(instance_requests.GetLockoutEndTimeForHours(67)), "H67", 0,v, 0);
		end
	elseif (e.signal == 4) then
		--Guardian of Glorification dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout4", tostring(instance_requests.GetLockoutEndTimeForHours(67)), "H67", 0,v, 0);
		end
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(294584) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(294583) == false) then
			eq.zone_emote(0,"The Guardian of Glorification has been defeated! This massive stone golem is a testament to the ancient trusik geomancy powers and you have been powerful enough to defeat it. Congratulations on completing a difficult deed.");
			eq.ZoneMarquee(10,510,1,1,6000,"The Guardian of Glorification has been defeated! Congratulations!");
		end
	elseif (e.signal == 5) then
		--Guardian of Transcendence dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout5", tostring(instance_requests.GetLockoutEndTimeForHours(33)), "H33", 0,v, 0);
		end
	elseif (e.signal == 6) then
		--Vrex Xalkak Nixki dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout5", tostring(instance_requests.GetLockoutEndTimeForHours(67)), "H67", 0,v, 0);
		end
	elseif (e.signal == 7) then
		--Oracle of the Altar dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout6", tostring(instance_requests.GetLockoutEndTimeForHours(33)), "H33", 0,v, 0);
		end
	elseif (e.signal == 8) then
		--Keeper of the Altar dead
		for k,v in pairs(charid_list) do
			eq.target_global("ikkylockout6", tostring(instance_requests.GetLockoutEndTimeForHours(108)), "H108", 0,v, 0);
		end
	end
end
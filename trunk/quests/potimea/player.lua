function event_enter_zone(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.self);
	if ( qglobals.time_enter == nil and e.self:Admin() < 10 ) then
		eq.world_emote(15, "The earth rumbles, sky thunders, volcanoes erupt, and tidal waves crash as the Gods prepare their armies for battle. The first of the mortals have obtained the power to cross into the Plane of Time!");
		eq.set_global("time_enter","1",7,"F");
	end
end

function event_click_door(e)
	local door_id = e.door:GetDoorID();
	if (door_id >= 8 and door_id <=12) then
		-- determine if the player is in an instance already
		local instance_id = eq.get_instance_id("potimeb",0);
		-- load the current qglobals
		local qglobals = eq.get_qglobals(e.self);
		-- should never be nil, but just in case.
		if (instance_id == nil or instance_id == 0) then
			-- check for lockout qglobal. (potimeLockout is the old one and can be removed when potimeb rewrite is completed.)
			if (e.self:Admin() <= 80 and (qglobals.potimeb_lockout ~= nil or qglobals.potimeLockout ~= nil)) then
				e.self:Message(13, "You are not ready yet to start a new instance");
				return;
			end
			-- the instance is only good for 12 hours (43200 seconds).
			instance_id = eq.create_instance("potimeb",0,43200);
			-- create a qglobal for status tracking
			eq.set_global(instance_id.."_potimeb_status","Phase1",7,"H13");
			-- check if the player is in a raid
			local raid = e.self:GetRaid();
			if (raid.valid) then
				eq.assign_raid_to_instance(instance_id);
			else
				-- not in a raid so check if in a group
				local group = e.self:GetGroup();
				if (group.valid) then
					eq.assign_group_to_instance(instance_id);
				else
					-- not in a group, just assign to the player
					eq.assign_to_instance(instance_id);
				end
			end
		end
		
		if (instance_id > 0) then
			e.self:Message(10, "The portal, dim at first, begins to glow brighter.");
			e.self:Message(10, "The portal flashes briefly, then glows steadily.");
			-- send them into their instance
			if (door_id == 8) then
				-- GetDoorID =  8 : Air Trial
				e.self:MovePCInstance(223, instance_id, -36, 1352, 496, 62);
			elseif (door_id == 9) then
				-- GetDoorID =  9 : Water Trial
				e.self:MovePCInstance(223, instance_id, -51, 857, 496, 62);
			elseif (door_id == 10) then
				-- GetDoorID = 10 : Earth Trial
				e.self:MovePCInstance(223, instance_id, -35, 1636, 496, 62);
			elseif (door_id == 11) then
				-- GetDoorID = 11 : Fire Trial
				e.self:MovePCInstance(223, instance_id, -55, 569, 496, 62);
			elseif (door_id == 12) then
				-- GetDoorID = 12 : Undead Trial
				e.self:MovePCInstance(223, instance_id, -27, 1103, 496, 62);
			end
		end
	end
end

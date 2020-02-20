

function event_enter_zone(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.self);
	if ( qglobals["time_emote"] == nil and e.self:Admin() < 10 ) then
		eq.world_emote(15, "The earth rumbles, sky thunders, volcanoes erupt, and tidal waves crash as the Gods prepare their armies for battle. The first of the mortals have obtained the power to cross into the Plane of Time!");
		eq.set_global("time_emote","TimeEntered",7,"F");
	end
end

function event_click_door(e)
	local door_id = e.door:GetDoorID();
	local player_list = nil;
	local player_list_count = nil;
	local raid = e.self:GetRaid();
	local HasLockout = 0;
	local NotLocked = 0;
	-- make sure the player_list is clear
	player_list = nil;
	player_list_count = nil;
	if ((door_id >= 8 and door_id <=12) and (raid.valid or e.self:Admin() > 80)) then
		-- determine if the player is in an instance already
		local instance_id = eq.get_instance_id("potimeb",0);
		-- should never be nil, but just in case.
		if (instance_id == nil or instance_id == 0) then
			-- check for lockout qglobal on whole raid.
			player_list = raid;
			player_list_count = raid:RaidCount();
			if (player_list ~= nil) then
				-- cycle through raid and check lockouts
				for i = 0, player_list_count - 1, 1 do
					local mob_v = player_list:GetMember(i);
					if (mob_v.valid and mob_v:IsClient()) then
						local client_v = mob_v:CastToClient();
						if (client_v.valid) then
							qglobals = eq.get_qglobals(client_v);
							if (e.self:Admin() <= 80 and qglobals["potimeb_lockout"] ~= nil) then
								e.self:Message(13, client_v:GetCleanName().." has a lockout");
								HasLockout = HasLockout + 1;
							end
						end
					end
				end
			end
			--Anyone in raid had a lockout
			if (HasLockout > 0) then
				e.self:Message(13, "There are "..HasLockout.." players in your raid with a lockout");
				--keeping notes for a while
				eq.set_global("TimeHack_Lock",""..HasLockout,5,"D5");
				NotLocked = player_list_count - HasLockout;
				eq.set_global("TimeHack_NotLock",""..NotLocked,5,"D5");
				return;
			end
			--No lockouts, create instance
			-- the instance is only good for 13 hours (46800 seconds).
			instance_id = eq.create_instance("potimeb",0,46800);
			-- create a qglobal for status tracking
			eq.set_global(instance_id.."_potimeb_status","Phase1",7,"H13");
			if (raid.valid) then
				eq.assign_raid_to_instance(instance_id);
			end
		end
		
		--Player is part of an instance
		if (instance_id > 0) then
			local phase = eq.get_qglobals()[instance_id .. '_potimeb_status'];

			e.self:Message(10, "The portal, dim at first, begins to glow brighter.");
			e.self:Message(10, "The portal flashes briefly, then glows steadily.");
			-- Send them to their instance
			-- If past Phase 3, move them to their current phase
			if ( phase == "Phase6" ) then
				e.self:MovePCInstance(223, instance_id, 337, 1, 8, 128); -- Zone: mischiefplane
			elseif ( phase == "Phase5" ) then
				e.self:MovePCInstance(223, instance_id, -358, 0, 4, 128); -- Zone: mischiefplane
			elseif ( phase == "Phase4" ) then
				e.self:MovePCInstance(223, instance_id, -382, -11, 349, 124); -- Zone: mischiefplane
			elseif ( phase == "Phase3" ) then
				e.self:MovePCInstance(223, instance_id, 681, 1113, 496, 112); -- Zone: mischiefplane
			-- Not past phase 3, spawn in individual trials
			else
				if (door_id == 8) then
					-- GetDoorID =  8 : Air Trial
					e.self:MovePCInstance(223, instance_id, -36, 1352, 496, 124); -- Zone: mischiefplane
				elseif (door_id == 9) then
					-- GetDoorID =  9 : Water Trial
					e.self:MovePCInstance(223, instance_id, -51, 857, 496, 124); -- Zone: mischiefplane
				elseif (door_id == 10) then
					-- GetDoorID = 10 : Earth Trial
					e.self:MovePCInstance(223, instance_id, -35, 1636, 496, 124); -- Zone: mischiefplane
				elseif (door_id == 11) then
					-- GetDoorID = 11 : Fire Trial
					e.self:MovePCInstance(223, instance_id, -55, 569, 496, 124); -- Zone: mischiefplane
				elseif (door_id == 12) then
					-- GetDoorID = 12 : Undead Trial
					e.self:MovePCInstance(223, instance_id, -27, 1103, 496, 124); -- Zone: mischiefplane
				end
			end
		end
	else
		e.self:Message(13, "You are not in a raid.");
	end
end

-- PoTimeA/B

local expedition_info = {
    expedition = { name="The Prison of the Forsaken", min_players=18, max_players=72 },
    instance   = { zone="potimeb", version=0, duration=43200 }, -- 12 Hours
    safereturn = { zone="potimea", x=-37, y=-110, z=6.08, h=0.0 },
    zonein     = { x=-9, y=-2466, z=-79, h=0 }
}

function event_click_door(e)
	local door_id = e.door:GetDoorID();
	if (door_id >= 8 and door_id <=12) then
		e.self:Message(MT.Yellow, "The portal, dim at first, begins to glow brighter.");

		local dz = e.self:GetExpedition()
		if dz.valid then -- In a valid expedition
			local instance_id = dz:GetInstanceID(); -- Assign DZ Instance to Variable

			if (instance_id == nil) then -- Found a DZ but did not find an instance
				e.self:Message(MT.Red, "Unable to find an instance but Expedition is valid, yell at a GM");
			end

			-- Expedition and instance are valid - Start the port query
			e.self:Message(MT.NPCQuestSay, "The portal flashes briefly, then glows steadily.");

			--handles porting player to specified area if raid is currently in Phase 3 or further
			if (dz:HasLockout('Phase 1 Complete') and dz:HasLockout('Phase 2 Complete') and not dz:HasLockout('Phase 3 Complete')) then
				e.self:MovePCInstance(223, tonumber(instance_id), 585,1110,496,127);
				return;
			elseif (dz:HasLockout('Phase 1 Complete') and dz:HasLockout('Phase 2 Complete') and dz:HasLockout('Phase 3 Complete') and not dz:HasLockout('Phase 4 Complete')) then
				e.self:MovePCInstance(223,tonumber(instance_id),-395,0,350,127);
				return;
			elseif (dz:HasLockout('Phase 1 Complete') and dz:HasLockout('Phase 2 Complete') and dz:HasLockout('Phase 3 Complete') and dz:HasLockout('Phase 4 Complete') and not dz:HasLockout('Phase 5 Complete')) then
				e.self:MovePCInstance(223,tonumber(instance_id),-410,0,5,127);
				return;
			elseif (dz:HasLockout('Phase 1 Complete') and dz:HasLockout('Phase 2 Complete') and dz:HasLockout('Phase 3 Complete') and dz:HasLockout('Phase 4 Complete') and dz:HasLockout('Phase 5 Complete') and not dz:HasLockout('Phase 6 Complete')) then
				e.self:MovePCInstance(223,tonumber(instance_id),330,0,5,127);
				return;
			end

			-- Phase 1/2
			if (door_id == 8) then
				-- GetDoorID =  8 : Air Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -36, 1352, 496, 124);
			elseif (door_id == 9) then
				-- GetDoorID =  9 : Water Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -51, 857, 496, 124);
			elseif (door_id == 10) then
				-- GetDoorID = 10 : Earth Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -35, 1636, 496, 124);
			elseif (door_id == 11) then
				-- GetDoorID = 11 : Fire Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -55, 569, 496, 124);
			elseif (door_id == 12) then
				-- GetDoorID = 12 : Undead Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -27, 1103, 496, 124);
			end
		else	-- If not in an expedition, create one
			dz = e.self:CreateExpedition(expedition_info);
			if dz.valid then
				if dz:GetInstanceID() == 0 then
					e.self:Message(MT.Red, "Instance failed to be created, yell at a GM");
				end
			end
		end
	end
end

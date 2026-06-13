-- PoTimeA/B

local EXPEDITION_NAME = "The Prison of the Forsaken"
local INSTANCE_ZONE = "potimeb"

local expedition_info = {
	expedition = { name = EXPEDITION_NAME, min_players = 18, max_players = 72 },
	instance   = { zone = INSTANCE_ZONE, version = 0, duration = eq.seconds("7d") },
	safereturn = { zone = "potimea", x = -37, y = -110, z = 6.08, h = 0.0 },
	zonein     = { x = -9, y = -2466, z = -79, h = 0 }
}

local trial_ports = {
	[8]  = { -36, 1352, 496, 124 },  -- Air
	[9]  = { -51, 857, 496, 124 },   -- Water
	[10] = { -35, 1636, 496, 124 },  -- Earth
	[11] = { -55, 569, 496, 124 },   -- Fire
	[12] = { -27, 1103, 496, 124 },  -- Undead
}

local function is_potime_expedition(dz)
	return dz.valid and dz:GetZoneName() == INSTANCE_ZONE
end

local function port_by_progress(e, dz, instance_id)
	if (dz:HasLockout('Phase 1 Complete') and dz:HasLockout('Phase 2 Complete') and not dz:HasLockout('Phase 3 Complete')) then
		e.self:MovePCInstance(223, tonumber(instance_id), 585, 1110, 496, 127)
		return true
	elseif (dz:HasLockout('Phase 1 Complete') and dz:HasLockout('Phase 2 Complete') and dz:HasLockout('Phase 3 Complete') and not dz:HasLockout('Phase 4 Complete')) then
		e.self:MovePCInstance(223, tonumber(instance_id), -395, 0, 350, 127)
		return true
	elseif (dz:HasLockout('Phase 1 Complete') and dz:HasLockout('Phase 2 Complete') and dz:HasLockout('Phase 3 Complete') and dz:HasLockout('Phase 4 Complete') and not dz:HasLockout('Phase 5 Complete')) then
		e.self:MovePCInstance(223, tonumber(instance_id), -410, 0, 5, 127)
		return true
	elseif (dz:HasLockout('Phase 1 Complete') and dz:HasLockout('Phase 2 Complete') and dz:HasLockout('Phase 3 Complete') and dz:HasLockout('Phase 4 Complete') and dz:HasLockout('Phase 5 Complete') and not dz:HasLockout('Phase 6 Complete')) then
		e.self:MovePCInstance(223, tonumber(instance_id), 330, 0, 5, 127)
		return true
	end
	return false
end

function event_click_door(e)
	local door_id = e.door:GetDoorID()
	if (door_id < 8 or door_id > 12) then
		return
	end

	e.self:Message(MT.Yellow, "The portal, dim at first, begins to glow brighter.")

	local dz = e.self:GetExpedition()
	if is_potime_expedition(dz) then
		local instance_id = dz:GetInstanceID()

		if (instance_id == nil or instance_id == 0) then
			e.self:Message(MT.Red, "Unable to find an instance but Expedition is valid, yell at a GM")
			return
		end

		e.self:Message(MT.NPCQuestSay, "The portal flashes briefly, then glows steadily.")

		if port_by_progress(e, dz, instance_id) then
			return
		end

		local trial = trial_ports[door_id]
		if trial ~= nil then
			e.self:MovePCInstance(223, tonumber(instance_id), trial[1], trial[2], trial[3], trial[4])
		end
	elseif dz.valid then
		e.self:Message(MT.Red, "You are in a different expedition and cannot use this portal.")
	else
		dz = e.self:CreateExpedition(expedition_info)
		if dz.valid then
			if dz:GetInstanceID() == 0 then
				e.self:Message(MT.Red, "Instance failed to be created, yell at a GM")
			else
				e.self:Message(MT.NPCQuestSay, "The expedition is prepared. Click the portal again to enter.")
			end
		end
	end
end

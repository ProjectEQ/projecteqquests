function event_enter_zone(e)
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(227074) == false) then
		eq.spawn2(294631,0,0,0,0,0,0); -- NPC: lockout_ikkinz
	end
end

-- door pairs in order encountered (right and left sliding door ids)
local first_door   = { [15] = true, [16] = true }
local second_door  = { [2] = true, [3] = true }
local third_door   = { [4] = true, [5] = true }
local fourth_door  = { [6] = true, [7] = true }
local fifth_door   = { [8] = true, [9] = true }
local sixth_door   = { [10] = true, [12] = true }
local seventh_door = { [13] = true, [14] = true }
local statue_door  = { [11] = true } -- statue behind fourth door area

local group_trial_1 = instance_version.ikkinz_chambers_of_singular_might
local group_trial_2 = instance_version.ikkinz_chambers_of_twin_struggles
local group_trial_3 = instance_version.ikkinz_chambers_of_the_tri_fates
local raid_trial_1  = instance_version.ikkinz_chambers_of_righteousness
local raid_trial_2  = instance_version.ikkinz_chambers_of_glorification
local raid_trial_3  = instance_version.ikkinz_chambers_of_transcendence
local raid_trial_4  = instance_version.ikkinz_chambers_of_destruction

function event_click_door(e)
	local zone_version = eq.get_zone_instance_version()
	local door_id = e.door:GetDoorID()

	eq.debug(("door (%s) zone version (%s)"):format(door_id, zone_version))

	-- only group trials are verified for some of these flavor messages for now
	local is_group_trial = (zone_version == group_trial_1 or zone_version == group_trial_2 or zone_version == group_trial_3)

	if first_door[door_id] then
		if is_group_trial then
			e.self:Message(15, "The door gives way freely as dust falls from the cracks.")
		end
	elseif second_door[door_id] then
		if is_group_trial then
			e.self:Message(15, "Magic rocks rub against stone and charge the air as the door opens.")
		end
	elseif third_door[door_id] then
		if is_group_trial then
			e.self:Message(15, "Magic rocks rub against stone and charge the air as the door opens.")
		end
	elseif fourth_door[door_id] then
		if is_group_trial then
			e.self:Message(13, "This door is damaged and has been closed for some time. There is no telling who caused the damage, but it will be impossible to repair.")
		end
	elseif fifth_door[door_id] then
		if zone_version == group_trial_1 or zone_version == group_trial_2 then
			e.self:Message(13, "The door appears to have been sealed shut long ago. You will be unable to open it.")
		elseif zone_version == group_trial_3 then
			e.self:Message(15, "The stone nearby shudders as the massive doors part for you.")
		elseif zone_version == raid_trial_2 and e.self:HasItem(60225) then -- item: Axtekilitek
			e.self:Message(15, "The glyphs on Axtekilitek and the door glow momentarily before the doors slide open.")
		elseif zone_version == raid_trial_4 and e.self:HasItem(60240) then -- item: Overseer's Geostone
			e.self:Message(15, "The markings on the Overseer's Geostone line up with the markings on the door. It rumbles to life as it opens for you.")
		end
	elseif sixth_door[door_id] then
		if zone_version == group_trial_3 then -- group trial 3
			e.self:Message(13, "This door has been sealed magically from the other side. There is no way to tell what might lie in the halls beyond.")
		elseif zone_version == raid_trial_2 and e.self:HasItem(60227) then -- item: Kruxilitek
			e.self:Message(15, "Kruxilitek seemingly melds to the door before falling back into your hand. The door opens with ease.")
		end
	elseif seventh_door[door_id] then
		if zone_version == raid_trial_3 and e.self:HasItem(60233) then -- item: Solid Glyphed Essence
			e.self:Message(15, "The solid glyphed essence forms to an opening in the door and energy creeps out through the door like a swarm of spiders. The energy recedes in an instant and the door slides open.")
		elseif zone_version == raid_trial_4 and e.self:HasItem(60249) then -- item: Fused Trusik Signet
			e.self:Message(15, "The door reacts to the signet's aura. The ground trembles as the door opens.")
		end
	end
end

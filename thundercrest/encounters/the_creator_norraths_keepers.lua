local the_creator_task_ids = { 4793, 4794, 4795 } -- the 3 different norrath's keepers creator difficulty versions

local garden_area_id = 1
local garden = { min_x=1980.0, max_x=2260.0, min_y=-807.0, max_y=-130.0, min_z=126.44, max_z=255.0 }

-- todo: would need to select npc type ids based on task id zone version for lower level difficulties
local creator_kroval_npc_type_id = 340007 -- #Creator_Kro`val (level 75 in [68+] version)
local furious_sentry_npc_type_id = 340006 -- Furious_Sentry (level 70 in [68+] version)
local furious_sentry_locs = {
  [1] = { x=2436, y=-744, z=176, w=0.0 },   -- left room
  [2] = { x=2436, y=-172, z=176, w=256.0 }  -- right room
}

local task_elements = {
  explore_garden        = 1,
  kill_defunct_sentries = 2,
  kill_furious_sentry   = 3,
  cast_identify         = 5,
}

local has_spawned_furious_sentry = false

function player_enter_area(e)
  if e.area_id == garden_area_id then
    eq.remove_area(garden_area_id)

    eq.debug("player_enter_area: " .. e.self:GetName())
    for _, task_id in pairs(the_creator_task_ids) do
      if eq.is_task_activity_active(task_id, task_elements.explore_garden) then
        eq.update_task_activity(task_id, task_elements.explore_garden, 1)
        break
      end
    end
  end
end

function player_task_stage_complete(e)
  -- note that on live the first defunct sentry kill adds 2 to the kill count but
  -- the furious sentry doesn't spawn until the actual third defunct sentry is killed.
  -- it's either bugged or they do this so the zone marquee from furious sentry
  -- spawn doesn't overlap the task update marquee

  if has_spawned_furious_sentry then
    return
  end

  -- these two task elements can be completed in any order, check if furious sentry needs spawned
  if e.activity_id == task_elements.explore_garden or e.activity_id == task_elements.kill_defunct_sentries then
    if eq.is_task_activity_active(e.task_id, task_elements.kill_furious_sentry) then
      local loc = furious_sentry_locs[math.random(#furious_sentry_locs)] -- can spawn in either room
      eq.unique_spawn(furious_sentry_npc_type_id, 0, 0, loc.x, loc.y, loc.z, loc.w)
      has_spawned_furious_sentry = true
    end
  end
end

function furious_sentry_spawn(e)
  e.self:CameraEffect(1000, 6) -- 1000 ms and 1.0f intensity in packet (source api for this is wtf, change this if it's ever fixed for floats)
  eq.ZoneMarquee(10, 255, 1000, 2000, 6000, "Something has just come alive in a nearby room! Be warned!") -- live packet values
end

function player_cast_on(e)
  -- identify can be cast from anywhere in zone to complete this task element
  -- but it must be cast on a player holding the energy crystal on cursor
  if e.spell:ID() == 305 then -- spell: Identify
    local inv = e.self:GetInventory()
    if inv:HasItem(60257, 1, InventoryWhere.Cursor) ~= -1 then -- item: Energy Crystal
      for _, task_id in pairs(the_creator_task_ids) do
        if eq.is_task_activity_active(task_id, task_elements.cast_identify) then
          eq.zone_emote(15, "The crystal glows brilliantly filling the room with an eerie light. A scream of rage can be heard in the distance and moments later a voice echoes across the island, 'Foolish adventurers, you will all meet death for destroying my sentries!'")

          eq.spawn2(creator_kroval_npc_type_id, 0, 0, 1348.0, -474.0, 114.0, 124.0) -- #Creator_Kro`val

          -- todo: these are randomized among different sentinel types/levels (also a_rock_sentinel, levels ranged from at least 67-69 in [68+] version of zone)
          -- todo: maybe use spawn conditions based on different zone versions for lower level difficulties
          eq.spawn2(340003, 0, 0, 1612.0, -446.0, 113.0, 128.0) -- a_crag_sentinel
          eq.spawn2(340521, 0, 0, 1612.0, -504.0, 113.0, 128.0) -- a_stone_sentinel
          eq.spawn2(340521, 0, 0, 1466.0, -446.0, 113.0, 128.0) -- a_stone_sentinel
          eq.spawn2(340521, 0, 0, 1466.0, -504.0, 113.0, 128.0) -- a_stone_sentinel

          eq.update_task_activity(task_id, task_elements.cast_identify, 1)
          break
        end
      end
    end
  end
end

function event_encounter_load(e)
  -- don't register any events unless this zone instance is a creator version
  if eq.get_zone_instance_version() ~= instance_version.thundercrest_isles_the_creator then
    return
  end

  -- hack to make the doors behind Creator Kro`val unopenable (door system needs refactored)
  eq.get_entity_list():FindDoor(31):SetOpenType(58)
  eq.get_entity_list():FindDoor(32):SetOpenType(58)

  eq.add_area(garden_area_id, 0, garden.min_x, garden.max_x, garden.min_y, garden.max_y, garden.min_z, garden.max_z)

  eq.register_player_event("the_creator_norraths_keepers", Event.enter_area, player_enter_area)
  eq.register_player_event("the_creator_norraths_keepers", Event.task_stage_complete, player_task_stage_complete)
  eq.register_player_event("the_creator_norraths_keepers", Event.cast_on, player_cast_on)

  eq.register_npc_event("the_creator_norraths_keepers", Event.spawn, furious_sentry_npc_type_id, furious_sentry_spawn) -- Furious_Sentry
end

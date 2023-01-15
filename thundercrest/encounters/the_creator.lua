-- would need to select npc type ids based on task id zone version for lower level difficulties
local dz_task_id = 0
local elements = { kill_defunct_sentries = 2, cast_identify = 5 } -- task element indexes
local defunct_count = 0
local spawned_creator = false
local furious_sentry_locs = {
  { x = 2436, y = -744, z = 176, h = 0.0 },  -- south room
  { x = 2436, y = -172, z = 176, h = 256.0 } -- north room
}

local function zone_death(e)
  -- note on live the first defunct sentry kill adds 2 to the task kill count but
  -- furious sentry doesn't spawn until the actual third defunct sentry is killed.
  -- they either double increment from task and script by mistake or they do this
  -- so the marquee from furious sentry spawn doesn't overlap the task update
  if defunct_count < 3 and e.killed:GetName():find("a_defunct_sentry") then
    eq.update_task_activity(dz_task_id, elements.kill_defunct_sentries, 1) -- mimic live
    defunct_count = defunct_count + 1
    if defunct_count == 3 then
      local loc = furious_sentry_locs[math.random(#furious_sentry_locs)] -- can spawn in either room
      eq.unique_spawn(340006, 0, 0, loc.x, loc.y, loc.z, loc.h) -- Furious_Sentry
    end
  end
end

local function furious_sentry_spawn(e)
  e.self:CameraEffect(1000, 1.0)
  eq.ZoneMarquee(MT.NPCQuestSay, 255, 1000, 2000, 6000, "Something has just come alive in a nearby room! Be warned!") -- live packet values
end

local function player_cast_on(e)
  -- identify must be cast on a player holding the energy crystal on cursor (anywhere in zone)
  if not spawned_creator and e.spell:ID() == 305 then -- spell: Identify
    local inv = e.self:GetInventory()
    if inv:HasItem(60257, 1, InventoryWhere.Cursor) ~= -1 then -- item: Energy Crystal on cursor
      eq.zone_emote(MT.Yellow, "The crystal glows brilliantly filling the room with an eerie light. A scream of rage can be heard in the distance and moments later a voice echoes across the island, 'Foolish adventurers, you will all meet death for destroying my sentries!'")
      -- should be spawn condition for different zone difficulty versions/random sentinel types
      eq.spawn2(340007, 0, 0, 1348.0, -474.0, 114.0, 124.0) -- #Creator_Kro`val
      eq.spawn2(340003, 0, 0, 1612.0, -446.0, 113.0, 128.0) -- a_crag_sentinel
      eq.spawn2(340521, 0, 0, 1612.0, -504.0, 113.0, 128.0) -- a_stone_sentinel
      eq.spawn2(340521, 0, 0, 1466.0, -446.0, 113.0, 128.0) -- a_stone_sentinel
      eq.spawn2(340521, 0, 0, 1466.0, -504.0, 113.0, 128.0) -- a_stone_sentinel
      -- note live does not require the cast target to have the shared task for update
      eq.update_task_activity(dz_task_id, elements.cast_identify, 1)
      spawned_creator = true
    end
  end
end

function event_encounter_load(e)
  dz_task_id = eq.get_dz_task_id()
  eq.register_npc_event(Event.death_zone, 10,     zone_death)           -- zone_controller
  eq.register_npc_event(Event.spawn,      340006, furious_sentry_spawn) -- Furious_Sentry (level 70 in [68+] version)
  eq.register_player_event(Event.cast_on, player_cast_on)
end

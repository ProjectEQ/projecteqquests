local warders = 0

local function zone_death(e)
  -- multiple crawling_warder in database so match by name
  if warders < 5 and not e.killed:IsPet() and e.killed:GetName():match("crawling_warder") then
    warders = warders + 1
    eq.debug("warder kills: " .. warders)
    if warders == 5 then
      eq.unique_spawn(339296, 0, 0, 432, 2277, 202, 143) -- Lair_Mistress
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_zone, 10, zone_death) -- zone_controller
end

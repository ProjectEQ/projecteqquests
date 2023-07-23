-- suspect spider stones only drop after a minimum of 50 kills in zone (lowest seen 53)
-- the Large Spider Stone always appears to drop before Small Spider Stone
-- npcs near zone-in can drop spider stones so area doesn't matter
-- a single npc can double drop both spider stones (Large Spider Stone listed first)

local kill_count = 0
local dropped_large = false
local dropped_small = false

local function zone_death(e)
  if e.killed:IsPet() then
    return
  end

  kill_count = kill_count + 1
  eq.debug("kill count: " .. kill_count)

  -- drop stones at 33% chance after 50 kills (unconfirmed, but both drop fast after 50 kills)
  if kill_count > 50 then
    if not dropped_large and math.random(3) == 1 then
      eq.debug("Dropping Large Spider Stone on " .. e.killed:GetName())
      e.corpse:AddItem(81911, 1) -- Large Spider Stone
      e.corpse:ResetDecayTimer() -- needed if corpse had no other loot
      dropped_large = true
    end

    -- Small stone requires Large stone to drop first
    if dropped_large and not dropped_small and math.random(3) == 1 then
      eq.debug("Dropping Small Spider Stone on " .. e.killed:GetName())
      e.corpse:AddItem(81912, 1) -- Small Spider Stone
      e.corpse:ResetDecayTimer() -- needed if corpse had no other loot
      dropped_small = true
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_zone, 10, zone_death) -- zone_controller (hardcoded id)
end

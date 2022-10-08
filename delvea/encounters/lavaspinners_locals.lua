-- add mission items to npcs (db drop rates are off)
-- note live also rarely double drops the items
local function zone_spawn(e)
  if not e.other:IsPet() then
    local roll = math.random()
    if roll <= 0.75 and e.other:GetName():find("dervish") then -- 75%
      e.other:AddItem(48140, 1) -- Ionized Ore
    elseif roll <= 0.50 and e.other:GetName():find("_Delve_") then -- 50%
      e.other:AddItem(48141, 1) -- Drake Scales
    elseif roll <= 0.75 and e.other:GetName():find("lavaspinner") then -- 75%
      e.other:AddItem(48142, 1) -- Magma Carapace
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn_zone, 10, zone_spawn) -- zone_controller
end

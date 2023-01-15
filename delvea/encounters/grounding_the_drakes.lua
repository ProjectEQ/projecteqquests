-- add Drake Fang drops to drakes (db drop rates were wrong and disabled)
-- note on live they also drop in 'The Drake Menace' at higher rates (further skewing magelo data)

-- max stack seen in this mission is 5 but max seen in 'The Drake Mance' is 12 (which has higher drop rate)
-- it's possible the max in this mission should be higher but the drop chance is much lower
local max_drake_fang_stack = 5

local function zone_spawn(e)
  if not e.other:IsPet() and e.other:GetName():find("_Delve_") then
    local add_count = 0
    for i=1,max_drake_fang_stack do
      if math.random() <= 0.40 then -- 40% for additionals
        add_count = add_count + 1
      else
        break
      end
    end

    if add_count > 0 then
      e.other:AddItem(48144, add_count) -- Drake Fang
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn_zone, 10, zone_spawn) -- zone_controller
end

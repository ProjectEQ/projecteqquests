-- bard 1.5
-- no pre-reqs
local dire_id = 250030 -- spawn2 ID

function event_combat(e)
    if (e.joined == false and e.self:GetHPRatio() < 97) then
        eq.set_timer("depop", 12000)
    end
end

function event_timer(e)
    if (e.self:GetHPRatio() == 100) then
        eq.update_spawn_timer(dire_id, 0)
        eq.depop()
    end
end


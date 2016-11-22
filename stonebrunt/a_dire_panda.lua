-- bard 1.5
-- no pre-reqs
local dragon_id = 100227

function event_spawn(e)
    eq.set_next_hp_event(80)
end

function event_hp(e)
    -- if it's up, do nothing
    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(dragon_id) == true) then
        -- lets reset the HP event in case it's not killed and it regens
        eq.set_next_hp_event(80)
        return
    end

    local x = e.self:GetX()
    local y = e.self:GetY()
    local z = e.self:GetZ()
    local h = e.self:GetHeading()
    eq.spawn2(dragon_id, 0, 0, x, y, z, h)
    eq.depop_with_timer();
end


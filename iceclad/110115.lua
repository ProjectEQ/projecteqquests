function event_spawn(e)
    eq.set_proximity(e.self:GetX()-75, e.self:GetX()+75, e.self:GetY()-75, e.self:GetY()+75)
end

function event_enter(e)
    if eq.is_prophecy_of_ro_enabled() then
        e.other:MovePC(Zone.northro, -949.81, 801, -5.55, 0)
        return
    end
    e.other:MovePC(Zone.nro, -949.81, 801, -5.55, 0)
end

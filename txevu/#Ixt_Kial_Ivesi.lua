function event_spawn(e)
    if math.random(0, 1) == 1 then
        e.self:SetSpecialAbility(SpecialAbility.flurry, 1)
    else
        e.self:SetSpecialAbility(SpecialAbility.rampage, 1)
    end
end

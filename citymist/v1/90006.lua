-- a_black_reaver that spawns trash an_apparition (90091), an_apparition (90153), a_wraith (90064), a_wraith (90073), a_phantom (90048), a_phantom (90057)
function event_death_complete(e)
    local roll = math.random(100)

    if (roll <= 15) then
        local which = eq.ChooseRandom(90091, 90153, 90064, 90073, 90048, 90057)
        eq.spawn2(which, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
    else
        eq.spawn2(90192, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
    end
end


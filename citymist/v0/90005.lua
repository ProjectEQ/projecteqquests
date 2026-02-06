-- a_black_reaver that spawns #Lord_Rak`Ashiir (90174)
function event_death_complete(e)
    local roll = math.random(100)

    if (roll <= 15) then
        eq.unique_spawn(90174, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
    else
        eq.spawn2(90005, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
    end
end


-- a_black_reaver that spawns Lord_Ghiosk (90180)
function event_death_complete(e)
    local roll = math.random(100)

    if (roll <= 15) then
        eq.unique_spawn(90180, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
    else
        eq.spawn2(90004, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
    end
end


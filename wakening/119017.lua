function event_death_complete(e)
    local which = math.random(2);
    if  (which == 1) then
      eq.spawn2(119122, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_tar_goo
    elseif (which == 2) then
      eq.spawn2(119122, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_tar_goo
      eq.spawn2(119122, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_tar_goo
    end
end

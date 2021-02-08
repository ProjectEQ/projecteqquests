function event_combat(e)
if (e.joined == true) then
eq.spawn2(354113, 0, 0, e.self:GetX()-5, e.self:GetY()-5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_hungry_spiderling
eq.spawn2(354113, 0, 0, e.self:GetX()+5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_hungry_spiderling
eq.spawn2(354113, 0, 0, e.self:GetX()-5, e.self:GetY()-5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_hungry_spiderling
eq.depop_with_timer();
end
end

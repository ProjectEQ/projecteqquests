function event_combat(e)
if (e.joined == true) then
e.self:Emote("erupts from a pile of bloody flesh.");
eq.spawn2(200079, 0, 0, e.self:GetX(), e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_swarming_fly
eq.spawn2(200079, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_swarming_fly
eq.spawn2(200079, 0, 0, e.self:GetX(), e.self:GetY()-5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_swarming_fly
eq.spawn2(200079, 0, 0, e.self:GetX()+5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_swarming_fly
eq.depop_with_timer();
end
end

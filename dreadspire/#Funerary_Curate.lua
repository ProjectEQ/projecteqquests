function event_spawn(e)
eq.set_next_hp_event(75);
end

function event_hp(e)
if(e.hp_event == 75) then
eq.spawn2(351134, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_charred_visitant
eq.set_next_hp_event(50);
elseif (e.hp_event == 50) then
eq.spawn2(351135, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_repentant_slave
eq.set_next_hp_event(25);
elseif (e.hp_event == 25) then
eq.spawn2(351136, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_blood-soaked_visitant
end
end

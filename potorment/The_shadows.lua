function event_combat(e)
if (e.joined == true) then
e.self:Emote("around you erupt with activity!");
eq.spawn2(207074, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: a_parylyx_hookcaster
eq.depop_with_timer();
end
end

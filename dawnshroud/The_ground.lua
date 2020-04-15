function event_combat(e)
if (e.joined == true) then
e.self:Emote("beneath you begins to sprout shrooms.");
eq.spawn2(174122, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_fungus_covered_shroom
eq.depop_with_timer();
end
end

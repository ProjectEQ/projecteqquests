function event_combat(e)
if (e.joined == true) then
eq.get_entity_list():MessageClose(e.self, false, 100, 0, "Storm clouds begin to gather over your head.");
eq.spawn2(209086, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_storm_cloud
eq.depop_with_timer();
end
end

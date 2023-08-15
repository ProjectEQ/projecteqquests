function event_combat(e)
    if e.joined then
        eq.get_entity_list():MessageClose(e.self, false, 100, MT.White, "Storm clouds begin to gather over your head.");
        eq.spawn2(209122, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
        eq.depop_with_timer();
    end
end

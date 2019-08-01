function event_spawn(e)
eq.set_timer("explode", 20 * 1000);
end

function event_timer(e)
eq.spawn2(354110, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
eq.depop();
end

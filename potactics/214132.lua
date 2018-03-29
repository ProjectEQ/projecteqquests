function event_spawn(e)
eq.set_timer("upgrade", 50 * 1000);
end

function event_timer(e)
if(e.timer=="upgrade") then
eq.spawn2(214133,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
eq.depop();
end
end

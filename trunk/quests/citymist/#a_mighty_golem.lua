function event_death_complete(e)
	local chance_spawn = math.random(100);
	
	if(chance_spawn <= 10) then
		eq.spawn2(90190,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
end
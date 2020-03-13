function event_signal(e)
	if (e.signal == 1) then
		eq.spawn2(214131,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	--#an_Enraged_War_Boar (214131)
		eq.depop_with_timer();
	end
end

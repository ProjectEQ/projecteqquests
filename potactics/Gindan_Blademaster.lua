function event_spawn(e)
	eq.set_next_hp_event(51);
end


function event_hp(e)
	if e.hp_event == 51 then
		eq.spawn2(214137,0,0,e.self:GetX()+ 5, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); --#Gindan_Blademaster (214137) split version 5 min depop
		eq.spawn2(214137,0,0,e.self:GetX()- 5, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); --#Gindan_Blademaster (214137) split version 5 min depop
		eq.depop_with_timer();
	end
end

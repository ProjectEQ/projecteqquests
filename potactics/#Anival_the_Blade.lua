function event_spawn(e)
	eq.set_next_hp_event(51);
end


function event_hp(e)
	if e.hp_event == 51 then
		eq.spawn2(214139,0,0,e.self:GetX()+ 5, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); --##Anival_the_Blade_ (214139) no loot 2.5 min depop
		eq.spawn2(214138,0,0,e.self:GetX()- 5, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); --##Anival_the_Blade (214138) loot 2.5 min depop
		eq.depop_with_timer();
	end
end

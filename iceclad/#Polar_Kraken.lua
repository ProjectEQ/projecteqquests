function event_spawn(e)
	eq.set_timer("depop",30*60*1000);
end

function event_combat(e)
	if e.joined==true then
		eq.set_timer("adds",45*1000);
		eq.set_timer("blind",12*1000);
		eq.set_next_hp_event(50);
	else	
		eq.stop_timer("adds");
	end
end

function event_timer(e)
	if e.timer=="depop" then
		eq.depop_all(110132);
		eq.depop();
	elseif e.timer=="blind" then
		e.self:CastSpell(5597,e.self:GetHateRandom():GetID()); -- Spell: Squid's Ink
	elseif e.timer=="adds" then
		eq.spawn2(110132, 0, 0, e.self:GetX()-30, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: #Krakling
		eq.spawn2(110132, 0, 0, e.self:GetX()+30, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: #Krakling
		eq.spawn2(110132, 0, 0, e.self:GetX()-30, e.self:GetY()-30, e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: #Krakling
		eq.spawn2(110132, 0, 0, e.self:GetX()-30, e.self:GetY()+30, e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: #Krakling
	end
end
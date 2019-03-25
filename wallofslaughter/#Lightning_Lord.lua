function event_spawn(e)
	eq.set_next_hp_event(90);
	eq.set_timer("check_hp",1000);
	eq.set_timer("eshock",30*1000);
	e.self:CastSpell(5810, e.self:GetID()); -- Spell: Electric Shock
end

function event_hp(e)
	if (e.hp_event == 90) then
		eq.spawn2(300099, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); --loyalist
		eq.set_next_hp_event(75);
	elseif (e.hp_event == 75) then
		eq.spawn2(300099, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); --loyalist
		eq.set_next_hp_event(60);
	elseif (e.hp_event == 60) then
		eq.spawn2(300099, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); --loyalist
		eq.set_next_hp_event(45);
	elseif (e.hp_event == 45) then
		eq.spawn2(300099, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); --loyalist
		eq.set_next_hp_event(30);
	elseif (e.hp_event == 30) then
		eq.spawn2(300099, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); --loyalist
		eq.set_next_hp_event(15);
	elseif (e.hp_event == 15) then
		eq.spawn2(300099, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); --loyalist
	end
end

function event_timer(e)
	if e.timer=="check_hp" then
		if (e.self:GetHPRatio() < 15) then
			local npc = eq.get_entity_list():GetMobByNpcTypeID(300099);			
			if (npc.valid) then
				npc:Damage(e.self, 1000000, 0, 1);					
				e.self:SetHP(e.self:GetMaxHP());
			end;
		end
	elseif e.timer=="eshock" then
		e.self:CastSpell(5810,e.self:GetID()); -- Spell: Electric Shock
	end
end
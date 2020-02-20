function event_spawn(e)
	eq.set_next_hp_event(90);
end

function event_hp(e)
	if (e.hp_event == 90) then
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		e.self:Emote("begins to break into smaller pieces!");
		e.self:ChangeSize(25);
		eq.set_next_hp_event(60);
	elseif (e.hp_event == 60) then
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		e.self:Emote("begins to break into smaller pieces!");
		e.self:ChangeSize(20);
		eq.set_next_hp_event(35);
	elseif (e.hp_event == 35) then
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		e.self:Emote("begins to break into smaller pieces!");
		e.self:ChangeSize(15);
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		e.self:Emote("begins to break into smaller pieces!");
		e.self:ChangeSize(10);
		eq.set_next_hp_event(5);
	elseif (e.hp_event == 5) then
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		eq.spawn2(212064, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_magmite
		e.self:Emote("begins to break into smaller pieces!");
		e.self:ChangeSize(5);
	end
end

function event_combat(e)
	if (e.joined == true) then
		eq.stop_timer("reset");
	else
		eq.set_timer("reset", 300 * 1000);
	end
end

function event_timer(e)
	if(e.timer=="reset") then
		eq.stop_timer("reset");
		e.self:ChangeSize(30);
		e.self:SetHP(e.self:GetMaxHP());
		eq.set_next_hp_event(90);
	end
end

function event_spawn(e)
	eq.set_timer("depop", 1800 * 1000);
	eq.spawn2(301070,0,0,e.self:GetX()+15,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
	eq.spawn2(301070,0,0,e.self:GetX()-15,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
	eq.spawn2(301070,0,0,e.self:GetX(),e.self:GetY()+15,e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
	eq.spawn2(301070,0,0,e.self:GetX(),e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
	eq.spawn2(301070,0,0,e.self:GetX()-15,e.self:GetY()+15,e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
	eq.spawn2(301070,0,0,e.self:GetX()+15,e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("call", math.random(3,8) * 1000); --30
		eq.set_timer("flame", math.random(10,15) * 1000); --60
		eq.set_timer("silence", math.random(3,10) * 1000); --30
	else
		eq.stop_timer("call");
		eq.stop_timer("flame");
		eq.stop_timer("silence");
	end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.stop_timer("depop");
		eq.depop_all(301070);
		eq.depop_all(301071);
		eq.depop_all(301072);
		eq.depop();
	elseif(e.timer=="call") then
		e.self:CastSpell(4666, e.self:GetTarget():GetID());	
		eq.set_timer("call", 30 * 1000);
	elseif(e.timer=="flame") then
		e.self:CastSpell(4117, e.self:GetTarget():GetID());	
		eq.set_timer("flame", 60 * 1000);			
	elseif(e.timer=="silence") then
		e.self:CastSpell(2164, e.self:GetTarget():GetID());	
		eq.set_timer("silence", 30 * 1000);			
	end
end
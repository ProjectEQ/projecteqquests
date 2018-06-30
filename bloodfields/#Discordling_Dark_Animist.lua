function event_spawn(e)
	eq.set_timer("depop", 1800 * 1000);
	eq.spawn2(301070,0,0,e.self:GetX()+15,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
	eq.spawn2(301070,0,0,e.self:GetX()-15,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
	eq.spawn2(301070,0,0,e.self:GetX(),e.self:GetY()+15,e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
	eq.spawn2(301070,0,0,e.self:GetX(),e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
	eq.spawn2(301070,0,0,e.self:GetX()-15,e.self:GetY()+15,e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
	eq.spawn2(301070,0,0,e.self:GetX()+15,e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading()); --a_savage_feran (301070)
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.stop_timer("depop");
		eq.depop_all(301070);
		eq.depop_all(301071);
		eq.depop_all(301072);
		eq.depop();
	end
end


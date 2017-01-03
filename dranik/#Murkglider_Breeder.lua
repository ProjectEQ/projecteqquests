function event_combat(e)
  if (e.joined == true) then
	eq.set_timer("adds", 10 * 1000);
  end
end

function event_timer(e)
	if(e.timer=="adds") then
		eq.stop_timer("adds");
		eq.spawn2(336213, 0, 0, e.self:GetX(),e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(336213, 0, 0, e.self:GetX(),e.self:GetY()+15,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(336212 ,0, 0, e.self:GetX()-15,e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(336211 ,0, 0, e.self:GetX()+15,e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(336211 ,0, 0, e.self:GetX()-15,e.self:GetY()+15,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(336210 ,0, 0, e.self:GetX()+15,e.self:GetY()+15,e.self:GetZ(),e.self:GetHeading());
	end
end
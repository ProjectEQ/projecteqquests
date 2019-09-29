function event_waypoint_arrive(e)
	if(e.wp == 2) then
		eq.spawn2(227003, 0, 0, e.self:GetX(), e.self:GetY()+10,  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(227003, 0, 0, e.self:GetX(), e.self:GetY()-10,  e.self:GetZ(),  e.self:GetHeading());
	elseif(e.wp == 6) then
		eq.spawn2(227003, 0, 0, e.self:GetX()+10, e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(227003, 0, 0, e.self:GetX()-10, e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(227002, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
	elseif(e.wp == 13) then
		eq.spawn2(227003, 0, 0, e.self:GetX()+10, e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(227003, 0, 0, e.self:GetX()-10, e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(227002, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(227002, 0, 0, e.self:GetX()+5, e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
	elseif(e.wp == 16) then
		eq.spawn2(227003, 0, 0, e.self:GetX(), e.self:GetY()+10,  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(227003, 0, 0, e.self:GetX(), e.self:GetY()-10,  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(227002, 0, 0, e.self:GetX(), e.self:GetY()-5,  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(227002, 0, 0, e.self:GetX(), e.self:GetY()+5,  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(227003, 0, 0, e.self:GetX(), e.self:GetY()+5,  e.self:GetZ(),  e.self:GetHeading());
	elseif(e.wp == 18) then
		eq.spawn2(227321, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
		eq.depop();
	end
end

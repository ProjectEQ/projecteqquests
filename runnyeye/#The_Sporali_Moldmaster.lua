function event_combat(e)
	if (e.joined == false) then
		e.self:SaveGuardSpot(e.self:GetX(),e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	end
end

function event_death_complete(e)
	eq.spawn2(11164,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

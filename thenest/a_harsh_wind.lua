--corpse camps

function event_combat(e)
	if (e.joined == false) then
		e.self:SaveGuardSpot(e.self:GetX(),e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	end
end

-- chance for random mob respawn on a black reaver death

function event_death_complete(e)
	local chance_spawn = math.random(100);

	if (chance_spawn <= 10) then
		--Lord_Ghiosk for shaman epic 1.0
		eq.spawn2(90180,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	elseif (chance_spawn <= 25) then
		eq.spawn2(90004,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	elseif (chance_spawn <= 45) then
		eq.spawn2(90005,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	elseif (chance_spawn <= 65) then
		eq.spawn2(90006,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	elseif (chance_spawn <= 75) then
		eq.spawn2(90174,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	elseif (chance_spawn <= 85) then
		eq.spawn2(90184,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
end

-- EOF zone: citymist ID: 90004 90005 90006 NPC: a_black_reaver
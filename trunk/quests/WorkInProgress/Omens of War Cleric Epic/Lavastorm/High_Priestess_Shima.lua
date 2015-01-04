-- Cleric 1.5 Epic // Harmony of the Soul // -- Drogerin

function event_spawn(e)
	e.self:Say("Traitor! You will burn before our might!");
	eq.spawn2(NPCID,0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(NPCID,0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(NPCID,0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(NPCID,0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(NPCID,0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading());
	-- Summons 5 adds with her, A mixture of 5 Priestesses and Priests, need NPCIDs here.
end


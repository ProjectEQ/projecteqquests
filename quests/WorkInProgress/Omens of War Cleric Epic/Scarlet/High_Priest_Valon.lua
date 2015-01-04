-- Cleric Epic 1.5 // Harmony of the Soul // -- Drogerin

function event_spawn(e)
	eq.spawn2(NPCID,0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(NPCID,0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(NPCID,0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(NPCID,0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading());
	-- Summons 4 adds with him, A mixture of 4 Priestesses and Priests, need NPCIDs here.
end
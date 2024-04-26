-- quest: Berserker Epic 1.0

function event_death_complete(e)
	eq.spawn2(72069,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: Ireblind_Imp
end
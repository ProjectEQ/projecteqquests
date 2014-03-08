-- an_essence_harvester NPCID: 71018
function event_death_complete(e)
	-- spawn 2 a_soul_harvester (71110) on death and have them aggro whoever killed me.
	eq.spawn2(71110,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	eq.spawn2(71110,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
end
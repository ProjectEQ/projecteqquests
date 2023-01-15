function event_death_complete(e)
	eq.spawn2(123195,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); --#Garzicor`s_Wraith (123195)
end

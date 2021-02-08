function event_combat(e)
	if (e.joined == true) then
     eq.spawn2(218133,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A_Decaying_Spelunker
     eq.depop_with_timer();
	end
end

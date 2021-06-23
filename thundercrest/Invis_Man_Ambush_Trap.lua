function event_combat(e)
	if (e.joined == true) then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 100,"Hidden panels open from the ceiling as a pair of assassins drop from above.");
    		eq.spawn2(340502, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- an_Autumn_Rose_assassin (340502)
    		eq.spawn2(340502, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- an_Autumn_Rose_assassin (340502)
		eq.depop_with_timer();
	end
end

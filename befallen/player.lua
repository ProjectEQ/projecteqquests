function event_enter_zone(e)
	if e.self:GetClass() == Class.BARD or e.self:GetClass() == Class.ROGUE then
		if e.self:HasItem(52355) and not e.self:HasItem(52357) then -- Item Has: Shakey's Dilapidated Noggin Item Does Not Have: Pulsing Rose Lightstone
			eq.unique_spawn(36102, 2, 0, 165, -170, -10, 0); -- NPC: Flighty_Rose_Wisp
			e.self:Message(MT.Yellow, "Out of the corner of your eye, you catch a glimpse of a brightly colored wisp as it darts by. It's moving at an incredible speed.");
		end
	end
end

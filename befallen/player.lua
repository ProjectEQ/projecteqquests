function event_enter_zone(e)
	if(e.self:Class() == "Bard" or e.self:Class() == "Rogue") then
		if(e.self:HasItem( 52355) == true and e.self:HasItem( 52357) == false) then --Shakey's Dilapidated Noggin, Pulsing Rose Lightstone
			eq.unique_spawn(36102, 2, 0, 165, -170, -10); --Flighty_Rose_Wisp
			e.self:Message(15, "Out of the corner of your eye, you catch a glimpse of a brightly colored wisp as it darts by. It's moving at an incredible speed.");
		end
	end
end
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

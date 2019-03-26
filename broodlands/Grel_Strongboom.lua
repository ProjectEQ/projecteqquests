function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Say("Where's me bloody hat? I need it a'fore I can leave this despicable place!");
	elseif(e.wp == 11) then
		e.self:Say("Where's me bloody hat? I need it a'fore I can leave this despicable place!");
  	elseif(e.wp == 19) then
		e.self:Say("Grr! I'll get me hat if it's the last thing I do! Minions! Search about to find me hat!");
  	elseif(e.wp == 24) then
		e.self:Say("Filthy, disgusting, despicable place! I hope i can find me hat so I can get out of here quickly!");
  	elseif(e.wp == 35) then
		e.self:Say("Where's me bloody hat? I need it a'fore I can leave this despicable place!");
  	elseif(e.wp == 40) then
		e.self:Say("Arr! I'll look for it later around here. I'll be back you whelps! Grel will find his hat, count on it! Minions, stay here and guard my retreat!");
	end
end

function event_spawn(e)
eq.spawn2(337039, 87, 0, 1573, 734, 26.93, 295); -- NPC: a_Grelian_bonebreaker
eq.spawn2(337052, 87, 0, 1573, 734, 26.93, 295); -- NPC: a_Grelian_pactbinder
eq.spawn2(337063, 87, 0, 1573, 734, 26.93, 295); -- NPC: a_Grelian_firelunger
eq.spawn2(337112, 87, 0, 1573, 734, 26.93, 295); -- NPC: a_Grelian_woundmender
eq.spawn2(337116, 87, 0, 1573, 734, 26.93, 295); -- NPC: a_Grelian_backslicer
end

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:Say("Where's me bloody hat? I need it a'fore I can leave this despicable place!");
	elseif(e.wp == 12) then
		e.self:Say("Where's me bloody hat? I need it a'fore I can leave this despicable place!");
  	elseif(e.wp == 20) then
		e.self:Say("Grr! I'll get me hat if it's the last thing I do! Minions! Search about to find me hat!");
  	elseif(e.wp == 25) then
		e.self:Say("Filthy, disgusting, despicable place! I hope i can find me hat so I can get out of here quickly!");
  	elseif(e.wp == 36) then
		e.self:Say("Where's me bloody hat? I need it a'fore I can leave this despicable place!");
  	elseif(e.wp == 41) then
		e.self:Say("Arr! I'll look for it later around here. I'll be back you whelps! Grel will find his hat, count on it! Minions, stay here and guard my retreat!");
	end
end

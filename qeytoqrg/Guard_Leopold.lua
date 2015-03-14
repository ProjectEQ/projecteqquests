function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s. You had best keep moving. One who stands around too long in Qeynos Hills tends to get surprised by vicious creatures.",e.other:GetName()));
	elseif(e.message:findi("donate")) then
		e.self:Say("Why, yes! I would love to donate to the Temple of Thunder. My father was a brave and noble member of that order. Here you are. You should ask Guard Cheslin also. His father and mine are both members of Thunder. Now, move along!");
		e.other:SummonItem(13294);
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:DoAnim(29);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello. How nice to meet you. %s!",e.other:GetName()));
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 8) then
		e.self:Say("Would you please leave me alone?!");
	elseif(e.wp == 9) then
		e.self:Say("I need to get out of here.");
	elseif(e.wp == 12) then
		e.self:Say("Would you please stop following me!!");
	elseif(e.wp == 16) then
		e.self:Say("I just adore this place.");
	end
end

-- Herald_of_Druzzil_Ro (202425)

function event_say (e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, yes, I'm still of one mind, for now. Time, time is all that matters. Would you like to see the [" .. eq.say_link("time",false,"time") .. "]?");
	elseif (e.message:findi("time")) then
		if (e.other:HasZoneFlag(219) == true) then
			--Plane of Time A
			e.other:MovePC(219, 110, 0, 8, 0);
		end
	end
end
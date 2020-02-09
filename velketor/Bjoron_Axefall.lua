function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am not the beginning.");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("A beginning, a");
		eq.signal(112032,1); -- NPC: Khlem_Alestone
	end
end

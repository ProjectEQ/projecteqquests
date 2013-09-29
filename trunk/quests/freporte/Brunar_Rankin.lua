function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How are you? Please excuse my stench. I fish all day and night just to feed my large family. You look like an adventurer. That must be exciting. I am but a humble fisherman. Maybe someday we shall both be rich. You by your treasure and me by my catch.");
	end
end


function event_waypoint_arrive(e)
	if(e.wp == 13) then
		e.self:Say("Here is my catch for today, Gregor");
		eq.signal(10171,1);
	elseif(e.wp == 34) then
		e.self:Say("Ho hum, what a lovely day !");
		e.self:SetRunning(true);
	elseif(e.wp == 39) then
		e.self:SetRunning(false);
	elseif(e.wp == 44) then
		e.self:SetRunning(true);
	elseif(e.wp == 59) then
		e.self:SetRunning(false);
	end
end

-- END of FILE Zone:freporte -- Brunar Rankin
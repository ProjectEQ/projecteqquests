function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I have no time to talk, citizen. Please, step aside!");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 14) then
		e.self:Say("Sir. You called for me?");
		eq.signal(1068,1); -- NPC: Captain_Tillin Warrior Guildmaster
	elseif(e.wp == 40) then
		e.self:Say("McNeal Jocub? You have been found guilty of crimes against the city of Qeynos.");
	elseif(e.wp == 41) then
		eq.signal(1099,1); -- NPC: McNeal_Jocub General Supplies
	end
end

function event_signal(e)
	e.self:Say("Aye sir!");
end

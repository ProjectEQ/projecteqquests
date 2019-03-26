function event_spawn(e)
	e.self:SetRunning(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The towering wall of stone is clearly unmovable at this point, being held in place by collection of magical energies.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 5) then
		e.self:Say("Hello, Alayle. We just got a message from Qeynos. I think you should come with me.");
		eq.signal(382217,1); -- NPC: Guard_Alayle
		e.self:SetRunning(false);
	end
end

function event_signal(e)
		e.self:Say("Oh, well. We can talk here. You just have to do all the bleeding.");
		eq.attack_npc_type(382217);
end	

-- freeporteast version - Krazen_Loosh
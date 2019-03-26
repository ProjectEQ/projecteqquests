function event_spawn(e)
	e.self:SetRunning(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The towering wall of stone is clearly unmovable at this point, being held in place by collection of magical energies.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 8) then
		e.self:Say("Hello, Alayle. We just got a message from Qeynos. I think you should come with me.");
		eq.signal(9141,1); -- NPC: Guard_Alayle
		e.self:SetRunning(false);
	end
end

function event_signal(e)
		e.self:Say("As you try to open penetrate the stone wall it is clearly being held in place by a powerful force.");
		eq.attack_npc_type(9141);
		eq.signal(9106,1); -- NPC: Guard_Lithnon
end	

--END of FILE Zone:freportw  Krazen_Loosh

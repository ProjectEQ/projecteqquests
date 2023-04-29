-- Huffin trap revamp

local num_dead = 0;
local reset_trap = 0;
local trap_triggered = 0;

function event_spawn(e)
	local x,y = e.self:GetX(), e.self:GetY();
	eq.set_proximity(x - 20, x + 20, y - 20, y + 20);
	trap_triggered = 0;
	reset_trap = 0;
	num_dead = 0;
end

function event_enter(e)
	if trap_triggered == 0 then
		trap_triggered = trap_triggered + 1;
		eq.spawn2(eq.ChooseRandom(292029,292005,292030,292001,292006,292002),2,0,-494,-1123,-51,127); -- NPC(s): #a_trusik_anchorite (292029), #a_trusik_ritualist (292005), #a_trusik_ascetic (292030), #a_trusik_ascetic (292001), #a_trusik_stalker (292006), #a_trusik_summoner (292002)
		eq.spawn2(eq.ChooseRandom(292029,292005,292030,292001,292006,292002),2,0,-494,-1123,-51,127); -- NPC(s): #a_trusik_anchorite (292029), #a_trusik_ritualist (292005), #a_trusik_ascetic (292030), #a_trusik_ascetic (292001), #a_trusik_stalker (292006), #a_trusik_summoner (292002)
		eq.spawn2(eq.ChooseRandom(292029,292005,292030,292001,292006,292002),2,0,-494,-1123,-51,127); -- NPC(s): #a_trusik_anchorite (292029), #a_trusik_ritualist (292005), #a_trusik_ascetic (292030), #a_trusik_ascetic (292001), #a_trusik_stalker (292006), #a_trusik_summoner (292002)
		eq.spawn2(eq.ChooseRandom(292029,292005,292030,292001,292006,292002),2,0,-494,-1123,-51,127); -- NPC(s): #a_trusik_anchorite (292029), #a_trusik_ritualist (292005), #a_trusik_ascetic (292030), #a_trusik_ascetic (292001), #a_trusik_stalker (292006), #a_trusik_summoner (292002)
		eq.spawn2(eq.ChooseRandom(292029,292005,292030,292001,292006,292002),2,0,-494,-1123,-51,127); -- NPC(s): #a_trusik_anchorite (292029), #a_trusik_ritualist (292005), #a_trusik_ascetic (292030), #a_trusik_ascetic (292001), #a_trusik_stalker (292006), #a_trusik_summoner (292002)
		eq.zone_emote(MT.Yellow,"An angry voice shouts, After the infidels! Crush the trespassing fools and return their severed heads to me.");
	end
end

function event_signal(e)
	if e.signal == 1 then --an add has reached the zone in, initiate respawn sequence
		if reset_trap == 0 then
			reset_trap = 1;
			eq.set_timer("reset", 10 * 1000);
		end
	elseif e.signal == 2 then
		num_dead = num_dead + 1;
		if num_dead == 5 then
			eq.depop_with_timer();
		end
	end
end

function event_timer(e)
	if e.timer == "reset" then
		eq.stop_timer("reset");
		eq.signal(292029, 2);
		eq.signal(292030, 2);
		eq.signal(292005, 2);
		eq.signal(292001, 2);
		eq.signal(292006, 2);
		eq.signal(292002, 2);
		reset_trap = 0;
		trap_triggered = 0;
	end
end

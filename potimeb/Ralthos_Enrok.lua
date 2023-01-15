--Ralthos_Enrok (223127)
--Phase 2 Undead
--potimeb

function event_spawn(e)
	eq.set_next_hp_event(75);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
	else
		eq.set_timer("reset",5 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "reset" then
		eq.stop_timer("reset");
		eq.set_next_hp_event(75);
		eq.depop_all(223131);
	end
end

function event_death_complete(e)
	eq.signal(223097,223127); -- Add Loot Lockout for Phase 2 Wing
	eq.signal(223242,2); --signal phase_two_undead
end

function event_hp(e)
	if e.hp_event == 75 then
		SpawnGuards(e);
		eq.set_next_hp_event(25);
	elseif e.hp_event == 25 then
		SpawnGuards(e);
	end
end

function SpawnGuards(e)
	local x,y,z = e.self:GetX(),e.self:GetY(),e.self:GetZ()
	for n = 1,2 do
		mob = eq.spawn2(223131,0,0,360,1110,495,127);	--a_summoned_guardian (223131)
		mob:CastToNPC():MoveTo(x,y,z,0,true);
	end
end
-- #Cragbeast_Queen NPCID: 280080
local super_regen = false;
local heading = 0.0; -- IsMoving doesn't catch heading changes ...

function event_spawn(e)
	eq.zone_emote(MT.Yellow,"A muffled roar echoes in the distance.");
	-- piercing does more damage, rest do less, special attacks not touched
	e.self:ModSkillDmgTaken(36, 30); -- piercing
	e.self:ModSkillDmgTaken(0, -85); -- 1h blunt
	e.self:ModSkillDmgTaken(1, -85); -- 1h slashing
	e.self:ModSkillDmgTaken(2, -85); -- 2h blunt
	e.self:ModSkillDmgTaken(3, -85); -- 2h slashing
	e.self:ModSkillDmgTaken(7, -85); -- archery
	e.self:ModSkillDmgTaken(51, -85); -- throwing
	e.self:ModSkillDmgTaken(77, 30); -- 2h pierce
end

function event_combat(e)
	if (e.joined) then
		-- turn off the despawn event if we go in to combat.
		eq.toggle_spawn_event(65, false, false, false)
	else
		-- turn it back on when we come out of combat
		eq.toggle_spawn_event(65, true, false, false)
		-- if the time is after 2am turn off the spawn condition that the spawn_event would have done
		local zone_time = eq.get_zone_time();
		if (zone_time["zone_hour"] >= 2 and zone_time["zone_hour"] < 24) then
			eq.spawn_condition("natimbi",0,1,0);
		end
	end
end

function event_death_complete(e)
	-- turn the depop spawn_event back on
	eq.toggle_spawn_event(65, true, false, false)
	eq.zone_emote(MT.NPCQuestSay, "The Cragbeast Queen roars in defiance.  She staggers for a moment before her gargantuan form comes crashing to the sandy ground.  The impact shakes the entire beach of Natimbi.");
end


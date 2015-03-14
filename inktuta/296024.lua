-- #Kelekdrix,_Herald_of_Trushar (296024)
function event_spawn(e)
	e.self:CastToNPC():MoveTo(510.0, -495.0, 6.0, -1.0, true)
	eq.set_next_hp_event(99)
end

function event_hp(e)
	-- this is the 99% HP event, no need to check which event, so lets not
	eq.spawn_condition("inktuta", eq.get_zone_instance_id(), 1, 1) -- start Usher/Watcher
	e.self:WipeHateList()
end

function event_death_complete(e)
	e.self:Emote("cries out, her booming alto echoing with contempt,")
	e.self:Say("Your victory here is hollow. With my death, the way to the lower reaches is unsealed. The denizens below destroy everything they touch. You will suffer their wrath!")
	eq.unload_encounter("kelekdrix")
	eq.spawn2(296077, 0, 0, 526, -495, 7, 193) -- loot skull
end


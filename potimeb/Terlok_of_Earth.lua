--Terlok_of_Earth (223119)
--Phase 1 - Terlok of Earth Trial
--potimeb

function event_death_complete(e)
	-- send a signal to the #earth_trigger that I died
	eq.signal(223169,2);
	eq.set_global(eq.get_zone_instance_id() .. "_potimeb_Terlok","1",7,"H36");
end
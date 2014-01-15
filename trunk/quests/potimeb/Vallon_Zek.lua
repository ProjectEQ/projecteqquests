function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,5);
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 8
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,8)),7,"H13");
end

function event_spawn(e)
	eq.set_next_hp_event(51);
end

function event_hp(e)
	if (e.hp_event == 51) then
		-- spawn copies
		eq.spawn2(223164,0,0,286,-182,358,23);
		eq.spawn2(223164,0,0,305,-201,358,23);
	end
end

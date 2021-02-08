function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,5); -- NPC: zone_status
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 4
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,4)),7,"H13");
end

function event_timer(e)
	if (e.timer == "barb") then
		e.self:CastSpell(eq.ChooseRandom(2449, 2450, 2451, 2452), e.self:GetTarget():GetID());
		eq.set_timer("barb", math.random(2, 6) * 1000); -- don't think it's on reuse of the one he casts, none are 2 seconds!
	elseif(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < 250) then
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 6 * 1000);
			end
	end
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("barb", math.random(1, 4) * 1000);
		eq.set_timer("OOBcheck", 6 * 1000);
	else
		eq.stop_timer("barb");
		eq.stop_timer("OOBcheck");
	end
end


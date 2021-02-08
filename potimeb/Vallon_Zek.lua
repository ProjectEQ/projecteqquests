function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,5); -- NPC: zone_status
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 8
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,8)),7,"H13");
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		eq.stop_timer("reset");
	else
		eq.stop_timer("OOBcheck");
		eq.set_timer("reset", 6 * 1000);
	end
end


function event_timer(e)
	if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < 250) then
			e.self:GotoBind();
			e.self:WipeHateList();
			e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
			else
			eq.set_timer("OOBcheck", 6 * 1000);
			end
	elseif(e.timer=="reset") then
		eq.stop_timer("reset");
		e.self:SetHP(e.self:GetMaxHP());
		eq.set_next_hp_event(51);
		eq.depop_all(223164); -- depop fake VZ
	end
end

function event_spawn(e)
	eq.set_next_hp_event(51);
end

function event_hp(e)
	if (e.hp_event == 51) then
		-- spawn copies
		eq.spawn2(223164,0,0,353,-18,358,383); -- NPC: #Vallon_Zek
		eq.spawn2(223164,0,0,353,17,358,383); -- NPC: #Vallon_Zek
	end
end

function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,6);
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 1
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,1)),7,"H13");
end

function event_spawn(e)
    eq.set_next_hp_event(85)
end

function event_hp(e)
    -- His resists are suppose to change?
    if (e.hp_event == 85) then
        eq.modify_npc_stat("min_hit", "1040")
        eq.modify_npc_stat("max_hit", "1800")
        eq.ze("Blisters and festering sores covering Bertoxxulous's hide burst. A noxious ooze bleeds down his scarred flesh, strengthening his physical body.")
        eq.set_next_hp_event(70)
    elseif (e.hp_event == 70) then
        eq.modify_npc_stat("min_hit", "1145")
        eq.modify_npc_stat("max_hit", "2000")
        eq.ze("Blisters and festering sores covering Bertoxxulous's hide burst. A noxious ooze bleeds down his scarred flesh, strengthening his physical body.")
        eq.set_next_hp_event(55)
    elseif (e.hp_event == 55) then
        eq.modify_npc_stat("min_hit", "1250")
        eq.modify_npc_stat("max_hit", "2200")
        eq.ze("Blisters and festering sores covering Bertoxxulous's hide burst. A noxious ooze bleeds down his scarred flesh, strengthening his physical body.")
        eq.set_next_hp_event(40)
    elseif (e.hp_event == 40) then
        eq.modify_npc_stat("min_hit", "1145")
        eq.modify_npc_stat("max_hit", "2000")
        eq.ze("Bertoxxulous falters, nearly imperceptibly.")
        eq.set_next_hp_event(25)
    elseif (e.hp_event == 25) then
        eq.modify_npc_stat("min_hit", "1040")
        eq.modify_npc_stat("max_hit", "1800")
        eq.ze("Bertoxxulous falters, nearly imperceptibly.")
        eq.set_next_hp_event(10)
    elseif (e.hp_event == 10) then
        eq.modify_npc_stat("min_hit", "940")
        eq.modify_npc_stat("max_hit", "1700")
        eq.ze("Bertoxxulous falters, nearly imperceptibly.")
    end
end

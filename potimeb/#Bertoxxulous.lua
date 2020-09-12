function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,6); -- NPC: zone_status
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 1
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,1)),7,"H13");
end

function event_combat(e)
	if (e.joined == false) then
		e.self:SetHP(e.self:GetMaxHP());
		eq.set_next_hp_event(85);
		eq.modify_npc_stat("mr", "300")
		eq.modify_npc_stat("cr", "300")
		eq.modify_npc_stat("fr", "300")
		eq.modify_npc_stat("dr", "300")
		eq.modify_npc_stat("pr", "300")
		eq.modify_npc_stat("ac", "200")
	end
end

function event_spawn(e)
    eq.set_next_hp_event(85)
end

function event_hp(e)
    if (e.hp_event == 85) then
        eq.modify_npc_stat("min_hit", "1040")
        eq.modify_npc_stat("max_hit", "1800")
	eq.modify_npc_stat("mr", "250")
	eq.modify_npc_stat("cr", "250")
	eq.modify_npc_stat("fr", "250")
	eq.modify_npc_stat("dr", "250")
	eq.modify_npc_stat("pr", "250")
	eq.modify_npc_stat("ac", "300")
        eq.zone_emote(15, "Blisters and festering sores covering Bertoxxulous's hide burst. A noxious ooze bleeds down his scarred flesh, strengthening his physical body.")
        eq.set_next_hp_event(70)
    elseif (e.hp_event == 70) then
        eq.modify_npc_stat("min_hit", "1145")
        eq.modify_npc_stat("max_hit", "2000")
	eq.modify_npc_stat("mr", "200")
	eq.modify_npc_stat("cr", "200")
	eq.modify_npc_stat("fr", "200")
	eq.modify_npc_stat("dr", "200")
	eq.modify_npc_stat("pr", "200")
	eq.modify_npc_stat("ac", "400")
        eq.zone_emote(15, "Blisters and festering sores covering Bertoxxulous's hide burst. A noxious ooze bleeds down his scarred flesh, strengthening his physical body.")
        eq.set_next_hp_event(55)
    elseif (e.hp_event == 55) then
        eq.modify_npc_stat("min_hit", "1250")
        eq.modify_npc_stat("max_hit", "2200")
	eq.modify_npc_stat("mr", "150")
	eq.modify_npc_stat("cr", "150")
	eq.modify_npc_stat("fr", "150")
	eq.modify_npc_stat("dr", "150")
	eq.modify_npc_stat("pr", "150")
	eq.modify_npc_stat("ac", "500")
        eq.zone_emote(15, "Blisters and festering sores covering Bertoxxulous's hide burst. A noxious ooze bleeds down his scarred flesh, strengthening his physical body.")
        eq.set_next_hp_event(40)
    elseif (e.hp_event == 40) then
        eq.modify_npc_stat("min_hit", "1145")
        eq.modify_npc_stat("max_hit", "2000")
	eq.modify_npc_stat("mr", "200")
	eq.modify_npc_stat("cr", "200")
	eq.modify_npc_stat("fr", "200")
	eq.modify_npc_stat("dr", "200")
	eq.modify_npc_stat("pr", "200")
	eq.modify_npc_stat("ac", "450")
        eq.zone_emote(15, "Bertoxxulous falters, nearly imperceptibly.")
        eq.set_next_hp_event(25)
    elseif (e.hp_event == 25) then
        eq.modify_npc_stat("min_hit", "1040")
        eq.modify_npc_stat("max_hit", "1800")
	eq.modify_npc_stat("mr", "250")
	eq.modify_npc_stat("cr", "250")
	eq.modify_npc_stat("fr", "250")
	eq.modify_npc_stat("dr", "250")
	eq.modify_npc_stat("pr", "250")
	eq.modify_npc_stat("ac", "400")
        eq.zone_emote(15, "Bertoxxulous falters, nearly imperceptibly.")
        eq.set_next_hp_event(10)
    elseif (e.hp_event == 10) then
        eq.modify_npc_stat("min_hit", "940")
        eq.modify_npc_stat("max_hit", "1700")
	eq.modify_npc_stat("mr", "300")
	eq.modify_npc_stat("cr", "300")
	eq.modify_npc_stat("fr", "300")
	eq.modify_npc_stat("dr", "300")
	eq.modify_npc_stat("pr", "300")
	eq.modify_npc_stat("ac", "350")
        eq.zone_emote(15, "Bertoxxulous falters, nearly imperceptibly.")
    end
end

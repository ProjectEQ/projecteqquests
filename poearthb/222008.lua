-- the unmezzable A Rathe Councilman
function event_spawn(e)
    eq.set_next_hp_event(70)
end


--[ NPC flecks down at each HP event
--Starting damage:
--  DI = 123.2
--  DB = 500
--Each fleck
--  DI = DI - 20
--  DB = DB - 70
--  Last tick parsed 150 DB and 35 DI (this DI doesn't match the pattern)
--]
function event_hp(e)
    if (e.hp_event == 70) then
        eq.modify_npc_stat("min_hit", "533")
        eq.modify_npc_stat("max_hit", "2494")
	eq.modify_npc_stat("accuracy", "370")
        eq.zone_emote(15, "The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.")
        eq.set_next_hp_event(40)
    elseif (e.hp_event == 40) then
        eq.modify_npc_stat("min_hit", "443")
        eq.modify_npc_stat("max_hit", "2024")
	eq.modify_npc_stat("accuracy", "340")
        eq.zone_emote(15, "The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.")
        eq.set_next_hp_event(20)
    elseif (e.hp_event == 20) then
        eq.modify_npc_stat("min_hit", "353")
        eq.modify_npc_stat("max_hit", "1554")
	eq.modify_npc_stat("accuracy", "310")
        eq.zone_emote(15, "The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.")
        eq.set_next_hp_event(15)
    elseif (e.hp_event == 15) then
        eq.modify_npc_stat("min_hit", "263")
        eq.modify_npc_stat("max_hit", "1084")
	eq.modify_npc_stat("accuracy", "280")
        eq.zone_emote(15, "The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.")
        eq.set_next_hp_event(8)
    elseif (e.hp_event == 8) then
        eq.modify_npc_stat("min_hit", "185")
        eq.modify_npc_stat("max_hit", "850")
	eq.modify_npc_stat("accuracy", "250")
        eq.zone_emote(15, "The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.")
    end
end

function event_combat(e)
	if (e.joined) then
		eq.set_timer("banish", 60000)
		eq.stop_timer("reset")
	else
		eq.stop_timer("banish")
		eq.set_timer("reset", 45000)
	end
end

function event_timer(e)
    if(e.timer=="banish") then
    local rand_hate = e.self:GetHateRandom()
		eq.debug("banish selected: " ..rand_hate:GetName());
		if (rand_hate.valid and rand_hate:IsClient() and not e.self:IsMezzed() and not rand_hate:IsPet() and e.self:GetHPRatio() >= 11) then
			local rand_hate_v = rand_hate:CastToClient()
			if (rand_hate_v.valid) then
				eq.debug(rand_hate_v:GetName());
				e.self:Say("begone " .. rand_hate_v:GetName())
				e.self:SetHate(rand_hate_v, 1, 1)
				rand_hate_v:MovePC(222,1864.94, 941.05, -254.0, 0)
			end
		end
    elseif(e.timer=="reset") then
	    eq.stop_timer("reset")
	    e.self:SetHP(e.self:GetMaxHP());
        eq.set_next_hp_event(70);
        eq.modify_npc_stat("min_hit", "623")
        eq.modify_npc_stat("max_hit", "2964")
	eq.modify_npc_stat("accuracy", "400")
    end
end

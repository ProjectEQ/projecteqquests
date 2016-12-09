-- the unmezzable A Rathe Councilman
function event_spawn(e)
    eq.set_next_hp_event(70)
end

function event_combat(e)
    if (e.joined == false) then
        e.self:SetHP(e.self:GetMaxHP());
        eq.set_next_hp_event(70);
    end
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
        eq.zone_emote(15, "The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.")
        eq.set_next_hp_event(40)
    elseif (e.hp_event == 40) then
        eq.modify_npc_stat("min_hit", "443")
        eq.modify_npc_stat("max_hit", "2024")
        eq.zone_emote(15, "The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.")
        eq.set_next_hp_event(20)
    elseif (e.hp_event == 20) then
        eq.modify_npc_stat("min_hit", "353")
        eq.modify_npc_stat("max_hit", "1554")
        eq.zone_emote(15, "The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.")
        eq.set_next_hp_event(15)
    elseif (e.hp_event == 15) then
        eq.modify_npc_stat("min_hit", "263")
        eq.modify_npc_stat("max_hit", "1084")
        eq.zone_emote(15, "The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.")
        eq.set_next_hp_event(8)
    elseif (e.hp_event == 8) then
        eq.modify_npc_stat("min_hit", "185")
        eq.modify_npc_stat("max_hit", "850")
        eq.zone_emote(15, "The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.")
    end
end

function event_combat(e)
if (e.joined == true) then
eq.get_entity_list():MessageClose(e.self, false, 70, 0, "A wolf springs from a nearby bush...hungry for blood."); -- a blood starved wolf
eq.depop_with_timer();
end
end

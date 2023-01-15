local function amaro_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Amaro says, 'You found me!  I was beginning to give up hope with all the goblins that have been coming in and out of here.  Once I lost touch with the other scouts, I thought my chances of getting out of here were over.  Thank you for coming to find me.''")
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.say, 342068, amaro_say) -- Amaro
end

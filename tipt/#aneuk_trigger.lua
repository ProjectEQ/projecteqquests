-- NPCID: 289047 #aneuk_trigger
-- Harshly Spiked Key room emote trigger
function event_spawn(e)
  eq.set_timer("check_proximity", 2000)
end

function event_timer(e)
  if e.timer == "check_proximity" and #e.self:GetClientsInProximity(150) >= 1 then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "The air is thick with smoke. Strange noises that could be the snapping of bones reach your ears. Utmost care would be wise.")
    eq.depop()
  end
end

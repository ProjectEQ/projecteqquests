-- NPCID: 289044 #zone_status
function event_spawn(e)
  -- proximity triggers for events
  eq.spawn2(289045, 0, 0, -2011.0, 156.0, 250.75, 15.0)  -- #aemc_trigger
  eq.spawn2(289046, 0, 0, -1489.0, 883.0, 395.50, 125.0) -- #ghost_trigger
  eq.spawn2(289047, 0, 0, -792.0, 1396.0, 539.50, 15.0)  -- #aneuk_trigger
end

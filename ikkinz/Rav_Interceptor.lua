-- npc id: 294626 (Ikkinz, Chambers of Twin Struggles group trial 2 named)
function event_death_complete(e)
  local dz = eq.get_expedition()
  if dz.valid then
    dz:AddReplayLockoutDuration(eq.seconds("7h"))
  end
end

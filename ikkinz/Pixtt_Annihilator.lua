-- npc id: 294042 (Ikkinz, Chambers of Singular Might group trial 1 named)
function event_death_complete(e)
  local dz = eq.get_expedition()
  if dz.valid then
    dz:AddReplayLockoutDuration(eq.seconds("7h"))
  end
end

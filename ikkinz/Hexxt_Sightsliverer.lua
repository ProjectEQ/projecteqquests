-- npc id: 294623 (Ikkinz, Chambers of the Tri-Fates group trial 3 named)
function event_death_complete(e)
  local dz = eq.get_expedition()
  if dz.valid then
    dz:AddReplayLockoutDuration(eq.seconds("7h"))
  end
end

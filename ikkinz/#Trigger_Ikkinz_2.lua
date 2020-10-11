-- npc id: 294142 (used in group trial 3)
local counter = 0

function event_signal(e)
  if e.signal == 1 then -- signal from death of Flesh_Hunter
    counter = counter + 1
  end

  if counter == 3 then
    local dz = eq.get_expedition()
    if dz.valid then
      dz:SetLocked(true, ExpeditionLockMessage.Close)
      dz:AddReplayLockoutDuration(eq.seconds("16h"))

      eq.spawn2(294143, 0, 0, 477, -593, -50, 256) -- NPC: a_pile_of_bones
      eq.spawn2(294144, 0, 0, 477, -638, -50, 256) -- NPC: a_pile_of_bones

      eq.zone_emote(0, "The Tri-Fate Hunters have been defeated! Though the legion may send replacements, you have finished what you sought out to do and delayed their progress for a time! Congratulations!")
      eq.ZoneMarquee(10, 510, 1, 1, 6000, "The Tri-Fate Hunters have been defeated! Congratulations!");
    end
  end
end

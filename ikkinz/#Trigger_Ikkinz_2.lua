-- npc id: 294142 (used in group trial 3)
local counter = 0

function event_signal(e)
  if e.signal == 1 then -- signal from death of Flesh_Hunter
    counter = counter + 1
   eq.set_timer("kyv1", math.random(450,630) * 1000); --7.5-10.5 min RNG timer to respawn
   eq.set_timer("pixtt1", math.random(60,360) * 1000); --1-6min RNG timer to spawn mana drain mob
  elseif e.signal == 2 then -- signal from death of Flesh_Hunter
    counter = counter + 1
   eq.set_timer("kyv2", math.random(450,630) * 1000); --7.5-10.5 min RNG timer to respawn
   eq.set_timer("pixtt2", math.random(60,360) * 1000); --1-6min RNG timer to spawn mana drain mob
  elseif e.signal == 3 then -- signal from death of Flesh_Hunter
    counter = counter + 1
   eq.set_timer("kyv3", math.random(450,630) * 1000); --7.5-10.5 min RNG timer to respawn
   eq.set_timer("pixtt3", math.random(60,360) * 1000); --1-6min RNG timer to spawn mana drain mob
  end

  if counter == 3 then
    eq.stop_timer("kyv1");
    eq.stop_timer("kyv2");
    eq.stop_timer("kyv3");
    eq.stop_timer("pixtt1");
    eq.stop_timer("pixtt2");
    eq.stop_timer("pixtt3");
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

function event_timer(e)
  eq.zone_emote(0, "Sensing an opportunity, a Flesh Hunter calls forth a reinforcement from some unseen location.")
  if(e.timer=="kyv1") then
    eq.stop_timer("kyv1");
    eq.stop_timer("pixtt1");
    counter = counter - 1
    eq.spawn2(294624, 0, 0, 623, -559, -46, 384)
  elseif(e.timer=="kyv2") then
    eq.stop_timer("kyv2");
    eq.stop_timer("pixtt2");
    counter = counter - 1
    eq.spawn2(294135, 0, 0, 623, -483, -46, 384)
  elseif(e.timer=="kyv3") then
    eq.stop_timer("kyv3");
    eq.stop_timer("pixtt3");
    counter = counter - 1
    eq.spawn2(294625, 0, 0, 623, -634, -46, 384)
  elseif(e.timer=="pixtt1") then
    eq.spawn2(294148, 0, 0, 485, -560, -50, 126) --Pixtt_Annuller (294148)
  elseif(e.timer=="pixtt2") then
    eq.spawn2(294149, 0, 0, 485, -481, -50, 126) --Pixtt_Annuller (294149)
  elseif(e.timer=="pixtt3") then
    eq.spawn2(294147, 0, 0, 485, -636, -50, 126) --Pixtt_Annuller (294147)
  end
end

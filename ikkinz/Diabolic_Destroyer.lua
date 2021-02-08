-- Ikkinz Group 1 Expedition
-- Diabolic_Destroyer NPCID: 294043

function event_spawn(e)
  set_event_start();
end

function event_hp(e)
  local xloc = e.self:GetX();
  local yloc = e.self:GetY();
  local zloc = e.self:GetZ();
  local heading = e.self:GetHeading();
  -- spawn #Dire_Illusion x2
  eq.spawn2(294137,0,0,xloc,yloc + 25,zloc,heading); -- NPC: Dire_Illusion
  eq.spawn2(294137,0,0,xloc,yloc - 25,zloc,heading); -- NPC: Dire_Illusion
  -- set next HP event threshold
  if (e.hp_event == 76) then
    eq.set_next_hp_event(51);
  elseif (e.hp_event == 51) then
    eq.set_next_hp_event(26);
  end
end

function event_combat(e)
  if (e.joined) then
    -- /loc updated from MySEQ capture 2014/01/26
    eq.spawn2(294137,0,0,418.5914,-179.3205,10.502,384); -- NPC: Dire_Illusion
    eq.spawn2(294137,0,0,418.5914,-94.3507,10.502,384); -- NPC: Dire_Illusion
    eq.spawn2(294137,0,0,379.2154,-186.3592,1.502002,512); -- NPC: Dire_Illusion
  else
    if (e.self:GetHP() < e.self:GetMaxHP()) then
      e.self:SetHP(e.self:GetMaxHP());
    end
    set_event_start();
  end
end

function event_death_complete(e)
  -- depop the Dire_Illusions
  eq.depop_all(294137);
  -- spawn the Cruel_Illusion
  eq.spawn2(294136,0,0,442,-141,11,384); -- NPC: Cruel_Illusion

  --set lockout
  local dz = eq.get_expedition()
  if dz.valid then
    dz:AddReplayLockoutDuration(eq.seconds("16h")) -- add 16 hours to lockout
    dz:SetLocked(true, ExpeditionLockMessage.Close)
  end

  eq.zone_emote(0, "The Diabolic Destroyer has been defeated! Though the legion may send a replacement, you have finished what you sought out to do and delayed their progress for a time! Congratulations!")
  eq.ZoneMarquee(10,510,1,1,6000,"The Diabolic Destroyer has been defeated! Congratulations!");
end

function set_event_start()
  eq.depop_all(294137);
  eq.set_next_hp_event(76);
end

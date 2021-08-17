-- Ikkinz Group 1 Expedition
-- Diabolic_Destroyer NPCID: 294043


function event_combat(e)
  if (e.joined) then
    -- /loc updated from MySEQ capture 2014/01/26
    eq.spawn2(294137,0,0,418.5914,-179.3205,10.502,384); -- NPC: Dire_Illusion
    eq.spawn2(294137,0,0,418.5914,-94.3507,10.502,384); -- NPC: Dire_Illusion
    eq.spawn2(294137,0,0,379.2154,-186.3592,1.502002,512); -- NPC: Dire_Illusion
    eq.set_timer("OOBcheck", 3 * 1000);
    eq.set_timer("checkdisc", 5 * 1000);
  else
    eq.depop_all(294137);
    eq.stop_timer("OOBcheck");
    eq.stop_timer("checkdisc");
  end
end

function event_timer(e)
if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < 218 or e.self:GetX() > 500 or e.self:GetY() > -30 or e.self:GetY() < -250) then
				e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
elseif(e.timer=="checkdisc") then
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


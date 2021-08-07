-- Ikkinz Raid #1: Chambers of Righteousness   
-- more parse data needed for what spells he chooses to use, is it 3 each time? I got 3 on my parse run
-- he should change into the race of whomever is on top aggro
local spell_setone = false;
local spell_settwo = false;

function event_spawn(e)
   local rand = math.random(1,2);
   if (rand == 1) then
      spell_setone = true;
   elseif (rand == 2) then
      spell_settwo = true;
   end
end
     
function event_death_complete(e)
   eq.spawn2(294579,0,0,-126,-919,-3,508); -- NPC: a_pile_of_bones
   eq.spawn2(294579,0,0,-124,-855,-3,260); -- NPC: a_pile_of_bones
   eq.spawn2(294579,0,0,-187,-853,-3,254); -- NPC: a_pile_of_bones
   eq.spawn2(294579,0,0,-182,-922,-3,496); -- NPC: a_pile_of_bones
   eq.signal(294631,3); --set lockout
end

function event_combat(e)
   if(e.joined) then
		eq.set_timer("random", 5 * 1000);
	else
		eq.stop_timer("random");
	end
end

function event_timer(e)
   if (e.timer == "random") then
      if (spell_setone == true) then
          local rand = math.random(1,100);
          if (rand >= 85) then -- 15 % to cast
            e.self:CastedSpellFinished(993, e.self:GetHateRandom()); -- Spell: Deadly Lifetap
            e.self:Say("Your life force is mine!");
          elseif (rand < 85) and (rand >= 70) then -- 15 % to cast
            e.self:CastedSpellFinished(5005, e.self:GetHateRandom()); -- Tamuik's Ghastly Presence (5005)
            e.self:Emote("instills fright in his foe with his ghastly presence.");
          elseif (rand < 70) and (rand >= 55) then -- 15 % to cast
            e.self:CastedSpellFinished(5006, e.self:GetHateRandom()); -- Tamuik's Spectral Step (5006)
            e.self:Say("Time has no meaning when you live as a ghost does!");
          end
      elseif (spell_settwo == true) then
          local rand = math.random(1,100);
          if (rand >= 85) then -- 15 % to cast
            e.self:CastedSpellFinished(5004, e.self:GetHateRandom()); -- Tamuik's Suggestion (5004)
            e.self:Say("Your life force is mine!");
          elseif (rand < 85) and (rand >= 70) then -- 15 % to cast
            e.self:CastedSpellFinished(5007, e.self:GetHateRandom()); -- Curse of Tunik Tamuik (5007)
            e.self:Emote("instills fright in his foe with his ghastly presence.");
          elseif (rand < 70) and (rand >= 55) then -- 15 % to cast
            e.self:CastedSpellFinished(5008, e.self:GetHateRandom()); -- Bane of Tunik Tamuik (5008)
            e.self:Say("Time has no meaning when you live as a ghost does!");
          end
       end
   end
end

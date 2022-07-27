-- Ikkinz Raid #1: Chambers of Righteousness   

-- he should change into the race of whomever is on top aggro
--local spell_setone = false; --hybrid
--local spell_settwo = false; --priest
--local spell_setthree = false; --int
--local spell_setfour = false; --pure melee

spell_set = 0;
     
function event_death_complete(e)
   -- he should only reward as many artifacts as there are people in the zone, not dz, not raid. Only the # of PCs in the zone at time of death
   eq.spawn2(294579,0,0,-126,-919,-3,508); -- NPC: a_pile_of_bones
   eq.spawn2(294579,0,0,-124,-855,-3,260); -- NPC: a_pile_of_bones
   eq.spawn2(294579,0,0,-187,-853,-3,254); -- NPC: a_pile_of_bones
   eq.spawn2(294579,0,0,-182,-922,-3,496); -- NPC: a_pile_of_bones
   eq.signal(294631,3); --set lockout
end

function event_combat(e)
   if(e.joined) then
		eq.set_timer("random", 5 * 1000);
		eq.set_timer("memwipe", 60 * 1000);
	else
		eq.stop_timer("random");
		eq.stop_timer("memwipe");
	end
end

function event_timer(e)
   if (e.timer == "random") then
	local check_type = e.self:GetHateTop()

	if (check_type.valid and check_type:IsClient() and not check_type:IsPet()) then
		local check_type_v = check_type:GetRace();
			--if (check_type_v.valid) then
				e.self:SetRace(check_type_v);
	if check_type:GetClass() == 15 or check_type:GetClass() == 8  or check_type:GetClass() == 5  or check_type:GetClass() == 4  or check_type:GetClass() == 3 then
		spell_set = 1; --hybrid
	elseif check_type:GetClass() == 2  or check_type:GetClass() == 6  or check_type:GetClass() == 10 then
		spell_set = 2; --priest
	elseif check_type:GetClass() == 11  or check_type:GetClass() == 12  or check_type:GetClass() == 13  or check_type:GetClass() == 14 then
		spell_set = 3; --int
	elseif check_type:GetClass() == 1  or check_type:GetClass() == 7  or check_type:GetClass() == 9  or check_type:GetClass() == 16 then
		spell_set = 4; --pure melee
	end
	end
      if (spell_set == 1) then
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
      elseif (spell_set == 2) then
          local rand = math.random(1,100);
          if (rand >= 85) then -- 15 % to cast
            e.self:CastedSpellFinished(5009, e.self:GetHateRandom()); -- Unholy Barrage (5009)
            e.self:Emote("Unleashes an unholy barrage upon his opponent!");
          elseif (rand < 85) and (rand >= 70) then -- 15 % to cast
            e.self:CastedSpellFinished(5007, e.self:GetHateRandom()); -- Curse of Tunik Tamuik (5007)
            e.self:Emote("Now you will suffer the baleful existence I know!");
          elseif (rand < 70) and (rand >= 55) then -- 15 % to cast
            e.self:CastedSpellFinished(5008, e.self:GetHateRandom()); -- Bane of Tunik Tamuik (5008)
            e.self:Say("Now you will suffer the baleful existence I know!");
          end
	elseif (spell_set == 3) then
          local rand = math.random(1,100);
          if (rand >= 85) then -- 15 % to cast
            e.self:CastedSpellFinished(5003, e.self:GetHateRandom()); -- Impoverished Lifeblood (5003)
            e.self:Emote("Assaults his foe with a blood-reaping blast of magic!");
          elseif (rand < 85) and (rand >= 70) then -- 15 % to cast
            e.self:CastedSpellFinished(5002, e.self:GetHateRandom()); -- Manablast (5002)
            e.self:Emote("Assaults his foe with a blast of tainted mana!");
          elseif (rand < 70) and (rand >= 55) then -- 15 % to cast
            e.self:CastedSpellFinished(5004, e.self:GetHateRandom()); -- Tamuik's Suggestion (5004)
            e.self:Say("You! You're mine to control now!");
          end
	elseif (spell_set == 4) then
			-- does nothing
    end
  elseif (e.timer == "memwipe") then
		local rand_hate = e.self:GetHateTop()

		if (rand_hate.valid and rand_hate:IsClient() and not rand_hate:IsPet()) then
				
			local rand_hate_v = rand_hate:CastToClient()
			if (rand_hate_v.valid) then
				e.self:SetHate(rand_hate_v, 1, 1)		
			end
		end
   end
end

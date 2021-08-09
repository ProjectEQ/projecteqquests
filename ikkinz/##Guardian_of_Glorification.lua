--Ikkinz Raid #2: Chambers of Glorification
--2nd form of split mobs that will split into their final form

function event_spawn(e)
	eq.set_next_hp_event(55);

end

function event_hp(e)
	if(e.hp_event == 55) then
		eq.zone_emote(0, "Guardian of Glorification splits into two smaller stone workers!");
		eq.spawn2(294584,0,0,1038,-484,-68,384); -- NPC: #Guardian_of_Glorification_
		eq.spawn2(294584,0,0,1039,-431,-68,384); -- NPC: #Guardian_of_Glorification_
		eq.depop();
	end
end

function event_combat(e)
	if(e.joined) then
		eq.set_timer("random", 5 * 1000);
		eq.set_timer("OOBcheck", 3 * 1000);
	else
		eq.stop_timer("random");
		eq.stop_timer("OOBcheck");
	end
end

function event_timer(e)
	if (e.timer == "random") then
		local rand = math.random(1,100);
		if (rand >= 85) then -- 15 % to cast throw
		e.self:Emote("tosses its foes away wildly!");
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom());	-- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom());	-- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom());	-- Spell: Throw
		elseif (rand < 85) and (rand >= 70) then -- 15 % to cast manabolt
			e.self:Emote("lets loose a bolt of energy toward his enemy!");
				e.self:CastedSpellFinished(1046, e.self:GetHateRandom());	-- Spell: Manabolt
		end
	elseif(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < 845) then
				e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
	end
end

--Ikkinz Raid #2: Chambers of Glorification
--final split form that drops loot
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
		elseif (rand < 70) and (rand >= 55) then -- 15 % to cast Fling
			local npc1 = eq.get_entity_list():GetMobByNpcTypeID(294466);
			local npc2 = eq.get_entity_list():GetMobByNpcTypeID(294469);

				if (npc1.valid and npc2.valid) then

					if ( npc1:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) < npc2:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ())) then
						eq.signal(294466,1);
						
					else
						eq.signal(294469,1);
						
					end
				end
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

function event_death_complete(e)
eq.signal(294631,4); -- NPC: lockout_ikkinz
eq.spawn2(294585, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --NPC: a_pile_of_bones
end

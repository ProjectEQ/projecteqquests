function event_combat(e)
	if(e.joined) then
		eq.set_timer("random", 5 * 1000);
		eq.set_timer("bury", 70 * 1000);
	else
		eq.stop_timer("random");
		eq.stop_timer("bury");
	end
end

function event_timer(e)
if (e.timer == "random") then
local rand = math.random(1,100);
		if (rand >= 85) then -- 15 % to cast throw
		e.self:Emote("motions toward three attackers and throws them wildly around!");
			hate_list = e.self:CountHateList();
    			if (hate_list ~= nil and tonumber(hate_list) == 1) then
				e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
			elseif (hate_list ~= nil and tonumber(hate_list) == 2) then
				e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw

			elseif (hate_list ~= nil and tonumber(hate_list) >= 3) then
				e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			end
		elseif (rand > 55) and (rand < 85) then -- 30 % to wake an add
		e.self:Emote("motions for one of the crumbling monuments to aid in the attack!");
			local rand = math.random(1,8);
				if (rand == 1) then
					eq.signal(294344,1)
				elseif (rand == 2) then
					eq.signal(294344,2)
				elseif (rand == 3) then
					eq.signal(294344,3)
				elseif (rand == 4) then
					eq.signal(294344,4)
				elseif (rand == 5) then
					eq.signal(294344,5)
				elseif (rand == 6) then
					eq.signal(294344,6)
				elseif (rand == 7) then
					eq.signal(294344,7)
				elseif (rand == 8) then
					eq.signal(294344,8)
				end
		end
elseif (e.timer == "bury") then
	e.self:Emote("slams his fist down, burying the opponent.");
	e.self:CastedSpellFinished(5001, e.self:GetHateRandom()); -- Spell: Bury
end
end

function event_death_complete(e)
	eq.signal(294342,1); -- NPC: Crumbling_Monolith
	eq.signal(294631,1); --set lockout
	eq.get_entity_list():FindDoor(11):SetLockPick(0);
end

--Ikkinz Raid #4: Chambers of Destruction 
function event_combat(e)
	if(e.joined) then
		eq.set_timer("rain", 30 * 1000);
		eq.set_timer("random", 5 * 1000);
		eq.set_timer("bury", 15 * 1000);
	else
		eq.stop_timer("random");
		eq.stop_timer("bury");
		eq.stop_timer("rain");
	end
end

function event_timer(e)
if (e.timer == "random") then
local rand = math.random(1,100);
		if (rand >= 70) then -- 30 % to cast throw
		local instance_id = eq.get_zone_instance_id();
		e.self:ForeachHateList(
		  function(ent, hate, damage, frenzy)
			if(ent:IsClient() and ent:GetY() > -466 or ent:GetY() < -825) then
			  local currclient=ent:CastToClient();
				e.self:Shout("You will not evade me " .. currclient:GetName())
				currclient:MovePCInstance(294,instance_id, e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),0); -- Zone: ikkinz
			end
		  end
		);
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
		elseif (rand > 40) and (rand < 70) then -- 30 % to wake an add
		e.self:Emote("motions for one of the altar monuments to come to its aid.");
			local rand = math.random(1,8);
				if (rand == 1) then
					eq.signal(294607,1)
				elseif (rand == 2) then
					eq.signal(294607,2)
				elseif (rand == 3) then
					eq.signal(294607,3)
				elseif (rand == 4) then
					eq.signal(294607,4)
				elseif (rand == 5) then
					eq.signal(294607,5)
				elseif (rand == 6) then
					eq.signal(294607,6)
				elseif (rand == 7) then
					eq.signal(294607,7)
				elseif (rand == 8) then
					eq.signal(294607,8)
				end
		end
elseif (e.timer == "bury") then
	e.self:Emote("finds an opponent to crush into the ground!");
	e.self:CastedSpellFinished(5001, e.self:GetHateRandom()); -- Spell: Bury
elseif (e.timer == "rain") then
e.self:CastedSpellFinished(4481, e.self:GetHateTop());	-- Spell: Rain of Stone
end
end

function event_death_complete(e)
	eq.signal(294614, 1); -- NPC: #Trigger_Ikkinz_4
	e.self:Emote("'s corpse crumbles to pieces almost instantly.  Whatever is the driving force behind this creature must be siphoning the energy back into itself.");
end

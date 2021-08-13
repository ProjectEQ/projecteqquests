--Ikkinz Raid #4: Chambers of Destruction 
local reduce_regen = 0;

function event_spawn(e)
	reduce_regen = 0;
end

function event_signal(e)
	if (e.signal == 1) then
 		if (reduce_regen == 0) then
			reduce_regen = reduce_regen + 1;
			e.self:ModifyNPCStat("hp_regen", "1000");
		elseif (reduce_regen == 1) then
			reduce_regen = reduce_regen + 1;
			e.self:ModifyNPCStat("hp_regen", "1");
		end
	elseif (e.signal == 2) then
		eq.modify_npc_stat("max_hp", tostring(e.self:GetMaxHP() - 70000)); --reduce max hp by 70k per signal (2 total)
	
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
		e.self:Emote("knocks an adversary back wildly!");
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
		end
	elseif(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < 845) then
				e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
				e.self:GotoBind();
				e.self:WipeHateList();
				e.self:SetHP(e.self:GetMaxHP());
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
	end
end

function event_death_complete(e)
	eq.signal(294631,7); --set lockout
	eq.signal(294614, 1); -- NPC: #Trigger_Ikkinz_4
	e.self:Emote("'s corpse crumbles to pieces almost instantly.  Whatever is the driving force behind this creature must be siphoning the energy back into itself.");
end

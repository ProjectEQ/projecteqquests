function event_death_complete(e)
	eq.signal(292069,1); -- NPC: #Vrex_Barxt_Qurat
	eq.zone_emote(MT.Yellow,"Some destructive energy dissipates, causing damage to Barxt.");
end

function event_combat(e)
	if e.joined then
		eq.set_timer("OOBcheck", 3 * 1000);
	else
		eq.stop_timer("OOBcheck");
	end
end

function event_spawn(e)
	e.self:SetSpecialAbility(25, 1); --turn on immune to aggro
	e.self:SetSpecialAbility(24, 1); --turn on anti aggro
	e.self:SetSpecialAbility(35, 1); --turn on immunity
	e.self:WipeHateList();
end

function event_signal(e)
	e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
	e.self:SetSpecialAbility(24, 0); --turn off anti aggro
	e.self:SetSpecialAbility(35, 0); --turn off immunity
end

function event_timer(e)
	if e.timer == "OOBcheck" then
		eq.stop_timer("OOBcheck");
		if e.self:GetY() < -184 then
			e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
			e.self:GotoBind();
			e.self:WipeHateList();
		else
			eq.set_timer("OOBcheck", 3 * 1000);
		end
	end
end

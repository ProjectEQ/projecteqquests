function event_spawn(e)
eq.set_timer("deactivate", 15 * 1000);
end

function event_timer(e)
	if (e.timer == "deactivate") then
    e.self:SetSpecialAbility(24, 1); --turn on immunity
    e.self:SetSpecialAbility(35, 1); --turn turn on immunity
		e.self:WipeHateList();
		eq.stop_timer("deactivate");
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"The assailant runs out of energy and crumbles to the ground.");
		e.self:SetAppearance(3);
		eq.set_timer("depop", 5 * 1000); -- guessing 5 sec until depop at this point
	elseif (e.timer == "depop") then
		eq.depop();
	elseif(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetY() < -70) then
				e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
	end
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);
		
	else
		eq.stop_timer("OOBcheck");
	end
end

--north jail mobs
function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3000)
	else
		eq.stop_timer("OOBcheck")
	end
end

function event_timer(e)
	if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetY() < 175) then
				e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
	end
end

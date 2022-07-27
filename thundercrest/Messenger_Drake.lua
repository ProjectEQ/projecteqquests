function event_signal(e)
  if (e.signal==1) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(35, 0);
  end
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);
	else
		eq.stop_timer("OOBcheck");
	end
end


function event_timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() < 1712 and e.self:GetY() < 2433) then
		e.self:GotoBind();
		e.self:WipeHateList();
		e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
	else
		eq.set_timer("OOBcheck", 3 * 1000);
	end
end
end

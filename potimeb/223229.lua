-- a_summoned_minion_ (223229) part of Rallos Zek p5 adds
function event_combat(e)
  if (e.joined == true) then
    eq.set_timer("OOBcheck", 6 * 1000);
  else
    eq.stop_timer("OOBcheck");
  end
end


function event_timer(e)
	if(e.timer=="OOBcheck") then
	eq.stop_timer("OOBcheck");
		if (e.self:GetX() < 169 or e.self:GetY() > -179) then
			e.self:GotoBind();
			e.self:WipeHateList();
			e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
		else
			eq.set_timer("OOBcheck", 6 * 1000);
		end
	end
end

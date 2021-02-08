function event_combat(e)
if (e.joined == true) then
eq.set_timer("OOBcheck", 6 * 1000);
eq.set_timer("blur", 45 * 1000);
else
eq.stop_timer("OOBcheck");
eq.stop_timer("blur");
end
end


function event_timer(e)
	if(e.timer=="OOBcheck") then
	  eq.stop_timer("OOBcheck");
	    if (e.self:GetY() > -350) then
		    e.self:CastSpell(3791, e.self:GetID())
		    e.self:GotoBind();
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 6 * 1000);
	    end
	elseif(e.timer=="blur") then
		e.self:Emote("shifts its weight and turns its attention to someone new.");
		e.self:WipeHateList();
	end
end

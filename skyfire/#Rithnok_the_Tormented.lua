function event_spawn(e)
	eq.set_timer("depop", 1800 * 1000);
end

function event_combat(e)
  if (e.joined == true) then
	e.self:CastSpell(13536, e.self:GetTarget():GetID()); -- Spell: Harm Touch
  end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	end
end
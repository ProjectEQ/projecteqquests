function event_combat(e)
  if (e.joined == true) then
	e.self:CastSpell(4472, e.self:GetHateRandom():GetID());
	eq.set_timer("ae",120000);
  end 
end

function event_timer(e)
 if(e.timer=="ae") then
	e.self:CastSpell(4472, e.self:GetHateRandom():GetID());
 end
end
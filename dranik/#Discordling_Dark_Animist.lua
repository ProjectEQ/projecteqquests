function event_combat(e)
  if (e.joined == true) then
	eq.set_timer("depop", 1800 * 1000);
	eq.set_timer("discfeed", 15 * 1000);
	eq.set_timer("corptor", 8 * 1000);
  end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	elseif(e.timer=="discfeed") then
		eq.stop_timer("discfeed");
		e.self:CastSpell(4748, e.self:GetTarget():GetID());	
		eq.set_timer("discfeed", 45 * 1000);
	elseif(e.timer=="corptor") then
		eq.stop_timer("corptor");
		e.self:CastSpell(3954, e.self:GetTarget():GetID());	
		eq.set_timer("corptor", 60 * 1000);			
	end
end
function event_combat(e)
	if e.joined then
		eq.set_timer("withering",7*1000);
	else
		eq.stop_timer("withering");
	end
end

function event_timer(e)
	if (e.timer=="withering") then
		eq.stop_timer("withering");		
		e.self:CastSpell(5801, e.self:GetHateTop():GetID());
		eq.set_timer("withering",20*1000);
	end
end
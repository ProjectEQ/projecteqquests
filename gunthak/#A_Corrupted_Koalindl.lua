function event_spawn(e)
	eq.set_timer("depop", 1800 * 1000);
end

function event_combat(e)
  if (e.joined == true) then
		e.self:Emote("swims toward you in a blood frenzy");
  end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	end
end
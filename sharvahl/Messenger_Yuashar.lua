function event_spawn(e) 
	e.self:MoveTo(478.7,-167,-102,190,true);
	eq.set_timer("say",7000);
end

function event_timer(e)
	if e.timer=="say" then
		eq.stop_timer("say");
		e.self:Say("Sir! We have ill tidings. Jillaa gave the Dark Animist Wand she was holding to one of our scouts. No one has been able to find a trace of the ogre scout since -- and she is an easy one to find with that odor she carries around. What shall we do? Shall we keep searching?");
		eq.set_timer("depop",15*1000);
	else
		eq.depop();
	end
end


function event_spawn(e)
	e.self:Shout("Fool, you think you can come here and try to defeat me? Try as you may, you will fail.");
	eq.set_timer("depop", 1800 * 1000);
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	end
end

function event_death(e)
	e.self:Say("My master and his followers in Vxed shall avenge my death, mortal!");
end
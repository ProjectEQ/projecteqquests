function event_spawn(e)
	e.self:Emote(" whispers, So, I see Couragebringer is fractured. I will give this sword my blessing once more.");
	e.self:Say("The Champion of Valor shall wield this weapon, return it to him");
	eq.set_timer("depop",10000);
end


function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

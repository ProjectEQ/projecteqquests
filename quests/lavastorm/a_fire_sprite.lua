function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	elseif(e.message:findi("challenge eejag")) then
		eq.spawn(27119,0,0,126,1789,-42);
		eq.depop_withtimer();
	end
end

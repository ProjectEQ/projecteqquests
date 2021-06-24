function event_combat(e)
	if (e.joined == true) then
		e.self:Emote("can be seen on the ground before you. Perhaps if you keep searching you will find more.");
	  eq.depop_with_timer();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("'For some, unimaginable riches are their only goal in life. For others, it is unfathomable knowledge.  Today, you will experience wisdom through battle.  If you are [ready], we shall begin.'");
	elseif(e.message:findi("ready")) then
		eq.spawn2(338162,0,0,218,458,-6.39,384); -- NPC: An_Animated_Statue
		eq.depop();
	end
end

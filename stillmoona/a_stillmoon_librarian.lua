function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("'Yes outsider, I have been foretold of your arrival.  The scroll you seek, however, was stolen from here but mere moments before you arrived.  Find the thieves and you will find the scroll you need!'");
		eq.unique_spawn(338407, 0, 0, -729, 1097, 5, 123); -- NPC: scroll_thief
		eq.unique_spawn(338408, 0, 0, -704, 1141, 5, 252); -- NPC: scroll_thief_underling
		eq.unique_spawn(338409, 0, 0, -733, 1106, 5, 123); -- NPC: scroll_thief_underling
		eq.unique_spawn(338410, 0, 0, -703, 1063, 5, 510); -- NPC: scroll_thief_underling
	end
end

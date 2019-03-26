function event_say(e)
	if(e.message:findi("tolon nurbyte")) then
		e.self:Say("So you are inquiring about Mister Tolon Nurbyte, eh? He is on the second floor, last door on the right. You two had best not be up to any mischief. The pair of you look a little shifty for the kingdom of Felwithe.");
		eq.unique_spawn(61095,0,0,-343,155,17,16); -- NPC: Tolon_Nurbyte
	end
end

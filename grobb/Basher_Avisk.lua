function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ranjor tell shaddernites to gets rids of spore guardian. Ha! Gud.");
	elseif(e.message:findi("where the minstrel")) then
		e.self:Say("Dere stewpid skeleton singing by Basher Ganbaku. His post be up high.");
		eq.unique_spawn(52119,0,0,-182,313,26.7,459); -- NPC: a_skeleton
	end
end

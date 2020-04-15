function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Me hear dat dere are humans, elves and other weaklings hunting in da swamp.");
	elseif(e.message:findi("where the captain")) then
		e.self:Say("You speak of da skeleton. He belong to Kaglari. He in dis swamp on little island.");
		eq.unique_spawn(46108,0,0,-6.7,-1422,-12.25,0); -- NPC: a_skeleton
	end
end

-- END of FILE Zone:innothule  ID:228 -- Basher_Sklama 


function event_spawn(e)
	eq.set_timer("depop",2400000); -- set 40 mins before despawn
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please, let me go. I shall leave the [Freeport Militia]. I did not know they were such a vile group.");
		eq.set_timer("cry",30000);
	elseif(e.message:findi("freeport militia")) then
		e.self:Say("I thought they were nothing more than the local militia. Little did I know they were so vile. Now I am stuck [here] and I ask for your forgiveness.");
	elseif(e.message:findi("why are you here")) then
		e.self:Say("I came here to escape the militia and ask [Merko to forgive] me.");
	elseif(e.message:findi("merko to forgive")) then
		e.self:Say("I had a small encounter with his wife, my aunt. She was quite red after that altercation. I guess I upset her in a great way, somehow. Could you please go ask Merko to forgive [Willia]. I shall wait here for his answer.");
	end
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	elseif(e.timer == "cry") then
		e.self:Say("Please do not harm me!! I am a lady underneath this garb. I just wanted to join the [Freeport Militia] to help my people.. Please.. Please.. I am nobody. Marr have mercy. I give you the truth. Is that not what you stand for? Merko is my Uncle!!");
		eq.stop_timer("cry");
	end
end

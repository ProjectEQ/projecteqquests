function event_spawn(e)
	eq.set_timer("appearance", 3 * 1000);
end

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Wha... what happened? Where am I? This isn't the cave... And you, who are you? Why are you standing over me with that peculiar look on your face? I didn't do anything regrettable did I?");
	elseif e.message:findi("yes") or e.message:findi("what did you do") then
		e.self:Say("Oh no, I thought it was just a dream, a nightmare. All I saw was myself as a Srerendi Storm giant, dealing punishment to all interlopers of my domain. Deep down, I couldn't believe that it was me, but on the surface, I could feel the power, feel a force guiding me to be... to be evil. What did you say they called me?")
	elseif e.message:findi("jeplak") then
		e.self:Say("Right, Jeplak. Obviously I wasn't really him, but he's not far from here. I was merely a distraction for anyone who tried to push he and his tribe out of this place. There is another building behind this one that you might want to check for the real Jeplak. I apologize if I've caused any harm to anyone. Farewell, and good luck.");
		eq.unique_spawn(210231,0,0,349,-3163,-455,0);	--#Jeplak_Lord_of_Srerendi (210231)
		eq.depop();
	end
end
function event_timer(e)
	if e.timer == "appearance" then
		eq.stop_timer(e.timer);
		e.self:SetAppearance(3);	--lay down on floor
	end
end

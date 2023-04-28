function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("The ritual of destruction has begun. Tiv Barxt Qurat has completed the transfer of destructive energy from the Altar of Destruction into the Guardian of Destruction and it must be destroyed if there is any chance of disrupting his plans. Be wary of Barxt -- he is powerful and tricky. If he sees things are not going his way, he will use many different tactics to destroy you. When you are [ready] to enter, tell me so, and I will remove the seal. However, once you enter, I am afraid the only way out will be through death or victory.");
	elseif e.message:findi("ready") then
		e.self:Say("The seal has been removed. Good luck to you.");
		eq.get_entity_list():FindDoor(5):SetLockPick(0);
		eq.zone_emote(MT.Yellow,"Within the large chamber lies a massive stone guardian and many trusik. As they wave their arms and chant, you hear a raspy voice near the large altar in the center of the room. You have disrupted the ritual of destruction. Your interference is an annoyance to the great Trushar and it is his will that you be dealt with. Defilers, witness what happens when the destructive forces of Trushar are combined with my geomantic knowledge. Rise, Guardian of Destruction! Come to life and destroy those who would defile this temple!");
		eq.zone_emote(MT.Yellow,"I can feel the energy from the guardian course through my soul! More! Give me more, I say! Trushar, give me the power to destroy these creatures and send them and the others back from where they came!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome to the Temple of Life! The healing of the world shall begin within. Let me know if you have seen a [new disciple of life]. I have a task which needs to be attended to.");
	elseif(e.message:findi("disciple of life")) then
		e.self:Say("It is good to meet a new follower of the Prime Healer. Remember that we must defend all life. Disease and poison are the enemies. Within Qeynos we work hand in hand with other guilds. I seek an acolyte to [deliver a flask].");
	elseif(e.message:findi("deliver a flask")) then
		e.self:Say("Our allies, the Knights of Thunder, have requested that we aid their followers in the Plains of Karana. We have a few young acolytes working there now. Take this blessed oil to Brother Estle. Follow the path to the plains. He shall be waiting for you by a tree alongside the path.");
		e.other:SummonItem(13910);
	end
end

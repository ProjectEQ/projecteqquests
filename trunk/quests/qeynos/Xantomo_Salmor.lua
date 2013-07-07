function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail and well met %s. Are you inquiring as to the legendary happenings I might have heard of in passing? I will tell you the tale if you are [interested] in hearing it.",e.other:GetName()));
	elseif(e.message:findi("interested")) then
		e.self:Say("So be it. Sit back and enjoy the tale of twelve adventurous folk who traveled far to meet their fellows. The fellows that will soon be mentioned had faith in themselves individually, but soon learned that their faith in the sum of their individual parts would be key to their victory. Shall I [go on]?");
	elseif(e.message:findi("go on")) then
		e.self:Say("You had me worried there with that blank stare on your face. Well, to make a long story short, the group of twelve heard there was adventure to be had. They packed and left their respective cities and set out to find their companions. One by one, they joined together until all were united once again. Many tales were told and memories revisited. Time was short though, and adventure soon found them. A grizzled and ancient being appeared before them. Do you know [what it said]?");
	elseif(e.message:findi("say")) then
		e.self:Say("The being presented the fellowship with a challenge. Many beings had received this challenge as well, and all set off to complete the challenge. Their knowledge of Norrath was put to the test against the many others of differing faiths. Soon, the fellowship realized the completion of their challenge. They had triumphed against the odds yet again, succeeding where many others had failed. Their reward was very simple. The ancient being pulled from thin air, a silver, glowing scroll. This scroll was entrusted to few, but I myself have a copy. Do you care to hear me read it aloud?");
	end
end

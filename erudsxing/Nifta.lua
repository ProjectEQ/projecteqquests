function event_say(e)
	if(e.message:findi("lights glory")) then
		e.self:Say("The Light's Glory? Yes I know of that ship. I have seen it many times. Many ships come through here on their way to Erudin. I hear many stories, many tales of the ocean. [Bad news] is all I have for you this day however.");
	elseif(e.message:findi("bad news")) then
		e.self:Say("Your ship left our dock almost a week ago. I watched the ocean that night, as I do every night. Your ship was attacked as it left the dock. There was a big battle. I saw many Erudites thrown overboard. The ship was captured and taken away with the pirate vessel. What became of your ship, I do not know. You could perhaps swim out and take a look for any clues.");
	end
end
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s.  Do you like [riddles]?",e.other:GetName()));
	elseif(e.message:findi("riddles")) then
		e.self:Say("Well I don't have any riddles for you today.  However I do have a [story] to tell about some adventures who were very adept at solving riddles.");
	elseif(e.message:findi("story")) then
		e.self:Say("Not too long ago there were a group of adventurers, some were friends and some were not.  These adventurers traveled far to meet with each other, and this rag-tag crew was thrown together, united for a [common goal].");
	elseif(e.message:findi("common goal")) then
		e.self:Say("What other common goal do most people in this land share?  The accumulation of wealth of course, that isn't to say they didn't serve a greater good, they helped all sorts in their travels, gnomes, dancing bixies, dragons, scarecrows, pixies, elves, nearly anything you can imagine.  It was quite a sight to see, they were not the only [participants] in this grand adventure, however they were the ones who finished with the most to coin show for it.");
	elseif(e.message:findi("participants")) then
		e.self:Say("As I said, there were all manner of participants, however our victors were, Livius Maximus, Moonglumm Riptear, Rhuigha Spirithealer, Littlun Bigheart, Jaras Loupgeist, Balshazzar Synapse, Ironking, Riverraine, Dolaf, Breezar and Wichy Wolfpup, Valthor Runefang, Niborris, and Rixma.");
	end
end
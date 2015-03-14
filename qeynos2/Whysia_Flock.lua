function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Good evening, %s. Feel free to take your time browsing. The temple shop is open night and day for your convenience. Most clerics need access to their [scroll strongbox] at all times.",e.other:GetName()));
	elseif(e.message:findi("scroll strongbox")) then
		e.self:Say("The scroll strongboxes are kept here. They are used by the temple clerics to hold their valuable scrolls. I tend to the 30 and 40 numbered boxes and [Tyokan] deals with the 20s. Presently all are taken and the waiting list is quite long. If you are here to turn in your key, then please do so. I shall get your scroll for you.");
	elseif(e.message:findi("tyokan")) then
		e.self:Say("Tyokan Mekase is the day merchant here at the temple shop. He usually arrives around eight in the morning or so.");	
	end
end

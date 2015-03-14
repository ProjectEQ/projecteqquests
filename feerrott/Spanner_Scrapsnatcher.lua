function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You know, you can go greet yourself. Converse with yourself and then see yourself off while you're at it. I've had enough of this place. To be honest, I've just thought about it and I think that I've had quite enough of you as well. So mate, unless you're holding my bag of fame and fortune... as promised to me last week by our huge headed friend over there... I think that it would be best if you shambled off. Please feel free to take the Erudite with you.");
	elseif(e.message:findi("fame and fortune")) then
		e.self:Say("Oh dun give me the 'what fame and fortune routine'. I'm sure that you're not poking around in the dark jungle because you heard some orphans needed rescuing, you greedy looking wretch. Bah... you've heard the stories about the temple too, haven't ya? That is of course why you're here, right? Looking for your cut?");
	elseif(e.message:findi("stories")) then
		e.self:Say("The lass here told me that she'd be needing me to do some poking around in that temple. Of course being the handsome gentleman that I am and all, I told her that I'd take a look or two. You know a charitable and chivalrous bloke like me would perform such a task for free, but then the Errordite has to go and pry me with stories of riches and... err... a little fame. So, I says, sure... I'll do it since you're begging me and all... now look at us. Deep in the swamp and covered in black monster mucous.");
	elseif(e.message:findi("black monster mucous")) then
		e.self:Say("I dunno what to tell you. I woke up our first morning here to find all of my gear covered in this nasty slime. Most of the stuff crawled off, but now our goods are ruined. I'll be happy when I can get a nice change of clothes. If you happen into some sporty gnome sized clothing let me know.");
	end
end

-- End of File zone: feerot ID: 47130 -- Spanner Scrapsnatcher
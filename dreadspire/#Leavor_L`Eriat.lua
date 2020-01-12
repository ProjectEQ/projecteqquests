function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, friend.  Perhaps I can offer you something from my inventory? There may be something you'll find interesting, though you aren't the [usual customer] I get around here. But, if you got in here then I'll assume you're welcome.");
	elseif(e.message:findi("usual customer")) then
		e.self:Say("Oh, you know, the usual; wolves, vampires and other such undead, orcs, and of course drachnid. Folks such as yourself aren't often allowed in the back hall, if you [know what I mean].");
	elseif(e.message:findi("know what you mean")) then
		e.self:Say("Well, if you don't know what I mean then I probably shouldn't tell you, but I'm always helpful to potential customers. The way you entered is part of what I call the back hall, I'm sure the spiders have another name for them. It leads to one of the crypts, of which this place has plenty. I really can't say more, other than to encourage you not to go down there, that is unless you've bought a lot of [supplies] before you go.  I hate to lose a customer, unless their purse is empty.");
	elseif(e.message:findi("supplies")) then
		e.self:Say("Well, I generally carry specialty food and drink items, though I've been known to carry other things at times. Nothing against the Chef Ioan, he's a fine cook, but he doesn't know how to tend to individual needs. You see, he's been dead a long time and really has no idea what living beings like you and I like to eat. And he's been making food for large numbers of guests, not for individuals.  I've found a few items that the folks here like and I keep them in stock.  That's why I tend to keep my door locked.  Eventually Ioan will get fed up with my side business here and will come banging on my door carrying a large cleaver.  I don't plan to be killed just for trying to serve my customers.");
	end
end

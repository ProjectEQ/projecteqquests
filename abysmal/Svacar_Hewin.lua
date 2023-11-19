function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("nods to you in greeting.  'Hello, ".. e.other:GetName() .. ".  I noticed you when you came aboard.  It's my task to keep [watch] for dangers to the ship.");
	elseif e.message:findi("watch") then
		e.self:Say("Oh, don't take my words the wrong way.  I don't mean to imply that you are a danger.  We see many adventurers come aboard and I knew you were one from the moment I saw you.  You have that [look] about you...'");
	elseif e.message:findi("look") then
		e.self:Emote("looks surprised.  'I'm sorry!  I didn't mean to imply that there was anything wrong with adventurers!  I know that some of us go out looking for trouble and others of us stay at home to protect those that can't defend themselves.  That's just the way some of us are.  I'm here to make certain that none of those...  [things]... that adventurers have reported seeing find there way aboard this ship.'");
	elseif e.message:findi("things") then
		e.self:Say("Well, I'm not sure that I believe the crazy stories that some people tell. They say that there are creatures of pure evil beyond that magical barrier -- the sort of creatures that my parents used to try to scare me with so that I wouldn't wander off when I was [young]. Giant creatures of stone and clay that can crush a man in their bare fists... men twisted into the shapes of dogs that serve creatures even more horrible than those rotten dark elves...' As Svacar talks, his eyes seem to stare past you.");
	elseif e.message:findi("young") then
		e.self:Emote("looks up at you a little dazed, as if only just now remembering that he was talking to you. 'Huh?  Oh, look, I don't have time to chat with you.  I have a duty to this ship.  I wish you well on your travels, adventurer.  If the rumors are correct, this time it will be up to your type to protect the world from danger.  Me, I'll be happy if I can help keep this ship safe.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("turns to glower at you.  His face is hard and tired-looking as he cocks his head to look at you.  'If your business with me isn't important, then perhaps you should find some work to do around the ship.  I'm not out here, dressed like a servant, just to answer your questions.  I have [work] to do.'");
	elseif e.message:findi("work") then
		e.self:Emote("peers at you, his eyes growing darker and his eyebrows moving closer together. 'When I signed on with the [Wayfarers], I was...   I had a violent disagreement with a certain Cleric of Hate.  I won the argument, as he now lies dead.  His corpse may still be visible out the window of the Blind Fish, if he's lucky.  I couldn't very well stay in Neriak after that.  Those two-faced clerics believe in Hate, but not when it costs them one of their own.'");
	elseif e.message:findi("Wayfarers") then
		e.self:Say("I'm no worshiper of Hate, but it's a rare time when I can say that I'm grateful to someone.  The Wayfarers took me in when there were still several of the Indigo Brotherhood looking to take my head.  I would rather be home.  I find life among these people irritating, but at least I'm alive.  At the end of each day that's as much as any Teir'Dal can ask for.  Now move along, I've got work to do.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
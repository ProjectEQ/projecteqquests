function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("What a [sad] day no?");
	elseif e.message:findi("sad") then
		e.self:Say("Why is it sad? Mother Tunare has blessed nature with many beautiful things, and Innoruuk takes it upon himself to desecrate such beauty with the creation of [abominations] to the very senses. Creatures created, mind you, in his very image. These foul beings slither about and do his bidding, destroying and enslaving, all the while mocking the beauty of creation. It makes me ill to think upon it.");
	elseif e.message:findi("abominations") then
		e.self:Say("I have heard them referred to as Luggalds. They reside upon the blasted island of Broken Skull Rock. I was just now watching the seas to see perhaps if there was any word from our last scout we sent investigating. Unfortunately it has been many weeks and I fear that something has happened to him. Such is too often the fate of truly brave scouts, to disappear and simply never discover their fate. [fate] and mortality are not why I am here this day, however.' The elf shifts his weight a bit and turns back to the sea, seeming to forget you are there.");
	elseif e.message:findi("fate") then
		e.self:Say("Fate, mortality, idle concepts that do not highlight my purpose. I am here for honor, and for Mother Tunare. Should our scout not turn up in a few days time I will need to go in his place and leave the coastline rather unprotected. Scouts are so few in numbers these days, there are too many who would overlook such a post in lieu of grandeur and riches. We can always use more good [help].");
	elseif e.message:findi("help") then
		e.self:Emote("glances at you sharply, taking both eyes from the sea for the first time. 'Perhaps then you can. The Scouts of Tunare have taken it upon ourselves to learn as much as we can about these Luggalds so that they may be destroyed. It is a mission of utmost danger, as you will be in unfamiliar land and surrounded by enemies on all sides. We have been slaying the Luggalds in batches and ferrying back their organs and remains to study. Thin the population a bit whilst we study' The scout smirks and turns back to the water. 'If you really wish to do this, travel to Broken Skull Rock and slay the Luggalds. Bring me back four carcasses, or evidence thereof. Should the evidence prove enlightening perhaps our leader will have a reward for you, of course that is dependent on you making it out alive. Good luck.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 54018, item2 = 54018, item3 = 54018, item4 = 54018}) then -- Items: Luggald Parts x4
		e.self:Say("Not bad at all, my friend. I believe these will prove most useful in our studies, and four less abominations to contend with.' He scrawls out some symbols that make no sense at all onto a slip of parchment. 'Take this to Tylfon in Kelethin and I believe he may show some gratitude to our cause.");
		e.other:QuestReward(e.self,0,0,0,0,54019,10000); -- Item: Encrypted Scout Note
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

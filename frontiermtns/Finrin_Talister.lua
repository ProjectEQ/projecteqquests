function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, " .. e.other:Race() .. ". What brings you to this [" .. eq.say_link("legendary site") .. "]? I hope that you're here to do something about all these pesky [" .. eq.say_link("goblins") .. "].");
	elseif(e.message:findi("legendary site")) then
		e.self:Say("As the legend goes, the ruins you see around us was no ordinary building. On this site was once a temple to one of the lesser gods, of which one or if even the god still exists is unknown. What is known is that this place still contains powerful enchantments allowing souls to bind here.");
	elseif(e.message:findi("goblins")) then
		e.self:Say("They've been a real problem lately. Not that they aren't always a problem, but there was all this commotion about some sort of contest with a prize a while ago. It seems that they've [" .. eq.say_link("forgotten") .. "] it again for the moment, thank goodness.");
	elseif(e.message:findi("forgotten")) then
		e.self:Say("Yes, forgotten. They forget about this contest for a while, then suddenly one of them remembers. Fights break out for a while over who will win the [" .. eq.say_link("prize") .. "] then they forget again until the next one remembers it. I wish they'd have this contest already and get it over with.");
	elseif(e.message:findi("prize")) then
		e.self:Say("I don't know for sure what the prize is, I don't speak goblin all that well. All I know is that they discovered something on some poor [" .. eq.say_link("victim") .. "] that they desire. I'm not certain that they even know what it is from the way they talk about it.");
	elseif(e.message:findi("victim")) then
		e.self:Say("I don't know who it was, just someone that they caught sneaking into or out of Droga. You know, I'm tempted to dress up like a goblin and insist that they start the contest already, just so it will be over and we can go back to the relative peace and quiet I've learned to enjoy out here.");			
	end
end

function event_trade(e)
	local item_lib = require("items");

	item_lib.return_items(e.self, e.other, e.trade)
end
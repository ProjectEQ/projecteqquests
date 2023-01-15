-- items: 62821, 62820
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am very busy. Thank you for taking the time to speak to me, stranger, but I have no time for talk right now. I'm afraid that your business can not be urgent enough.");
	elseif(e.message:findi("problem")) then
		e.self:Say("I appreciate your warm concern strange one, but the Othmir will handle this ourselves. I am certain that it would be below you to take on such troubles, especially when I have only a paltry few sentences of information to trade for it. That is, unless this is seems like a [" .. eq.say_link("fair deal") .. "] to you, for who am I to judge such a noble, if unusually depilated, creature such as yourself.");
	elseif(e.message:findi("fair deal")) then
		e.self:Emote("eyes light up and he smiles warmly. 'Such a kind offer! As you may know, we Othmir are exceptional carvers, though it is at brewing that we excel. Our carvings are made from many things, but most commonly of the gruesome teeth of those disgusting Ulthork. We create these beautiful carvings in tribute to our lord Prexus. Turning the ugly teeth of our enemies into items of worship provides several layers of irony and amusement that we can not resist.' ");
	elseif(e.message:findi("carvings")) then
		e.self:Say("The Ulthork raid our homes when they become desperate. We always push them back, of course. But lately there has been one of there kind that is unusually powerful and he has managed to breach our defenses by force or trickery. They steal food and kill our young, as they always do. This one, though, is unusual in that he has taken one of our carvings. This concerns us, for we had not thought the beasts smart enough to recognize the irony in what we have done with their tusks. Our concern is that this one may be able to recognize the carving for what it is and will use it to incite his people to be more trouble that they usually are. If you can recover that carving as evidence that this beastly Ulthork is dispensed with, I will gladly share with you what we have seen of sickness in our waters.");	
	elseif(e.message:findi("rumors") and e.other:HasItem(62812)) then
		e.self:Say("I hate to repeat such rudeness, but as you insist. Some of my people witnessed a hairless-one swimming from the grotto just before the first sickness was seen. Of course many of your people come swimming out of the grotto, so I would give it little thought. Some of my people have decided that it must have been that hairless swimmer that cause the illness. They say, and forgive me for repeating this, that the skin of your people is poison in the water, that you expose it because it defends you in such ways. Obvious foolishness, I apologize for repeating it.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 62821})) then --Carved Prexus Totem
		e.self:Say("Wonderful! You are indeed a creature of your word. Not only have you defeated an enemy of the Othmir, but you have returned to us this most precious statue. I thank you. It is unfortunate that the only thing I have to give you in return is some information and a small fish.");
		e.other:SummonItem(62820); --Small Trigger Fish
		e.other:Ding();
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end
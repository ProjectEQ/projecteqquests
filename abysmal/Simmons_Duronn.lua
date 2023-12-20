-- Pepe's Got a Brand New Bag

function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("I am on the hunt for something, my friend.  Think you can [assist] me?");
	elseif e.message:findi("assist") then
		e.self:Say("I have dealt with the natives, selling them some goods.  In return they have told me of a way to make an interesting bag to carry goods in, from the Venomous Stonemites that inhabit Vxed, the Crumbling Caverns.  If you could [travel there] and bring me back a venom sac from one of these Venomous Stonemites, I would be happy to see if I could make a bag for you.");
	elseif e.message:findi("travel there") then
		e.self:Say("I await your return.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 55570}) then -- Venomous Stonemite Poison Sac
		e.self:Say("You found the sac! Now what was it they said to do next? Hmm. I believe they said something about not touching the poison. yes now I remember. We shouldn't touch the poison. I believe you should talk to a friend of mine named Rion. He can be found here in the city.' Simmons scribbles something down on a note. Take this note and the venom sac to him. He should be able to help you.");
		e.other:SummonItem(55570); -- Venomous Stonemite Poison Sac
		e.other:QuestReward(e.self,0,0,0,0,55576,1000); -- Note to Rion
	elseif item_lib.check_turn_in(e.trade, {item1 = 55574}) then -- Prepared Stonemite Sac
		e.self:Say("Okay, let's see. Simmons begins to craft the sac into the shape of a small bag. He then dips it into some sort of liquid. 'This will preserve your new bag and keep its shape. Here you go, I hope it assists you on your adventures.");
		e.other:QuestReward(e.self,0,0,0,0,55575,eq.ExpHelper(51)); -- Treated Stonemite Bag
	end

	item_lib.return_items(e.self, e.other, e.trade);
end

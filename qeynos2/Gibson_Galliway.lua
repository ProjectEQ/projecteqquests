function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello stranger. Welcome to Galliway's. Please excuse me. I am very [tired] right now.");
	elseif(e.message:findi("tired")) then
		e.self:Say("I have just arrived home after a trip to Halas where I was supposed to pick up a shipment of furs for my father, Sneed. However it all went [wrong].");
	elseif(e.message:findi("wrong")) then
		e.self:Say("On my way back to Qeynos from Halas, I was attacked by a large group of hideous trolls and captured. They took me to [Broken Skull Island].' A look of fear overcomes Gibson. 'They put me to work in the mines of Nadox. However one day, an overseer approached me and made a [deal] with me.");
	elseif(e.message:findi("broken skull island")) then
		e.self:Say("It is a nightmarish, frightening place full of trollish pirates and other miscreants. There were also some other creatures there that wore hoods. They inspired great fear in all those living on the island.");
	elseif(e.message:findi("deal")) then
		e.self:Say("The deal was that if he let me go, I would help supply their mining operations with goods from our shop. I of course agreed. However when the first [contact], for the pirates came for the shipment, I was not able to get all the supplies they wanted.");
	elseif(e.message:findi("contact")) then
		e.self:Say("The contact for the trolls was a horrible little gnome named Ralo the Black.' Tears well up in Gibson's eyes. 'He was furious when I told him I didn't have all the supplies that he wanted. He lunged towards me and bit my hand. In the struggle, he managed to take my [ring.]");
	elseif(e.message:findi("ring")) then
		e.self:Say("It was nothing magical, but it has very sentimental ties attached to it. My father, Sneed gave it to me when I was old enough to help around the shop.' Gibson lowers his voice a bit. 'My father is not known for giving, so I have always treasured it. I do not know what I am going to do. My ring is missing and I am sure that horrid gnome will be back for another shipment soon. Perhaps you could find it in your heart to [help] me? I am sure I could come up with some sort of compensation for such a dangerous task.");
	elseif(e.message:findi("help")) then
		e.self:Say("I am in your debt! While I was imprisoned in the mines of Nadox, I saw a gigantic ship. It is called the Hate's Fury. I frequently saw Ralo going to and from the ship. He often came out just to taunt me and throw rocks at me. If you can find him and get my ring back, I will do all I can to find something to pay you back with. And if Ralo manages to get hurt, that would be an added bonus. Please return when you have my ring. I must get back to work. Gibson addresses his father, Sneed. 'Sorry father, I will finish dusting the shelves now.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 55006})) then
		e.self:Say("You really did it? Yes, this is my ring! I cannot believe it! Father look! He has returned my ring to me!' Sneed ignores Gibson. 'I found this the other day in an old storage room. Perhaps it will aid you in your adventures. You are truly a friend to Sneed's Trading Outpost. Remember to come back again some time. I was going to offer you a discount on all goods here but father wouldn't allow it. I must get back to work now. Farewell, friend!");
		e.other:SummonItem(55026);
		e.other:Ding();
		e.other:AddEXP(15000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

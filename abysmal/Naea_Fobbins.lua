function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Why hello there.  Just arrived?  My name is Naea Fobbins.  My husband and I recently joined the Wayfarers Brotherhood.  When we heard that they were sailing for lands unknown we just had to go.  Truth be told, I do miss home though.  I had quite a lucrative business in Rivervale making [necklaces].");
	elseif e.message:findi("necklaces") then
		e.self:Say("I made all kinds!  Some were magical in nature and some just beautiful to look at.  That reminds me.  My husband recently brought some shells from the shores of Natimbi.  They were quite wonderful and I was able to make a nice necklace from them.  If you could bring me some shells from Natimbi, I can try to make you one as well.  I have nothing else to do at the moment.  Are you [interested]?");
	elseif e.message:findi("interested") then
		e.self:Say("Okay, great!  I will need three Broken Shore shells, and one set of Reef Crustacean Glands to make a necklace for you.  The glands are needed because they secrete a kind of sealant to protect the delicate shells.  You should be able to find all the items in Natimbi.  Hand them to me once you find them.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 55586, item2 = 55585, item3 = 55585, item4 = 55585}) then -- reef crustacean gland, broken shore shell x3
		e.self:Say("Oh, you have returned. And you brought all the items I asked for! As promised I will make you a necklace.' Naea begins to carefully thread the shells and adds the secretion from the gland. 'This should do nicely. Here you go! It was a pleasure making it for you. Take care!");
		e.other:QuestReward(e.self,0,0,0,0,55587,eq.ExpHelper(42)); -- Item: broken shore necklace
	end

	item_lib.return_items(e.self, e.other, e.trade)
end

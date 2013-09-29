function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Sit down and name your poison!  I know we are lacking in originality. but I intend to create some [exotic drinks].");
	elseif(e.message:findi("exotic drinks")) then
		e.self:Say("Interested in exotic drinks. are we?  I am attempting to create some of these drinks I read about in this book I found. It was called the [Barkeep's Compendium].  I will first need to get my hands on a few [exotic ingredients].");
	elseif(e.message:findi("barkeep's compendium")) then
		e.self:Say("I found the book amongst some garbage littering the ground in Freeport East.  It appears to have been created by an ogre named [Clurg].  I am sure he wants it returned. but I will never part with it.  That is... unless I get a few [exotic ingredients] I need to experiment with.");
	elseif(e.message:findi("exotic ingredients")) then
		e.self:Say("I desire a [kiola nut]. [Erud's Tonic]. [honey jum] and a [Koalindl fish].  If I could get those. I would no longer need to hold on to the [Barkeep's Compendium].  Whoever returned the ingredients to me could have it!!");
	elseif(e.message:findi("kiola nut")) then
		e.self:Say("The kiola nut usually grows only in humid territories.  I hear there are some such lands between Qeynos and Erudin.  Some also have been found on the islands of the Ocean of Tears.");
	elseif(e.message:findi("erud's Tonic")) then
		e.self:Say("Now that is an ingredient that is hard to obtain.  Found only in the city of Erudin. it is a crime for anyone to attempt to smuggle it out of the city.  If caught. a horrid death is assured. though I hear there is a frequent customer of the taverns of Qeynos who has a way to obtain the forbidden liquid.");
	elseif(e.message:findi("honey jum")) then
		e.self:Say("Honey jum can be found in the halfling community of Rivervale.  I hear it is used in many of their potions.  I am sure it can be purchased somewhere in Rivervale.  If it is not on the shelf it is surely known by the shopkeeper.");
	elseif(e.message:findi("koalindl fish")) then
		e.self:Say("Some rare drinks call for ground up fish. I intend to use the Koalindl fish of Qeynos.  It is said to be magical in nature.  The problem with obtaining them is that you must get them from Jahnda's Pool near the Temple of Life and I hear that the members protect these fish with great ferocity.");
	elseif(e.message:findi("clurg")) then
		e.self:Say("I do not know. Ask an ogre. Maybe they have heard of him.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	-- Erud's Tonic - Koalindl Fish - Honey Jum - Kiola Nut
	if(item_lib.check_turn_in(e.trade, {item1 = 13118,item2 = 13383,item3 = 13952,item4 = 13340})) then
		e.self:Say("Now I have every ingredient mentioned in the Barkeep Compendium. Here. You take it. <..click!.> Whoops!! I just closed it. It's magically sealed, I never closed it before. It's useless to you. I have no need for it any longer. Maybe you can return it to [Clurg] for some type of reward.");
		e.other:SummonItem(13379); -- Barkeep Compendium
		e.other:Ding();
		e.other:Faction(48,1,0); -- Coalition of Tradefolk Underground
		e.other:Faction(47,1,0); -- Coalition of Trade Folk
		e.other:Faction(31,1,0); -- Carson McCabe
		e.other:Faction(53,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(105,1,0); -- Freeport Militia
		e.other:AddEXP(200);
		e.other:GiveCash(0,0,0,2);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("Thank you, Brunar. You are some kind of fisherman! I better take this down to the storeroom with your earlier catches before it spoils.. hmm.. a little later.");
end

-- END of FILE Zone:freporte -- Gregor_Nasin
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Stand at attention!!  I am General Jyleel. of the Koada'Vie. defenders of Felwithe.  Do you [follow Tunare]. the Mother of All. or do you still [seek your enlightenment]?");
	elseif(e.message:findi("follow Tunar")) then
		e.self:Say("Then you are wise indeed.  Would you like to [assist the defenders] in our conflicts or have you other business to attend to?");
	elseif(e.message:findi("seek my enlightenment")) then
		e.self:Say("Then seek it within these walls.  We welcome all fine upstanding Koada'Dal.");
	elseif(e.message:findi("assist the defenders")) then
		e.self:Say("Seek out the Crushbone orcs of the Faydarks.  We must have their oracle scrolls.  They are illegible to you, but we will study them here in Felwithe.  Only the orc oracles will carry them, so be very careful.  There is also the problem with the [Crushbone runners]."); 
	elseif(e.message:findi("crushbone runners")) then
		e.self:Say("The Crushbone orcs are sending messages across the Ocean of Tears to Antonica.  Why. we do not know.  The runner is usually spotted on the open pathways of Butcherblock. running toward the docks.  Find him. kill him. and return his note pouch.");
	elseif(e.message:findi("faithful paladin of this court")) then
		e.self:Say("I command you to seek out this Ambassor DVinn and rip his heart from his lifeless body. Next, find the supreme caster of the orcs and, finally, find the spot where supplies are dropped by the Teir`Dal for the orcs. There you should find the supply crate. Return all 3 items and you shall wield the falchion.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13225})) then
		e.self:Say("Very fine work. A pity you are not Koada'Vie. Here is a small reward for you. Anytime you come upon an oracle. remember to return its scroll to me. Go and find your fate on the field of battle.");
		e.other:SummonItem(eq.ChooseRandom(15200, 15042, 15226, 13360, 15246, 15276)); -- low level spell or Rotted Illegible Scroll
		e.other:Ding();
		e.other:Faction(43,5,0); -- Clerics of Tunare
		e.other:Faction(178,5,0); -- King Tearis Thex
		e.other:Faction(8,3,0); -- Anti Mage
		e.other:AddEXP(500);
		e.other:GiveCash(1,2,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13226})) then
		e.self:Say("So, you succeeded in stopping a Crushbone runner! That is good. Now take this as reward. Keep up your fine work. The people of Felwithe are grateful.");
		e.other:Ding();
		e.other:Faction(43,10,0); -- Clerics of Tunare
		e.other:Faction(178,10,0); -- King Tearis Thex
		e.other:Faction(8,7,0); -- Anti Mage
		e.other:AddEXP(500);
		e.other:GiveCash(1,2,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18840})) then
		e.self:Say("So, the Teir'Dal are behind the recent advances of the orcs?!! Your news has shed light on their union. It is time to step forth and prove yourself a [faithful paladin of this court].");
		e.other:Ding();
		e.other:Faction(43,5,0); -- Clerics of Tunare
		e.other:Faction(178,5,0); -- King Tearis Thex
		e.other:Faction(8,3,0); -- Anti Mage
		e.other:AddEXP(500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12330,item2 = 12329,item3 = 13227})) then -- A Large Locked Crate, Blue Orc Head, Black Heart
		e.self:Say("'A noble deed has been done and the alliance of evil has been stalled. I present you with the falchion of the Koada`Vie. You are now an honorable member of our order. Hail Felwithe, and may you defender her with honor.");
		e.other:SummonItem(5379); -- Falchion of the Koada'Vie 
		e.other:Ding();
		e.other:Faction(43,5,0); -- Clerics of Tunare
		e.other:Faction(178,5,0); -- King Tearis Thex
		e.other:Faction(8,3,0); -- Anti Mage
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:felwithea  ID:61026 -- General_Jyleel
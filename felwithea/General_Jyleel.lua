-- items: 13225, 15200, 15042, 15226, 13360, 15246, 15276, 13226, 18840, 12330, 12329, 13227, 5379, 1000, 69962
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		e.self:Say("Stand at attention!!  I am General Jyleel. of the Koada'Vie. defenders of Felwithe.  Do you [" .. eq.say_link("follow Tunare") .. "]. the Mother of All. or do you still [" .. eq.say_link("seek my enlightenment",false,"seek your enlightenment") .. "]?");
	elseif(e.message:findi("follow Tunar")) then
		e.self:Say("Then you are wise indeed.  Would you like to [assist the defenders] in our conflicts or have you other business to attend to?");
	elseif(e.message:findi("seek my enlightenment")) then
		e.self:Say("Then seek it within these walls.  We welcome all fine upstanding Koada'Dal.");
	elseif(e.message:findi("assist the defenders")) then
		e.self:Say("Seek out the Crushbone orcs of the Faydarks.  We must have their oracle scrolls.  They are illegible to you, but we will study them here in Felwithe.  Only the orc oracles will carry them, so be very careful.  There is also the problem with the [" .. eq.say_link("Crushbone runners") .. "]."); 
	elseif(e.message:findi("crushbone runners")) then
		e.self:Say("The Crushbone orcs are sending messages across the Ocean of Tears to Antonica.  Why. we do not know.  The runner is usually spotted on the open pathways of Butcherblock. running toward the docks.  Find him. kill him. and return his note pouch.");
	elseif(e.message:findi("faithful paladin of this court")) then
		e.self:Say("I command you to seek out this Ambassor DVinn and rip his heart from his lifeless body. Next, find the supreme caster of the orcs and, finally, find the spot where supplies are dropped by the Teir`Dal for the orcs. There you should find the supply crate. Return all 3 items and you shall wield the falchion.");
	elseif(qglobals["paladin_epic"] == "9" and e.message:findi("special gem")) then
		e.self:Say("I might have just the gem that you are looking for. Tunare blessed it herself! If you would make a 1000 platinum donation in the name of Tunare I will let you have it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 13225})) then
		e.self:Say("Very fine work. A pity you are not Koada'Vie. Here is a small reward for you. Anytime you come upon an oracle. remember to return its scroll to me. Go and find your fate on the field of battle.");
		e.other:SummonItem(eq.ChooseRandom(15200, 15042, 15226, 13360, 15246, 15276)); -- low level spell or Rotted Illegible Scroll
		e.other:Ding();
		e.other:Faction(226,5,0); -- Clerics of Tunare
		e.other:Faction(279,5,0); -- King Tearis Thex
		e.other:Faction(5001,3,0); -- Anti Mage
		e.other:AddEXP(500);
		e.other:GiveCash(1,2,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13226})) then
		e.self:Say("So, you succeeded in stopping a Crushbone runner! That is good. Now take this as reward. Keep up your fine work. The people of Felwithe are grateful.");
		e.other:Ding();
		e.other:Faction(226,10,0); -- Clerics of Tunare
		e.other:Faction(279,10,0); -- King Tearis Thex
		e.other:Faction(5001,7,0); -- Anti Mage
		e.other:AddEXP(500);
		e.other:GiveCash(1,2,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18840})) then
		e.self:Say("So, the Teir'Dal are behind the recent advances of the orcs?!! Your news has shed light on their union. It is time to step forth and prove yourself a [" .. eq.say_link("faithful paladin of this court") .. "].");
		e.other:Ding();
		e.other:Faction(226,5,0); -- Clerics of Tunare
		e.other:Faction(279,5,0); -- King Tearis Thex
		e.other:Faction(5001,3,0); -- Anti Mage
		e.other:AddEXP(500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12330,item2 = 12329,item3 = 13227})) then -- A Large Locked Crate, Blue Orc Head, Black Heart
		e.self:Say("'A noble deed has been done and the alliance of evil has been stalled. I present you with the falchion of the Koada`Vie. You are now an honorable member of our order. Hail Felwithe, and may you defender her with honor.");
		e.other:SummonItem(5379); -- Falchion of the Koada'Vie 
		e.other:Ding();
		e.other:Faction(226,5,0); -- Clerics of Tunare
		e.other:Faction(279,5,0); -- King Tearis Thex
		e.other:Faction(5001,3,0); -- Anti Mage
		e.other:AddEXP(500);
	elseif(qglobals["paladin_epic"] == "9" and item_lib.check_turn_in(e.trade, {platinum = 1000})) then
		e.self:Say("Tunare thanks you " .. e.other:GetName() .. " for the kind donation. For another small donation of 500 platinum I will give you some more information on where you can find another gem.");
		e.other:SummonItem(69962); --felwithe prayer bead
	elseif(qglobals["paladin_epic"] == "9" and item_lib.check_turn_in(e.trade, {platinum = 500})) then
		e.self:Say("I once heard a story from a drunken Dwarf knight. He boasted about this rare jewel he happened upon. You should head in his direction and send my regards.");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:felwithea  ID:61026 -- General_Jyleel

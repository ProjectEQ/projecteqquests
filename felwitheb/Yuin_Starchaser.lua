-- Quest: Art Keepers  NPC: Yuin Starchaser  Zone: Felwithe B
-- items: 17125, 19561, 19555, 19559, 19560, 11395, 19557, 19558, 20293, 20296, 20271, 20274, 20332

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Keepers of the Art friend $name. I am Yuin Starchaser and it is my pleasure to assist new scholars wishing to study the arts of Enchantment, Wizardry, and Magery. Although much can be learned within these halls there is no substitute for experiences gained in the world outside Felwithe. The Koada'Dal have many enemies however, and it is wise to be prepared to face them. If you are new to the Keepers of the Art I will assist you in obtaining a [robe and clothing] suitable for study in the wilds.");
	elseif(e.message:findi("robe and clothing")) then
		e.self:Say("You will need this specially prepared Curing Kit to craft the Art Keepers clothing. The materials required vary depending on the piece of clothing you desire to craft. Once you have been outfitted in the garments return to me and you may be assistance with another [task]. Do you desire to craft a art keepers [cap], [wristband], [gloves], [boots], [sleeves], [pantaloons], or [robe]?");
		e.other:SummonItem(17125); -- Curing Kit
	elseif(e.message:findi("boots")) then
		e.self:Say("To craft Art Keepers Boots you require two [silk thread], giant wasp worker pollen, a woven spider silk, and two ruined forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
		e.other:SummonItem(19561); -- Tattered Boot Pattern
	elseif(e.message:findi("cap")) then
		e.self:Say("To craft an Art Keepers Cap you will require two [silk thread], giant wasp worker pollen, and a woven spider silk. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
		e.other:SummonItem(19555); -- Tattered Cap Pattern
	elseif(e.message:findi("gloves")) then
		e.self:Say("To craft Art Keepers Gloves you require two [silk thread], giant wasp worker pollen, two woven spider silks, and a ruined forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
		e.other:SummonItem(19559); -- Tattered Glove Pattern
	elseif(e.message:findi("pantaloons")) then
		e.self:Say("To craft Art Keepers Pantaloons you require two [silk thread], giant wasp warrior pollen, two woven spider silks, and two forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Leggings Pattern.");
		e.other:SummonItem(19560); -- Tattered Pant Pattern
	elseif(e.message:findi("robe")) then
		e.self:Say("To craft an Art Keepers Robe you will require three [silk thread], giant wasp warrior pollen, two woven spider silks, and a pristine forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Robe Pattern.");
		e.other:SummonItem(11395); -- Tattered Robe Pattern
	elseif(e.message:findi("sleeves")) then
		e.self:Say("To craft Art Keepers Sleeves you require two [silk thread], giant wasp warrior pollen, a woven spider silk, and a forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
		e.other:SummonItem(19557); -- Tattered Sleeves Pattern
	elseif(e.message:findi("wristband")) then
		e.self:Say("To craft an Art Keepers Wristband you require a [silk thread], giant wasp drone pollen, and a woven spider silk. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
		e.other:SummonItem(19558); -- Tattered Wristband Pattern
	elseif(e.message:findi("task")) then
		e.self:Say("One of the responsibilities of the Keepers of the Art is to weave and maintain powerful magic wards that help protect Felwithe from enemy magic. An understanding of the magic wielded by Felwithes many foes is vital to the success of our protective wards. With the help of the paladins of the Koada'Vie we have discovered many of the secrets of the orcish shaman that reside in the citadel of Clan Crushbone to the north of the Faydarks but there is still much to learn. The task I have to present you will take you into the [Crushbone Citadel] itself.");
	elseif(e.message:findi("crushbone citadel")) then
		e.self:Say("The entrance to the Citadel can be found on the northern edge of the Greater Faydark. Once within the citadel seek out the Orc Thaumaturgist and obtain his book of spells. Once you are in possession of the Orc Thaumaturgists Spell Book return it to me so that the masters of the Keepers of the Art may study its contents.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20293})) then -- Orc Thaumaturgists Spell Book
		e.self:Say("Well done young Art Keeper. Take this Rough Art Keepers Initiate Staff and go forth and gather a Pristine Forest Drakeling Scales and an Arborean Amber. When you have acquired those two items return them to me with the Rough Art Keepers Initiate Staff and I will put the final touches on the staff.");
		e.other:SummonItem(20296); -- Rough Art Keepers Initiate Staff
		e.other:Ding();
		e.other:Faction(275,10,0); -- Keepers of the Art
		e.other:Faction(279,10,0); -- King Tearis Thex
		e.other:Faction(246,10,0); -- Faydark's Champions
		e.other:Faction(239,-10,0); -- The Dead
		e.other:AddEXP(250);
	-- Handin: Rough Artkeepers Initiate Staff, Pristine Forest Drakeling Scales, Arborean Amber
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20296,item2 = 20271,item3 = 20274})) then
		e.self:Emote("fashions a grip for the staff from the pristine forest drakeling scales, places the arborean amber into a mithril fixture and attaches the fixture to one end of the staff. 'Here is your new staff young Art Keeper may it serve you well in the pursuit of your studies.'");
		e.other:SummonItem(20332); -- Art Keepers Initiate Staff
		e.other:Ding();
		e.other:Faction(275,10,0); -- Keepers of the Art
		e.other:Faction(279,10,0); -- King Tearis Thex
		e.other:Faction(246,10,0); -- Faydark's Champions
		e.other:Faction(239,-10,0); -- The Dead
		e.other:AddEXP(250);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

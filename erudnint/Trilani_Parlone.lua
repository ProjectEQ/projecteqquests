-- Tunare Warden
-- Missing The Mystic Cloak
-- items: 1598, 1596, 1597, 1599, 1056, 1057

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. good adventurer!  Do you bring word from my [husband]?");
	elseif(e.message:findi("husband")) then
		e.self:Say("Tolkar is his name. My beloved husband. He still lives in Felwithe while I study here. It must be hard on him."); 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1598})) then -- Black Stone Candlestick
		e.self:Say("I sense a great evil power in this candlestick. I will need you to concoct a divinatory aid for me before I can discern more. Take this suspension and brew it in a brew barrel with one white hellebore, a pouch of the red dust created by the Fire Peak Goblin Wizards, and the caustic substance used by the werebats in Unrest.");
		e.other:Ding();
		e.other:SummonItem(1596); -- Magical Suspension Fluid
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1597})) then -- Divinatory Concoction 
		e.self:Emote("performs a subtle divinatory ritual. 'This is a powerful evil indeed. The smoke from special candles crafted by the Teir'Dal and burned in this candlestick allows the creation of undead of unordinary might. The Ghasts are only one of its many possible creations. I will concoct a powder for you to take back to Yeolarn that will assist in defeating the monstrosities the candle has produced. The candlestick itself will remain here within the High Tower of Erudin for the time being.'");
		e.other:SummonItem(1599); -- Powder of Unanimation
		e.other:Ding();
		e.other:Faction(246,10,0); -- Faction: Faydarks Champions
		e.other:Faction(275,10,0); -- Faction: Keepers of the Art
		e.other:Faction(279,10,0); -- Faction: King Tearis Thex
		e.other:Faction(239,-30,0); -- Faction: The Dead
		e.other:AddEXP(1500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1056})) then --Faded Cloak
		e.self:Say("Oh my lord Tunare! I did not know my daughter was in trouble. I thank you for saving her. Here, I have returned the once lost power to this cloak. Wear it with my humblest gratitude.");
		e.other:SummonItem(1057); --Mystic Cloak
		e.other:Ding();
		e.other:Faction(246,2,0); -- Faction: Faydarks Champions
		e.other:Faction(275,15,0); -- Faction: Keepers of the Art
		e.other:Faction(279,3,0); -- Faction: King Tearis Thex
		e.other:Faction(239,-3,0); -- Faction: The Dead
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:erudnint  ID:23020 -- Trilani_Parlone

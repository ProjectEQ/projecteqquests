function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. good adventurer!  I am afraid that my services are not available at the moment.  I am too worried about my [daughter].");
	elseif(e.message:findi("daughter")) then
		e.self:Say("My daughter's name is Lenara.  I have not seen her in several months. and I fear the worst.  She went off adventuring. even though I told her how dangerous it was."); 
	elseif(e.message:findi("Where did she go")) then
		e.self:Say("'I do not know where she went, but I thought she mentioned something about lava. It still sends shivers down my spine just thinking about it.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 5573})) then -- folded note
		e.self:Say("Oh, my, she did get herself into some trouble! I thank you for rescuing her, my friend. Here, take this old cloak. I am afraid its power has faded, but if you bring it to my wife, she might be able to do something for you. She is currently studying in Erudin.");
		e.other:SummonItem(1056); -- Faded Cloak
		e.other:Ding();
		e.other:Faction(170,5,0); -- Keepers of the Art
		e.other:Faction(178,5,0); -- King Tearis Thex
		e.other:Faction(99,5,0); -- Faydark's Champions
		e.other:Faction(322,-5,0); -- The Dead
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:felwithea  ID:61017 -- Tolkar_Parlone
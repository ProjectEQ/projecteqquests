function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The Temple of Marr welcomes you. I am Gygus Remnara. High Sentinel for the Sentries of Passion. We are the order of paladins within the Priests of Marr and whose charge it is to protect the holy Temple of Marr.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18738})) then -- A tattered note
		e.self:Say("Welcome to the Sentries of Passion. We are the protectors of the Temple of Marr. Wear our tunic with pride, young knight! Find your wisdom within these walls and in the words of our priests. And remember to aid all who follow the twin deities, Mithaniel and Erollisi Marr.");
		e.other:SummonItem(13556); -- White and Blue Tunic
		e.other:Ding();
		e.other:Faction(258,100,0); -- Priests of Marr
		e.other:Faction(105,-10,0); -- The Freeport Militia
		e.other:Faction(184,15,0); -- Knight of Truth
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportn  ID:8028 -- Gygus_Remnara
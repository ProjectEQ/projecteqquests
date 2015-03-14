function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18727)) then
		e.other:Message(15,"Ghanlin Skyphire, a stern and powerful looking man looks your way, 'What is this? An apprentice wizard in our ranks? If so, then read the note in your inventory and hand it to me to start your training. With my help you will start on the path to becoming a great and powerful wizard if that be your will.'");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18727})) then -- Tattered Note
		e.self:Say("Greetings. I am Ghanlin Skyphire, Master Wizard of the Crimson Hands. All of us here have devoted our lives to the studies of the arcane and mystical. Let's get you started. Here's your training robe.  Now, go find Raskena. She'll help train you and give you your first lesson.");
		e.other:SummonItem(13550); --Old Used Robe*
		e.other:Ding();
		e.other:Faction(60,100,0);   --Crimson Hands
		e.other:Faction(145,10,0);  --High Council of Erudin
		e.other:Faction(143,-15,0); --Heretics
		e.other:Faction(147,15,0);  --High Guard of Erudin		
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:erudnint  ID:24040 -- Ghanlin_Skyphire
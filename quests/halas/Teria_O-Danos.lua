function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to ye! Ye look a wee bit hungrry. I sell many fine foods. Please have a look. Might I suggest the [lion roast]? It is a wee bit expensive, but well worth it.");
	end
	if(e.message:findi("lion roast")) then
		e.self:Say("The lion roast is quite good. Tis me specialty. Ah marinate the lion meat in mammoth fat fer two days before roasting it. Lion meat isn't common around here. I'll purchase what I can from strangers but I rely mostly on shipments from the Plains o' Karana. I'm presently searching fer someone to [pick up me lion meat shipment].");
	end
	if(e.message:findi("lion meat shipment")) then
		e.self:Say("It'd be grand o' ye to pick up me lion meat shipment. Ye must travel to the Plains o' Karana. Search fer a Northman fishing village. It should be Clan McMannus. Speak with the chieftain, Einhorst. Tell him ye're there to [pick up the lion meat shipment for Halas]. When ye return, I'll pay ye at least three gold. I look forward to yer return.");
	end
	if(e.message:findi("lion delight")) then
		e.self:Say("Oh, yes. A wonderful tasting dish. Unfortunately, I need more lion meat to make that dish. Might I instead suggest the [lion roast]?"); --Text made up
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13961})) then 	--Lion Meat Shipment
		e.self:Say("Ye've returned!! How wonderful! The people o' Halas thank ye! It isn't often we get to indulge ourselves in the delicacies o' warmer climates. Here ye go, me friend. Ye've completed the delivery in good time. I hope ye deliver more often. Here, try some of me new creation.. [Lion Delight].");
		e.other:SummonItem(12221,1); 							--Lion Delight
		e.other:GiveCash(0,0,3,0); 								--Gold x 3
		e.other:Faction(213,5); 								--Merchants of Halas
		e.other:Faction(361,5); 								--Wolves of the North
		e.other:Faction(294,5);									--Shamen of Justice
		e.other:AddEXP(1000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
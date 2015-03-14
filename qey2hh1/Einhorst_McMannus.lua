-- ###########################################
-- ## DEVELOPER: KOVOU
-- ## CONVERTED TO LUA BY: robregen
-- ## *** NPC INFORMATION ***
-- ##
-- ## NAME: Einhorst McMannus
-- ## ID: 12091
-- ## ZONE: qey2hh1
-- ##
-- ############################################

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s. Welcome to the fishing village of Clan McMannus. We sell what we can here. Have a look around but, please do not buy too much. We must save most of our stock for delivery to our home.",e.other:GetName()));
	elseif(e.message:findi("searching for the fugitive")) then
		e.self:Say("I see they have sent someone to hunt the scoundrel down.  I am afraid I haven't seen the barbarian thief in quite some time.  You can search and search for him here in the western plains, but I doubt you shall find him.  Good luck.");
	elseif(e.message:findi("lion meat shipment")) then
		e.self:Say("Oh, yes, the lion meat shipment. Aye, it's here somewhere. Just a moment. Ah! Here you go. Apologize for the delay in this.");
		e.other:SummonItem(13961); -- Lion Meat Shipment
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18831})) then
		e.self:Say("What? Ok well, hmm let me see...... Oh there it is. Here is the shipment as ordered!");
		e.other:SummonItem(13962); -- Karana Clover Shipment
		e.other:Ding();
		e.other:Faction(361,2,0); -- Wolves of the North
		e.other:Faction(294,2,0); -- Shamen of Justice
		e.other:Faction(213,2,0); -- Merchants of Halas
		e.other:Faction(311,2,0); -- Steel Warriors
		e.other:Faction(275,-3,0); -- Rogues of the White Rose
		e.other:AddEXP(1600);
		e.other:GiveCash(math.random(99),math.random(99),eq.ChooseRandom(3,4,5),0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

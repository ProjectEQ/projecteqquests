function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want?  Can't you see that I wish to be alone?!  I have no need nor desire to speak with anyone.  I have a minor dilemma to ponder and the only person I wish to speak with is the [captain].");
	elseif(e.message:findi("captain")) then
		e.self:Say("If you have to ask that. you should not be in this fine establishment.");
	elseif(e.message:findi("danaria sent me")) then
		e.self:Say("If you are working for Danaria, you have been misguided. You will go back to her empty handed. Now leave. The [captain] and I have some business to discuss.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13817,item2 = 13817,item3 = 13817,item4 = 13817})) then -- 4x Capt. Orlin's Spiced Ale
		e.self:Say("Ahh.. I.. Need help.. You.. take this.. Go build.. boat beacon. Ask gnomes about.. boat beacon. They know how.. Then bring back.. Unnnhh!! Prexus help me!! I will never drink again.");
		e.other:Message(15,"In his drunkedness, Palatos advises you to seek out Svinal Wyspin, a Gnome merchant in North Freeport.");
		e.other:SummonItem(12145); -- Beacon Mount
		e.other:Ding();
		e.other:Faction(56,1,0); -- Craftkeepers
		e.other:Faction(145,1,0); -- High Council of Erudin
		e.other:Faction(147,1,0); -- High Guard of Erudin
		e.other:Faction(143,-1,0); -- Heretics
		e.other:AddEXP(100);
		e.other:GiveCash(0,0,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13818})) then
		e.self:Say("Thanks.. That saved me a lot of money. Now I can spend more time with the captain before I give this back to Lenka Stoutheart. Here is a little so...mething.");
		e.other:Ding();
		e.other:Faction(56,1,0); -- Craftkeepers
		e.other:Faction(145,1,0); -- High Council of Erudin
		e.other:Faction(147,1,0); -- High Guard of Erudin
		e.other:Faction(143,-1,0); -- Heretics
		e.other:AddEXP(200);
		e.other:GiveCash(0,0,0,1);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte  ID:10112 -- Palatos_Kynarn




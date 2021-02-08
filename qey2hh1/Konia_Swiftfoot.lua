-- Zone: West Karana
-- Short Name: qey2hh1
-- Zone ID: 12
--
-- NPC Name: Konia Swiftfoot
-- NPC ID: 12117
-- Quest Status: Finished
--
-- items: 20532, 20379, 20376, 20366, 20383

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello there, %s.  I am hosting a relay running contest.  Would you like to participate?",e.other:GetName()));
	elseif(e.message:findi("like to participate")) then
		e.self:Say("Great!  The prize will be this silly old music sheet.  Let me know when you are ready and I will pass you the torch and tell you where the next stop is.");
	elseif(e.message:findi("ready")) then
		e.self:Say("Here you go.  Run with this torch as fast as you can to the Misty Thicket and hand this torch off to Fajio Knejo.  He will tell you where to go from there.  Hurry!  You do not have much time!");
		e.other:SummonItem(20532); -- Item: Torch of Misty
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20379})) then
		e.self:Say("Excellent!  You are quite a runner.  Here is half of the sheet music.  I decided to keep the other half because it has this wonderful signature.  I think it might be quite valuable.  It is probably worth as much as an instrument the great Mahlin used.");
		e.other:SummonItem(20376); -- Item: Maestro's Symphony Page 24 Top
		e.other:Ding();
		e.other:AddEXP(1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20366})) then
		e.self:Say("Mahlin's bongos!  Here, take the other half of the sheet music.  I can't really make out what the signature was, anyway.");
		e.other:SummonItem(20383); -- Item: Maestro's Symphony Page 24 Bottom
		e.other:Ding();
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qey2hh1  ID:12117 -- Konia Swiftfoot

